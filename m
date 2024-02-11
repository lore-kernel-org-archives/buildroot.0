Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90570C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552BA851E7;
	Sun, 11 Feb 2024 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUXkC_JP9f7N; Sun, 11 Feb 2024 21:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18761851CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18761851CC;
	Sun, 11 Feb 2024 21:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A79FD1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94AF04012F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibuy31OLcg8B for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 370884011D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 370884011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:42:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19B13877C2; Sun, 11 Feb 2024 21:42:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:41:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc59cbe4674f9d0f953857edff11cd93d570f360
X-Git-Newrev: 16eec251427b3075d68ea43d7f1395567e2effe4
X-Patchwork-Hint: ignore
Message-Id: <20240211214202.19B13877C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinymembench: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=16eec251427b3075d68ea43d7f1395567e2effe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As advised by Thomas Petazzoni in [1], drop tinymembench which is
abandonned (last commit in 2017). Moreover, it raises the following
build failure in Thumb mode:

/tmp/ccaZHrla.s:40: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
/tmp/ccaZHrla.s:43: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
main.c:45: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
main.c:46: Error: unshifted register required -- `and r8,r7,r2,lsr#16'
main.c:47: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
main.c:48: Error: unshifted register required -- `and r9,r6,r2,lsr#8'
main.c:49: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240114135446.1156025-1-fontaine.fabrice@gmail.com/

Fixes:
 - http://autobuild.buildroot.org/results/1e359c294a8d71fb1833e5d04a6bc7d4fd533510
 - http://autobuild.buildroot.org/results/c06010d7a2bdb33a1707266133a3880e14be7657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  6 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 ...arm-fix-build-on-Thumb-only-architectures.patch | 47 ----------------------
 package/tinymembench/Config.in                     | 12 ------
 package/tinymembench/tinymembench.hash             |  3 --
 package/tinymembench/tinymembench.mk               | 21 ----------
 8 files changed, 6 insertions(+), 86 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5948492d07..c2e107ce96 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1274,7 +1274,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch Upstream
-package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch Upstream
 package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index 5e0db855cc..a869279af7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_TINYMEMBENCH
+	bool "tinymembench removed"
+	select BR2_LEGACY
+	help
+	  tinymembench has been removed due to being abandoned.
+
 config BR2_PACKAGE_DAVINCI_BOOTCOUNT
 	bool "davinci-bootcount has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d7947821e4..8234d578cf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1062,7 +1062,6 @@ F:	package/snort3/
 F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
-F:	package/tinymembench/
 F:	package/whois/
 F:	package/x11r7/xlib_libXpresent/
 F:	package/zeek/
diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00..bf0fe078b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -156,7 +156,6 @@ menu "Debugging, profiling and benchmark"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
 	source "package/tcf-agent/Config.in"
-	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
diff --git a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
deleted file mode 100644
index 88559ec012..0000000000
--- a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 034a3552e9700c6d424bd706db106f5bce1f5a5e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 11 Nov 2016 21:49:39 +0100
-Subject: [PATCH] arm: fix build on Thumb-only architectures
-
-Building tinymembench for ARM Cortex-M currently fails, because the
-arm-neon.S file contains ARM code that doesn't build on Thumb-only
-architectures. To account for this and fix the build for Cortex-M,
-this patch adjusts the compile time condition to also verify that the
-architecture supports the ARM instruction set, by testing the
-__ARM_ARCH_ISA_ARM compiler define.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- arm-neon.S | 2 +-
- asm-opt.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arm-neon.S b/arm-neon.S
-index 4db78ce..19c30ad 100644
---- a/arm-neon.S
-+++ b/arm-neon.S
-@@ -21,7 +21,7 @@
-  * DEALINGS IN THE SOFTWARE.
-  */
- 
--#ifdef __arm__
-+#if defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
- 
- .text
- .fpu neon
-diff --git a/asm-opt.c b/asm-opt.c
-index 9da4596..eba1183 100644
---- a/asm-opt.c
-+++ b/asm-opt.c
-@@ -202,7 +202,7 @@ bench_info *get_asm_framebuffer_benchmarks(void)
-         return empty;
- }
- 
--#elif defined(__arm__)
-+#elif defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
- 
- #include "arm-neon.h"
- 
--- 
-2.7.4
-
diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
deleted file mode 100644
index 8f6e1a2b35..0000000000
--- a/package/tinymembench/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_TINYMEMBENCH
-	bool "tinymembench"
-	depends on !BR2_MIPS_NABI32 && !BR2_MIPS_NABI64
-	help
-	  Tinymembench is a simple memory benchmark program, which
-	  tries to measure the peak bandwidth of sequential memory
-	  accesses and the latency of random memory accesses.
-	  Bandwidth is measured by running different assembly code for
-	  the aligned memory blocks and attempting different prefetch
-	  strategies.
-
-	  https://github.com/ssvb/tinymembench
diff --git a/package/tinymembench/tinymembench.hash b/package/tinymembench/tinymembench.hash
deleted file mode 100644
index 04dbd30f81..0000000000
--- a/package/tinymembench/tinymembench.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-0.4.tar.gz
-sha256  8ba473aced4630aee2808efe17b53e904a9d68a9b3361de491717f9a4e75da39  LICENSE
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
deleted file mode 100644
index 016d680ce7..0000000000
--- a/package/tinymembench/tinymembench.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# tinymembench
-#
-################################################################################
-
-TINYMEMBENCH_VERSION = 0.4
-TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,v$(TINYMEMBENCH_VERSION))
-TINYMEMBENCH_LICENSE = MIT
-TINYMEMBENCH_LICENSE_FILES = LICENSE
-
-define TINYMEMBENCH_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
-
-define TINYMEMBENCH_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tinymembench \
-		$(TARGET_DIR)/usr/bin/tinymembench
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
