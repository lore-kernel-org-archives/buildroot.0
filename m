From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:40 +0100
Subject: [Buildroot] [PATCH 7/9] Rename BR2_PROGRAM_INVOCATION to
	BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c30b3ace0ef27155f16cd2836b8e641fa2cf9412.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/Config.in                      |    4 ++--
 package/tar/Config.in                            |    4 ++--
 package/usbutils/Config.in                       |    4 ++--
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    2 +-
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index d72df3a..674c2d4 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
@@ -14,4 +14,4 @@ config BR2_PACKAGE_COREUTILS
 	  http://www.gnu.org/software/coreutils/
 
 comment "coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION)
+	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION)
diff --git a/package/tar/Config.in b/package/tar/Config.in
index 87d2c63..8bfc8f5 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TAR
 	  http://www.gnu.org/software/tar/
 
 comment "tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION)
+	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION)
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 0aabc4a..55e9eff 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,9 +1,9 @@
 comment "usbutils requires a toolchain with PROGRAM_INVOCATION support"
-	depends on !BR2_PROGRAM_INVOCATION
+	depends on !BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
-	depends on BR2_PROGRAM_INVOCATION
+	depends on BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f767d41..ff7c999 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -148,7 +148,7 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_WCHAR,Wide char support) ;\
-	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION,Program invocation support)
 
 #
 # Check the conformity of Buildroot configuration with regard to the
@@ -194,7 +194,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_TOOLCHAIN_HAS_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_TOOLCHAIN_HAS_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
 
 #
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 56e440c..07cddd7 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -43,7 +43,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
 	bool "Enable 'program invocation name' support"
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	help
 	  Enable this option if you want your toolchain to support the
 	  GNU-specific program_invocation_name and
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index d96ff90..a2aadc1 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -20,7 +20,7 @@ config BR2_TOOLCHAIN_HAS_WCHAR
 config BR2_TOOLCHAIN_HAS_LOCALE
 	bool
 
-config BR2_PROGRAM_INVOCATION
+config BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	bool
 
 config BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 8b1774f..6d18ce8 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -17,7 +17,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_TOOLCHAIN_HAS_WCHAR
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 
 config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
@@ -26,7 +26,7 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_TOOLCHAIN_HAS_WCHAR
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 
 endchoice # C library
 
@@ -88,7 +88,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_LOCALE
 
 config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
 	bool "Enable 'program invocation name' support"
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	help
 	  Enable this option if you want your toolchain to support the
 	  GNU-specific program_invocation_name and
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index b7b4cfe..8c22039 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -302,7 +302,7 @@ CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
 endif
 
 # Handle the program_invocation_name option
-ifneq ($(call qstrip,$(BR2_PROGRAM_INVOCATION)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_PROGRAM_INVOCATION_NAME) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_PROGRAM_INVOCATION_NAME)=y:\# \1 is not set:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9cb54f3..5fc3096 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -148,7 +148,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_TOOLCHAIN_HAS_LOCALE
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
@@ -215,7 +215,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LOCALE
 
 config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
 	bool "Toolchain has program invocation support?"
-	select BR2_PROGRAM_INVOCATION
+	select BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	help
 	  Select this option if your external toolchain has program
 	  invocation support. If you don't know, leave the default
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index f3c0dec..dfb4700 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -318,7 +318,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_WCHAR),y)
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_PROGRAM_INVOCATION),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION),y)
 	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=y,g' $(UCLIBC_DIR)/.oldconfig
 else
-- 
1.7.0.4
