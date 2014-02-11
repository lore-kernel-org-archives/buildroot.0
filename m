From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 08:04:36 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: fix "jpegtran" spelling in
	target-install hook
Message-ID: <20140211082559.25C718DC1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28f427ddb94b44ccef0af514c49e40727247df21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use correct bin name so that JPEG_TURBO_REMOVE_USELESS_TOOLS fixup
actually removes it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
