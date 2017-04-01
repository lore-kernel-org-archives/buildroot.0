From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:56:45 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add libvdpau optional
	dependency
Message-ID: <20170401135650.4DDE081DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c4002e9afc7dbadb95453fccf1d47736a8e5cca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libvdpau package is build before mesa3d, it will be detected and
enabled by the configure script.

Handle libvdpau in mesa3d for consistency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ca23f41..4b95e9b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -176,6 +176,13 @@ else
 MESA3D_CONF_OPTS += --disable-texture-float
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
+MESA3D_DEPENDENCIES += libvdpau
+MESA3D_CONF_OPTS += --enable-vdpau
+else
+MESA3D_CONF_OPTS += --disable-vdpau
+endif
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 MESA3D_CONF_OPTS += --enable-lmsensors
 MESA3D_DEPENDENCIES += lm-sensors
