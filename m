From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:56:58 +0200
Subject: [Buildroot] [git commit] package/meda3d: add xlib_libXvMC optional
	dependency
Message-ID: <20170401135702.E6AB8807C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59b89750473be0a41307ee25f66254100a02df92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If xlib_libXvMC package is build before mesa3d, it will be detected and
enabled by the configure script.

Handle xlib_libXvMC in mesa3d for consistency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4b95e9b..6fa1599 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -176,6 +176,13 @@ else
 MESA3D_CONF_OPTS += --disable-texture-float
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
+MESA3D_DEPENDENCIES += xlib_libXvMC
+MESA3D_CONF_OPTS += --enable-xvmc
+else
+MESA3D_CONF_OPTS += --disable-xvmc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
 MESA3D_DEPENDENCIES += libvdpau
 MESA3D_CONF_OPTS += --enable-vdpau
