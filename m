From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 12:07:16 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-octonet: new package
Message-ID: <20200614100646.D06C0818AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ce6878aa45663b2f0538e5445737ab7adf4403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-pvr-octonet/Config.in             | 13 +++++++++++++
 package/kodi-pvr-octonet/kodi-pvr-octonet.hash |  3 +++
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk   | 13 +++++++++++++
 package/kodi/Config.in                         |  1 +
 4 files changed, 30 insertions(+)

diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
new file mode 100644
index 0000000000..b8bcd7e218
--- /dev/null
+++ b/package/kodi-pvr-octonet/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KODI_PVR_OCTONET
+	bool "kodi-pvr-octonet"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	help
+	  DigitalDevices Octonet PVR client addon for Kodi
+
+	  https://github.com/DigitalDevices/pvr.octonet
+
+comment "kodi-pvr-octonet needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
new file mode 100644
index 0000000000..5ee0eeb6e9
--- /dev/null
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e55d440afe3b1f1bc1529d1f662d4d18f5334ecf01e023d34d5a7e419b6fbf10  kodi-pvr-octonet-e35cc373476a92aee11ec8e8a14fb8fc086a4f84.tar.gz
+sha256  8547bcbe8bd72c18ac285fd801fcbff8806a988913741b14497f4aba88bba403  debian/copyright
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
new file mode 100644
index 0000000000..890a283565
--- /dev/null
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-octonet
+#
+################################################################################
+
+KODI_PVR_OCTONET_VERSION = e35cc373476a92aee11ec8e8a14fb8fc086a4f84
+KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
+KODI_PVR_OCTONET_LICENSE = GPL-2.0+
+KODI_PVR_OCTONET_LICENSE_FILES = debian/copyright
+KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi-platform libplatform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fb6b07b53f..7d66c822dc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -336,6 +336,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-mythtv/Config.in"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
+	source "package/kodi-pvr-octonet/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
