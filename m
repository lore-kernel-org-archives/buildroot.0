From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 00:26:01 +0100
Subject: [Buildroot] [PATCH 3/4] package/tpm2-abrmd: bump to version 2.3.0
In-Reply-To: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
References: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214232602.3337220-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop dbus dependency as it is not needed since version 2.2.0 and
https://github.com/tpm2-software/tpm2-abrmd/commit/c1d42c9ebefbfe36255603aca065944836c14610

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-abrmd/Config.in       | 5 ++---
 package/tpm2-abrmd/tpm2-abrmd.hash | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index db0ea66112..4931641af4 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_TPM2_ABRMD
 	bool "tpm2-abrmd"
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # tpm2-tss
-	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
 	help
diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index 61a75c0d1b..cff3266bc8 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ff0ed283b0300cd784d6bf2b042e167020f8443602974e53b924e9fd98a4b515  tpm2-abrmd-2.0.3.tar.gz
+sha256 63cb59be1fd21e6ae233c37a0aa4a59883a4885a7bfd2c7e69979c5048518d50  tpm2-abrmd-2.3.0.tar.gz
 sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 31f19f5d01..42f41b6ba8 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.0.3
+TPM2_ABRMD_VERSION = 2.3.0
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
-TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
+TPM2_ABRMD_DEPENDENCIES = libglib2 tpm2-tss host-pkgconf
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-- 
2.24.0
