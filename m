Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD51C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3150A605D6;
	Sat, 29 Aug 2026 11:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy7z3NDq9rtH; Sat, 29 Aug 2026 11:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788003572;
	bh=QC52yvRkYx6a8hFyp2Os3wckPVA3p1q4ZcefM7kY22w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sz4oKsGocazIf7+9LUdc6ONr4LQk4onLmgFgSUQBJe6nTjXqYOCcGI9+f5uODxkhR
	 lTMq7Lots3oHaOp16jDG+6h/cMVMbUdvTvz1arewBslVmCwd0RLwT2yY3ZmijPvjID
	 ySHddHRa9qjcyeAO1om0dnPgIxo8MTRMw79PFTF+WQ2wN3pFZXVK+rYSK0Ig4lZWfd
	 H15rz+Smmn0jaZ6tIZ5cWGoRvyNRDM8H1zGfhMIKVCl/sviLuPmjAIukDNMFuxuZnU
	 fdFp4rpiLBsFDB63U+KIqatvlIU/ijW9xVFHmoKL00H7Vhm07uD0loRMY/atMifz5c
	 r2h3ODfihgqdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB19605EC;
	Sat, 29 Aug 2026 11:39:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA860336
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC751406FE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJqNKKZFnIiI for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD4844070E
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:39:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 155D01A1849
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:39:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB0956053C;
 Sat, 29 Aug 2026 11:39:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8936311C78131; 
 Sat, 29 Aug 2026 13:39:19 +0200 (CEST)
Date: Sat, 29 Aug 2026 13:39:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <apLDmvqL1lzNhoH5@windsurf>
References: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] arch/or1k: fix uClibc issues with fenv
 enabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Thu, Aug 20, 2026 at 12:15:58AM +0200, Waldemar Brodkorb wrote:
> OpenRISC architecture can be either soft-float or hard-float, so add the
> ability to the user to configure it.
> 
> GNU libc has hard-float support since 03 May 2024, see here:
> https://sourceware.org/pipermail/glibc-cvs/2024q2/085211.html
> There fenv functions f.e. were added to glibc.
> 
> uClibc-ng has added fenv functions in commit 8a77b4785acd143d76ccc08142abb39c0100de3d
> on 27 April 2025.
> 
> musl does not have any or1k architecture specific fenv support.
> 
> Tested with all 6 combinations of C libraries and float configurations.

Are you sure? I don't see how your patch solves the soft-float
configuration.

> diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
> index f42aef9eef..e626907496 100644
> --- a/arch/Config.in.or1k
> +++ b/arch/Config.in.or1k
> @@ -1,3 +1,12 @@
> +config BR2_OR1K_SOFT_FLOAT
> +	bool "Use soft-float"
> +	select BR2_SOFT_FLOAT

This should be "default y", to preserve existing behavior.

> +	help
> +	  If your target CPU does not have a Floating Point Unit (FPU)
> +	  or a kernel FPU emulator, but you still wish to support
> +	  floating point functions, then everything will need to be
> +	  compiled with soft floating point support (-msoft-float).
> +
>  config BR2_ARCH
>  	default "or1k"
>  
> diff --git a/package/Makefile.in b/package/Makefile.in
> index eac28b3a96..69859e8ce4 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -106,6 +106,14 @@ TARGET_ABI += -mabi=spe -mfloat-gprs=double -Wa,-me500mc
>  endif
>  endif
>  
> +# use hard-float option globally for OpenRISC, when not
> +# soft-float choosen by the user.
> +ifeq ($(BR2_or1k),y)
> +ifneq ($(BR2_OR1K_SOFT_FLOAT),y)
> +TARGET_ABI += -mhard-float
> +endif
> +endif

This needs somehow to go in the toolchain wrapper, so instead of your
change, you would need something like this:

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 180e90856d..16c9e08ba5 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -212,6 +212,10 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
 HOST_GCC_COMMON_CONF_OPTS += --with-float=soft
 endif
+else
+ifeq ($(BR2_or1k),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-float=hard
+endif
 endif
 
 # Determine arch/tune/abi/cpu options
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 270cf814ed..a9593a4a69 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -243,6 +243,9 @@ TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 ifeq ($(BR2_SOFT_FLOAT),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
+else ifeq ($(BR2_or1k),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mhard-float
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_HARDFLOAT=1
 endif
 
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 5b306190bb..7dba652e28 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -61,6 +61,9 @@ static char *predef_args[] = {
 #ifdef BR_SOFTFLOAT
        "-msoft-float",
 #endif /* BR_SOFTFLOAT */
+#ifdef BR_HARDFLOAT
+       "-mhard-float",
+#endif /* BR_HARDFLOAT */
 #ifdef BR_SIMD
        "-msimd=" BR_SIMD,
 #endif

But more importantly, I don't see how your patch fixes the soft float
situation. My understanding is that soft-float is the default on
OR1K. Your patch doesn't change *anything* in soft-float
configuration, it only passes -mhard-float in hard float
configurations, and makes hard float the default.

How can your patch fix anything with BR2_OR1K_SOFT_FLOAT enabled?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
