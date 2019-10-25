From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:07:29 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: switch
 to virtual opengl provider
Message-ID: <20191025180402.4DE2B880E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec48b624b7bd7c675d187aa872ed1e2a03cb6995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to use xserver_xorg-server without mesa3d.

Build-tested using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_NVIDIA_DRIVER=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 41c82ad930..8ccc04224d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -120,9 +120,9 @@ else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
+XSERVER_XORG_SERVER_DEPENDENCIES += libgl
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
