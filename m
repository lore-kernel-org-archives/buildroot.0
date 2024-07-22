Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2403C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 14:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 880AE810F0;
	Mon, 22 Jul 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d363YPCUBWAu; Mon, 22 Jul 2024 14:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78DB4810F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78DB4810F5;
	Mon, 22 Jul 2024 14:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1491BF286
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 872D0810F5
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uBNGOCaOXz4z for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 14:57:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62FCB810F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62FCB810F0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62FCB810F0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 14:57:19 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id BF162440271;
 Mon, 22 Jul 2024 17:56:09 +0300 (IDT)
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
In-Reply-To: <20240722143100.346659-1-wdouglass@carnegierobotics.com> (Woodrow
 Douglass via buildroot's message of "Mon,
 22 Jul 2024 10:30:59 -0400")
References: <20240722131117.273274-1-wdouglass@carnegierobotics.com>
 <20240722143100.346659-1-wdouglass@carnegierobotics.com>
Date: Mon, 22 Jul 2024 17:57:16 +0300
Message-ID: <87a5i9mq43.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1721660169;
 bh=JN+M3FVjnfD/mbPYHoy7dxFhn7dPyfBggCIdB+FkWOI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=xCM2LwMMjSCsCH8oL7J7/xRjwiWzE+/vaZ2NScn9YaRuUvmcEewnQkfc097yYDm2g
 C8b4jaHuiyb7eqVQIOmXAqLB6lJqJN3NOw1OSnSdOwF5CLoUcw6kY6D2i1VXPjEmt+
 601uYSDvoPhwFj4LfftVuqU9ZqL1Zr+fOjbfWzsaojykrkayAzNUtFGnrAOlsOT5Ul
 Vlsbe0AWj/9yURgsag9BFjIvSUBHhucSuD/ycsI2i8ZjNYsHAYGh++d1aIRkwXwU9t
 tLa97uU5ab0o+0bwCrrZpqwWwHeeWoQe1n5LLMdN5WeCfPa9BvaKXe0qiN4GqBz01/
 BluUa/66E2+Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=xCM2LwMM
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Woodrow,

On Mon, Jul 22 2024, Woodrow Douglass via buildroot wrote:
> This solves a build problem -- by default xtensa-gcc puts literals in a
> different section of memory then the program text, and chicken is a very
> literal-heavy program, so they don't all fit there. This avoids that problem.
>
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  .../0001-xtensa-text-section-literals.patch   | 30 +++++++++++++++++++
>  package/chicken/chicken.mk                    | 14 +++++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 package/chicken/0001-xtensa-text-section-literals.patch
>
> diff --git a/package/chicken/0001-xtensa-text-section-literals.patch b/package/chicken/0001-xtensa-text-section-literals.patch
> new file mode 100644
> index 0000000000..b93aaf9e21
> --- /dev/null
> +++ b/package/chicken/0001-xtensa-text-section-literals.patch
> @@ -0,0 +1,30 @@
> +From e8d177f4d4e1c6bc41787ea1621e323ff4ad493e Mon Sep 17 00:00:00 2001
> +From: Woodrow Douglass <wdouglass@carnegierobotics.com>
> +Date: Mon, 22 Jul 2024 08:50:37 -0400
> +Subject: [PATCH] Move literals into text section for xtensa architecture
> +
> +Upstream: https://bugs.call-cc.org/ticket/1840
> +Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> +---
> + Makefile.linux | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/Makefile.linux b/Makefile.linux
> +index b628cda4..e97c2b94 100644
> +--- a/Makefile.linux
> ++++ b/Makefile.linux
> +@@ -52,6 +52,11 @@ USES_SONAME = yes
> + 
> + # architectures
> + 
> ++ifeq ($(ARCH),xtensa)
> ++C_COMPILER_OPTIONS += -mtext-section-literals
> ++LINKER_OPTIONS += -mtext-section-literals
> ++endif
> ++
> + ifeq ($(ARCH),x32)
> + C_COMPILER_OPTIONS += -mx32
> + LINKER_OPTIONS += -mx32
> +-- 
> +2.39.2
> +
> diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
> index 2667f7823d..d0e456f92a 100644
> --- a/package/chicken/chicken.mk
> +++ b/package/chicken/chicken.mk
> @@ -11,9 +11,19 @@ CHICKEN_LICENSE_FILES = LICENSE
>  CHICKEN_CPE_ID_VENDOR = call-cc
>  CHICKEN_INSTALL_STAGING = YES
>  
> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
> +#Chicken only uses the "arch" variable for some special-case compile arguments
> +#If it's empty, it tries to detect the arch host
> +#Handle some cases, but in most cases the normalized arch is fine here
> +ifeq ($(BR2_NORMALIZED_ARCH),"i386")
> +CHICKEN_ARCH="x32"

Are you sure about that? x32 requires the 64-bit extension for x86
processors (https://en.wikipedia.org/wiki/X32_ABI). i386 is for 32-bit
capable processors.

baruch

> +else ifeq ($(BR2_NORMALIZED_ARCH),"x86_64")
> +CHICKEN_ARCH="x86-64"
> +else
> +CHICKEN_ARCH=$(BR2_NORMALIZED_ARCH)
> +endif
> +
>  CHICKEN_MAKE_OPTS = \
> -	ARCH=unused \
> +	ARCH=$(CHICKEN_ARCH) \
>  	C_COMPILER="$(TARGET_CC)" \
>  	CXX_COMPILER="$(TARGET_CXX)" \
>  	PREFIX=/usr \

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
