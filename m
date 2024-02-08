Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B63DC48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 540304031C;
	Thu,  8 Feb 2024 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7NJmPOZsNks; Thu,  8 Feb 2024 19:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7DD240471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7DD240471;
	Thu,  8 Feb 2024 19:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61A371BF31B
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DD494031C
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1uWgEja4F6P for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 19:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75CD34023B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CD34023B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75CD34023B
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 19:54:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b2fba3176so42740f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 11:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707422083; x=1708026883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyw2orcx4FkvRZG2N1v/UZoE3yxI4PJTmDt0toPMzYk=;
 b=ehW7Qw3tJ5xmQHCdvvBZJdhtXVMdVBvXvXj9QXfKZiQxkH+29vu4SbzWXIEvF0iW+j
 PYpYx9vstnH3mWSCu/8rSPYCG6byjuuXAGe3A5MwI8Y4iwKFwlqoNc/QmiEMWOKp5b9S
 V+njnEQuAiMq6qa+calmbSgxf8YY5rLz70s5PCzi5vdmW5Ybr5JsdNHkirJrRdP1BSKK
 gotKr1r9iAzRII93K0dXi08Ot09SAtF6tsrT96pA5LSCHWg5BQGh16MhQP0MQ5miSlIp
 68H+ZKOvnNf2TDTmgU+8E1FNZtJ2wEEcfxzaITzL0RVtb9KU4BvFoyryBYZLwCTekZjZ
 6DvQ==
X-Gm-Message-State: AOJu0YxeggfqRfZsstwQuHzZui6X/98++TGdpfYBFsMQwzh1MN0ywxZ3
 jIrGpF/LHAl//pSgLW+oIcH4DbM2dy1RZFcS8ZN6I4x1v03OibKq+7+3u8gHSEw=
X-Google-Smtp-Source: AGHT+IFAG214v81/6al7et6p1kKhza1UnlIvKLPygKcEbnvhq3yVPGFhyUOb4fVE3FPCKxL2vDnncw==
X-Received: by 2002:adf:ed4e:0:b0:33b:4f07:5b4f with SMTP id
 u14-20020adfed4e000000b0033b4f075b4fmr354533wro.69.1707422083319; 
 Thu, 08 Feb 2024 11:54:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b18-20020a5d45d2000000b0033b1b1da2adsm45866wrs.99.2024.02.08.11.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 11:54:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 20:54:38 +0100
Message-ID: <20240208195438.89814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707422083; x=1708026883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uyw2orcx4FkvRZG2N1v/UZoE3yxI4PJTmDt0toPMzYk=;
 b=TdKDmKjCU3HroIoKmy6xw4dYrJkJKbW+OKQC+w5KVm9rx+BzC4AtQQJ1Eu8CV16r23
 EaVceqQ4lUPug6J70z6+3G75LM3v9uGUE6Zye01HqVbYTkXF80fotEynOBOltzZ3+vKc
 hRAJa4m64kWXt4/N5RgH5PSVbRHNKh62WDrgDr/VvrWw1kPKX0nY7txQnO9yc6ft2EJi
 Dgb+K623RLAI8XuUDQBnxpUcdMUY86kD3wPiNonnZFUzn8KNIkpq6WDM3gYofTdyPXQ5
 Faan7cGOCXCBHAIGceW4S6ejEM0qlMmbbvTX61mZT+WTriXl5qU/il9ifPUIWq2Dpn+w
 pOeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TdKDmKjC
Subject: [Buildroot] [PATCH 1/1] package/tinymembench: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...ix-build-on-Thumb-only-architectures.patch | 47 -------------------
 package/tinymembench/Config.in                | 12 -----
 package/tinymembench/tinymembench.hash        |  3 --
 package/tinymembench/tinymembench.mk          | 21 ---------
 8 files changed, 6 insertions(+), 86 deletions(-)
 delete mode 100644 package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
 delete mode 100644 package/tinymembench/Config.in
 delete mode 100644 package/tinymembench/tinymembench.hash
 delete mode 100644 package/tinymembench/tinymembench.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 4a1041a84a..a2b5c14a94 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1265,7 +1265,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
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
index eeca05cd94..5632d2771d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1064,7 +1064,6 @@ F:	package/snort3/
 F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
-F:	package/tinymembench/
 F:	package/whois/
 F:	package/x11r7/xlib_libXpresent/
 F:	package/zeek/
diff --git a/package/Config.in b/package/Config.in
index ee4058155d..ebcc8c2655 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
