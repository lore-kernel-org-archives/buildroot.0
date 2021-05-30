From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 May 2021 07:58:18 +0200
Subject: [Buildroot] [PATCH/next v2 3/4] package/intel-mediasdk: bump
 version to 21.1.3
In-Reply-To: <20210530055819.101091-1-bernd.kuhls@t-online.de>
References: <20210530055819.101091-1-bernd.kuhls@t-online.de>
Message-ID: <20210530055819.101091-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed dependency to X.org following changes in intel-mediadriver.
Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 package/intel-mediasdk/Config.in           | 5 -----
 package/intel-mediasdk/intel-mediasdk.hash | 4 ++--
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
index 05293d7604..c1f609e3f8 100644
--- a/package/intel-mediasdk/Config.in
+++ b/package/intel-mediasdk/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
-	depends on BR2_PACKAGE_XORG7  # intel-mediadriver
 	select BR2_PACKAGE_INTEL_MEDIADRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -21,10 +20,6 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 
 	  http://mediasdk.intel.com/
 
-comment "intel-mediasdk needs X.org"
-	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on !BR2_PACKAGE_XORG7
-
 comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 103c8bb52d..04947b6eee 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 289a40ffe73dc291461d97edf452bdc622f76e52666483fd1eb4f131d2921cd1  intel-mediasdk-19.4.0.tar.gz
-sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
+sha256  718e68e3be78fcdc2dea0e3cd4714c38df2d451d7c8afef840c9c07e82bd4cb9  intel-mediasdk-21.1.3.tar.gz
+sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 5467c96380..93bf25779a 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 19.4.0
+INTEL_MEDIASDK_VERSION = 21.1.3
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.29.2
