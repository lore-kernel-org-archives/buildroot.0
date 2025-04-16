Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4111EC369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C91F8417D8;
	Wed, 16 Apr 2025 17:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16RRDEGpGfjS; Wed, 16 Apr 2025 17:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C6E419AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C6E419AA;
	Wed, 16 Apr 2025 17:21:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A357B159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 946E060C1E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFQD72CMc9Dq for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F59960B66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F59960B66
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4504482670; Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 19:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f865963a47b4706209997650f7dc053696b6a9
X-Git-Newrev: 2f1c46b6cb36867201134abe0a91502128fc428e
X-Patchwork-Hint: ignore
Message-Id: <20250416172109.4504482670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump to version 3.4.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f1c46b6cb36867201134abe0a91502128fc428e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches 0002-arc-Fix-warnings.patch and
0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch are upstream
as part of commit 30e887f84e70c16df5c421983f074d07a93b4e58 (yes they
have been squashed into a single commit upstream).

Patches 0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch and
0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch are upstream
as part of commit 8a0d029244d9b0393db19898e603f24febfb53ee (here as
well, they have been squashed into a single commit upstream).

Changes 3.4.6..3.4.7:

    Add static trampoline support for Linux on s390x.
    Fix BTI support for ARM64.
    Support pointer authentication for ARM64.
    Fix ASAN compatibility.
    Fix x86-64 calls with 6 GP registers and some SSE registers.
    Miscellaneous fixes for ARC and Darwin ARM64.
    Fix OpenRISC or1k and Solaris 10 builds.
    Remove nios2 port.

Changes 3.4.7..3.4.8:

    aarch64: add PAC to GNU Notes by @billatarm in #882
    MIPS: Dont import asm/sgidefs.h on linux by @fossdd in #885
    Update the Simple Example from the Docs to fix a compile error by @Nikitf777 in #886
    Fix bugs in the x86-64 and x32 target (#887) by @mikulas-patocka in #889
    Add the "ABI_ATTR" attribute to called functions (#891) by @mikulas-patocka in #892
    powerpc: Add static trampoline support (#894) by @peter-bergner in #895
    testsuite: add two tests to Makefile.am by @thesamesam in #893

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libffi/0002-arc-Fix-warnings.patch         | 56 ----------------------
 ...-Do-not-use-mov_s-and-movl_s-instructions.patch | 45 -----------------
 ...or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch | 47 ------------------
 ...-or1k-ffi.c-fix-incompatible-pointer-type.patch | 50 -------------------
 package/libffi/libffi.hash                         |  2 +-
 package/libffi/libffi.mk                           |  2 +-
 6 files changed, 2 insertions(+), 200 deletions(-)

diff --git a/package/libffi/0002-arc-Fix-warnings.patch b/package/libffi/0002-arc-Fix-warnings.patch
deleted file mode 100644
index 45a2c9dbd7..0000000000
--- a/package/libffi/0002-arc-Fix-warnings.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4f25e5be1a8a429b6925527c1cb94b6acd05642b Mon Sep 17 00:00:00 2001
-From: Yuriy Kolerov <ykolerov@synopsys.com>
-Date: Wed, 17 Jul 2024 18:56:52 +0300
-Subject: [PATCH] arc: Fix warnings
-
-These warnings are fixed:
-
-1. A series of "unused variables".
-2. Implicit conversion from a pointer to uint32_t.
-
-Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
-Upstream: https://github.com/libffi/libffi/pull/844
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/arc/ffi.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/arc/ffi.c b/src/arc/ffi.c
-index d729274..0632319 100644
---- a/src/arc/ffi.c
-+++ b/src/arc/ffi.c
-@@ -192,9 +192,10 @@ static void unmarshal_atom(call_builder *cb, int type, void *data) {
- /* for arguments passed by reference returns the pointer, otherwise the arg is copied (up to MAXCOPYARG bytes) */
- static void *unmarshal(call_builder *cb, ffi_type *type, int var, void *data) {
-   size_t realign[2];
--  void *pointer;
- 
- #if defined(__ARC64_ARCH64__)
-+  void *pointer;
-+
-   if (type->size > 2 * __SIZEOF_POINTER__) {
-         /* pass by reference */
-         unmarshal_atom(cb, FFI_TYPE_POINTER, (char*)&pointer);
-@@ -348,7 +349,10 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
- 		      void *user_data, void *codeloc)
- {
-   uint32_t *tramp = (uint32_t *) & (closure->tramp[0]);
-+
-+#if defined(__ARC64_ARCH64__)
-   size_t address_ffi_closure = (size_t) ffi_closure_asm;
-+#endif
- 
-   switch (cif->abi)
-     {
-@@ -367,7 +371,7 @@ ffi_prep_closure_loc (ffi_closure * closure, ffi_cif * cif,
-       FFI_ASSERT (tramp == codeloc);
-       tramp[0] = CODE_ENDIAN (0x200a1fc0);	/* mov r8, pcl  */
-       tramp[1] = CODE_ENDIAN (0x20200f80);	/* j [long imm] */
--      tramp[2] = CODE_ENDIAN (ffi_closure_asm);
-+      tramp[2] = CODE_ENDIAN ((uint32_t) ffi_closure_asm);
-       break;
- #endif
- 
--- 
-2.46.0
-
diff --git a/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch b/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
deleted file mode 100644
index 3577ddf19d..0000000000
--- a/package/libffi/0003-arc-Do-not-use-mov_s-and-movl_s-instructions.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 97c273519e41a7ef2841cb7531c6eda01fc69dc2 Mon Sep 17 00:00:00 2001
-From: Yuriy Kolerov <ykolerov@synopsys.com>
-Date: Wed, 17 Jul 2024 19:19:30 +0300
-Subject: [PATCH] arc: Do not use mov_s and movl_s instructions
-
-mov_s and movl_s instructions use a restricted set of registers.
-However, a list of available registers for such instructions for
-one ARC target may not match a list for another ARC targets. For
-example, it is applicable to ARC700 and ARC HS3x/4x - build
-fails because mov_s formats may be incompatible in some cases.
-
-The easiest and the most straightforward way to fix this issue
-is to use mov and movl instead of mov_s and movl_s.
-
-Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>
-Upstream: https://github.com/libffi/libffi/pull/844
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/arc/arcompact.S | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/arc/arcompact.S b/src/arc/arcompact.S
-index 1d7f1a1..e749341 100644
---- a/src/arc/arcompact.S
-+++ b/src/arc/arcompact.S
-@@ -39,14 +39,14 @@
- #define LARG ldl
- #define SARG stl
- #define ADDPTR addl
--#define MOVPTR movl_s
-+#define MOVPTR movl
- #else
- #define PTRS 4
- #define FLTS 4
- #define LARG ld
- #define SARG st
- #define ADDPTR add
--#define MOVPTR mov_s
-+#define MOVPTR mov
- #endif
- 
- #define FRAME_LEN (8 * PTRS + 16)
--- 
-2.46.0
-
diff --git a/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch b/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
deleted file mode 100644
index f3a7b29e3b..0000000000
--- a/package/libffi/0004-src-or1k-ffi.c-fix-prototype-of-ffi_call_SYSV.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4506e943289ed1363f3921bc201d5da76f750229 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 17 Aug 2024 12:56:22 +0200
-Subject: [PATCH] src/or1k/ffi.c: fix prototype of ffi_call_SYSV()
-
-The current code base of libffi on OpenRISC (or1k) fails to build with
-GCC 14.x with the following error:
-
-../src/or1k/ffi.c: In function 'ffi_call':
-../src/or1k/ffi.c:167:34: error: passing argument 3 of 'ffi_call_SYSV' from incompatible pointer type [-Wincompatible-pointer-types]
-  167 |       ffi_call_SYSV(size, &ecif, ffi_prep_args, rvalue, fn, cif->flags);
-      |                                  ^~~~~~~~~~~~~
-      |                                  |
-      |                                  void * (*)(char *, extended_cif *)
-../src/or1k/ffi.c:113:27: note: expected 'void * (*)(int *, extended_cif *)' but argument is of type 'void * (*)(char *, extended_cif *)'
-  113 |                           void *(*)(int *, extended_cif *),
-      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This is due to the fact that ffi_prep_args() is in fact defined as:
-
-  void* ffi_prep_args(char *stack, extended_cif *ecif)
-
-so, let's fix the prototype of the function pointer, which anyway gets
-passed to assembly code, so the typing gets lost.
-
-Upstream: https://github.com/libffi/libffi/pull/854
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/or1k/ffi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
-index 9451d4e..157388e 100644
---- a/src/or1k/ffi.c
-+++ b/src/or1k/ffi.c
-@@ -110,7 +110,7 @@ void* ffi_prep_args(char *stack, extended_cif *ecif)
- 
- extern void ffi_call_SYSV(unsigned,
-                           extended_cif *,
--                          void *(*)(int *, extended_cif *),
-+                          void *(*)(char *, extended_cif *),
-                           unsigned *,
-                           void (*fn)(void),
-                           unsigned);
--- 
-2.46.0
-
diff --git a/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch b/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
deleted file mode 100644
index e1ff003500..0000000000
--- a/package/libffi/0005-src-or1k-ffi.c-fix-incompatible-pointer-type.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ec39b03d891a77552ad7729ff79bf21bf3591842 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 17 Aug 2024 13:52:45 +0200
-Subject: [PATCH] src/or1k/ffi.c: fix incompatible pointer type
-
-The current code base of libffi on OpenRISC (or1k) fails to build with
-GCC 14.x with the following error:
-
-../src/or1k/ffi.c: In function 'ffi_closure_SYSV':
-../src/or1k/ffi.c:183:22: error: initialization of 'char *' from incompatible pointer type 'int *' [-Wincompatible-pointer-types]
-  183 |   char *stack_args = sp;
-      |                      ^~
-
-Indeed:
-
-  register int *sp __asm__ ("r17");
-  [..]
-  char *stack_args = sp;
-
-Adopt the same logic used for:
-
-  char *ptr = (char *) register_args;
-
-which consists in casting to the desired pointer type. Indeed, later
-in the code stack_args is assigned to ptr (so they need to be the same
-pointer type), and some arithmetic is done on ptr, so changing its
-pointer type would change the behavior.
-
-Upstream: https://github.com/libffi/libffi/pull/854
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/or1k/ffi.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/or1k/ffi.c b/src/or1k/ffi.c
-index 157388e..7a6d28c 100644
---- a/src/or1k/ffi.c
-+++ b/src/or1k/ffi.c
-@@ -180,7 +180,7 @@ void ffi_closure_SYSV(unsigned long r3, unsigned long r4, unsigned long r5,
-   register int *r13 __asm__ ("r13");
- 
-   ffi_closure* closure = (ffi_closure*) r13;
--  char *stack_args = sp;
-+  char *stack_args = (char*) sp;
- 
-   /* Lay the register arguments down in a continuous chunk of memory.  */
-   unsigned register_args[6] =
--- 
-2.46.0
-
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index c2ef588f6b..75be5bbcef 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e  libffi-3.4.6.tar.gz
+sha256  bc9842a18898bfacb0ed1252c4febcc7e78fa139fd27fdc7a3e30d9d9356119b  libffi-3.4.8.tar.gz
 # License files, locally calculated
 sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 9c47cf3973..7ea61dac1e 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.6
+LIBFFI_VERSION = 3.4.8
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
