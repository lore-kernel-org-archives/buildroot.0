From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:38:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: clarify the comment
	about *-gcc-ar... LTO wrappers
Message-ID: <20150913103829.AA33D81DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=797318b48362f610c3fdce5e56c735223d74381a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4b4b463..967e9ec 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -666,11 +666,12 @@ endif
 # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
-# When the link-time-optimization flag '-flto' is used, then the compiler
-# and binutils have to support lto. ar/ranlib need to be called with the
-# lto plugin. The wrappers *-gcc-ar and *-gcc-ranlib provided by GCC could
-# be used as drop-ins for ar/runlib when Makefiles are used which do not
-# pass the lto arguments.
+# The LTO support in gcc creates wrappers for ar, ranlib and nm which load
+# the lto plugin. These wrappers are called *-gcc-ar, *-gcc-ranlib, and
+# *-gcc-nm and should be used instead of the real programs when -flto is
+# used. However, we should not add the toolchain wrapper for them, and they
+# match the *cc-* pattern. Therefore, an additional case is added for *-ar,
+# *-ranlib and *-nm.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
 	$(Q)mkdir -p $(HOST_DIR)/usr/bin
