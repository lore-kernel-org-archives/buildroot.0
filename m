From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:16:23 +0100
Subject: [Buildroot] [git commit] package/mesa3d: add lm-sensors optional
	dependency
Message-ID: <20170320212053.80A5980E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73401587e5984397bedddab61ad6c89712041267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

radeon-pci-0008
Adapter: PCI adapter
temp1:        +56.0 C  (crit = +120.0 C, hyst = +90.0 C)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9774f05..0ad8ded 100644
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
 
