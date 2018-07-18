From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 22:45:33 +0200
Subject: [Buildroot] [git commit] package/binutils: bump to version 2.31.1
Message-ID: <20180718204201.E8ED088993@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec4ca0ddf974aafa60acc00a89ce0b962bd701d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release note:
  This is a point release over the previous 2.31 version, which was
  necessary as a source file was accidentally omitted from that
  release.

  This release also contains a fix for PR gold/23409 where the gold
  linker could end up creating duplicate copies of some symbols.

https://sourceware.org/ml/binutils/2018-07/msg00286.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/{2.31 => 2.31.1}/0001-sh-conf.patch                  | 0
 package/binutils/{2.31 => 2.31.1}/0002-ld-makefile.patch              | 0
 package/binutils/{2.31 => 2.31.1}/0003-check-ldrunpath-length.patch   | 0
 .../{2.31 => 2.31.1}/0004-add-sysroot-fix-from-bug-3049.patch         | 0
 .../binutils/{2.31 => 2.31.1}/0005-poison-system-directories.patch    | 0
 .../0006-Refactored-location-where-GOT-information-is-collect.patch   | 0
 .../0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch   | 0
 .../0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch   | 0
 .../0009-PLT-information-was-still-being-generated-when-symbo.patch   | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 11 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/2.31/0001-sh-conf.patch b/package/binutils/2.31.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.31/0001-sh-conf.patch
rename to package/binutils/2.31.1/0001-sh-conf.patch
diff --git a/package/binutils/2.31/0002-ld-makefile.patch b/package/binutils/2.31.1/0002-ld-makefile.patch
similarity index 100%
rename from package/binutils/2.31/0002-ld-makefile.patch
rename to package/binutils/2.31.1/0002-ld-makefile.patch
diff --git a/package/binutils/2.31/0003-check-ldrunpath-length.patch b/package/binutils/2.31.1/0003-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/2.31/0003-check-ldrunpath-length.patch
rename to package/binutils/2.31.1/0003-check-ldrunpath-length.patch
diff --git a/package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/2.31/0004-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/2.31.1/0004-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/2.31/0005-poison-system-directories.patch b/package/binutils/2.31.1/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.31/0005-poison-system-directories.patch
rename to package/binutils/2.31.1/0005-poison-system-directories.patch
diff --git a/package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch b/package/binutils/2.31.1/0006-Refactored-location-where-GOT-information-is-collect.patch
similarity index 100%
rename from package/binutils/2.31/0006-Refactored-location-where-GOT-information-is-collect.patch
rename to package/binutils/2.31.1/0006-Refactored-location-where-GOT-information-is-collect.patch
diff --git a/package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch b/package/binutils/2.31.1/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
similarity index 100%
rename from package/binutils/2.31/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
rename to package/binutils/2.31.1/0007-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
diff --git a/package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch b/package/binutils/2.31.1/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
similarity index 100%
rename from package/binutils/2.31/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
rename to package/binutils/2.31.1/0008-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
diff --git a/package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch b/package/binutils/2.31.1/0009-PLT-information-was-still-being-generated-when-symbo.patch
similarity index 100%
rename from package/binutils/2.31/0009-PLT-information-was-still-being-generated-when-symbo.patch
rename to package/binutils/2.31.1/0009-PLT-information-was-still-being-generated-when-symbo.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 982456332a..21dc84e498 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,7 +20,7 @@ config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
 
 config BR2_BINUTILS_VERSION_2_31_X
-	bool "binutils 2.31"
+	bool "binutils 2.31.1"
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.29)"
@@ -33,7 +33,7 @@ config BR2_BINUTILS_VERSION
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
-	default "2.31"		if BR2_BINUTILS_VERSION_2_31_X
+	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 67f2a99a68..d97f55da8a 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,7 +2,7 @@
 sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b029a43f308a7938a7299b1928d385205d0a2245674a621649032a138d  binutils-2.28.1.tar.xz
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 sha512  e747ea20d8d79fcd21b9d9f6695059caa7189d60f19256da398e34b789fea9a133c32b192e9693b5828d27683739b0198431bf8b3e39fb3b04884cf89d9aa839  binutils-2.30.tar.xz
-sha512  3448a71c42d790569c1159c1042aa520b2d8ac8af7506fb1f2a4199dfb13b39f1c2271a5cb3a643d10c7d8a388a73f190e90503d4793a016da7893473aa1c635  binutils-2.31.tar.xz
+sha512  0fca326feb1d5f5fe505a827b20237fe3ec9c13eaf7ec7e35847fd71184f605ba1cefe1314b1b8f8a29c0aa9d88162849ee1c1a3e70c2f7407d88339b17edb30  binutils-2.31.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  bea88164ed48733bad63393fe702e12e651efd113aa4f3fe2e253e05c4c1e5da20b5a99333f0b5528df6d32ce806f799211c568e1916845a87999901dde28817  binutils-arc-2018.03.tar.gz
