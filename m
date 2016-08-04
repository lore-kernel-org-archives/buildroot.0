From: Petri Gynther <pgynther@google.com>
Date: Thu,  4 Aug 2016 15:30:00 -0700
Subject: [Buildroot] [PATCH 3/3] uclibc: configs: rename BR2_PTHREAD_DEBUG
In-Reply-To: <1470349800-27521-1-git-send-email-pgynther@google.com>
References: <1470349800-27521-1-git-send-email-pgynther@google.com>
Message-ID: <1470349800-27521-3-git-send-email-pgynther@google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename BR2_PTHREAD_DEBUG to BR2_PTHREADS_DEBUG to be consistent
with BR2_PTHREADS_* config item naming.

Signed-off-by: Petri Gynther <pgynther@google.com>
---
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig     | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig | 2 +-
 package/uclibc/Config.in                         | 2 +-
 package/uclibc/uclibc.mk                         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index d7f4717..aa52bd0 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
-BR2_PTHREAD_DEBUG=y
+BR2_PTHREADS_DEBUG=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index d51a141..220c941 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -9,7 +9,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
-BR2_PTHREAD_DEBUG=y
+BR2_PTHREADS_DEBUG=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index c45c2ce..e360cfb 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -9,7 +9,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
-BR2_PTHREAD_DEBUG=y
+BR2_PTHREADS_DEBUG=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 7dadeca..cad4eb1 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
-BR2_PTHREAD_DEBUG=y
+BR2_PTHREADS_DEBUG=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 9e11efa..1738a9a 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 # Needed for gdb
-BR2_PTHREAD_DEBUG=y
+BR2_PTHREADS_DEBUG=y
 # Needed for some packages
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 6c16ed4..e459f44 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -69,7 +69,7 @@ choice
 		depends on !BR2_m68k && !BR2_microblaze
 endchoice
 
-config BR2_PTHREAD_DEBUG
+config BR2_PTHREADS_DEBUG
 	bool "Thread library debugging"
 	depends on BR2_PTHREADS || BR2_PTHREADS_NATIVE
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 124bd59..6fd0768 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -353,7 +353,7 @@ endif
 # Thread debug
 #
 
-ifeq ($(BR2_PTHREAD_DEBUG),y)
+ifeq ($(BR2_PTHREADS_DEBUG),y)
 UCLIBC_THREAD_DEBUG_CONFIG = $(call KCONFIG_ENABLE_OPT,PTHREADS_DEBUG_SUPPORT,$(@D)/.config)
 else
 UCLIBC_THREAD_DEBUG_CONFIG = $(call KCONFIG_DISABLE_OPT,PTHREADS_DEBUG_SUPPORT,$(@D)/.config)
-- 
2.8.0.rc3.226.g39d4020
