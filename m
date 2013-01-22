From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 08:03:41 -0300
Subject: [Buildroot] [PATCHv2 1/3] lzop: add LZOP definition for the host
	variant
Message-ID: <1358852623-10388-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lzop/lzop.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 1f7c835..9803b39 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -3,6 +3,7 @@
 # lzop
 #
 #############################################################
+
 LZOP_VERSION = 1.03
 LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
@@ -12,3 +13,5 @@ LZOP_DEPENDENCIES = lzo
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+LZOP = $(HOST_DIR)/usr/bin/lzop
-- 
1.7.12.4
