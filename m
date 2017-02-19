From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:37:27 +0100
Subject: [Buildroot] [git commit] package/libva-intel-driver: project moved
	to github
Message-ID: <20170301170422.65ACB822A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8cd8eff93c918196092a7fba812d6b8367a77b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details read
https://lists.01.org/pipermail/intel-vaapi-media/2017-January/000001.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/Config.in               | 2 +-
 package/libva-intel-driver/libva-intel-driver.hash | 4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 0f5b656..a39e554 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	help
 	  VA-API back-end driver for Intel graphics chips
 
-	  https://01.org/linuxgraphics/community/vaapi
+	  https://01.org/linuxmedia/vaapi
 
 comment "libva intel driver needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 10664d0..a968876 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/libva/2016-November/004731.html
-sha1 5100f187afc4e39fce5664b96fe11a38faa9afaa  libva-intel-driver-1.7.3.tar.bz2
+# Locally computed
+sha256 c1f02cbdf0398f096ddc91096fac6ee62267a54955f6d235d73a8ff2ea888118  libva-intel-driver-1.7.3.tar.gz
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 86f6eaa..e2f855b 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LIBVA_INTEL_DRIVER_VERSION = 1.7.3
-LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
-LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
+LIBVA_INTEL_DRIVER_SITE = \
+	$(call github,01org,intel-vaapi-driver,$(LIBVA_INTEL_DRIVER_VERSION))
 LIBVA_INTEL_DRIVER_LICENSE = MIT
 LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
 # needed to work around https://bugs.freedesktop.org/show_bug.cgi?id=79478
