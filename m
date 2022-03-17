Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7414C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8335E403E0;
	Thu, 17 Mar 2022 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 337DzFjG6ZS6; Thu, 17 Mar 2022 21:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B982740469;
	Thu, 17 Mar 2022 21:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36D151BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26F50401F1
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p51IUDYBBXNJ for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:38:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9672401DC
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:38:10 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id yy13so13454750ejb.2
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=T0CPGTG6nXGEDwjKPDE77EUTA+xsgZSm1QqJZiorwtM=;
 b=XAquBmIZAKVNa3OXVOVSt6K/7n5H9EYl/q0Ojusi9SDeM6PeboRIzhnyXyBJAdapKk
 e6VTHzal1iFV/3lGEWCQv9XjV8JL1H2i6gjB/FK0rjSXW38C1i+2bWGNmjPy/yl7Zqxv
 LYc+aGBTjwDMckoYO+xa2JNh7/HygqJEj6Ha/JCuXllUmtwy9rqbgoZo7HPyuKb3Jth1
 vIDVByoJjTYnSaqDWucMMLRMsJ1Y2564k7AAeUbPtdrWP3aZWf0bGkpsX/VGl9v0g4Yv
 sVaXkqZYzhNZe1Ep6wPszd8IiJK+mmpTmhXGrQ/jgiqerkyb1ypLq8zPqfxVY6BRSsal
 33Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=T0CPGTG6nXGEDwjKPDE77EUTA+xsgZSm1QqJZiorwtM=;
 b=7ZnsGDUQEkHc7ratGr0TXv+jux0soSvCmVODTB3Qn6UmCQnWL94qxZbWxZwVX1QTXH
 X7QMKs5+W0QPKv+bbtrIIz18wamoUMN42rS0WUq/I6A2z1OrOwgvoTCVRUBzgGaDpQoy
 bL0AJTcqAdf+lYgVULijIQdP7DLnzYbALWi0whLPqSdltL572GNFfO5AO9ItCAit/yEX
 wy+a0CCjxxoOM+epBgtUuuTqeK9YcogmEeBgljjnelTTNVS8UjWc77fOnGcBlY6Sch6E
 TYL0BbYMYodVW8aKgohLab9t3cVafl3pcp1PLaSm48ELfbqfydUlhJBjRihteDVZIL5b
 QTpw==
X-Gm-Message-State: AOAM531lzwYu6L1nHb16ZV7YLy0+Ah2BMPkNnmzFO5DrrcYW00cStVDd
 GysuHXGBGjGQ5Ct+hqri9tGnhIykeA+fHw==
X-Google-Smtp-Source: ABdhPJzvp+lsXvX4A1T65qz9KSORogJHNDzoMNazWz/i9wOTJG4sWktXRmslSkGhlUgNQ87MyOPIvA==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id
 t12-20020a17090616cc00b006cee607ff02mr6261476ejd.418.1647553088693; 
 Thu, 17 Mar 2022 14:38:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q10-20020aa7cc0a000000b0040f826f09fdsm3141361edt.81.2022.03.17.14.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:38:08 -0700 (PDT)
Message-ID: <61249287-eed1-34a0-3b8f-d5615a23027f@mind.be>
Date: Thu, 17 Mar 2022 22:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220310221908.30588-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220310221908.30588-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: bump to version 2022-03-08
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2022 23:19, Fabrice Fontaine wrote:
> - Switch site:
>    https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=f271e1b630a1b8b5f4eae2331654fc1e70abfd66
> - Update first patch
> - Drop second patch (binutils < 2.23 is not supported by buildroot
>    anymore)
> - Drop third and fourth patches (already in version)
> - This bump will fix the following build failure with powerpc and gcc 11
>    thanks to
>    https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/0c111b370ad3c5a89e11caee79bc93a66fd004f2
> 
> /tmp/ccSlivNE.s:348: Error: `lswx' invalid when little-endian
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/746e87892ac545e8fb97c17d4bfd7bd7bbc9d8be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Thomas Huth):
>   - Drop second patch
> 
>   ...emove-Werror-to-avoid-build-failures.patch |  17 +--
>   ...vm-unit-tests-test-for-rdseed-rdrand.patch | 110 ------------------
>   ...3-Makefile-fix-stack-protector-tests.patch |  36 ------
>   ...issue-with-the-linker-from-Fedora-32.patch |  61 ----------
>   package/kvm-unit-tests/kvm-unit-tests.hash    |   2 +-
>   package/kvm-unit-tests/kvm-unit-tests.mk      |   6 +-
>   6 files changed, 14 insertions(+), 218 deletions(-)
>   delete mode 100644 package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
>   delete mode 100644 package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
>   delete mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
> 
> diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> index cbfa3a87e6..d07b9b6912 100644
> --- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> +++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH] Makefile: remove -Werror to avoid build failures
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>   [Matthew: Refactoring of Thomas Petazzoni's original.]
>   Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +[Fabrice: updated for 2022-03-08]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    Makefile | 1 -
>    1 file changed, 1 deletion(-)
> @@ -14,14 +16,15 @@ diff --git a/Makefile b/Makefile
>   index 7231334..d9ad42b 100644
>   --- a/Makefile
>   +++ b/Makefile
> -@@ -53,7 +53,6 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
> - COMMON_CFLAGS += -g $(autodepend-flags)
> - COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
> - COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
> --COMMON_CFLAGS += -Werror
> +@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
> +
> + COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
> + COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
> +-COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
> ++COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
> +
>    frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
>    fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
> - fnostack_protector := $(call cc-option, -fno-stack-protector, "")
> ---
> +-
>   2.14.2
>   
> diff --git a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
> deleted file mode 100644
> index 1a1a90ce99..0000000000
> --- a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 8d9a62a5fa89001266352a929c5d40b28c0dda85 Mon Sep 17 00:00:00 2001
> -From: Matt Weber <matthew.weber@rockwellcollins.com>
> -Date: Fri, 12 Jan 2018 19:07:27 -0600
> -Subject: [PATCH] kvm-unit-tests: test for rdseed/rdrand
> -
> -The build fails when the host binutils isn't at least 2.23
> -(2.22.x introduced RDSEED).
> -
> -Fixes:
> -http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
> -
> -Upstream:
> -https://marc.info/?l=kvm&m=151580743523259&w=2
> -
> -Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ----
> - Makefile        |  2 +-
> - configure       | 18 ++++++++++++++++++
> - x86/vmx_tests.c |  6 ++++++
> - 3 files changed, 25 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index d9ad42b..799e9b5 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -50,7 +50,7 @@ include $(SRCDIR)/$(TEST_DIR)/Makefile
> - cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
> -               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
> -
> --COMMON_CFLAGS += -g $(autodepend-flags)
> -+COMMON_CFLAGS += -g $(autodepend-flags) $(EXTRA_CFLAGS)
> - COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
> - COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
> - frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
> -diff --git a/configure b/configure
> -index dd9d361..21c0219 100755
> ---- a/configure
> -+++ b/configure
> -@@ -171,6 +171,23 @@ mkdir -p lib
> - ln -sf "$asm" lib/asm
> -
> -
> -+cat > rd_test.c <<EOF
> -+#include <stdint.h>
> -+int main() {
> -+   uint16_t seed=0;
> -+   unsigned char ok;
> -+   asm volatile ("rdseed %0; setc %1"
> -+                 : "=r" (seed), "=qm" (ok));
> -+   return ok;
> -+}
> -+EOF
> -+if $cross_prefix$cc -o /dev/null rd_test.c &> /dev/null; then
> -+  echo "Checking for rdseed/rdrand... Yes."
> -+else
> -+  echo "Checking for rdseed/rdrand... No."
> -+  extra_cflags="-DNO_RDSEEDRAND"
> -+fi
> -+
> - # create the config
> - cat <<EOF > config.mak
> - SRCDIR=$srcdir
> -@@ -181,6 +198,7 @@ ARCH_NAME=$arch_name
> - PROCESSOR=$processor
> - CC=$cross_prefix$cc
> - CXX=$cross_prefix$cxx
> -+EXTRA_CFLAGS=$extra_cflags
> - LD=$cross_prefix$ld
> - OBJCOPY=$cross_prefix$objcopy
> - OBJDUMP=$cross_prefix$objdump
> -diff --git a/x86/vmx_tests.c b/x86/vmx_tests.c
> -index 4a3e94b..2cbe3eb 100644
> ---- a/x86/vmx_tests.c
> -+++ b/x86/vmx_tests.c
> -@@ -770,8 +770,10 @@ asm(
> - 	"insn_sldt: sldt %ax;ret\n\t"
> - 	"insn_lldt: xor %eax, %eax; lldt %ax;ret\n\t"
> - 	"insn_str: str %ax;ret\n\t"
> -+#ifndef NO_RDSEEDRAND
> - 	"insn_rdrand: rdrand %rax;ret\n\t"
> - 	"insn_rdseed: rdseed %rax;ret\n\t"
> -+#endif
> - );
> - extern void insn_hlt();
> - extern void insn_invlpg();
> -@@ -796,8 +798,10 @@ extern void insn_lldt();
> - extern void insn_str();
> - extern void insn_cpuid();
> - extern void insn_invd();
> -+#ifndef NO_RDSEEDRAND
> - extern void insn_rdrand();
> - extern void insn_rdseed();
> -+#endif
> -
> - u32 cur_insn;
> - u64 cr3;
> -@@ -853,8 +857,10 @@ static struct insn_table insn_table[] = {
> - 	{"DESC_TABLE (LLDT)", CPU_DESC_TABLE, insn_lldt, INSN_CPU1, 47, 0, 0, 0},
> - 	{"DESC_TABLE (STR)", CPU_DESC_TABLE, insn_str, INSN_CPU1, 47, 0, 0, 0},
> - 	/* LTR causes a #GP if done with a busy selector, so it is not tested.  */
> -+#ifndef NO_RDSEEDRAND
> - 	{"RDRAND", CPU_RDRAND, insn_rdrand, INSN_CPU1, VMX_RDRAND, 0, 0, 0},
> - 	{"RDSEED", CPU_RDSEED, insn_rdseed, INSN_CPU1, VMX_RDSEED, 0, 0, 0},
> -+#endif
> - 	// Instructions always trap
> - 	{"CPUID", 0, insn_cpuid, INSN_ALWAYS_TRAP, 10, 0, 0, 0},
> - 	{"INVD", 0, insn_invd, INSN_ALWAYS_TRAP, 13, 0, 0, 0},
> ---
> -1.9.1
> -
> diff --git a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch b/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
> deleted file mode 100644
> index be819f27c6..0000000000
> --- a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9bf9155804652c0b3a94af9723c79b6de430187b Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 24 Feb 2020 00:04:06 +0100
> -Subject: [PATCH] Makefile: fix stack-protector tests
> -
> -Rename fnostack_protector into fno_stack_protector and
> -fnostack_protector_all into fnostack_protector_all otherwise build will
> -fail if -fstack-protector is passed by the toolchain
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: sent to kvm@vger.kernel.org]
> ----
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 767b6c6..754ed65 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -55,8 +55,8 @@ COMMON_CFLAGS += -Wignored-qualifiers -Werror
> -
> - frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
> - fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
> --fnostack_protector := $(call cc-option, -fno-stack-protector, "")
> --fnostack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
> -+fno_stack_protector := $(call cc-option, -fno-stack-protector, "")
> -+fno_stack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
> - wno_frame_address := $(call cc-option, -Wno-frame-address, "")
> - fno_pic := $(call cc-option, -fno-pic, "")
> - no_pie := $(call cc-option, -no-pie, "")
> ---
> -2.25.0
> -
> diff --git a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch b/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
> deleted file mode 100644
> index 1768c668b7..0000000000
> --- a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 5126732d73aa75a0bc84f898042bfe35640624b8 Mon Sep 17 00:00:00 2001
> -From: Thomas Huth <thuth@redhat.com>
> -Date: Wed, 13 May 2020 13:14:46 +0200
> -Subject: [PATCH] Fix powerpc issue with the linker from Fedora 32
> -
> -The linker from Fedora 32 complains:
> -
> -powerpc64-linux-gnu-ld: powerpc/selftest.elf: error: PHDR segment not
> - covered by LOAD segment
> -
> -Let's introduce some fake PHDRs to the linker script to get this
> -working again.
> -
> -Message-Id: <20200514192626.9950-7-thuth@redhat.com>
> -Signed-off-by: Thomas Huth <thuth@redhat.com>
> -Signed-off-by: Matthew Weber <matthew.weber@collins.com>
> ----
> - powerpc/flat.lds | 19 ++++++++++++++++---
> - 1 file changed, 16 insertions(+), 3 deletions(-)
> -
> -diff --git a/powerpc/flat.lds b/powerpc/flat.lds
> -index 53221e8..5eed368 100644
> ---- a/powerpc/flat.lds
> -+++ b/powerpc/flat.lds
> -@@ -1,7 +1,17 @@
> -
> -+PHDRS
> -+{
> -+    text PT_LOAD FLAGS(5);
> -+    data PT_LOAD FLAGS(6);
> -+}
> -+
> - SECTIONS
> - {
> --    .text : { *(.init) *(.text) *(.text.*) }
> -+    .text : {
> -+        *(.init)
> -+        *(.text)
> -+        *(.text.*)
> -+    } :text
> -     . = ALIGN(64K);
> -     etext = .;
> -     .opd : { *(.opd) }
> -@@ -19,9 +29,12 @@ SECTIONS
> -     .data : {
> -         *(.data)
> -         *(.data.rel*)
> --    }
> -+    } :data
> -     . = ALIGN(16);
> --    .rodata : { *(.rodata) *(.rodata.*) }
> -+    .rodata : {
> -+        *(.rodata)
> -+        *(.rodata.*)
> -+    } :data
> -     . = ALIGN(16);
> -     .bss : { *(.bss) }
> -     . = ALIGN(256);
> ---
> -2.17.1
> -
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
> index ad500d04f2..42c3b4a241 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.hash
> +++ b/package/kvm-unit-tests/kvm-unit-tests.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  e476443cd76c8f540734e075b419638b2f200ae002986d6fc14076d410f3751e  kvm-unit-tests-kvm-unit-tests-20171020-br1.tar.gz
> +sha256  c2edf2b188033a5d634150ecc797c797a85e5af8e3ef4ac3e583f60b2ee7bcf3  kvm-unit-tests-v2022-03-08.tar.bz2
>   sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index a972602fb9..d610442e03 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
> -KVM_UNIT_TESTS_SITE = https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
> -KVM_UNIT_TESTS_SITE_METHOD = git
> +KVM_UNIT_TESTS_VERSION = 2022-03-08
> +KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
> +KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
>   KVM_UNIT_TESTS_LICENSE = LGPL-2.0
>   KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
