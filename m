From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 19 Mar 2017 21:51:53 +0100
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: add lm-sensors optional
	dependency
Message-ID: <20170319205155.3333-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

radeon-pci-0008
Adapter: PCI adapter
temp1:        +56.0 C  (crit = +120.0 C, hyst = +90.0 C)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d29a043..61baa50 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -180,6 +180,13 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+MESA3D_CONF_OPTS += --enable-lmsensors
+MESA3D_DEPENDENCIES += lm-sensors
+else
+MESA3D_CONF_OPTS += --disable-lmsensors
+endif
+
 # Avoid automatic search of llvm-config
 MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
 
-- 
2.9.3
