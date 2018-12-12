From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:34 +0100
Subject: [Buildroot] [PATCH v2 09/14] use select instead of depend for fftw
 package and fix DEPENDENCIES
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-9-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/hackrf/Config.in | 6 ++----
 package/hackrf/hackrf.mk | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
index 4fa27699c4..b86790f2b0 100644
--- a/package/hackrf/Config.in
+++ b/package/hackrf/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_HACKRF
 	bool "hackrf"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_LIBUSB
 	help
 	  Library and tools for accessing HackRF SDR boards.
@@ -11,6 +12,3 @@ config BR2_PACKAGE_HACKRF
 
 comment "hackrf needs a toolchain w/ threads, dynamic library"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "hackrf needs fftw's single precision"
-	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index acab0be1d3..b83f6518e8 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -9,7 +9,7 @@ HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VER
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+ BSD-3c
 HACKRF_LICENSE_FILES = COPYING
-HACKRF_DEPENDENCIES = fftw libusb
+HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
 HACKRF_INSTALL_STAGING = YES
 
-- 
2.19.2
