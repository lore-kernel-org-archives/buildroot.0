From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Apr 2017 10:13:26 +0200
Subject: [Buildroot] [PATCH 2/3] package/libva-intel-driver: bump version to
	1.8.0
In-Reply-To: <20170402081327.2195-1-bernd.kuhls@t-online.de>
References: <20170402081327.2195-1-bernd.kuhls@t-online.de>
Message-ID: <20170402081327.2195-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autoreconf is not necessary anymore after a fix was commit upstream:
https://github.com/01org/intel-vaapi-driver/commit/fe6280841dfaaee94e8664517420f351cd334c86

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 +++-
 package/libva-intel-driver/libva-intel-driver.mk   | 7 +++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index a9688763a..ea885bc52 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,4 @@
+# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000016.html
+sha1 9982122c8ef36aad01aa09c083974532afa8f8ca intel-vaapi-driver-1.8.0.tar.bz2
 # Locally computed
-sha256 c1f02cbdf0398f096ddc91096fac6ee62267a54955f6d235d73a8ff2ea888118  libva-intel-driver-1.7.3.tar.gz
+sha256 4fcbb282957cf4f33b6c43a0f476d8df21f7721e586a8546c71242551986b3a6  intel-vaapi-driver-1.8.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index e2f855bb3..ef14ca1e2 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.7.3
+LIBVA_INTEL_DRIVER_VERSION = 1.8.0
+LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = \
-	$(call github,01org,intel-vaapi-driver,$(LIBVA_INTEL_DRIVER_VERSION))
+	https://github.com/01org/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
-# needed to work around https://bugs.freedesktop.org/show_bug.cgi?id=79478
-LIBVA_INTEL_DRIVER_AUTORECONF = YES
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
2.11.0
