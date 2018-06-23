From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jun 2018 23:06:58 +0200
Subject: [Buildroot] [PATCH v2 14/22] package/x11r7/xproto_*: mass removal
In-Reply-To: <20180623210706.2519-1-bernd.kuhls@t-online.de>
References: <20180623210706.2519-1-bernd.kuhls@t-online.de>
Message-ID: <20180623210706.2519-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

After switching to xorgproto the old xproto_* packages are removed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                              | 243 ++++++++++++++++++
 package/x11r7/Config.in                       |  30 ---
 package/x11r7/xproto_applewmproto/Config.in   |   4 -
 .../xproto_applewmproto.hash                  |   3 -
 .../xproto_applewmproto.mk                    |  15 --
 package/x11r7/xproto_bigreqsproto/Config.in   |   4 -
 .../xproto_bigreqsproto.hash                  |   2 -
 .../xproto_bigreqsproto.mk                    |  15 --
 package/x11r7/xproto_compositeproto/Config.in |   4 -
 .../xproto_compositeproto.hash                |   3 -
 .../xproto_compositeproto.mk                  |  15 --
 package/x11r7/xproto_damageproto/Config.in    |   4 -
 .../xproto_damageproto.hash                   |   3 -
 .../xproto_damageproto/xproto_damageproto.mk  |  15 --
 package/x11r7/xproto_dmxproto/Config.in       |   4 -
 .../xproto_dmxproto/xproto_dmxproto.hash      |   3 -
 .../x11r7/xproto_dmxproto/xproto_dmxproto.mk  |  15 --
 package/x11r7/xproto_dri2proto/Config.in      |   4 -
 .../xproto_dri2proto/xproto_dri2proto.hash    |   2 -
 .../xproto_dri2proto/xproto_dri2proto.mk      |  15 --
 package/x11r7/xproto_dri3proto/Config.in      |   4 -
 .../xproto_dri3proto/xproto_dri3proto.hash    |   2 -
 .../xproto_dri3proto/xproto_dri3proto.mk      |  15 --
 package/x11r7/xproto_fixesproto/Config.in     |   4 -
 .../xproto_fixesproto/xproto_fixesproto.hash  |   3 -
 .../xproto_fixesproto/xproto_fixesproto.mk    |  16 --
 package/x11r7/xproto_fontcacheproto/Config.in |   4 -
 .../xproto_fontcacheproto.hash                |   3 -
 .../xproto_fontcacheproto.mk                  |  16 --
 package/x11r7/xproto_fontsproto/Config.in     |   4 -
 .../xproto_fontsproto/xproto_fontsproto.hash  |   2 -
 .../xproto_fontsproto/xproto_fontsproto.mk    |  16 --
 package/x11r7/xproto_glproto/Config.in        |   4 -
 .../x11r7/xproto_glproto/xproto_glproto.hash  |   2 -
 .../x11r7/xproto_glproto/xproto_glproto.mk    |  15 --
 package/x11r7/xproto_inputproto/Config.in     |   4 -
 .../xproto_inputproto/xproto_inputproto.hash  |   2 -
 .../xproto_inputproto/xproto_inputproto.mk    |  16 --
 package/x11r7/xproto_kbproto/Config.in        |   4 -
 .../x11r7/xproto_kbproto/xproto_kbproto.hash  |   2 -
 .../x11r7/xproto_kbproto/xproto_kbproto.mk    |  16 --
 package/x11r7/xproto_presentproto/Config.in   |   5 -
 .../xproto_presentproto.hash                  |   2 -
 .../xproto_presentproto.mk                    |  16 --
 package/x11r7/xproto_randrproto/Config.in     |   4 -
 .../xproto_randrproto/xproto_randrproto.hash  |   3 -
 .../xproto_randrproto/xproto_randrproto.mk    |  15 --
 package/x11r7/xproto_recordproto/Config.in    |   4 -
 .../xproto_recordproto.hash                   |   2 -
 .../xproto_recordproto/xproto_recordproto.mk  |  15 --
 package/x11r7/xproto_renderproto/Config.in    |   4 -
 .../xproto_renderproto.hash                   |   2 -
 .../xproto_renderproto/xproto_renderproto.mk  |  16 --
 package/x11r7/xproto_resourceproto/Config.in  |   4 -
 .../xproto_resourceproto.hash                 |   3 -
 .../xproto_resourceproto.mk                   |  15 --
 package/x11r7/xproto_scrnsaverproto/Config.in |   4 -
 .../xproto_scrnsaverproto.hash                |   2 -
 .../xproto_scrnsaverproto.mk                  |  15 --
 package/x11r7/xproto_videoproto/Config.in     |   4 -
 .../xproto_videoproto/xproto_videoproto.hash  |   2 -
 .../xproto_videoproto/xproto_videoproto.mk    |  15 --
 package/x11r7/xproto_windowswmproto/Config.in |   4 -
 .../xproto_windowswmproto.hash                |   3 -
 .../xproto_windowswmproto.mk                  |  15 --
 package/x11r7/xproto_xcmiscproto/Config.in    |   4 -
 .../xproto_xcmiscproto.hash                   |   2 -
 .../xproto_xcmiscproto/xproto_xcmiscproto.mk  |  17 --
 package/x11r7/xproto_xextproto/Config.in      |   4 -
 .../xproto_xextproto/xproto_xextproto.hash    |   2 -
 .../xproto_xextproto/xproto_xextproto.mk      |  17 --
 .../x11r7/xproto_xf86bigfontproto/Config.in   |   4 -
 .../xproto_xf86bigfontproto.hash              |   3 -
 .../xproto_xf86bigfontproto.mk                |  16 --
 package/x11r7/xproto_xf86dgaproto/Config.in   |   4 -
 .../xproto_xf86dgaproto.hash                  |   3 -
 .../xproto_xf86dgaproto.mk                    |  15 --
 package/x11r7/xproto_xf86driproto/Config.in   |   4 -
 .../xproto_xf86driproto.hash                  |   3 -
 .../xproto_xf86driproto.mk                    |  15 --
 .../x11r7/xproto_xf86vidmodeproto/Config.in   |   4 -
 .../xproto_xf86vidmodeproto.hash              |   3 -
 .../xproto_xf86vidmodeproto.mk                |  15 --
 package/x11r7/xproto_xineramaproto/Config.in  |   4 -
 .../xproto_xineramaproto.hash                 |   3 -
 .../xproto_xineramaproto.mk                   |  15 --
 package/x11r7/xproto_xproto/Config.in         |   4 -
 .../x11r7/xproto_xproto/xproto_xproto.hash    |   2 -
 package/x11r7/xproto_xproto/xproto_xproto.mk  |  16 --
 .../xproto_xproxymanagementprotocol/Config.in |   6 -
 .../xproto_xproxymanagementprotocol.hash      |   2 -
 .../xproto_xproxymanagementprotocol.mk        |  15 --
 92 files changed, 243 insertions(+), 690 deletions(-)
 delete mode 100644 package/x11r7/xproto_applewmproto/Config.in
 delete mode 100644 package/x11r7/xproto_applewmproto/xproto_applewmproto.hash
 delete mode 100644 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
 delete mode 100644 package/x11r7/xproto_bigreqsproto/Config.in
 delete mode 100644 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.hash
 delete mode 100644 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
 delete mode 100644 package/x11r7/xproto_compositeproto/Config.in
 delete mode 100644 package/x11r7/xproto_compositeproto/xproto_compositeproto.hash
 delete mode 100644 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
 delete mode 100644 package/x11r7/xproto_damageproto/Config.in
 delete mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.hash
 delete mode 100644 package/x11r7/xproto_damageproto/xproto_damageproto.mk
 delete mode 100644 package/x11r7/xproto_dmxproto/Config.in
 delete mode 100644 package/x11r7/xproto_dmxproto/xproto_dmxproto.hash
 delete mode 100644 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
 delete mode 100644 package/x11r7/xproto_dri2proto/Config.in
 delete mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
 delete mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
 delete mode 100644 package/x11r7/xproto_dri3proto/Config.in
 delete mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
 delete mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
 delete mode 100644 package/x11r7/xproto_fixesproto/Config.in
 delete mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
 delete mode 100644 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
 delete mode 100644 package/x11r7/xproto_fontcacheproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.hash
 delete mode 100644 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
 delete mode 100644 package/x11r7/xproto_fontsproto/Config.in
 delete mode 100644 package/x11r7/xproto_fontsproto/xproto_fontsproto.hash
 delete mode 100644 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
 delete mode 100644 package/x11r7/xproto_glproto/Config.in
 delete mode 100644 package/x11r7/xproto_glproto/xproto_glproto.hash
 delete mode 100644 package/x11r7/xproto_glproto/xproto_glproto.mk
 delete mode 100644 package/x11r7/xproto_inputproto/Config.in
 delete mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.hash
 delete mode 100644 package/x11r7/xproto_inputproto/xproto_inputproto.mk
 delete mode 100644 package/x11r7/xproto_kbproto/Config.in
 delete mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.hash
 delete mode 100644 package/x11r7/xproto_kbproto/xproto_kbproto.mk
 delete mode 100644 package/x11r7/xproto_presentproto/Config.in
 delete mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.hash
 delete mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.mk
 delete mode 100644 package/x11r7/xproto_randrproto/Config.in
 delete mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.hash
 delete mode 100644 package/x11r7/xproto_randrproto/xproto_randrproto.mk
 delete mode 100644 package/x11r7/xproto_recordproto/Config.in
 delete mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.hash
 delete mode 100644 package/x11r7/xproto_recordproto/xproto_recordproto.mk
 delete mode 100644 package/x11r7/xproto_renderproto/Config.in
 delete mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.hash
 delete mode 100644 package/x11r7/xproto_renderproto/xproto_renderproto.mk
 delete mode 100644 package/x11r7/xproto_resourceproto/Config.in
 delete mode 100644 package/x11r7/xproto_resourceproto/xproto_resourceproto.hash
 delete mode 100644 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/Config.in
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.hash
 delete mode 100644 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
 delete mode 100644 package/x11r7/xproto_videoproto/Config.in
 delete mode 100644 package/x11r7/xproto_videoproto/xproto_videoproto.hash
 delete mode 100644 package/x11r7/xproto_videoproto/xproto_videoproto.mk
 delete mode 100644 package/x11r7/xproto_windowswmproto/Config.in
 delete mode 100644 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.hash
 delete mode 100644 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
 delete mode 100644 package/x11r7/xproto_xcmiscproto/Config.in
 delete mode 100644 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.hash
 delete mode 100644 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
 delete mode 100644 package/x11r7/xproto_xextproto/Config.in
 delete mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.hash
 delete mode 100644 package/x11r7/xproto_xextproto/xproto_xextproto.mk
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.hash
 delete mode 100644 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
 delete mode 100644 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
 delete mode 100644 package/x11r7/xproto_xf86driproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
 delete mode 100644 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/Config.in
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.hash
 delete mode 100644 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
 delete mode 100644 package/x11r7/xproto_xineramaproto/Config.in
 delete mode 100644 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.hash
 delete mode 100644 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
 delete mode 100644 package/x11r7/xproto_xproto/Config.in
 delete mode 100644 package/x11r7/xproto_xproto/xproto_xproto.hash
 delete mode 100644 package/x11r7/xproto_xproto/xproto_xproto.mk
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/Config.in
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
 delete mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 7fc4792aed..5bab1ced68 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -142,6 +142,249 @@ comment "unpredictable ways.                                 "
 comment "----------------------------------------------------"
 endif
 
+###############################################################################
+comment "Legacy options removed in 2018.08"
+
+config BR2_PACKAGE_XPROTO_APPLEWMPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_BIGREQSPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_DAMAGEPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_DMXPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_DRI2PROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_DRI3PROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_FIXESPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_FONTSPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_GLPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_INPUTPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_KBPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_PRESENTPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_RANDRPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_RECORDPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_RENDERPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_RESOURCEPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_VIDEOPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XCMISCPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XEXTPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XF86DRIPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XINERAMAPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XPROTO
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
+config BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
+	bool "xproto packages were superseded by package xorgproto"
+	select BR2_LEGACY
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  The new package xorgproto will combine and replace all xproto_*
+	  packages
+
 ###############################################################################
 comment "Legacy options removed in 2018.05"
 
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4648fcb5f6..f1396bbf0f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -230,36 +230,6 @@ if BR2_PACKAGE_XORG7
 	menu "X11R7 X protocols"
 		source package/x11r7/xcb-proto/Config.in
 		source package/x11r7/xorgproto/Config.in
-		source package/x11r7/xproto_applewmproto/Config.in
-		source package/x11r7/xproto_bigreqsproto/Config.in
-		source package/x11r7/xproto_compositeproto/Config.in
-		source package/x11r7/xproto_damageproto/Config.in
-		source package/x11r7/xproto_dmxproto/Config.in
-		source package/x11r7/xproto_dri2proto/Config.in
-		source package/x11r7/xproto_dri3proto/Config.in
-		source package/x11r7/xproto_fixesproto/Config.in
-		source package/x11r7/xproto_fontcacheproto/Config.in
-		source package/x11r7/xproto_fontsproto/Config.in
-		source package/x11r7/xproto_glproto/Config.in
-		source package/x11r7/xproto_inputproto/Config.in
-		source package/x11r7/xproto_kbproto/Config.in
-		source package/x11r7/xproto_presentproto/Config.in
-		source package/x11r7/xproto_randrproto/Config.in
-		source package/x11r7/xproto_recordproto/Config.in
-		source package/x11r7/xproto_renderproto/Config.in
-		source package/x11r7/xproto_resourceproto/Config.in
-		source package/x11r7/xproto_scrnsaverproto/Config.in
-		source package/x11r7/xproto_videoproto/Config.in
-		source package/x11r7/xproto_windowswmproto/Config.in
-		source package/x11r7/xproto_xcmiscproto/Config.in
-		source package/x11r7/xproto_xextproto/Config.in
-		source package/x11r7/xproto_xf86bigfontproto/Config.in
-		source package/x11r7/xproto_xf86dgaproto/Config.in
-		source package/x11r7/xproto_xf86driproto/Config.in
-		source package/x11r7/xproto_xf86vidmodeproto/Config.in
-		source package/x11r7/xproto_xineramaproto/Config.in
-		source package/x11r7/xproto_xproto/Config.in
-		source package/x11r7/xproto_xproxymanagementprotocol/Config.in
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
diff --git a/package/x11r7/xproto_applewmproto/Config.in b/package/x11r7/xproto_applewmproto/Config.in
deleted file mode 100644
index 51a5fd5ce6..0000000000
--- a/package/x11r7/xproto_applewmproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_APPLEWMPROTO
-	bool "applewmproto"
-	help
-	  No description available
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.hash b/package/x11r7/xproto_applewmproto/xproto_applewmproto.hash
deleted file mode 100644
index 695de3cd14..0000000000
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1371
-md5	c1d50749c3ac5215a1a9425818e856c1	applewmproto-1.4.2.tar.bz2
-sha1	71dd2374e745a7db7ae0e94410e55ba721683d10	applewmproto-1.4.2.tar.bz2
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
deleted file mode 100644
index 998d0aa33b..0000000000
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_applewmproto
-#
-################################################################################
-
-XPROTO_APPLEWMPROTO_VERSION = 1.4.2
-XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
-XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_APPLEWMPROTO_LICENSE = MIT
-XPROTO_APPLEWMPROTO_LICENSE_FILES = COPYING
-XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
-XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_bigreqsproto/Config.in b/package/x11r7/xproto_bigreqsproto/Config.in
deleted file mode 100644
index c431ef2bbb..0000000000
--- a/package/x11r7/xproto_bigreqsproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_BIGREQSPROTO
-	bool "bigreqsproto"
-	help
-	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.hash b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.hash
deleted file mode 100644
index 7d70dca8cc..0000000000
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	462116ab44e41d8121bfde947321950370b285a5316612b8fce8334d50751b1e	bigreqsproto-1.1.2.tar.bz2
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
deleted file mode 100644
index bca5a3cdfd..0000000000
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_bigreqsproto
-#
-################################################################################
-
-XPROTO_BIGREQSPROTO_VERSION = 1.1.2
-XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
-XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_BIGREQSPROTO_LICENSE = MIT
-XPROTO_BIGREQSPROTO_LICENSE_FILES = COPYING
-XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
-XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_compositeproto/Config.in b/package/x11r7/xproto_compositeproto/Config.in
deleted file mode 100644
index 136900a07d..0000000000
--- a/package/x11r7/xproto_compositeproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_COMPOSITEPROTO
-	bool "compositeproto"
-	help
-	  X.Org Composite protocol headers
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.hash b/package/x11r7/xproto_compositeproto/xproto_compositeproto.hash
deleted file mode 100644
index c6ef73c213..0000000000
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1193
-md5	98482f65ba1e74a08bf5b056a4031ef0	compositeproto-0.4.2.tar.bz2
-sha1	aa7b5abcfd5bbfad7cb681ce89dc1d6e381e3044	compositeproto-0.4.2.tar.bz2
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
deleted file mode 100644
index 21613582ec..0000000000
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_compositeproto
-#
-################################################################################
-
-XPROTO_COMPOSITEPROTO_VERSION = 0.4.2
-XPROTO_COMPOSITEPROTO_SOURCE = compositeproto-$(XPROTO_COMPOSITEPROTO_VERSION).tar.bz2
-XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_COMPOSITEPROTO_LICENSE = MIT
-XPROTO_COMPOSITEPROTO_LICENSE_FILES = COPYING
-XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
-XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_damageproto/Config.in b/package/x11r7/xproto_damageproto/Config.in
deleted file mode 100644
index 068ed2b406..0000000000
--- a/package/x11r7/xproto_damageproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DAMAGEPROTO
-	bool "damageproto"
-	help
-	  X.Org Damage protocol headers
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.hash b/package/x11r7/xproto_damageproto/xproto_damageproto.hash
deleted file mode 100644
index e5064b62a5..0000000000
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1194
-md5	998e5904764b82642cc63d97b4ba9e95	damageproto-1.2.1.tar.bz2
-sha1	bd0f0f4dc8f37eaabd9279d10fe2889710507358	damageproto-1.2.1.tar.bz2
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
deleted file mode 100644
index 0311ea4901..0000000000
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_damageproto
-#
-################################################################################
-
-XPROTO_DAMAGEPROTO_VERSION = 1.2.1
-XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
-XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DAMAGEPROTO_LICENSE = MIT
-XPROTO_DAMAGEPROTO_LICENSE_FILES = COPYING
-XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
-XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dmxproto/Config.in b/package/x11r7/xproto_dmxproto/Config.in
deleted file mode 100644
index dc048b1fd1..0000000000
--- a/package/x11r7/xproto_dmxproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DMXPROTO
-	bool "dmxproto"
-	help
-	  X.Org DMX protocol headers
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.hash b/package/x11r7/xproto_dmxproto/xproto_dmxproto.hash
deleted file mode 100644
index 041f580e47..0000000000
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1306
-md5	4ee175bbd44d05c34d43bb129be5098a	dmxproto-2.3.1.tar.bz2
-sha1	3b8b273b8ef3d8dbab998df9ec1dddf99edf4d91	dmxproto-2.3.1.tar.bz2
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
deleted file mode 100644
index 4cc795c212..0000000000
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_dmxproto
-#
-################################################################################
-
-XPROTO_DMXPROTO_VERSION = 2.3.1
-XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
-XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DMXPROTO_LICENSE = MIT
-XPROTO_DMXPROTO_LICENSE_FILES = COPYING
-XPROTO_DMXPROTO_INSTALL_STAGING = YES
-XPROTO_DMXPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
deleted file mode 100644
index 3fe5aa1ad1..0000000000
--- a/package/x11r7/xproto_dri2proto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DRI2PROTO
-	bool "dri2proto"
-	help
-	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash b/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
deleted file mode 100644
index e3ea0bc1e9..0000000000
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1731
-sha256	f9b55476def44fc7c459b2537d17dbc731e36ed5d416af7ca0b1e2e676f8aa04	dri2proto-2.8.tar.bz2
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
deleted file mode 100644
index e4ed7d8bf8..0000000000
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_dri2proto
-#
-################################################################################
-
-XPROTO_DRI2PROTO_VERSION = 2.8
-XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
-XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DRI2PROTO_LICENSE = MIT
-XPROTO_DRI2PROTO_LICENSE_FILES = COPYING
-XPROTO_DRI2PROTO_INSTALL_STAGING = YES
-XPROTO_DRI2PROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dri3proto/Config.in b/package/x11r7/xproto_dri3proto/Config.in
deleted file mode 100644
index eead7d4784..0000000000
--- a/package/x11r7/xproto_dri3proto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_DRI3PROTO
-	bool "dri3proto"
-	help
-	  X.Org DRI3 protocol headers
diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash b/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
deleted file mode 100644
index 6e1da4d3f2..0000000000
--- a/package/x11r7/xproto_dri3proto/xproto_dri3proto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2079
-sha256	01be49d70200518b9a6b297131f6cc71f4ea2de17436896af153226a774fc074	dri3proto-1.0.tar.bz2
diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
deleted file mode 100644
index bdbff74ffc..0000000000
--- a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_dri3proto
-#
-################################################################################
-
-XPROTO_DRI3PROTO_VERSION = 1.0
-XPROTO_DRI3PROTO_SOURCE = dri3proto-$(XPROTO_DRI3PROTO_VERSION).tar.bz2
-XPROTO_DRI3PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_DRI3PROTO_LICENSE = MIT
-XPROTO_DRI3PROTO_INSTALL_STAGING = YES
-# this package does not contain any binary files
-XPROTO_DRI3PROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_fixesproto/Config.in b/package/x11r7/xproto_fixesproto/Config.in
deleted file mode 100644
index d419fa13d1..0000000000
--- a/package/x11r7/xproto_fixesproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FIXESPROTO
-	bool "fixesproto"
-	help
-	  X.Org Fixes protocol headers
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash b/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
deleted file mode 100644
index d19f392442..0000000000
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1352
-md5	e7431ab84d37b2678af71e29355e101d	fixesproto-5.0.tar.bz2
-sha1	ab605af5da8c98c0c2f8b2c578fed7c864ee996a	fixesproto-5.0.tar.bz2
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
deleted file mode 100644
index 55212b2678..0000000000
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_fixesproto
-#
-################################################################################
-
-XPROTO_FIXESPROTO_VERSION = 5.0
-XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
-XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FIXESPROTO_LICENSE = MIT
-XPROTO_FIXESPROTO_LICENSE_FILES = COPYING
-XPROTO_FIXESPROTO_INSTALL_STAGING = YES
-XPROTO_FIXESPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
deleted file mode 100644
index daa6c7f20b..0000000000
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
-	bool "fontcacheproto"
-	help
-	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.hash b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.hash
deleted file mode 100644
index 7363e224bb..0000000000
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/834
-md5	a8a50e5e995bfacb0359575faf7f6906	fontcacheproto-0.1.3.tar.bz2
-sha1	07f6ab3e1e1efe71c51f50e95851d93d2a1de773	fontcacheproto-0.1.3.tar.bz2
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
deleted file mode 100644
index 0cb205ad59..0000000000
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_fontcacheproto
-#
-################################################################################
-
-XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
-XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
-XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTCACHEPROTO_LICENSE = MIT
-XPROTO_FONTCACHEPROTO_LICENSE_FILES = COPYING
-XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
-XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontsproto/Config.in b/package/x11r7/xproto_fontsproto/Config.in
deleted file mode 100644
index b00220c277..0000000000
--- a/package/x11r7/xproto_fontsproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_FONTSPROTO
-	bool "fontsproto"
-	help
-	  X.Org Fonts protocol headers
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.hash b/package/x11r7/xproto_fontsproto/xproto_fontsproto.hash
deleted file mode 100644
index 6a21058b91..0000000000
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.freedesktop.org/archives/xorg/2014-April/056540.html
-sha256	259046b0dd9130825c4a4c479ba3591d6d0f17a33f54e294b56478729a6e5ab8	fontsproto-2.1.3.tar.bz2
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
deleted file mode 100644
index b4e6d6a848..0000000000
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_fontsproto
-#
-################################################################################
-
-XPROTO_FONTSPROTO_VERSION = 2.1.3
-XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
-XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_FONTSPROTO_LICENSE = MIT
-XPROTO_FONTSPROTO_LICENSE_FILES = COPYING
-XPROTO_FONTSPROTO_INSTALL_STAGING = YES
-XPROTO_FONTSPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_glproto/Config.in b/package/x11r7/xproto_glproto/Config.in
deleted file mode 100644
index 28ceb9cc80..0000000000
--- a/package/x11r7/xproto_glproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_GLPROTO
-	bool "glproto"
-	help
-	  X.Org GL protocol headers
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.hash b/package/x11r7/xproto_glproto/xproto_glproto.hash
deleted file mode 100644
index fce6a22222..0000000000
--- a/package/x11r7/xproto_glproto/xproto_glproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256	adaa94bded310a2bfcbb9deb4d751d965fcfe6fb3a2f6d242e2df2d6589dbe40	glproto-1.4.17.tar.bz2
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
deleted file mode 100644
index ccfc6de666..0000000000
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_glproto
-#
-################################################################################
-
-XPROTO_GLPROTO_VERSION = 1.4.17
-XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
-XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_GLPROTO_LICENSE = MIT
-XPROTO_GLPROTO_LICENSE_FILES = COPYING
-XPROTO_GLPROTO_INSTALL_STAGING = YES
-XPROTO_GLPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_inputproto/Config.in b/package/x11r7/xproto_inputproto/Config.in
deleted file mode 100644
index fcccb26cac..0000000000
--- a/package/x11r7/xproto_inputproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_INPUTPROTO
-	bool "inputproto"
-	help
-	  X.Org Input protocol headers
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.hash b/package/x11r7/xproto_inputproto/xproto_inputproto.hash
deleted file mode 100644
index 4ecdddc56d..0000000000
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-April/002682.html
-sha256	893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d	inputproto-2.3.2.tar.bz2
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
deleted file mode 100644
index 20169b5c46..0000000000
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_inputproto
-#
-################################################################################
-
-XPROTO_INPUTPROTO_VERSION = 2.3.2
-XPROTO_INPUTPROTO_SOURCE = inputproto-$(XPROTO_INPUTPROTO_VERSION).tar.bz2
-XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_INPUTPROTO_LICENSE = MIT
-XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
-XPROTO_INPUTPROTO_INSTALL_STAGING = YES
-XPROTO_INPUTPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_kbproto/Config.in b/package/x11r7/xproto_kbproto/Config.in
deleted file mode 100644
index ce568d7ad8..0000000000
--- a/package/x11r7/xproto_kbproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_KBPROTO
-	bool "kbproto"
-	help
-	  X.Org KB protocol headers
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.hash b/package/x11r7/xproto_kbproto/xproto_kbproto.hash
deleted file mode 100644
index c98e595a16..0000000000
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002595.html
-sha256	f882210b76376e3fa006b11dbd890e56ec0942bc56e65d1249ff4af86f90b857	kbproto-1.0.7.tar.bz2
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
deleted file mode 100644
index b6c818f705..0000000000
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_kbproto
-#
-################################################################################
-
-XPROTO_KBPROTO_VERSION = 1.0.7
-XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
-XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_KBPROTO_LICENSE = MIT
-XPROTO_KBPROTO_LICENSE_FILES = COPYING
-XPROTO_KBPROTO_INSTALL_STAGING = YES
-XPROTO_KBPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_presentproto/Config.in b/package/x11r7/xproto_presentproto/Config.in
deleted file mode 100644
index 586008df4a..0000000000
--- a/package/x11r7/xproto_presentproto/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XPROTO_PRESENTPROTO
-	bool "presentproto"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
-	help
-	  X.Org Present extension headers
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.hash b/package/x11r7/xproto_presentproto/xproto_presentproto.hash
deleted file mode 100644
index aa45d9167e..0000000000
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002770.html
-sha256 f69b23a8869f78a5898aaf53938b829c8165e597cda34f06024d43ee1e6d26b9  presentproto-1.1.tar.bz2
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
deleted file mode 100644
index 0097b9cddb..0000000000
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_presentproto
-#
-################################################################################
-
-XPROTO_PRESENTPROTO_VERSION = 1.1
-XPROTO_PRESENTPROTO_SOURCE = presentproto-$(XPROTO_PRESENTPROTO_VERSION).tar.bz2
-XPROTO_PRESENTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_PRESENTPROTO_LICENSE = MIT
-XPROTO_PRESENTPROTO_LICENSE_FILES = presentproto.h
-XPROTO_PRESENTPROTO_DEPENDENCIES = host-pkgconf xutil_util-macros
-XPROTO_PRESENTPROTO_INSTALL_STAGING = YES
-XPROTO_PRESENTPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_randrproto/Config.in b/package/x11r7/xproto_randrproto/Config.in
deleted file mode 100644
index 097ec8f220..0000000000
--- a/package/x11r7/xproto_randrproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RANDRPROTO
-	bool "randrproto"
-	help
-	  X.Org Randr protocol headers
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.hash b/package/x11r7/xproto_randrproto/xproto_randrproto.hash
deleted file mode 100644
index c71df7f8a0..0000000000
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002605.html
-sha1	bc420745dc4af011988e9dcabdadf8829cbc2374				randrproto-1.5.0.tar.bz2
-sha256	4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468	randrproto-1.5.0.tar.bz2
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
deleted file mode 100644
index f6c4878104..0000000000
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_randrproto
-#
-################################################################################
-
-XPROTO_RANDRPROTO_VERSION = 1.5.0
-XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
-XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RANDRPROTO_LICENSE = MIT
-XPROTO_RANDRPROTO_LICENSE_FILES = COPYING
-XPROTO_RANDRPROTO_INSTALL_STAGING = YES
-XPROTO_RANDRPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_recordproto/Config.in b/package/x11r7/xproto_recordproto/Config.in
deleted file mode 100644
index 9fd5b884f8..0000000000
--- a/package/x11r7/xproto_recordproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RECORDPROTO
-	bool "recordproto"
-	help
-	  X.Org Record protocol headers
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.hash b/package/x11r7/xproto_recordproto/xproto_recordproto.hash
deleted file mode 100644
index bc03f8c4b5..0000000000
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370	recordproto-1.14.2.tar.bz2
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
deleted file mode 100644
index 2d2cceac22..0000000000
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_recordproto
-#
-################################################################################
-
-XPROTO_RECORDPROTO_VERSION = 1.14.2
-XPROTO_RECORDPROTO_SOURCE = recordproto-$(XPROTO_RECORDPROTO_VERSION).tar.bz2
-XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RECORDPROTO_LICENSE = MIT
-XPROTO_RECORDPROTO_LICENSE_FILES = COPYING
-XPROTO_RECORDPROTO_INSTALL_STAGING = YES
-XPROTO_RECORDPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_renderproto/Config.in b/package/x11r7/xproto_renderproto/Config.in
deleted file mode 100644
index 5b5806fa47..0000000000
--- a/package/x11r7/xproto_renderproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RENDERPROTO
-	bool "renderproto"
-	help
-	  X.Org Render protocol headers
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.hash b/package/x11r7/xproto_renderproto/xproto_renderproto.hash
deleted file mode 100644
index 92763da921..0000000000
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537	renderproto-0.11.1.tar.bz2
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
deleted file mode 100644
index 41a8445409..0000000000
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_renderproto
-#
-################################################################################
-
-XPROTO_RENDERPROTO_VERSION = 0.11.1
-XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
-XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RENDERPROTO_LICENSE = MIT
-XPROTO_RENDERPROTO_LICENSE_FILES = COPYING
-XPROTO_RENDERPROTO_INSTALL_STAGING = YES
-XPROTO_RENDERPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_resourceproto/Config.in b/package/x11r7/xproto_resourceproto/Config.in
deleted file mode 100644
index 4aec708c4a..0000000000
--- a/package/x11r7/xproto_resourceproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_RESOURCEPROTO
-	bool "resourceproto"
-	help
-	  X.Org Resource protocol headers
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.hash b/package/x11r7/xproto_resourceproto/xproto_resourceproto.hash
deleted file mode 100644
index 5ceb1c04ae..0000000000
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1404
-md5	cfdb57dae221b71b2703f8e2980eaaf4	resourceproto-1.2.0.tar.bz2
-sha1	9ff9bb9243b0474330959dc3853973523c9dd9ce	resourceproto-1.2.0.tar.bz2
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
deleted file mode 100644
index 960ca13372..0000000000
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_resourceproto
-#
-################################################################################
-
-XPROTO_RESOURCEPROTO_VERSION = 1.2.0
-XPROTO_RESOURCEPROTO_SOURCE = resourceproto-$(XPROTO_RESOURCEPROTO_VERSION).tar.bz2
-XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_RESOURCEPROTO_LICENSE = MIT
-XPROTO_RESOURCEPROTO_LICENSE_FILES = COPYING
-XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
-XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_scrnsaverproto/Config.in b/package/x11r7/xproto_scrnsaverproto/Config.in
deleted file mode 100644
index 83176a0d56..0000000000
--- a/package/x11r7/xproto_scrnsaverproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_SCRNSAVERPROTO
-	bool "scrnsaverproto"
-	help
-	  X.Org ScrnSaver protocol headers
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.hash b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.hash
deleted file mode 100644
index 36c10362b2..0000000000
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	8bb70a8da164930cceaeb4c74180291660533ad3cc45377b30a795d1b85bcd65	scrnsaverproto-1.2.2.tar.bz2
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
deleted file mode 100644
index 57047cf5a7..0000000000
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_scrnsaverproto
-#
-################################################################################
-
-XPROTO_SCRNSAVERPROTO_VERSION = 1.2.2
-XPROTO_SCRNSAVERPROTO_SOURCE = scrnsaverproto-$(XPROTO_SCRNSAVERPROTO_VERSION).tar.bz2
-XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_SCRNSAVERPROTO_LICENSE = MIT
-XPROTO_SCRNSAVERPROTO_LICENSE_FILES = COPYING
-XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
-XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_videoproto/Config.in b/package/x11r7/xproto_videoproto/Config.in
deleted file mode 100644
index 271c78f39d..0000000000
--- a/package/x11r7/xproto_videoproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_VIDEOPROTO
-	bool "videoproto"
-	help
-	  X.Org Video protocol headers
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.hash b/package/x11r7/xproto_videoproto/xproto_videoproto.hash
deleted file mode 100644
index 471a0a394b..0000000000
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://lists.freedesktop.org/archives/xorg-announce/2016-March/002680.html
-sha256	c7803889fd08e6fcaf7b68cc394fb038b2325d1f315e571a6954577e07cca702	videoproto-2.3.3.tar.bz2
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
deleted file mode 100644
index 896398fc7b..0000000000
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_videoproto
-#
-################################################################################
-
-XPROTO_VIDEOPROTO_VERSION = 2.3.3
-XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
-XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_VIDEOPROTO_LICENSE = MIT
-XPROTO_VIDEOPROTO_LICENSE_FILES = COPYING
-XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
-XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_windowswmproto/Config.in b/package/x11r7/xproto_windowswmproto/Config.in
deleted file mode 100644
index d1a36acc51..0000000000
--- a/package/x11r7/xproto_windowswmproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_WINDOWSWMPROTO
-	bool "windowswmproto"
-	help
-	  No description available
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.hash b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.hash
deleted file mode 100644
index eb96c5fa96..0000000000
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/835
-md5	e74b2ff3172a6117f2a62b655ef99064	windowswmproto-1.0.4.tar.bz2
-sha1	1c9b522c66325f08bb989700b4b31911b6ae60ae	windowswmproto-1.0.4.tar.bz2
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
deleted file mode 100644
index 067bccf01a..0000000000
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_windowswmproto
-#
-################################################################################
-
-XPROTO_WINDOWSWMPROTO_VERSION = 1.0.4
-XPROTO_WINDOWSWMPROTO_SOURCE = windowswmproto-$(XPROTO_WINDOWSWMPROTO_VERSION).tar.bz2
-XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_WINDOWSWMPROTO_LICENSE = MIT
-XPROTO_WINDOWSWMPROTO_LICENSE_FILES = COPYING
-XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
-XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/Config.in b/package/x11r7/xproto_xcmiscproto/Config.in
deleted file mode 100644
index f7ba153499..0000000000
--- a/package/x11r7/xproto_xcmiscproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XCMISCPROTO
-	bool "xcmiscproto"
-	help
-	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.hash b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.hash
deleted file mode 100644
index 08eb58bd39..0000000000
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256	b13236869372256c36db79ae39d54214172677fb79e9cdc555dceec80bd9d2df	xcmiscproto-1.2.2.tar.bz2
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
deleted file mode 100644
index 3bef2e9792..0000000000
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# xproto_xcmiscproto
-#
-################################################################################
-
-XPROTO_XCMISCPROTO_VERSION = 1.2.2
-XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
-XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XCMISCPROTO_LICENSE = MIT
-XPROTO_XCMISCPROTO_LICENSE_FILES = COPYING
-XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
-XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
-HOST_XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xextproto/Config.in b/package/x11r7/xproto_xextproto/Config.in
deleted file mode 100644
index d80d76ceed..0000000000
--- a/package/x11r7/xproto_xextproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XEXTPROTO
-	bool "xextproto"
-	help
-	  X.Org XExt protocol headers
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.hash b/package/x11r7/xproto_xextproto/xproto_xextproto.hash
deleted file mode 100644
index 258c4ec7e5..0000000000
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2013-December/056256.html
-sha256	f3f4b23ac8db9c3a9e0d8edb591713f3d70ef9c3b175970dd8823dfc92aa5bb0	xextproto-7.3.0.tar.bz2
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
deleted file mode 100644
index c17dd938b7..0000000000
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# xproto_xextproto
-#
-################################################################################
-
-XPROTO_XEXTPROTO_VERSION = 7.3.0
-XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
-XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XEXTPROTO_LICENSE = MIT
-XPROTO_XEXTPROTO_LICENSE_FILES = COPYING
-XPROTO_XEXTPROTO_INSTALL_STAGING = YES
-XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
-HOST_XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86bigfontproto/Config.in b/package/x11r7/xproto_xf86bigfontproto/Config.in
deleted file mode 100644
index 7af30d03d7..0000000000
--- a/package/x11r7/xproto_xf86bigfontproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO
-	bool "xf86bigfontproto"
-	help
-	  X.Org XF86BigFont protocol headers
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.hash b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.hash
deleted file mode 100644
index b0ab8aeb20..0000000000
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/734
-md5	120e226ede5a4687b25dd357cc9b8efe	xf86bigfontproto-1.2.0.tar.bz2
-sha1	312a2ea708b257520c1af4393b69d73a393a478f	xf86bigfontproto-1.2.0.tar.bz2
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
deleted file mode 100644
index f88f5ecace..0000000000
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_xf86bigfontproto
-#
-################################################################################
-
-XPROTO_XF86BIGFONTPROTO_VERSION = 1.2.0
-XPROTO_XF86BIGFONTPROTO_SOURCE = xf86bigfontproto-$(XPROTO_XF86BIGFONTPROTO_VERSION).tar.bz2
-XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86BIGFONTPROTO_LICENSE = MIT
-XPROTO_XF86BIGFONTPROTO_LICENSE_FILES = COPYING
-XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
-XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86dgaproto/Config.in b/package/x11r7/xproto_xf86dgaproto/Config.in
deleted file mode 100644
index 7561b8a6dc..0000000000
--- a/package/x11r7/xproto_xf86dgaproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86DGAPROTO
-	bool "xf86dgaproto"
-	help
-	  X.Org XF86DGA protocol headers
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
deleted file mode 100644
index 36284fcd52..0000000000
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/817
-md5	a036dc2fcbf052ec10621fd48b68dbb1	xf86dgaproto-2.1.tar.bz2
-sha1	97a06120e7195c968875e8ba42e82c90ab54948b	xf86dgaproto-2.1.tar.bz2
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
deleted file mode 100644
index d671bf0094..0000000000
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_xf86dgaproto
-#
-################################################################################
-
-XPROTO_XF86DGAPROTO_VERSION = 2.1
-XPROTO_XF86DGAPROTO_SOURCE = xf86dgaproto-$(XPROTO_XF86DGAPROTO_VERSION).tar.bz2
-XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DGAPROTO_LICENSE = MIT
-XPROTO_XF86DGAPROTO_LICENSE_FILES = COPYING
-XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
-XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86driproto/Config.in b/package/x11r7/xproto_xf86driproto/Config.in
deleted file mode 100644
index 8aeac87286..0000000000
--- a/package/x11r7/xproto_xf86driproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86DRIPROTO
-	bool "xf86driproto"
-	help
-	  X.Org XF86DRI protocol headers
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
deleted file mode 100644
index 85d4bfcc9e..0000000000
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1310
-md5	1d716d0dac3b664e5ee20c69d34bc10e	xf86driproto-2.1.1.tar.bz2
-sha1	23e861f40ba0f0cbbfd7db7ba2ef623762ffca17	xf86driproto-2.1.1.tar.bz2
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
deleted file mode 100644
index e6bb0f12f1..0000000000
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_xf86driproto
-#
-################################################################################
-
-XPROTO_XF86DRIPROTO_VERSION = 2.1.1
-XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
-XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86DRIPROTO_LICENSE = MIT
-XPROTO_XF86DRIPROTO_LICENSE_FILES = COPYING
-XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
-XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/Config.in b/package/x11r7/xproto_xf86vidmodeproto/Config.in
deleted file mode 100644
index 395c175861..0000000000
--- a/package/x11r7/xproto_xf86vidmodeproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
-	bool "xf86vidmodeproto"
-	help
-	  X.Org XF86VidMode protocol headers
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.hash b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.hash
deleted file mode 100644
index d80749be60..0000000000
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1311
-md5	e793ecefeaecfeabd1aed6a01095174e	xf86vidmodeproto-2.3.1.tar.bz2
-sha1	11d54c3210887631ea71e8f8030a77692e964fc4	xf86vidmodeproto-2.3.1.tar.bz2
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
deleted file mode 100644
index 41637983a6..0000000000
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_xf86vidmodeproto
-#
-################################################################################
-
-XPROTO_XF86VIDMODEPROTO_VERSION = 2.3.1
-XPROTO_XF86VIDMODEPROTO_SOURCE = xf86vidmodeproto-$(XPROTO_XF86VIDMODEPROTO_VERSION).tar.bz2
-XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XF86VIDMODEPROTO_LICENSE = MIT
-XPROTO_XF86VIDMODEPROTO_LICENSE_FILES = COPYING
-XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
-XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xineramaproto/Config.in b/package/x11r7/xproto_xineramaproto/Config.in
deleted file mode 100644
index 12c8e05b16..0000000000
--- a/package/x11r7/xproto_xineramaproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XINERAMAPROTO
-	bool "xineramaproto"
-	help
-	  X.Org Xinerama protocol headers
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.hash b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.hash
deleted file mode 100644
index 162c994898..0000000000
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/1312
-md5	9959fe0bfb22a0e7260433b8d199590a	xineramaproto-1.2.1.tar.bz2
-sha1	818bffc16139d6e3de4344c83f00c495d3536753	xineramaproto-1.2.1.tar.bz2
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
deleted file mode 100644
index 4c9ae11d28..0000000000
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_xineramaproto
-#
-################################################################################
-
-XPROTO_XINERAMAPROTO_VERSION = 1.2.1
-XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
-XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XINERAMAPROTO_LICENSE = MIT
-XPROTO_XINERAMAPROTO_LICENSE_FILES = COPYING
-XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
-XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xproto/Config.in b/package/x11r7/xproto_xproto/Config.in
deleted file mode 100644
index a5f88ef7c2..0000000000
--- a/package/x11r7/xproto_xproto/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XPROTO_XPROTO
-	bool "xproto"
-	help
-	  X.Org xproto protocol headers
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.hash b/package/x11r7/xproto_xproto/xproto_xproto.hash
deleted file mode 100644
index 4b77d256af..0000000000
--- a/package/x11r7/xproto_xproto/xproto_xproto.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2016-September/002713.html
-sha256 c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747  xproto-7.0.31.tar.bz2
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
deleted file mode 100644
index 76f9d32b19..0000000000
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# xproto_xproto
-#
-################################################################################
-
-XPROTO_XPROTO_VERSION = 7.0.31
-XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
-XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XPROTO_LICENSE = MIT
-XPROTO_XPROTO_LICENSE_FILES = COPYING
-XPROTO_XPROTO_INSTALL_STAGING = YES
-XPROTO_XPROTO_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/Config.in b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
deleted file mode 100644
index bb31f03065..0000000000
--- a/package/x11r7/xproto_xproxymanagementprotocol/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
-	bool "xproxymanagementprotocol"
-	help
-	  The Proxy Management Protocol is an ICE based protocol that
-	  provides a way for application servers to easily locate
-	  proxy services available to them.
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
deleted file mode 100644
index 27a9dfa8a4..0000000000
--- a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From http://lists.x.org/archives/xorg-announce/2009-October/001150.html
-sha1	4abb036371670ecc25d32e48b3277fe203ae5203	xproxymanagementprotocol-1.0.3.tar.bz2
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
deleted file mode 100644
index a48269aa13..0000000000
--- a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xproto_xproxymanagementprotocol
-#
-################################################################################
-
-XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION = 1.0.3
-XPROTO_XPROXYMANAGEMENTPROTOCOL_SOURCE = xproxymanagementprotocol-$(XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION).tar.bz2
-XPROTO_XPROXYMANAGEMENTPROTOCOL_SITE = http://xorg.freedesktop.org/releases/individual/proto
-XPROTO_XPROXYMANAGEMENTPROTOCOL_LICENSE = MIT
-XPROTO_XPROXYMANAGEMENTPROTOCOL_LICENSE_FILES = COPYING
-XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_STAGING = YES
-XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-- 
2.17.1
