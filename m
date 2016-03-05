From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 15:51:27 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-hdhomerun: new package
Message-ID: <20160305145309.D104880819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5250b26c8a47b52334058c1f3f7effab25c9ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-hdhomerun/Config.in               |  9 +++++++++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash |  2 ++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 15 +++++++++++++++
 package/kodi/Config.in                             |  1 +
 4 files changed, 27 insertions(+)

diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
new file mode 100644
index 0000000..ed5b914
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_PVR_HDHOMERUN
+	bool "kodi-pvr-hdhomerun"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBHDHOMERUN
+	help
+	  Kodi's HDHomeRun client addon
+
+	  https://github.com/kodi-pvr/pvr.hdhomerun
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
new file mode 100644
index 0000000..e822ae2
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  356548f86616a421e0b1d7f2a91eb5159c74b666973faa9de626940eb89afc54  kodi-pvr-hdhomerun-8d7b8af10633ad995193fb045cbaac6094a8f98d.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
new file mode 100644
index 0000000..c35c38a
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-pvr-hdhomerun
+#
+################################################################################
+
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_HDHOMERUN_VERSION = 8d7b8af10633ad995193fb045cbaac6094a8f98d
+KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
+KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
+KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
+KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ff6a3e6..07f9393 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -250,6 +250,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
+	source "package/kodi-pvr-hdhomerun/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
