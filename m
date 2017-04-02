From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:44:00 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.8.0
Message-ID: <20170402214406.99A8E82670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa944024c12da7e3516a5e8df36d1cd7be508398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autoreconf is not necessary anymore after a fix was commit upstream:
https://github.com/01org/intel-vaapi-driver/commit/fe6280841dfaaee94e8664517420f351cd334c86

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/libva-intel-driver.hash | 4 +++-
 package/libva-intel-driver/libva-intel-driver.mk   | 7 +++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index a968876..ea885bc 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,4 @@
+# From https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000016.html
+sha1 9982122c8ef36aad01aa09c083974532afa8f8ca intel-vaapi-driver-1.8.0.tar.bz2
 # Locally computed
-sha256 c1f02cbdf0398f096ddc91096fac6ee62267a54955f6d235d73a8ff2ea888118  libva-intel-driver-1.7.3.tar.gz
+sha256 4fcbb282957cf4f33b6c43a0f476d8df21f7721e586a8546c71242551986b3a6  intel-vaapi-driver-1.8.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index e2f855b..ef14ca1 100644
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
