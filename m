Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CDCA40A0A;
	Wed,  9 Mar 2022 21:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esFGUflZtyRk; Wed,  9 Mar 2022 21:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D983340562;
	Wed,  9 Mar 2022 21:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3AE1BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A5DF417C9
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffTZF1PyCNQS for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99ABC4179D
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:57:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id e24so5072800wrc.10
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 13:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DL+GEY+BM25wKVpBsKkCRL6LJ0T+2O0UvsFmlvOxwOg=;
 b=Pi371c3EGgDbLLN9DUduTCXuC4sGMZx9PJ1Db1ExUUlz11oL1FQpWdamxY+Leo09Id
 T0q8Y/RXm5ZdHzFIKv2bsY2Hfl8kohgNCYYAJFz58n6cLVpaYitOng63V1CeBul+fGuJ
 xzwgqZlgzExi+FRC3MzXxOnfT8jhsTUwbw6Y7nAk2C3oEw84Z0+FQhk9sENRcRti151K
 uNz2CNNW2hkn5ZzG0y8g2F44PS+CGFOeiMZJiFw9gl54QWrJxTui39ZIIUHRCcj9ODKO
 TNMNpHo+s/JzUXZkQ+76F3P6g7RRFDEFZk5+0zoffJwoBzERWp/3nzdRjc++ntnZc+cm
 PAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DL+GEY+BM25wKVpBsKkCRL6LJ0T+2O0UvsFmlvOxwOg=;
 b=u1TPosXCNwAsK2WuCUwgM87WJz7k0izo1EuH3+uHI4fleMwQoycq2gDqX6r56e4XEQ
 yYXbqyXpsX5jy8HiwPE3H7+KvxFCj9ZpH61zYoBb12az+KTJOvaLF0uqViMWehteALcp
 n72diyFJjKMUk7KOb9wjZiJ57TIup5xqjrRZzubrtcjiq3KKMpEXvma7qLs9rgNpbHjF
 IoSbDOThxU1cb/pN1Dx3/o9sjLJi+M0denTWpSDAEoUMB9WprGWcOemYVVHauFI+dijp
 1tztKCusFvXyOQvTdJ23EJesOnPIf030om4IAEFZDzCESOKcern/yCDTktv9RYj7Wqz8
 KBRQ==
X-Gm-Message-State: AOAM532R5cyXimRQWr2TyHKkGB1akDDkBEeir3qS8qDh1pVev5F13vUh
 UTQ1eSFEWI0rOp4SFWsa6gutEGt+L5c=
X-Google-Smtp-Source: ABdhPJyq3nnxEX0BXTv494yz3VjAnJamI5FmexPjP4jRUaK02kJSq8e/d8NTDgFIFTdr5xTvay34CQ==
X-Received: by 2002:a05:6000:16cd:b0:203:7c67:f661 with SMTP id
 h13-20020a05600016cd00b002037c67f661mr1246074wrf.368.1646863042449; 
 Wed, 09 Mar 2022 13:57:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adfec82000000b0020372dcab56sm2536899wrn.112.2022.03.09.13.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 13:57:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 22:56:39 +0100
Message-Id: <20220309215639.786189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: bump to version
 2022-03-08
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site:
  https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=f271e1b630a1b8b5f4eae2331654fc1e70abfd66
- Update first and second patches
- Drop third and fourth patches (already in version)
- This bump will fix the following build failure with powerpc and gcc 11
  thanks to
  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/0c111b370ad3c5a89e11caee79bc93a66fd004f2

/tmp/ccSlivNE.s:348: Error: `lswx' invalid when little-endian

Fixes:
 - http://autobuild.buildroot.org/results/746e87892ac545e8fb97c17d4bfd7bd7bbc9d8be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...emove-Werror-to-avoid-build-failures.patch | 17 +++---
 ...vm-unit-tests-test-for-rdseed-rdrand.patch | 24 ++++----
 ...3-Makefile-fix-stack-protector-tests.patch | 36 -----------
 ...issue-with-the-linker-from-Fedora-32.patch | 61 -------------------
 package/kvm-unit-tests/kvm-unit-tests.hash    |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk      |  6 +-
 6 files changed, 27 insertions(+), 119 deletions(-)
 delete mode 100644 package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
 delete mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch

diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
index cbfa3a87e6..d07b9b6912 100644
--- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
+++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Makefile: remove -Werror to avoid build failures
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Matthew: Refactoring of Thomas Petazzoni's original.]
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[Fabrice: updated for 2022-03-08]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 1 -
  1 file changed, 1 deletion(-)
@@ -14,14 +16,15 @@ diff --git a/Makefile b/Makefile
 index 7231334..d9ad42b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -53,7 +53,6 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
- COMMON_CFLAGS += -g $(autodepend-flags)
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
- COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
--COMMON_CFLAGS += -Werror
+@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
+ 
+ COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
+ COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
+-COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
++COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
+
  frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
  fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
- fnostack_protector := $(call cc-option, -fno-stack-protector, "")
--- 
+- 
 2.14.2
 
diff --git a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
index 1a1a90ce99..80549fd32a 100644
--- a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
+++ b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
@@ -13,6 +13,8 @@ Upstream:
 https://marc.info/?l=kvm&m=151580743523259&w=2
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[Fabrice: updated for 2022-03-08]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile        |  2 +-
  configure       | 18 ++++++++++++++++++
@@ -27,11 +29,11 @@ index d9ad42b..799e9b5 100644
  cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
                > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
  
--COMMON_CFLAGS += -g $(autodepend-flags)
-+COMMON_CFLAGS += -g $(autodepend-flags) $(EXTRA_CFLAGS)
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
- COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
+-COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
++COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common $(EXTRA_CFLAGS)
+ COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
+ COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
+ 
 diff --git a/configure b/configure
 index dd9d361..21c0219 100755
 --- a/configure
@@ -63,7 +65,7 @@ index dd9d361..21c0219 100755
 @@ -181,6 +198,7 @@ ARCH_NAME=$arch_name
  PROCESSOR=$processor
  CC=$cross_prefix$cc
- CXX=$cross_prefix$cxx
+ CFLAGS=$cflags
 +EXTRA_CFLAGS=$extra_cflags
  LD=$cross_prefix$ld
  OBJCOPY=$cross_prefix$objcopy
@@ -84,12 +86,12 @@ index 4a3e94b..2cbe3eb 100644
  extern void insn_hlt();
  extern void insn_invlpg();
 @@ -796,8 +798,10 @@ extern void insn_lldt();
- extern void insn_str();
- extern void insn_cpuid();
- extern void insn_invd();
+ extern void insn_str(void);
+ extern void insn_cpuid(void);
+ extern void insn_invd(void);
 +#ifndef NO_RDSEEDRAND
- extern void insn_rdrand();
- extern void insn_rdseed();
+ extern void insn_rdrand(void);
+ extern void insn_rdseed(void);
 +#endif
  
  u32 cur_insn;
diff --git a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch b/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
deleted file mode 100644
index be819f27c6..0000000000
--- a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9bf9155804652c0b3a94af9723c79b6de430187b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 24 Feb 2020 00:04:06 +0100
-Subject: [PATCH] Makefile: fix stack-protector tests
-
-Rename fnostack_protector into fno_stack_protector and
-fnostack_protector_all into fnostack_protector_all otherwise build will
-fail if -fstack-protector is passed by the toolchain
-
-Fixes:
- - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to kvm@vger.kernel.org]
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 767b6c6..754ed65 100644
---- a/Makefile
-+++ b/Makefile
-@@ -55,8 +55,8 @@ COMMON_CFLAGS += -Wignored-qualifiers -Werror
- 
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
- fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
--fnostack_protector := $(call cc-option, -fno-stack-protector, "")
--fnostack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
-+fno_stack_protector := $(call cc-option, -fno-stack-protector, "")
-+fno_stack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
- wno_frame_address := $(call cc-option, -Wno-frame-address, "")
- fno_pic := $(call cc-option, -fno-pic, "")
- no_pie := $(call cc-option, -no-pie, "")
--- 
-2.25.0
-
diff --git a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch b/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
deleted file mode 100644
index 1768c668b7..0000000000
--- a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 5126732d73aa75a0bc84f898042bfe35640624b8 Mon Sep 17 00:00:00 2001
-From: Thomas Huth <thuth@redhat.com>
-Date: Wed, 13 May 2020 13:14:46 +0200
-Subject: [PATCH] Fix powerpc issue with the linker from Fedora 32
-
-The linker from Fedora 32 complains:
-
-powerpc64-linux-gnu-ld: powerpc/selftest.elf: error: PHDR segment not
- covered by LOAD segment
-
-Let's introduce some fake PHDRs to the linker script to get this
-working again.
-
-Message-Id: <20200514192626.9950-7-thuth@redhat.com>
-Signed-off-by: Thomas Huth <thuth@redhat.com>
-Signed-off-by: Matthew Weber <matthew.weber@collins.com>
----
- powerpc/flat.lds | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/powerpc/flat.lds b/powerpc/flat.lds
-index 53221e8..5eed368 100644
---- a/powerpc/flat.lds
-+++ b/powerpc/flat.lds
-@@ -1,7 +1,17 @@
- 
-+PHDRS
-+{
-+    text PT_LOAD FLAGS(5);
-+    data PT_LOAD FLAGS(6);
-+}
-+
- SECTIONS
- {
--    .text : { *(.init) *(.text) *(.text.*) }
-+    .text : {
-+        *(.init)
-+        *(.text)
-+        *(.text.*)
-+    } :text
-     . = ALIGN(64K);
-     etext = .;
-     .opd : { *(.opd) }
-@@ -19,9 +29,12 @@ SECTIONS
-     .data : {
-         *(.data)
-         *(.data.rel*)
--    }
-+    } :data
-     . = ALIGN(16);
--    .rodata : { *(.rodata) *(.rodata.*) }
-+    .rodata : {
-+        *(.rodata)
-+        *(.rodata.*)
-+    } :data
-     . = ALIGN(16);
-     .bss : { *(.bss) }
-     . = ALIGN(256);
--- 
-2.17.1
-
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index ad500d04f2..42c3b4a241 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e476443cd76c8f540734e075b419638b2f200ae002986d6fc14076d410f3751e  kvm-unit-tests-kvm-unit-tests-20171020-br1.tar.gz
+sha256  c2edf2b188033a5d634150ecc797c797a85e5af8e3ef4ac3e583f60b2ee7bcf3  kvm-unit-tests-v2022-03-08.tar.bz2
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index a972602fb9..d610442e03 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
-KVM_UNIT_TESTS_SITE = https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
-KVM_UNIT_TESTS_SITE_METHOD = git
+KVM_UNIT_TESTS_VERSION = 2022-03-08
+KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
+KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
