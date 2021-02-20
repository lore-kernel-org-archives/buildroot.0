From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:44 +0100
Subject: [Buildroot] [PATCH/next 25/54] package/kodi-pvr-octonet: bump
 version to 4.1.0-2-Matrix
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-26-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch dependency to kodi after upstream removed the dependency to
libplatform and kodi-platform:
https://github.com/DigitalDevices/pvr.octonet/commit/ec08c205408de47a08fdc6e540e21dc0d6e18bd7
https://github.com/DigitalDevices/pvr.octonet/commit/e7449d9537a650790c2e742a57277d46b6cf6b33

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-octonet/Config.in             | 2 --
 package/kodi-pvr-octonet/kodi-pvr-octonet.hash | 4 ++--
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk   | 6 +++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/kodi-pvr-octonet/Config.in b/package/kodi-pvr-octonet/Config.in
index b8bcd7e218..e831194ba5 100644
--- a/package/kodi-pvr-octonet/Config.in
+++ b/package/kodi-pvr-octonet/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_KODI_PVR_OCTONET
 	bool "kodi-pvr-octonet"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
-	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  DigitalDevices Octonet PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
index 5ee0eeb6e9..8fdeac2a92 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e55d440afe3b1f1bc1529d1f662d4d18f5334ecf01e023d34d5a7e419b6fbf10  kodi-pvr-octonet-e35cc373476a92aee11ec8e8a14fb8fc086a4f84.tar.gz
-sha256  8547bcbe8bd72c18ac285fd801fcbff8806a988913741b14497f4aba88bba403  debian/copyright
+sha256  091ba0288a8c12d42f6352b453fb39bcace3174c8763f6cbe3dc8fef40a33f2b  kodi-pvr-octonet-4.1.0-2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index 890a283565..becd43a4e4 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_OCTONET_VERSION = e35cc373476a92aee11ec8e8a14fb8fc086a4f84
+KODI_PVR_OCTONET_VERSION = 4.1.0-2-Matrix
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
-KODI_PVR_OCTONET_LICENSE_FILES = debian/copyright
-KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi-platform libplatform
+KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
+KODI_PVR_OCTONET_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
