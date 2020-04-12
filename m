From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:26:22 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-vuplus: needs gcc >= 4.9
Message-ID: <20200412101339.0C0938E5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76c2914703166eeb179c9392740ee2301235eb02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 2cc2ae83fca29e3f70a42759a105bb1495831e7e, kodi-pvr-vuplus
has a dependency on json-for-modern-cpp, but the dependency of
json-for-modern-cpp on gcc >= 4.9 was not propagated. Let's fix that.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-vuplus/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index 96320f6fcb..b6a03e843f 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_VUPLUS
 	bool "kodi-pvr-vuplus"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_TINYXML
@@ -7,3 +8,6 @@ config BR2_PACKAGE_KODI_PVR_VUPLUS
 	  VuPlus PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vuplus
+
+comment "kodi-pvr-vuplus needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
