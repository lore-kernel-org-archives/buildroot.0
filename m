From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 12:58:09 +0100
Subject: [Buildroot] [PATCH v2 5/5] package/x11r7/xserver_xorg-server: bump
	version to 1.19.0
In-Reply-To: <20161203115809.25297-1-bernd.kuhls@t-online.de>
References: <20161203115809.25297-1-bernd.kuhls@t-online.de>
Message-ID: <20161203115809.25297-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release bumped video ABI to version 23
https://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/common/xf86Module.h?id=8d3f0e964e399dcfa8eb5e85d405217fdc5dbcd4
https://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/common/xf86Module.h?id=c07b796b47ae7f5a616d5e8e02ab0f84dc438a93
https://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/common/xf86Module.h?id=4af00242ef1e39499b932d12423fdf449296090a

and depends on xlib_libXfont2
https://cgit.freedesktop.org/xorg/xserver/commit/?id=05a793f5b3c40747d5a92a076def7f4fb673c7e7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: instead of adding 1.19 as additional choice this patch contains a
    version bump (Thomas)

 .../0001-modesettings-needs-dri2.patch                   |  0
 package/x11r7/xserver_xorg-server/Config.in              | 16 +++++++++-------
 .../x11r7/xserver_xorg-server/xserver_xorg-server.hash   |  4 ++--
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  9 ++++++++-
 4 files changed, 19 insertions(+), 10 deletions(-)
 rename package/x11r7/xserver_xorg-server/{1.18.4 => 1.19.0}/0001-modesettings-needs-dri2.patch (100%)

diff --git a/package/x11r7/xserver_xorg-server/1.18.4/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.19.0/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.18.4/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.19.0/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index df3801c..1d4a1fb 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
@@ -61,37 +60,40 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	bool
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 	bool
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
 	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
-	default 20 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
+	default 23 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
 
 choice
 	bool "X Window System server version"
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
-	bool "1.18.4"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
+	bool "1.19.0"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_23
+	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	bool "1.17.4"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 	bool "1.14.7"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+	select BR2_PACKAGE_XLIB_LIBXFONT
 
 endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
-	default "1.18.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.19.0" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index ab7ba7e..54ae0ec 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -3,5 +3,5 @@ sha1   7a95765e56b124758fcd7b609589e65b8870880b                                x
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
 sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2016-July/002699.html
-sha256 278459b2c31d61a15655d95a72fb79930c480a6bb8cf9226e48a07df8b1d31c8        xorg-server-1.18.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-November/002737.html
+sha256 149a708b50befc2d5a40b98d45ddd2ebe0beec018e6d0c663c43bad6210e4da3        xorg-server-1.19.0.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 51c3efc..48cd2a7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -15,7 +15,6 @@ XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xfont_font-util			\
 	xutil_util-macros 		\
-	xlib_libXfont 			\
 	xlib_libX11 			\
 	xlib_libXau 			\
 	xlib_libXdmcp 			\
@@ -194,6 +193,14 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-record
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT2),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont2
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXfont
+endif
+
 ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xvmc
 endif
-- 
2.10.2
