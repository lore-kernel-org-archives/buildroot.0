From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:03:05 +0200
Subject: [Buildroot] [git commit] package/clang: bump to version 9.0.0
Message-ID: <20191005200048.802738897C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5402cc32f73cce49d5f7b9fd25fe3f0c4eb33d53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The github download url doesn't contain the llvm 9.0.0 archive,
so use the previous url.

Since v9.0.0, it was relicensed to the Apache License 2.0 with
LLVM Exceptions. Update the license file hash.

See:
http://releases.llvm.org/9.0.0/tools/clang/docs/ReleaseNotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clang/clang.hash | 4 ++--
 package/clang/clang.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/clang/clang.hash b/package/clang/clang.hash
index 209ff0cb30..d9aa57c817 100644
--- a/package/clang/clang.hash
+++ b/package/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 70effd69f7a8ab249f66b0a68aba8b08af52aa2ab710dfb8a0fba102685b1646 cfe-8.0.1.src.tar.xz
-sha256 bdc41b826a9a50c7a31c1b613ca5d46415be68d5cc6da06f91f5bc1db8ad87aa LICENSE.TXT
+sha256 7ba81eef7c22ca5da688fdf9d88c20934d2d6b40bfe150ffd338900890aa4610 cfe-9.0.0.src.tar.xz
+sha256 ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47 LICENSE.TXT
diff --git a/package/clang/clang.mk b/package/clang/clang.mk
index 3796ca8605..35fe2feef3 100644
--- a/package/clang/clang.mk
+++ b/package/clang/clang.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 # LLVM and Clang should be version bumped together
-CLANG_VERSION = 8.0.1
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION = 9.0.0
+CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
 CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
-CLANG_LICENSE = NCSA
+CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
 CLANG_INSTALL_STAGING = YES
