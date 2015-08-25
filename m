From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 12:28:41 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: Add
	libdrm dependency when dri or dri2 is enabled
Message-ID: <20150825102853.345447FC2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77397b1c72323b8019b94abba7ca03af1aee2c0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes compile error using this defconfig
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XPROTO_DRI2PROTO=y

drmVersionPtr is referenced not only in hw/xfree86/dri2/dri2.c
but also in hw/xfree86/dri/dri.c.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index f0ec598..8b794b3 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -92,6 +92,8 @@ choice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
+	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
+		BR2_PACKAGE_XPROTO_DRI2PROTO)
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This variant of the X.org server is the full-blown variant,
