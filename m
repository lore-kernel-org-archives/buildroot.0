From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Dec 2010 21:32:05 +0100
Subject: [Buildroot] [git commit master 1/1] mesa3d: ensure it can only be
	compiled with modular X server
Message-ID: <20101227203241.AF9038EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d741cf7c62a5197a138a4e0890bf99f026dd0354
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kdrive has no glx support, and mesa3d depends on libdrm which needs
largefile support (just like the modular server), so ensure mesa3d
can only be enabled in that configuration.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mesa3d/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 52876e3..596eea3 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	depends on BR2_PACKAGE_XSERVER_xorg
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
-- 
1.7.2.2
