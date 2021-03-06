From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:49 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-vdr-vnsi:
 bump version to 8.2.1-Matrix
Message-ID: <20210306213555.5278986DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbe372ac12ad50a7d8048ddd3eea8cb7963b49bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch dependency to kodi after upstream removed the dependency to
kodi-platform:
https://github.com/kodi-pvr/pvr.vdr.vnsi/commit/d8af242ba923590330c65fded9034c1ac9b6157c
https://github.com/kodi-pvr/pvr.vdr.vnsi/commit/49cc728f18bbe8df1d1779eb5e42e060fa9f78ed

Added dependency to gcc >= 7 due to c++17 code added by
https://github.com/kodi-pvr/pvr.vdr.vnsi/commit/8a3f3c8fe378a4aae4ac381db45d0ce980f44761

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-vdr-vnsi/Config.in              | 5 ++++-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash | 4 ++--
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk   | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/kodi-pvr-vdr-vnsi/Config.in b/package/kodi-pvr-vdr-vnsi/Config.in
index 768dec88fd..6b57900b29 100644
--- a/package/kodi-pvr-vdr-vnsi/Config.in
+++ b/package/kodi-pvr-vdr-vnsi/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_KODI_PVR_VDR_VNSI
 	bool "kodi-pvr-vdr-vnsi"
-	select BR2_PACKAGE_KODI_PLATFORM
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	help
 	  Kodi PVR addon VNSI
 
 	  https://github.com/kodi-pvr/pvr.vdr.vnsi
+
+comment "kodi-pvr-vdr-vnsi needs a toolchain w/ gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index f7043b58a0..8b6548de9a 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f0ea8907e77ca014429bbe73d07c3410cc7be25a6db0df157863b87d2684affb  kodi-pvr-vdr-vnsi-3.6.4-Leia.tar.gz
-sha256  28266596fdf4162d4f15985e0108cd9ddb42531ddad2297011649c1af49f7fe2  debian/copyright
+sha256  aebb00f433b93256760960149e41647d65c84fdf6a78d7467df304f26c8bc4b2  kodi-pvr-vdr-vnsi-8.2.2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index f467fa98f5..4eff02f264 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 3.6.4-Leia
+KODI_PVR_VDR_VNSI_VERSION = 8.2.2-Matrix
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
-KODI_PVR_VDR_VNSI_LICENSE_FILES = debian/copyright
-KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
+KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
+KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
