From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:09:03 +0200
Subject: [Buildroot] [PATCH 1/4] binutils: bump 2.28.x series to 2.28.1
In-Reply-To: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
References: <20170729130906.2140-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170729130906.2140-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils 2.28.1 is a bug-fix release of the 2.28.x branch, so let's
switch to it.

Since a xz-compressed tarball is available, we use it instead of the
bz2-compressed one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/{2.28 => 2.28.1}/0120-sh-conf.patch                  | 0
 package/binutils/{2.28 => 2.28.1}/0300-ld-makefile.patch              | 0
 package/binutils/{2.28 => 2.28.1}/0301-check-ldrunpath-length.patch   | 0
 .../{2.28 => 2.28.1}/0500-add-sysroot-fix-from-bug-3049.patch         | 0
 .../binutils/{2.28 => 2.28.1}/0600-poison-system-directories.patch    | 0
 package/binutils/{2.28 => 2.28.1}/0905-bfin-rofixup-bug.patch         | 0
 package/binutils/{2.28 => 2.28.1}/0906-microblaze-pr21180.patch       | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 package/binutils/binutils.mk                                          | 4 ++++
 10 files changed, 7 insertions(+), 3 deletions(-)
 rename package/binutils/{2.28 => 2.28.1}/0120-sh-conf.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0300-ld-makefile.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0600-poison-system-directories.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0905-bfin-rofixup-bug.patch (100%)
 rename package/binutils/{2.28 => 2.28.1}/0906-microblaze-pr21180.patch (100%)

diff --git a/package/binutils/2.28/0120-sh-conf.patch b/package/binutils/2.28.1/0120-sh-conf.patch
similarity index 100%
rename from package/binutils/2.28/0120-sh-conf.patch
rename to package/binutils/2.28.1/0120-sh-conf.patch
diff --git a/package/binutils/2.28/0300-ld-makefile.patch b/package/binutils/2.28.1/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/2.28/0300-ld-makefile.patch
rename to package/binutils/2.28.1/0300-ld-makefile.patch
diff --git a/package/binutils/2.28/0301-check-ldrunpath-length.patch b/package/binutils/2.28.1/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/2.28/0301-check-ldrunpath-length.patch
rename to package/binutils/2.28.1/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/2.28/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.28.1/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/2.28/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/2.28.1/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/2.28/0600-poison-system-directories.patch b/package/binutils/2.28.1/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.28/0600-poison-system-directories.patch
rename to package/binutils/2.28.1/0600-poison-system-directories.patch
diff --git a/package/binutils/2.28/0905-bfin-rofixup-bug.patch b/package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
similarity index 100%
rename from package/binutils/2.28/0905-bfin-rofixup-bug.patch
rename to package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
diff --git a/package/binutils/2.28/0906-microblaze-pr21180.patch b/package/binutils/2.28.1/0906-microblaze-pr21180.patch
similarity index 100%
rename from package/binutils/2.28/0906-microblaze-pr21180.patch
rename to package/binutils/2.28.1/0906-microblaze-pr21180.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 03ddf62..3045cb5 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -17,7 +17,7 @@ config BR2_BINUTILS_VERSION_2_27_X
 	depends on !(BR2_arm && !BR2_USE_MMU)
 
 config BR2_BINUTILS_VERSION_2_28_X
-	bool "binutils 2.28"
+	bool "binutils 2.28.1"
 
 endchoice
 
@@ -26,7 +26,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2017.03"	if BR2_arc
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
-	default "2.28"		if BR2_BINUTILS_VERSION_2_28_X
+	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 5a70620..563f23d 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 sha512	cf276f84935312361a2ca077e04d0b469d23a3aed979d8ba5d92ea590904ffb2c2e7ed12cc842822bfc402836be86f479660cef3791aa62f3753d8a1a6f564cb  binutils-2.27.tar.bz2
-sha512	ede2e4e59a800260eea8c14eafbaee94e30abadafd5c419a3370f9f62213cf027d6400a1d4970b6958bd4d220e675dcd483a708107016e7abd5c99d7392ba8fd  binutils-2.28.tar.bz2
+sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  07d5639e74eafe8fced259870c1a7dedee67c534573dda53fb78ee1ffeec9e17479fdde41dccd03b1cf0248023acbef7f66013398b2f722e4a8891ac680d1d16  binutils-arc-2017.03.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ec85ad6..30ced3f 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -21,7 +21,11 @@ BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
+ifeq ($(BINUTILS_VERSION),2.28.1)
+BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
+else
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
+endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.9.4
