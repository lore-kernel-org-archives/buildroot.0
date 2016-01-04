From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jan 2016 01:11:47 +0100
Subject: [Buildroot] [PATCH 3/6] package/x11r7/xserver_xorg-server: reorder
	select/depends
In-Reply-To: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1451866310-10246-3-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in exemple in the manual suggest to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2bc3f75..71697ef 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
@@ -48,7 +49,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
-	depends on BR2_USE_MMU # fork()
 	help
 	  X.Org X server
 
@@ -93,9 +93,9 @@ choice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
 		BR2_PACKAGE_XPROTO_DRI2PROTO)
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This variant of the X.org server is the full-blown variant,
 	  as used by desktop GNU/Linux distributions. The drivers (for
-- 
2.4.3
