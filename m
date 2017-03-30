From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:19:17 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/mesa3d: add
	lm-sensors optional dependency
Message-ID: <20170331071605.CDC79826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51038b08eebee72d89ec7871d1ffe5c84abb2b9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

radeon-pci-0008
Adapter: PCI adapter
temp1:        +56.0 C  (crit = +120.0 C, hyst = +90.0 C)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 73401587e5984397bedddab61ad6c89712041267)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0c68ded..bf2ab6e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -177,6 +177,13 @@ else
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
 
