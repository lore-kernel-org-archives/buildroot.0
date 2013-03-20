From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xfont_font-bitstream-speedo: removed in
	X11R7.7
Message-ID: <20130324225200.B88B49B21A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52753d84a9f8c0cd36cc5ac297ae19a1c87b852c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/Config.in                            |    1 -
 .../x11r7/xfont_font-bitstream-speedo/Config.in    |    4 ----
 .../xfont_font-bitstream-speedo.mk                 |   15 ---------------
 3 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2ae59a4..f0cbd6f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -198,7 +198,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xfont_font-bh-type1/Config.in
 		source package/x11r7/xfont_font-bitstream-100dpi/Config.in
 		source package/x11r7/xfont_font-bitstream-75dpi/Config.in
-		source package/x11r7/xfont_font-bitstream-speedo/Config.in
 		source package/x11r7/xfont_font-bitstream-type1/Config.in
 		source package/x11r7/xfont_font-cronyx-cyrillic/Config.in
 		source package/x11r7/xfont_font-cursor-misc/Config.in
diff --git a/package/x11r7/xfont_font-bitstream-speedo/Config.in b/package/x11r7/xfont_font-bitstream-speedo/Config.in
deleted file mode 100644
index 70750f6..0000000
--- a/package/x11r7/xfont_font-bitstream-speedo/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO
-	bool "font-bitstream-speedo"
-	help
-	  No description available
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
deleted file mode 100644
index 79cb6ca..0000000
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# font-bitstream-speedo -- No description available
-#
-################################################################################
-
-XFONT_FONT_BITSTREAM_SPEEDO_VERSION = 1.0.1
-XFONT_FONT_BITSTREAM_SPEEDO_SOURCE = font-bitstream-speedo-$(XFONT_FONT_BITSTREAM_SPEEDO_VERSION).tar.bz2
-XFONT_FONT_BITSTREAM_SPEEDO_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install
-XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
-XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
-
-$(eval $(autotools-package))
-
