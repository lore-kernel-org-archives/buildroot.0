Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB36C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7816740466;
	Sun, 14 Jan 2024 13:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7816740466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WGu6i_U4n5hT; Sun, 14 Jan 2024 13:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E3740533;
	Sun, 14 Jan 2024 13:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E3740533
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ABA31BF372
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 13:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63400418BD
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 13:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63400418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOVrXbMTJnf0 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 13:46:51 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D859418BA
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 13:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D859418BA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3582C13F81D;
 Sun, 14 Jan 2024 14:46:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 14:46:45 +0100
Date: Sun, 14 Jan 2024 14:46:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaPlxc9iDoZwG-RZ@landeda>
References: <20240114111619.310101-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114111619.310101-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705240008;
 bh=UWPhjH3e4faLDdc8L4hm1DcsUzmkqY4oe5djuIMk6ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p1ccpu3qIxdRXFeF0i7rVooH74/5fMwQACEATjNLjkcblTdj054sqHYbzWOOWLS7h
 a+oAdgoLwC0RfLAGuA8uokG0SY1rf1GpAgTYRE2wX8J4pOGhp9PhqXt9gX5SEPBSRa
 ojEYRwCl2x952yISYkeRTyS7oJYQGxcpt9PpOV3Nhb1XpBiVnBCb7IVixHyLIz7U2K
 GjVnyV2Gz6DiIBhv8pip7r+o2m+yqzBsQtu3C90uqWBqM06OvImGrZMpNSbeTFYSpL
 cVq4SW78f2ugE0M0ijiY61mLqO3WsczHUY1t7BImX/yZ7zyvi/a5LucQsZVZ5yziUo
 tDJdiHbj2dXWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p1ccpu3q
Subject: Re: [Buildroot] [PATCH 1/1] package/tinymembench: force arm mode
 instead of Thumb mode
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-14 12:16 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure in Thumb mode:
> 
> /tmp/ccaZHrla.s:40: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
> /tmp/ccaZHrla.s:43: Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
> main.c:45: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
> main.c:46: Error: unshifted register required -- `and r8,r7,r2,lsr#16'
> main.c:47: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
> main.c:48: Error: unshifted register required -- `and r9,r6,r2,lsr#8'
> main.c:49: Error: selected processor does not support `mla r2,r10,r2,r5' in Thumb mode
> 
> While at it, drop patch which is not needed anymore. This patch has been
> submitted in 2016: https://github.com/ssvb/tinymembench/pull/13. But
> upstream seems dead (no commit since 2017).

The patch is still needed to fix the build on Cortex-M processors, such
as for this defconfig:

    BR2_arm=y
    BR2_cortex_m7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_TINYMEMBENCH=y

Do not confuse Thumb and Thumb2:

  - Thumb is Thumb1, availble in armv5 and armv6; virtually all such
    CPUs that have Thumb1, also have full ARM mode (at least as far as
    Buildroot is concerned); this is why it is OK to enable ARM mode
    when the configuration uses BR2_ARM_INSTRUCTIONS_THUMB;

  - Thumb2 is for armv7 (and above), and there are armv7 CPUs that have
    only Thumb2 adn no full ARM mode; they are "known" as armv7m.

The patch from Thomas fixes the third case, while the build failure you
try to fix is about the second case.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/1e359c294a8d71fb1833e5d04a6bc7d4fd533510
>  - http://autobuild.buildroot.org/results/c06010d7a2bdb33a1707266133a3880e14be7657
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...ix-build-on-Thumb-only-architectures.patch | 47 -------------------
>  package/tinymembench/tinymembench.mk          |  9 +++-
>  3 files changed, 8 insertions(+), 49 deletions(-)
>  delete mode 100644 package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 4051805c33..09a1bf35e0 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1296,7 +1296,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
>  package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch Upstream
>  package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch Upstream
>  package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch Upstream
> -package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch Upstream
>  package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch Upstream
>  package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstream
>  package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
> diff --git a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
> deleted file mode 100644
> index 88559ec012..0000000000
> --- a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 034a3552e9700c6d424bd706db106f5bce1f5a5e Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Fri, 11 Nov 2016 21:49:39 +0100
> -Subject: [PATCH] arm: fix build on Thumb-only architectures
> -
> -Building tinymembench for ARM Cortex-M currently fails, because the
> -arm-neon.S file contains ARM code that doesn't build on Thumb-only
> -architectures. To account for this and fix the build for Cortex-M,
> -this patch adjusts the compile time condition to also verify that the
> -architecture supports the ARM instruction set, by testing the
> -__ARM_ARCH_ISA_ARM compiler define.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - arm-neon.S | 2 +-
> - asm-opt.c  | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/arm-neon.S b/arm-neon.S
> -index 4db78ce..19c30ad 100644
> ---- a/arm-neon.S
> -+++ b/arm-neon.S
> -@@ -21,7 +21,7 @@
> -  * DEALINGS IN THE SOFTWARE.
> -  */
> - 
> --#ifdef __arm__
> -+#if defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
> - 
> - .text
> - .fpu neon
> -diff --git a/asm-opt.c b/asm-opt.c
> -index 9da4596..eba1183 100644
> ---- a/asm-opt.c
> -+++ b/asm-opt.c
> -@@ -202,7 +202,7 @@ bench_info *get_asm_framebuffer_benchmarks(void)
> -         return empty;
> - }
> - 
> --#elif defined(__arm__)
> -+#elif defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
> - 
> - #include "arm-neon.h"
> - 
> --- 
> -2.7.4
> -
> diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
> index 016d680ce7..bc84595e24 100644
> --- a/package/tinymembench/tinymembench.mk
> +++ b/package/tinymembench/tinymembench.mk
> @@ -9,8 +9,15 @@ TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,v$(TINYMEMBENCH_VERSION))
>  TINYMEMBENCH_LICENSE = MIT
>  TINYMEMBENCH_LICENSE_FILES = LICENSE
>  
> +# tinymembench has some assembly function that is not present in Thumb mode:
> +# Error: instruction not supported in Thumb16 mode -- `subs r1,r1,#16'
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +TINYMEMBENCH_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +
>  define TINYMEMBENCH_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TINYMEMBENCH_MAKE_OPTS) -C $(@D)
>  endef
>  
>  define TINYMEMBENCH_INSTALL_TARGET_CMDS
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
