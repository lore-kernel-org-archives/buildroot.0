From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Mar 2017 18:28:50 +0200
Subject: [Buildroot] [PATCH 2/5] package/mesa3d: add libvdpau optional
	dependency
In-Reply-To: <20170326162853.3022-1-romain.naour@gmail.com>
References: <20170326162853.3022-1-romain.naour@gmail.com>
Message-ID: <20170326162853.3022-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libvdpau package is build before mesa3d, it will be detected and
enabled by the configure script.

Handle libvdpau in mesa3d for consistency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 57e83ca..caaf03a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -190,6 +190,13 @@ else
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
-- 
2.9.3
