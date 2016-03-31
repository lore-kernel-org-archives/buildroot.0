From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:38:37 +0200
Subject: [Buildroot] [git commit] libdrm: add vc4 (Raspberry Pi) option
Message-ID: <20160331163901.7F75D81D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78efe747c51b0e7068941fc2629b28031a9321f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in | 6 ++++++
 package/libdrm/libdrm.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 445a85b..343a2ed 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -69,6 +69,12 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 	help
 	  Install NVIDIA Tegra driver using an experimental API.
 
+config BR2_PACKAGE_LIBDRM_VC4
+	bool "vc4"
+	depends on BR2_arm
+	help
+	  Install vc4 (Raspberry Pi) driver.
+
 endmenu
 
 endif
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 99a78d2..4082a19 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -76,6 +76,12 @@ else
 LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
+LIBDRM_CONF_OPTS += --enable-vc4
+else
+LIBDRM_CONF_OPTS += --disable-vc4
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBDRM_CONF_OPTS += --enable-udev
 LIBDRM_DEPENDENCIES += udev
