From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 14:55:06 +0200
Subject: [Buildroot] [git commit] toolchain-external: wrap gfortran
Message-ID: <20160704125513.27BB07FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1d90e9bb7ad1b9737db9f6476a5bdaa27a9fa8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index a31a04b..c103b96 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -729,9 +729,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 endef
 endif
 
-# Build toolchain wrapper for preprocessor, C and C++ compiler and setup
-# symlinks for everything else. Skip gdb symlink when we are building our
-# own gdb to prevent two gdb's in output/host/usr/bin.
+# Build toolchain wrapper for preprocessor, C, C++ and Fortran compilers
+# and setup symlinks for everything else. Skip gdb symlink when we are
+# building our own gdb to prevent two gdb's in output/host/usr/bin.
 # The LTO support in gcc creates wrappers for ar, ranlib and nm which load
 # the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
 # *-gcc-nm and should be used instead of the real programs when -flto is
@@ -746,7 +746,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		*-ar|*-ranlib|*-nm) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
