Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC37EC7EE29
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6654241872;
	Fri,  2 Jun 2023 18:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6654241872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYbZ9Sg-wUDD; Fri,  2 Jun 2023 18:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9886A41878;
	Fri,  2 Jun 2023 18:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9886A41878
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 492C01BF2F2
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 18:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 851214280B
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 18:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851214280B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-BJFrRkni6U for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E2D842809
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2D842809
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C7CD86B69; Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 20:54:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a623d4955a0c62037710aca545abc10b41153d6
X-Git-Newrev: f1e3d02cd4d9ba04b9aea8bf10a960104d171773
X-Patchwork-Hint: ignore
Message-Id: <20230602185603.6C7CD86B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: bump to version 11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1e3d02cd4d9ba04b9aea8bf10a960104d171773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Upstream tag to backported patches.
Remove patches merged in gcc 11.4.

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2023/000177.html

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/882299806

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   7 +-
 .../gcc/11.3.0/0005-rs6000-Improve-.machine.patch  | 120 ---------------------
 ...ot-use-rs6000_cpu-for-.machine-ppc-and-pp.patch |  68 ------------
 ...k-Add-mcmodel-option-to-handle-large-GOTs.patch |  12 ++-
 ...k-Use-cmodel-large-when-building-crtstuff.patch |  12 ++-
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch |   8 +-
 ...disable-split-stack-for-non-thread-builds.patch |   2 +-
 ...-fix-machine-names-in-__has_include-.-PR.patch} |   8 +-
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 10 files changed, 31 insertions(+), 212 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a8338883d0..ea5f6aafd3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -518,12 +518,7 @@ package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstr
 package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch Upstream
 package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch Upstream
 package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch Upstream
-package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
-package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch Upstream
-package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch Upstream
-package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
-package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch Upstream
-package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch Upstream
+package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
diff --git a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch b/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
deleted file mode 100644
index 82a667ab7b..0000000000
--- a/package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From ca2c3a7d3db7a699c358d3408f820396dd536fc8 Mon Sep 17 00:00:00 2001
-From: Segher Boessenkool <segher@kernel.crashing.org>
-Date: Tue, 1 Mar 2022 17:04:29 +0000
-Subject: [PATCH] rs6000: Improve .machine
-
-This adds more correct .machine for most older CPUs.  It should be
-conservative in the sense that everything we handled before we handle at
-least as well now.  This does not yet revamp the server CPU handling, it
-is too risky at this point in time.
-
-Tested on powerpc64-linux {-m32,-m64}.  Also manually tested with all
--mcpu=, and the output of that passed through the GNU assembler.
-
-2022-03-04  Segher Boessenkool  <segher@kernel.crashing.org>
-
-	* config/rs6000/rs6000.c (rs6000_machine_from_flags): Restructure a
-	bit.  Handle most older CPUs.
-
-(cherry picked from commit 77eccbf39ed55297802bb66dff5f62507a7239e3)
-(cherry picked from commit fc7e603edc67c66a14f893f3b5a0a34e7d26f77c)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/rs6000/rs6000.c | 81 +++++++++++++++++++++++++-------------
- 1 file changed, 54 insertions(+), 27 deletions(-)
-
-diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
-index 0421dc7adb3..0a55c979c36 100644
---- a/gcc/config/rs6000/rs6000.c
-+++ b/gcc/config/rs6000/rs6000.c
-@@ -5742,33 +5742,60 @@ const char *rs6000_machine;
- const char *
- rs6000_machine_from_flags (void)
- {
--  /* For some CPUs, the machine cannot be determined by ISA flags.  We have to
--     check them first.  */
--  switch (rs6000_cpu)
--    {
--    case PROCESSOR_PPC8540:
--    case PROCESSOR_PPC8548:
--      return "e500";
--
--    case PROCESSOR_PPCE300C2:
--    case PROCESSOR_PPCE300C3:
--      return "e300";
--
--    case PROCESSOR_PPCE500MC:
--      return "e500mc";
--
--    case PROCESSOR_PPCE500MC64:
--      return "e500mc64";
--
--    case PROCESSOR_PPCE5500:
--      return "e5500";
--
--    case PROCESSOR_PPCE6500:
--      return "e6500";
--
--    default:
--      break;
--    }
-+  /* e300 and e500 */
-+  if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3)
-+    return "e300";
-+  if (rs6000_cpu == PROCESSOR_PPC8540 || rs6000_cpu == PROCESSOR_PPC8548)
-+    return "e500";
-+  if (rs6000_cpu == PROCESSOR_PPCE500MC)
-+    return "e500mc";
-+  if (rs6000_cpu == PROCESSOR_PPCE500MC64)
-+    return "e500mc64";
-+  if (rs6000_cpu == PROCESSOR_PPCE5500)
-+    return "e5500";
-+  if (rs6000_cpu == PROCESSOR_PPCE6500)
-+    return "e6500";
-+
-+  /* 400 series */
-+  if (rs6000_cpu == PROCESSOR_PPC403)
-+    return "\"403\"";
-+  if (rs6000_cpu == PROCESSOR_PPC405)
-+    return "\"405\"";
-+  if (rs6000_cpu == PROCESSOR_PPC440)
-+    return "\"440\"";
-+  if (rs6000_cpu == PROCESSOR_PPC476)
-+    return "\"476\"";
-+
-+  /* A2 */
-+  if (rs6000_cpu == PROCESSOR_PPCA2)
-+    return "a2";
-+
-+  /* Cell BE */
-+  if (rs6000_cpu == PROCESSOR_CELL)
-+    return "cell";
-+
-+  /* Titan */
-+  if (rs6000_cpu == PROCESSOR_TITAN)
-+    return "titan";
-+
-+  /* 500 series and 800 series */
-+  if (rs6000_cpu == PROCESSOR_MPCCORE)
-+    return "\"821\"";
-+
-+  /* 600 series and 700 series, "classic" */
-+  if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
-+      || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
-+      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
-+    return "ppc";
-+
-+  /* Classic with AltiVec, "G4" */
-+  if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
-+    return "\"7450\"";
-+
-+  /* The older 64-bit CPUs */
-+  if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
-+      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
-+    return "ppc64";
- 
-   HOST_WIDE_INT flags = rs6000_isa_flags;
- 
--- 
-2.34.3
-
diff --git a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch b/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
deleted file mode 100644
index 43fed4c19f..0000000000
--- a/package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 6de33ed642f119f1e2543095dd56e4a94f97c27f Mon Sep 17 00:00:00 2001
-From: Segher Boessenkool <segher@kernel.crashing.org>
-Date: Fri, 11 Mar 2022 21:15:18 +0000
-Subject: [PATCH] rs6000: Do not use rs6000_cpu for .machine ppc and ppc64
- (PR104829)
-
-Fixes: 77eccbf39ed5
-
-rs6000.h has
-  #define PROCESSOR_POWERPC   PROCESSOR_PPC604
-  #define PROCESSOR_POWERPC64 PROCESSOR_RS64A
-which means that if you use things like  -mcpu=powerpc -mvsx  it will no
-longer work after my latest .machine patch.  This causes GCC build errors
-in some cases, not a good idea (even if the errors are actually
-pre-existing: using -mvsx with a machine that does not have VSX cannot
-work properly).
-
-2022-03-11  Segher Boessenkool  <segher@kernel.crashing.org>
-
-	PR target/104829
-	* config/rs6000/rs6000.c (rs6000_machine_from_flags): Don't output
-	"ppc" and "ppc64" based on rs6000_cpu.
-
-(cherry picked from commit 80fcc4b6afee72443bef551064826b3b4b6785e6)
-(cherry picked from commit d87e0e297b1cba73a0c055d2a3e9267d288f435a)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gcc/config/rs6000/rs6000.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
-index 0a55c979c36..7e5cdd34840 100644
---- a/gcc/config/rs6000/rs6000.c
-+++ b/gcc/config/rs6000/rs6000.c
-@@ -5782,20 +5782,28 @@ rs6000_machine_from_flags (void)
-   if (rs6000_cpu == PROCESSOR_MPCCORE)
-     return "\"821\"";
- 
-+#if 0
-+  /* This (and ppc64 below) are disabled here (for now at least) because
-+     PROCESSOR_POWERPC, PROCESSOR_POWERPC64, and PROCESSOR_COMMON
-+     are #define'd as some of these.  Untangling that is a job for later.  */
-+
-   /* 600 series and 700 series, "classic" */
-   if (rs6000_cpu == PROCESSOR_PPC601 || rs6000_cpu == PROCESSOR_PPC603
-       || rs6000_cpu == PROCESSOR_PPC604 || rs6000_cpu == PROCESSOR_PPC604e
--      || rs6000_cpu == PROCESSOR_PPC750 || rs6000_cpu == PROCESSOR_POWERPC)
-+      || rs6000_cpu == PROCESSOR_PPC750)
-     return "ppc";
-+#endif
- 
-   /* Classic with AltiVec, "G4" */
-   if (rs6000_cpu == PROCESSOR_PPC7400 || rs6000_cpu == PROCESSOR_PPC7450)
-     return "\"7450\"";
- 
-+#if 0
-   /* The older 64-bit CPUs */
-   if (rs6000_cpu == PROCESSOR_PPC620 || rs6000_cpu == PROCESSOR_PPC630
--      || rs6000_cpu == PROCESSOR_RS64A || rs6000_cpu == PROCESSOR_POWERPC64)
-+      || rs6000_cpu == PROCESSOR_RS64A)
-     return "ppc64";
-+#endif
- 
-   HOST_WIDE_INT flags = rs6000_isa_flags;
- 
--- 
-2.34.3
-
diff --git a/package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch b/package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
similarity index 95%
rename from package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
rename to package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
index 4888f7e320..f927cd007d 100644
--- a/package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
+++ b/package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
@@ -1,4 +1,4 @@
-From 7a20b4574f06472086c786bd1b078ee962cdb02c Mon Sep 17 00:00:00 2001
+From 35c0801efa26bf248d278b5711b77a19e95b2f57 Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Tue, 6 Apr 2021 05:47:17 +0900
 Subject: [PATCH] or1k: Add mcmodel option to handle large GOTs
@@ -28,7 +28,11 @@ gcc/ChangeLog:
 	* config/or1k/or1k.opt (mcmodel=): New option.
 	* doc/invoke.texi (OpenRISC Options): Document mcmodel.
 
+Uptream: eff8110674ef193481d3657456a262beeb9951ff
+
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Romain: add Upstream tag]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  gcc/config/or1k/or1k-opts.h | 30 ++++++++++++++++++++++++++++++
  gcc/config/or1k/or1k.c      | 11 +++++++++--
@@ -166,7 +170,7 @@ index 6bd0f3eee6d..cc23e3b8856 100644
  Target RejectNegative Mask(CMOV)
  Enable generation of conditional move (l.cmov) instructions.  By default the
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 35508efb4ef..a1b7608a3aa 100644
+index f1217812280..90c6186fc14 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -1136,7 +1136,8 @@ Objective-C and Objective-C++ Dialects}.
@@ -179,7 +183,7 @@ index 35508efb4ef..a1b7608a3aa 100644
  
  @emph{PDP-11 Options}
  @gccoptlist{-mfpu  -msoft-float  -mac0  -mno-ac0  -m40  -m45  -m10 @gol
-@@ -26443,6 +26444,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
+@@ -26444,6 +26445,15 @@ Enable generation of shift with immediate (@code{l.srai}, @code{l.srli},
  @code{l.slli}) instructions.  By default extra instructions will be generated
  to store the immediate to a register first.
  
@@ -196,5 +200,5 @@ index 35508efb4ef..a1b7608a3aa 100644
  @end table
  
 -- 
-2.35.1
+2.34.3
 
diff --git a/package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch b/package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
similarity index 88%
rename from package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
rename to package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
index 716f007a24..eb45175135 100644
--- a/package/gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
+++ b/package/gcc/11.4.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
@@ -1,4 +1,4 @@
-From c544a63928406b706b8493fd9b8ca2136b433cf0 Mon Sep 17 00:00:00 2001
+From f75178ccd2f5e4d73e27cccffffada859b87be7d Mon Sep 17 00:00:00 2001
 From: Stafford Horne <shorne@gmail.com>
 Date: Wed, 21 Apr 2021 05:33:15 +0900
 Subject: [PATCH] or1k: Use cmodel=large when building crtstuff
@@ -21,7 +21,11 @@ libgcc/ChangeLog:
 	* config.host (or1k-*, tmake_file): Add or1k/t-crtstuff.
 	* config/or1k/t-crtstuff: New file.
 
+Upstream: da8a9d695b3c4b9397b5d9a27660bfa48af8d707
+
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Romain: add Upstream tag]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  libgcc/config.host            | 4 ++--
  libgcc/config/or1k/t-crtstuff | 2 ++
@@ -29,10 +33,10 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  create mode 100644 libgcc/config/or1k/t-crtstuff
 
 diff --git a/libgcc/config.host b/libgcc/config.host
-index f2dc7e266f4..6f193c32fbd 100644
+index 45f8e19ada4..5523345abb0 100644
 --- a/libgcc/config.host
 +++ b/libgcc/config.host
-@@ -1132,12 +1132,12 @@ nios2-*-*)
+@@ -1150,12 +1150,12 @@ nios2-*-*)
  	extra_parts="$extra_parts crti.o crtn.o"
  	;;
  or1k-*-linux*)
@@ -56,5 +60,5 @@ index 00000000000..dcae7f3498e
 +# Compile crtbeginS.o and crtendS.o with -mcmodel=large
 +CRTSTUFF_T_CFLAGS_S += -mcmodel=large
 -- 
-2.35.1
+2.34.3
 
diff --git a/package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
similarity index 81%
rename from package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
rename to package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
index e33dec3ff6..cb407c78fc 100644
--- a/package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
+++ b/package/gcc/11.4.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -1,4 +1,4 @@
-From 8ef5787701f4d7cf46a27771d38ab54af2499e25 Mon Sep 17 00:00:00 2001
+From 48ced46a5f81f49737ea13d11a099e03062cf141 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Fri, 27 Mar 2020 21:23:53 +0100
 Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
@@ -8,7 +8,11 @@ is defined. Added the CPP_SPEC definition to correct this.
 
 Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
 
+Upstream: cac2f69cdad434ad5cb60f5fe931d45cd82ef476
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Romain: add Upstream tag]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  gcc/config/or1k/linux.h | 2 ++
  1 file changed, 2 insertions(+)
@@ -27,5 +31,5 @@ index 196f3f3c8f0..0cbdc934af1 100644
  #define LINK_SPEC "%{h*}			\
     %{static:-Bstatic}				\
 -- 
-2.35.1
+2.34.3
 
diff --git a/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
similarity index 92%
rename from package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
index dba2d02d7f..817997e925 100644
--- a/package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
+++ b/package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch
@@ -1,4 +1,4 @@
-From 3b9d7d397fa6dc290eb05bffca80968efb6ec2e5 Mon Sep 17 00:00:00 2001
+From 590ef1956786bfd49dae7a5e2fed67509d06f36b Mon Sep 17 00:00:00 2001
 From: Waldemar Brodkorb <wbx@openadk.org>
 Date: Mon, 25 Jul 2022 00:29:55 +0200
 Subject: [PATCH] disable split-stack for non-thread builds
diff --git a/package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch b/package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
similarity index 96%
rename from package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
rename to package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
index 4e93f6ab96..88bc26e0d7 100644
--- a/package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
+++ b/package/gcc/11.4.0/0005-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
@@ -1,4 +1,4 @@
-From de3f4ee9a5bd2adcb5ff2e1690db2567fda1473c Mon Sep 17 00:00:00 2001
+From 3e878f9d1c473f91a1377193d4d8d2616357bed1 Mon Sep 17 00:00:00 2001
 From: Xi Ruoyao <xry111@mengyan1223.wang>
 Date: Mon, 28 Jun 2021 13:54:58 +0800
 Subject: [PATCH] fixinc: don't "fix" machine names in __has_include(...)
@@ -93,10 +93,10 @@ index 5b23a8b640d..404b420f302 100644
               with the appropriate underscores, then leave it alone.
               We want exactly two leading and trailing underscores.  */
 diff --git a/fixincludes/inclhack.def b/fixincludes/inclhack.def
-index 066bef99162..b7ad6982e96 100644
+index c2f54d1189a..b2841d384f3 100644
 --- a/fixincludes/inclhack.def
 +++ b/fixincludes/inclhack.def
-@@ -3154,7 +3154,8 @@ fix = {
+@@ -3201,7 +3201,8 @@ fix = {
      c_fix     = machine_name;
  
      test_text = "/* MACH_DIFF: */\n"
@@ -120,5 +120,5 @@ index cf95321fb86..8b3accaf04e 100644
  #endif  /* MACHINE_NAME_CHECK */
  
 -- 
-2.37.3
+2.34.3
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index dca1579319..b6adf1f127 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -87,7 +87,7 @@ config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
-	default "11.3.0"    if BR2_GCC_VERSION_11_X
+	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 9082d25b78..f478962af8 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -2,8 +2,8 @@
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-10.4.0/sha512.sum
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
-sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-11.4.0/sha512.sum
+sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
