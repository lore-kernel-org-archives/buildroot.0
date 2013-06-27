From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 16:43:58 -0300
Subject: [Buildroot] [PATCH] polarssl: work around download URL
Message-ID: <1372362238-12025-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changed the download to a redirect which doesn't present a
proper content-disposition, so switching to the "final" URL doesn't help
either since we get an invalid filename ("polarssl-*-gpl.tgz?do=yes").
Switch to buildroot site until this is fixed or they present a fixed URL
which isn't a script. Fixes:
http://autobuild.buildroot.net/results/ec3/ec340fffa6eebb18a0746097419359b44c557a90/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 39de3e3..a0d2c4c 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-POLARSSL_SITE = https://polarssl.org/download
+#POLARSSL_SITE = https://polarssl.org/download
+# Use until upstream fixes content-disposition or enables a fixed URL
+POLARSSL_SITE = $(BR2_BACKUP_SITE)
 POLARSSL_VERSION = 1.2.8
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
-- 
1.8.1.5
