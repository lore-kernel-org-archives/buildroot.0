From: Piet Delaney <pdelaney@tensilica.com>
Date: Fri, 6 Aug 2010 21:53:19 -0700
Subject: [Buildroot] Xtensa Patch to allow Xtensa ARCH to start building on
 virgin clone of uclibc buildroot tree.
Message-ID: <4C5CE6BF.9050602@tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Would you review at this patch.

It's derived from you last stable tag 2010.05. I've attached it and show below:

Signed-off-by: Pete Delaney <piet@tensilica.com>
---
  toolchain/gcc/gcc-uclibc-4.x.mk |   10 +++++-----
  1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index f17b73f..51f47e2 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -25,11 +25,6 @@ else
   GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
  endif

-ifneq ($(filter xtensa%,$(ARCH)),)
-include target/xtensa/patch.in
-GCC_PATCH_EXTRA:=$(call XTENSA_PATCH,gcc,$(GCC_PATCH_DIR),. ..)
-endif
-
  GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
  GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
  GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
@@ -37,6 +32,11 @@ GCC_CAT:=$(BZCAT)
  GCC_STRIP_HOST_BINARIES:=nope
  GCC_SRC_DIR:=$(GCC_DIR)

+ifneq ($(filter xtensa%,$(ARCH)),)
+include target/xtensa/patch.in
+GCC_PATCH_EXTRA:=$(call XTENSA_PATCH,gcc,$(GCC_PATCH_DIR),. ..)
+endif
+
  # Branding works on >= 4.3
  ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
  BUILDROOT_VERSION_STRING=$(call qstrip,$(BR2_VERSION))
-- 
1.6.0.6

This is the 1st patch I've added to your tree that I've cloned and added here:

	http://git.linux-xtensa.org/cgi-bin/git.cgi?p=buildroot/buildroot-uclibc.git;a=commit;h=bd793839521c3c8254662922eb3ed174df8f4958

We would like to get our Buildroot environment up-to-date.

-piet
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001--XTENSA-Move-xtensa-code-so-it-can-use-GCC_PATCH_DI.patch
Type: text/x-patch
Size: 1306 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100806/0a77e33a/attachment.bin>
