From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:06:46 +0100
Subject: [Buildroot] [git commit] Rename BUILDROOT_LIBC to BR_LIBC
Message-ID: <20140204140813.A6A2E9C7BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de13e31a165268e030018bb6d168637303a65802
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but internal variables should be name BR_foo, not
BUILDROOT_foo (I think ..).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk                 |    2 +-
 package/gcc/gcc-intermediate/gcc-intermediate.mk   |    2 +-
 .../toolchain-buildroot/toolchain-buildroot.mk     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 49de481..47b30da 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -10,7 +10,7 @@ GCC_FINAL_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_FINAL_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	$(BUILDROOT_LIBC)
+	$(BR_LIBC)
 
 HOST_GCC_FINAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index f47e4be..2105cec 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -10,7 +10,7 @@ GCC_INTERMEDIATE_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	$(BUILDROOT_LIBC)-configure
+	$(BR_LIBC)-configure
 
 HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index f1f07a9..2b5028c 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -6,7 +6,7 @@
 
 TOOLCHAIN_BUILDROOT_SOURCE =
 
-BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
+BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 # Triggering the build of the host-gcc-final will automatically do the
 # build of binutils, uClibc, kernel headers and all the intermediate
