From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 10 Feb 2014 21:07:38 -0500
Subject: [Buildroot] [PATCH 2/2] jpeg-turbo: fix "jpegtran" spelling in
	target-install hook
Message-ID: <1392084458-1915-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use correct bin name so that JPEG_TURBO_REMOVE_USELESS_TOOLS fixup
actually removes it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index e6a0b24..785ef57 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -19,7 +19,7 @@ JPEG_TURBO_CONF_OPT += --without-simd
 endif
 
 define JPEG_TURBO_REMOVE_USELESS_TOOLS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom tjbench wrjpgcom)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
 endef
 
 JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
-- 
1.7.9.5
