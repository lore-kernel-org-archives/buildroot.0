From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 12:24:50 +0200
Subject: [Buildroot] [PATCH] Remove some fragments left over from the
	'qstrip' transition
Message-ID: <1253701490-11760-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit af2390c0f437dbb26a31150eb7d526e1d0bdfd1a overlooked some
old comment fragments.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 toolchain/gcc/Makefile.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index e148474..e052b83 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -52,15 +52,12 @@ endif
 
 # some additional defaults
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-# ")))
 GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-# ")))
 GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-# ")))
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
 
-- 
1.6.3.3
