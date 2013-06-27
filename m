From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jun 2013 17:51:50 -0300
Subject: [Buildroot] [PATCH] polarssl: fix download URL
Message-ID: <1372366310-25901-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to a non-redirect download URL to fix:
http://autobuild.buildroot.net/results/ec3/ec340fffa6eebb18a0746097419359b44c557a90/
Thanks go to Paul Bakker for the quick response!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/polarssl/polarssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 39de3e3..f3bc421 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLARSSL_SITE = https://polarssl.org/download
+POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.8
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
-- 
1.8.1.5
