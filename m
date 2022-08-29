Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D9DECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D516F60B4D;
	Mon, 29 Aug 2022 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D516F60B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA5yh3nN3ZEK; Mon, 29 Aug 2022 20:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0962260B46;
	Mon, 29 Aug 2022 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0962260B46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 292E31BF228
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B66A40895
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B66A40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYsdtD8BAjwD for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78C4140898
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78C4140898
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8EA6087FE6; Mon, 29 Aug 2022 20:36:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:25:07 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 2186b88dd756096ff7f04deeae0473b4ef87b625
X-Git-Newrev: f9f05667b3e89bbd498662ec642bec78819c8b75
X-Patchwork-Hint: ignore
Message-Id: <20220829203619.8EA6087FE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gcc: bump to
 version 10.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9f05667b3e89bbd498662ec642bec78819c8b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Remove upstream patch: 0004-Remove-cyclades-from-libsanitizer.patch

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=a7e72b282177fbaa6a852324641c871313d326da

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2022/000173.html

Tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/597437606

Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 3b6bce65981db6974bffc5bb4860fb44d15efe20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Remove-cyclades-from-libsanitizer.patch   | 125 ---------------------
 ...R-target-92095-internal-error-with-O1-mcp.patch |  26 ++---
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch |  10 +-
 ...k-Use-cmodel-large-when-building-crtstuff.patch |   8 +-
 ...REENTRANT-for-OpenRISC-when-pthread-is-p.patch} |   6 +-
 ...isable-split-stack-for-non-thread-builds.patch} |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 8 files changed, 29 insertions(+), 154 deletions(-)

diff --git a/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch b/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
deleted file mode 100644
index ee6e349a6c..0000000000
--- a/package/gcc/10.3.0/0004-Remove-cyclades-from-libsanitizer.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 745dae5923aba02982563481d75a21595df22ff8 Mon Sep 17 00:00:00 2001
-From: Tamar Christina <tamar.christina@arm.com>
-Date: Fri, 21 May 2021 10:30:59 +0100
-Subject: [PATCH] libsanitizer: Remove cyclades from libsanitizer
-
-The Linux kernel has removed the interface to cyclades from
-the latest kernel headers[1] due to them being orphaned for the
-past 13 years.
-
-libsanitizer uses this header when compiling against glibc, but
-glibcs itself doesn't seem to have any references to cyclades.
-
-Further more it seems that the driver is broken in the kernel and
-the firmware doesn't seem to be available anymore.
-
-As such since this is breaking the build of libsanitizer (and so the
-GCC bootstrap[2]) I propose to remove this.
-
-[1] https://lkml.org/lkml/2021/3/2/153
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100379
-
-(cherry picked from commit f7c5351552387bd43f6ca3631016d7f0dfe0f135)
-
-libsanitizer/ChangeLog:
-
-	PR sanitizer/100379
-	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry-pick
-	llvm-project revision f7c5351552387bd43f6ca3631016d7f0dfe0f135.
-	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
-	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
----
- .../sanitizer_common_interceptors_ioctl.inc           |  9 ---------
- .../sanitizer_platform_limits_posix.cpp               | 11 -----------
- .../sanitizer_platform_limits_posix.h                 | 10 ----------
- 3 files changed, 30 deletions(-)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-index 7f181258eab..b7da6598755 100644
---- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-+++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
-@@ -370,15 +370,6 @@ static void ioctl_table_fill() {
- 
- #if SANITIZER_GLIBC
-   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
--  _(CYGETDEFTHRESH, WRITE, sizeof(int));
--  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
--  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
--  _(CYGETTHRESH, WRITE, sizeof(int));
--  _(CYGETTIMEOUT, WRITE, sizeof(int));
--  _(CYSETDEFTHRESH, NONE, 0);
--  _(CYSETDEFTIMEOUT, NONE, 0);
--  _(CYSETTHRESH, NONE, 0);
--  _(CYSETTIMEOUT, NONE, 0);
-   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
-   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
-   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-index 35a690cba5c..6e5c330b98e 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-@@ -143,7 +143,6 @@ typedef struct user_fpregs elf_fpregset_t;
- # include <sys/procfs.h>
- #endif
- #include <sys/user.h>
--#include <linux/cyclades.h>
- #include <linux/if_eql.h>
- #include <linux/if_plip.h>
- #include <linux/lp.h>
-@@ -460,7 +459,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- 
- #if SANITIZER_GLIBC
-   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
--  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
- #if EV_VERSION > (0x010000)
-   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
- #else
-@@ -824,15 +822,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
- #endif // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
--  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
--  unsigned IOCTL_CYGETMON = CYGETMON;
--  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
--  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
--  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
--  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
--  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
--  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
-   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
-   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
-   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
-diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-index ad358eef8b7..cba41ba5494 100644
---- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-+++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
-@@ -983,7 +983,6 @@ extern unsigned struct_vt_mode_sz;
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
- extern unsigned struct_ax25_parms_struct_sz;
--extern unsigned struct_cyclades_monitor_sz;
- extern unsigned struct_input_keymap_entry_sz;
- extern unsigned struct_ipx_config_data_sz;
- extern unsigned struct_kbdiacrs_sz;
-@@ -1328,15 +1327,6 @@ extern unsigned IOCTL_VT_WAITACTIVE;
- #endif  // SANITIZER_LINUX
- 
- #if SANITIZER_LINUX && !SANITIZER_ANDROID
--extern unsigned IOCTL_CYGETDEFTHRESH;
--extern unsigned IOCTL_CYGETDEFTIMEOUT;
--extern unsigned IOCTL_CYGETMON;
--extern unsigned IOCTL_CYGETTHRESH;
--extern unsigned IOCTL_CYGETTIMEOUT;
--extern unsigned IOCTL_CYSETDEFTHRESH;
--extern unsigned IOCTL_CYSETDEFTIMEOUT;
--extern unsigned IOCTL_CYSETTHRESH;
--extern unsigned IOCTL_CYSETTIMEOUT;
- extern unsigned IOCTL_EQL_EMANCIPATE;
- extern unsigned IOCTL_EQL_ENSLAVE;
- extern unsigned IOCTL_EQL_GETMASTRCFG;
--- 
-2.27.0
-
diff --git a/package/gcc/10.3.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
similarity index 94%
rename from package/gcc/10.3.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
rename to package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
index af0d2d7d02..e8283afadb 100644
--- a/package/gcc/10.3.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
+++ b/package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
@@ -1,4 +1,4 @@
-From 0824d6819857f306583592bce96315893f91bd84 Mon Sep 17 00:00:00 2001
+From d672b64ae257e789311dfd0aea947972af64b966 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 20 Jan 2021 23:26:29 +0100
 Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
@@ -45,10 +45,10 @@ index 5f9999a669c..37452b06415 100644
  extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
  extern const char *output_return (rtx_insn *);
 diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
-index d0843102148..14d112d8ca8 100644
+index 7cfa9f80676..3a721f19eb5 100644
 --- a/gcc/config/sparc/sparc.c
 +++ b/gcc/config/sparc/sparc.c
-@@ -4157,6 +4157,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
+@@ -4243,6 +4243,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
  static bool
  sparc_cannot_force_const_mem (machine_mode mode, rtx x)
  {
@@ -62,7 +62,7 @@ index d0843102148..14d112d8ca8 100644
    switch (GET_CODE (x))
      {
      case CONST_INT:
-@@ -4192,11 +4199,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+@@ -4278,11 +4285,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
  }
  
  /* Global Offset Table support.  */
@@ -76,7 +76,7 @@ index d0843102148..14d112d8ca8 100644
  
  /* Return the SYMBOL_REF for the Global Offset Table.  */
  
-@@ -4209,6 +4214,27 @@ sparc_got (void)
+@@ -4295,6 +4300,27 @@ sparc_got (void)
    return got_symbol_rtx;
  }
  
@@ -104,7 +104,7 @@ index d0843102148..14d112d8ca8 100644
  /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
  
  static rtx
-@@ -4228,78 +4254,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
+@@ -4314,78 +4340,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
    return insn;
  }
  
@@ -189,7 +189,7 @@ index d0843102148..14d112d8ca8 100644
  }
  
  /* Ensure that we are not using patterns that are not OK with PIC.  */
-@@ -5464,7 +5442,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
+@@ -5550,7 +5528,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
      return true;
  
    /* GOT register (%l7) if needed.  */
@@ -198,7 +198,7 @@ index d0843102148..14d112d8ca8 100644
      return true;
  
    /* If the function accesses prior frames, the frame pointer and the return
-@@ -12507,9 +12485,10 @@ static void
+@@ -12658,9 +12636,10 @@ static void
  sparc_file_end (void)
  {
    /* If we need to emit the special GOT helper function, do so now.  */
@@ -210,7 +210,7 @@ index d0843102148..14d112d8ca8 100644
  #ifdef DWARF2_UNWIND_INFO
        bool do_cfi;
  #endif
-@@ -12546,22 +12525,17 @@ sparc_file_end (void)
+@@ -12697,22 +12676,17 @@ sparc_file_end (void)
  #ifdef DWARF2_UNWIND_INFO
        do_cfi = dwarf2out_do_cfi_asm ();
        if (do_cfi)
@@ -239,7 +239,7 @@ index d0843102148..14d112d8ca8 100644
  #endif
      }
  
-@@ -13056,10 +13030,7 @@ sparc_init_pic_reg (void)
+@@ -13207,10 +13181,7 @@ sparc_init_pic_reg (void)
    edge entry_edge;
    rtx_insn *seq;
  
@@ -252,10 +252,10 @@ index d0843102148..14d112d8ca8 100644
  
    start_sequence ();
 diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
-index 6e9ccb4ecfd..8fb0fa11aed 100644
+index b242c4b4481..7d08f50705a 100644
 --- a/gcc/config/sparc/sparc.md
 +++ b/gcc/config/sparc/sparc.md
-@@ -1601,7 +1601,10 @@
+@@ -1603,7 +1603,10 @@
     (clobber (reg:P O7_REG))]
    "REGNO (operands[0]) == INTVAL (operands[3])"
  {
@@ -324,5 +324,5 @@ index f00283f6e7b..67d4ac38095 100644
  #include <stdbool.h>
  #include <stdint.h>
 -- 
-2.30.2
+2.34.3
 
diff --git a/package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
similarity index 96%
rename from package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
rename to package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
index 73010c21ee..62eb437c62 100644
--- a/package/gcc/10.3.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ b/package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -1,4 +1,4 @@
-From 1dad3f95ffcd1871ca670a13a06fbedb1c3ce509 Mon Sep 17 00:00:00 2001
+From 8555b8d4f1d873d172c12a540ff97c57ed17f045 Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Sun, 2 May 2021 06:11:44 +0900
 Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
@@ -166,10 +166,10 @@ index 03c9b8d0bba..8e035075f8a 100644
  Target RejectNegative Mask(CMOV)
  Enable generation of conditional move (l.cmov) instructions.  By default the
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index eabeec944e7..eda350c99ec 100644
+index d7c787af226..848112e5b24 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -1102,7 +1102,8 @@ Objective-C and Objective-C++ Dialects}.
+@@ -1103,7 +1103,8 @@ Objective-C and Objective-C++ Dialects}.
  @gccoptlist{-mboard=@var{name}  -mnewlib  -mhard-mul  -mhard-div @gol
  -msoft-mul  -msoft-div @gol
  -msoft-float  -mhard-float  -mdouble-float -munordered-float @gol
@@ -179,7 +179,7 @@ index eabeec944e7..eda350c99ec 100644
  
  @emph{PDP-11 Options}
  @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -25111,6 +25112,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
+@@ -25142,6 +25143,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
  @code{l.slli}) instructions.  By default extra instructions will be generated
  to store the immediate to a register first.
  
@@ -196,5 +196,5 @@ index eabeec944e7..eda350c99ec 100644
  @end table
  
 -- 
-2.25.1
+2.34.3
 
diff --git a/package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
similarity index 93%
rename from package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
rename to package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
index 7da0e8f757..30d0c607f5 100644
--- a/package/gcc/10.3.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ b/package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -1,4 +1,4 @@
-From 0354e007a6235df81e208fa89cbf1571a8b56975 Mon Sep 17 00:00:00 2001
+From 3499ecd7c93c4c431cab83312bc5eabbf383c182 Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Sun, 2 May 2021 06:11:45 +0900
 Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
@@ -29,10 +29,10 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  create mode 100644 libgcc/config/or1k/t-crtstuff
 
 diff --git a/libgcc/config.host b/libgcc/config.host
-index c529cc40f0c..ddf0033e28c 100644
+index 89f41b56000..1210704d7e8 100644
 --- a/libgcc/config.host
 +++ b/libgcc/config.host
-@@ -1127,12 +1127,12 @@ nios2-*-*)
+@@ -1137,12 +1137,12 @@ nios2-*-*)
  	extra_parts="$extra_parts crti.o crtn.o"
  	;;
  or1k-*-linux*)
@@ -56,5 +56,5 @@ index 00000000000..dcae7f3498e
 +# Compile crtbeginS.o and crtendS.o with -mcmodel=large
 +CRTSTUFF_T_CFLAGS_S += -mcmodel=large
 -- 
-2.25.1
+2.34.3
 
diff --git a/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
similarity index 88%
rename from package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
rename to package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
index 5ac03d7c0c..e3dbbc7eb8 100644
--- a/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
+++ b/package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -1,4 +1,4 @@
-From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
+From d2e4e3e72b5f2f68d595dfd3a77f58744f3f243e Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Fri, 27 Mar 2020 21:23:53 +0100
 Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
@@ -14,7 +14,7 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
-index cbdc781418f..36303af892c 100644
+index 21cef067dda..2e1bb5601a9 100644
 --- a/gcc/config/or1k/linux.h
 +++ b/gcc/config/or1k/linux.h
 @@ -32,6 +32,8 @@
@@ -27,5 +27,5 @@ index cbdc781418f..36303af892c 100644
  #define LINK_SPEC "%{h*}			\
     %{static:-Bstatic}				\
 -- 
-2.31.1
+2.34.3
 
diff --git a/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch b/package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch
similarity index 92%
rename from package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch
index 668b1cd9d7..7ba9e0de54 100644
--- a/package/gcc/10.3.0/0006-disable-split-stack-for-non-thread-builds.patch
+++ b/package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch
@@ -1,4 +1,4 @@
-From cdb76d638e91cc53949585d98fa653d3671b92ac Mon Sep 17 00:00:00 2001
+From 14336d46b35577300dd68147a8f0c8165684850b Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Mon, 25 Jul 2022 00:29:55 +0200
 Subject: [PATCH] disable split-stack for non-thread builds
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b12035c4b..84f7a71c9c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -86,7 +86,7 @@ config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
-	default "10.3.0"    if BR2_GCC_VERSION_10_X
+	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index e364be0a06..9823f6d639 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 #  From https://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
 sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
-sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
+sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
