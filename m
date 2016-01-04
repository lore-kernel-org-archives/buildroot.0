From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  4 Jan 2016 01:11:49 +0100
Subject: [Buildroot] [PATCH 5/6] package/x11r7/xserver_xorg-server: move
	libpciaccess selection
In-Reply-To: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
References: <1451866310-10246-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1451866310-10246-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move libpciaccess selection under BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
to simplify.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index f407d34..ac1369e 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
@@ -96,6 +95,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
 		BR2_PACKAGE_XPROTO_DRI2PROTO)
+	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	help
 	  This variant of the X.org server is the full-blown variant,
-- 
2.4.3
