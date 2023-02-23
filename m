Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B4C636D7
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 06:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C2F41795;
	Thu, 23 Feb 2023 06:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C2F41795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pw5aKtup75L; Thu, 23 Feb 2023 06:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD304174A;
	Thu, 23 Feb 2023 06:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD304174A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14D0B1BF842
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF2AC61386
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF2AC61386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNhcoeLnLzZq for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 06:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7564C61385
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7564C61385
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:23:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EF3555FF33;
 Thu, 23 Feb 2023 07:22:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 23 Feb 2023 07:22:59 +0100
Date: Thu, 23 Feb 2023 07:22:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223062259.GJ2718518@scaer>
References: <20230222143512.1555539-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230222143512.1555539-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677133382;
 bh=MXdjwgn3L8TLKmnsxdtTgm5pkzxrNfk4GFUZq9MwMWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8Qr1qj56cHm1pvE+6Qqo+y03B9E81mB8GuOUA1OkZxx3cgSMySV/yzDU63AszdPs
 vrF1HbeWvjm87m4KJFKP5xrWDr42fwa7RxA2OH51s2tnEOQSH+EoJeLoOiR47K+7Hv
 20Mo1AG8Lv2wsaglQhy3vjCVxPITa+S4ok1Yyms1awNkrk5k9G8BwPdcXvFRyN3BMC
 WflaG381Yx6tF1EW2NMiqrx0+1IbkTsTWe1piNqZE8c95xvsTS4/g/gcBMRCefo4qo
 Y2d2zafNex5mQ+kFKY85hswHN/I8ZpLkJylfjshjo5amHU8DF7PAnKPnMqSEO0P3KW
 DFh9FdFsv9+qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A8Qr1qj5
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: force arm mode instead
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

On 2023-02-22 15:35 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> /tmp/ccY5gl3z.s:2145: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9d18a0d360b2e2f9e87c55daedda62d6ce198bb9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/audit/audit.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> index cbb174b980..af81dabac0 100644
> --- a/package/audit/audit.mk
> +++ b/package/audit/audit.mk
> @@ -15,6 +15,13 @@ AUDIT_INSTALL_STAGING = YES
>  
>  AUDIT_CONF_OPTS = --without-python --without-python3
>  
> +# src/libev has some assembly function that is not present in Thumb mode:
> +# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif

But then it would not work on systems that have a armv7m: BR2_cortex_m3,
BR2_cortex_m4, or BR2_cortex_m7.

I looked at the code, and it's going to be very complex to patch it to
support armv7m, i.e. thumb-only.

So, we will have to disallow audit in this case. It is going to be easy,
as it already have a _ARCH_SUPPORTS, but it going to neeed a bit of
cleanup:

    config BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64
        default y if (BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM
        default y if BR2_i386 || BR2_x86_64
        default y if BR2_powerpc || BR2_powerpc64

And then, the only 'select' is from libsemanage, which already depends
on AUDIT_ARCH_SUPPORT, so all is going to be alright (in the end).

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
>  AUDIT_DEPENDENCIES += libcap-ng
>  AUDIT_CONF_OPTS += --with-libcap-ng=yes
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
