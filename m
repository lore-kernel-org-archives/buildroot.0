From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:31:18 +0100
Subject: [Buildroot] [git commit] binutils: do not allow on NIOS2,
	no support available
Message-ID: <20131225113133.D155C9C1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c4b60c7e0d74f92ae7c06c7bd8f732a12e70ca6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils does not have support for NIOS2 on the target, so disable the
selection of binutils on this architecture.

Fixes:

  http://autobuild.buildroot.org/results/40d/40d9cbefd03727af82610412ed0bc47674c44dbb/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 package/binutils/Config.in  |    2 +-
 package/dropwatch/Config.in |    2 +-
 package/oprofile/Config.in  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e1f77e5..44e7ae0 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on !BR2_aarch64
+	depends on !BR2_aarch64 && !BR2_nios2
 	help
 	  Install binutils on the target
 
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index ac0cc3e..0c9aca6 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
 	select BR2_PACKAGE_BINUTILS
-	depends on !BR2_aarch64 # binutils
+	depends on !BR2_aarch64 && !BR2_nios2 # binutils
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index dff2a8c..2f223c0 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_aarch64 # binutils
+	depends on !BR2_aarch64 && !BR2_nios2 # binutils
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
 	help
