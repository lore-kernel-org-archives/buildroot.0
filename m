From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:53 +0100
Subject: [Buildroot] [PATCH 6/8] package/openocd: depends on libftdi1
	instead of libftdi
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openocd/Config.in  | 8 ++++----
 package/openocd/openocd.mk | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 7c140c7..2db17fa 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -121,7 +121,7 @@ config BR2_PACKAGE_OPENOCD_PARPORT
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2232 based devices (DEPRECATED)"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -135,7 +135,7 @@ config BR2_PACKAGE_OPENOCD_VPI
 
 config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -176,7 +176,7 @@ config BR2_PACKAGE_OPENOCD_GW16012
 
 config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
@@ -185,7 +185,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
 
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
-	select BR2_PACKAGE_LIBFTDI
+	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	depends on BR2_ARCH_HAS_ATOMICS
 	help
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index fd7e09f..4023af8 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -23,7 +23,7 @@ OPENOCD_CONF_OPTS = \
 # the dependencies they need.
 
 OPENOCD_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_LIBFTDI),libftdi) \
+	$(if $(BR2_PACKAGE_LIBFTDI),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
 	$(if $(BR2_PACKAGE_LIBHID),libhid)
-- 
2.2.2
