From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 10 Feb 2014 21:07:14 -0500
Subject: [Buildroot] [PATCH 1/2] libjpeg: fix "jpegtran" spelling in
	target-install hook
Message-ID: <1392084434-1876-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use correct bin name so that LIBJPEG_REMOVE_USELESS_TOOLS fixup
actually removes it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libjpeg/libjpeg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index b0b02ad..a5898a4 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,7 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_INSTALL_STAGING = YES
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom wrjpgcom)
 endef
 
 LIBJPEG_POST_INSTALL_TARGET_HOOKS += LIBJPEG_REMOVE_USELESS_TOOLS
-- 
1.7.9.5
