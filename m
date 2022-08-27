Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E16C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98D1812C9;
	Sat, 27 Aug 2022 07:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A98D1812C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_GB2KiVdwmh; Sat, 27 Aug 2022 07:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFFC081453;
	Sat, 27 Aug 2022 07:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFC081453
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B52B51BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9015460BB8
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9015460BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uff6CmlzWhMo for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B16E60BDF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B16E60BDF
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:52:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F1DDA19F736;
 Sat, 27 Aug 2022 09:52:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:52:35 +0200
Date: Sat, 27 Aug 2022 09:52:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075235.GJ37358@scaer>
References: <20220826205316.20112-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826205316.20112-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586758;
 bh=GSC7GErjsB6YjbW0KDmkFVGS0VGpe0EkedZcAlsfgJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LE33Oe44E0xEIUHbw2LY5FIl+Rhty8EZYJ8TduukaN4m6SDiFbJ82jWBL2RL5Y3VA
 0upSPn28vAIVM6uHChEiku6mAMinTAHnEmIJzEyIJum9DQfbBL/njqzCIXXxHxhHbd
 xfiUQAfNSEDoK18lVHY1ZFpvBA8Yeg2dHDJNFS4Cb/elZaVyVm1lZYA34OY2tG8Pl1
 K43fcE8Fafh41HABkuIAWr1bD2sM7qnUUYCvTByk6BW2ExildjHCoP9aQ85ZaEFwSa
 MpSTpsKu7Tpu7Lvaim8OsI9zV5rrTHIvwugiaMIFs6BRfu+mekeY4zPi+0cPfk3svB
 VFfdEM8XguLLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LE33Oe44
Subject: Re: [Buildroot] [PATCH 1/1] package/edk2-platforms: fix legal-info
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

On 2022-08-26 22:53 +0200, Fabrice Fontaine spake thusly:
> Fix typo: EDK2_PLATFORMS_LICENSE_FILE -> EDK2_PLATFORMS_LICENSE_FILES
> added by commit 33aa59e7b500e60f2d736a17183c7d49b7baf5bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/edk2-platforms/edk2-platforms.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
> index 430791ae3e..7de59c1afc 100644
> --- a/package/edk2-platforms/edk2-platforms.mk
> +++ b/package/edk2-platforms/edk2-platforms.mk
> @@ -8,7 +8,7 @@
>  EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
>  EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
>  EDK2_PLATFORMS_LICENSE = BSD-2-Clause
> -EDK2_PLATFORMS_LICENSE_FILE = License.txt
> +EDK2_PLATFORMS_LICENSE_FILES = License.txt
>  EDK2_PLATFORMS_INSTALL_TARGET = NO
>  EDK2_PLATFORMS_INSTALL_STAGING = YES
>  
> -- 
> 2.35.1
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
