From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 May 2019 00:20:29 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: add cmocka dependency
Message-ID: <20190510222029.28734-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use system version of cmocka instead of the embedded one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/Config.in | 3 ++-
 package/samba4/samba4.mk | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 4ccd22aa2d..f65cdc47b6 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -9,10 +9,11 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # python -> libffi
-	depends on !BR2_STATIC_LIBS # python, gnutls
+	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_POPT
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 941d4df1d6..3ab255b8fe 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -12,7 +12,7 @@ SAMBA4_LICENSE = GPL-3.0+
 SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = \
 	host-e2fsprogs host-heimdal host-python host-nfs-utils \
-	e2fsprogs popt python zlib \
+	cmocka e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline) \
-- 
2.20.1
