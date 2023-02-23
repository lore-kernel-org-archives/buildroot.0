Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F57C636D7
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 06:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A6C8210C;
	Thu, 23 Feb 2023 06:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A6C8210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKUgqKygmKSP; Thu, 23 Feb 2023 06:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A4882121;
	Thu, 23 Feb 2023 06:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A4882121
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 845731BF842
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E36082129
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E36082129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSzHAJAOS8uL for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 06:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D328214E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56D328214E
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:36:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0A26D5FF3F;
 Thu, 23 Feb 2023 07:36:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 23 Feb 2023 07:36:07 +0100
Date: Thu, 23 Feb 2023 07:36:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223063607.GK2718518@scaer>
References: <20230222143753.1563322-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230222143753.1563322-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677134170;
 bh=J5G330NctBl4bWXcMOuaklMKry5jTSP9WbYd+GyL2Uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEgdTQM9nsGh3FHpH1bV3yasCfzJWktsMvMmNZ1z9v/4z6dXznAPbtpj1uc7Je4I3
 yGbWDfp/ZNp2fyCNawrZztWNbStscIQIqnAQ3ggfdpz7x3m5a2RTVXxkITdHXd/DIy
 ds5S5rYh2DOs4ib/8IUHSGLndzcREq2PE5mg0bWVIs/m2natYyWOrvepG7+5rU7vz+
 pCVYzR+OBKDcfEipqm8QG+j4ji8WOaX9NZRz9EeJZv0pQlGiRzeSqiZ5kLLeqXYzu7
 LyD8kebmnywEuANS6xOFuuE83abUW2YrZ91O719tySrFtPXSRhFgATfsC6blWx62YR
 a/kAAjhSBxcqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IEgdTQM9
Subject: Re: [Buildroot] [PATCH 1/1] package/libev: force arm mode instead
 of Thumb mode
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

On 2023-02-22 15:37 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> /tmp/ccHc3Awn.s:825: Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c597c9da724d6cac06b09b1ecd456a28440a3a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libev/libev.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libev/libev.mk b/package/libev/libev.mk
> index 9f3c19d46c..cbd5433d76 100644
> --- a/package/libev/libev.mk
> +++ b/package/libev/libev.mk
> @@ -10,6 +10,13 @@ LIBEV_INSTALL_STAGING = YES
>  LIBEV_LICENSE = BSD-2-Clause or GPL-2.0+
>  LIBEV_LICENSE_FILES = LICENSE
>  
> +# libev has some assembly function that is not present in Thumb mode:
> +# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif

Same as for the audit change, this is going to fail for armv7m machines,
so we need to hide away libeve for those.

Unfortuantely, libev does not already have an _ARCH_SUPPORTS, and adding
one just for this is a bit overkill.

However, libeve has 12 reverse dependencies, so it's going to be a
little pain.

If we expect that libeve has more arch-dependencies, then it might be a
good idea, but I have no clue there...

In fact, re-reading the libev code, it seems that the situation is more
coplex that "not thumb":

     814    #elif defined __ARM_ARCH_6__  || defined __ARM_ARCH_6J__  \
     815       || defined __ARM_ARCH_6K__ || defined __ARM_ARCH_6ZK__ \
     816       || defined __ARM_ARCH_6T2__
     817      #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("mcr p15,0,%0,c7,c10,5" : : "r" (0) : "memory")
     818    #elif defined __ARM_ARCH_7__  || defined __ARM_ARCH_7A__  \
     819       || defined __ARM_ARCH_7R__ || defined __ARM_ARCH_7M__
     820      #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("dmb"      : : : "memory")

So, it goes through the armv6 case, and it looks like it does have
support for Thumb2 (6T2) or armv7m.

So, the condition is a bit more complex. It is OK for ARM full or
Thumb2 (armv7m implies Thumb2).

So, adding an LIBEVE_ARCH_SUPPORT is maybe a good idea, in the end:

    config BR2_PACKAGE_LIBEV_ARCH_SUPPORTS
        bool
        default y if !(BR2_arm || BR2_armeb) || BR2_ARM_CPU_HAS_ARM || BR2_ARM_CPU_HAS_THUMB2

Regards,
Yann E. MORIN.

>  # The 'compatibility' event.h header conflicts with libevent
>  # It's completely unnecessary for BR packages so remove it
>  define LIBEV_DISABLE_EVENT_H_INSTALL
> -- 
> 2.39.0
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
