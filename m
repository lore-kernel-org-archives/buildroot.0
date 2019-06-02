From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jun 2019 20:12:45 -0000
Subject: [Buildroot] [git commit] package/samba4: add cmocka dependency
Message-ID: <20190602201234.0D070800FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=415077b420682e36d0a742a2a052637942bc14b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use system version of cmocka instead of the embedded one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
