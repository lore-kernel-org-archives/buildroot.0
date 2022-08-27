Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CF1C0502E
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190F082F32;
	Sat, 27 Aug 2022 07:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190F082F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcbTxRO8N2Mn; Sat, 27 Aug 2022 07:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376AF82C9C;
	Sat, 27 Aug 2022 07:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376AF82C9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3381BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5009360B5C
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5009360B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mFlmCuDd48ez for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:52:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FD1D60BB8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FD1D60BB8
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:52:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 598CD19F751;
 Sat, 27 Aug 2022 09:51:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:51:59 +0200
Date: Sat, 27 Aug 2022 09:51:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827075159.GH37358@scaer>
References: <20220826204849.17439-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826204849.17439-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661586723;
 bh=27fdxLJ8kxcdMwnNF+g4rf8Kg5zPwCMTAZnLVARpa/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0eFAt9MOMYnKp06Am2xvadI7chZpAIahr3Qg2maFlVKYfbXkT95B164zCtAzTAS1
 MhH7tzr46WnLF9qIggeTsU8fkj9s7qMoWHENh1cmE1rVDmDRbGDQpJXoSCHLADHi8O
 jr66l6pPPFivHgBq/zIiGbZmyduH8uHFWCU+/wj7oxE74viHS3pPY+MgU5MMHD84xa
 whP530KFF5D0dl0q6wvaH301EiTUfS98aRMvkYWIprIDjAOax7rKRef2ZEXnuvhxfR
 KP97pPOGBmfdaTVHoK/ua+JksZMn5HAVFwJY7twEOAjxpXQqYzn/RW7h2fEHcCtssS
 sPy/jSy1rbUTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K0eFAt9M
Subject: Re: [Buildroot] [PATCH 1/1] package/sysdig: fix legal-info
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-26 22:48 +0200, Fabrice Fontaine spake thusly:
> Fix typo: SYSDIG_LICENSE_FILE -> SYSDIG_LICENSE_FILES
> added by commit ea86757e51cf424566f79896335d31d15b89d0d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysdig/sysdig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 2d57c0043f..e9968d9fde 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -7,7 +7,7 @@
>  SYSDIG_VERSION = 0.29.2
>  SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>  SYSDIG_LICENSE = Apache-2.0
> -SYSDIG_LICENSE_FILE = COPYING
> +SYSDIG_LICENSE_FILES = COPYING
>  SYSDIG_CPE_ID_VENDOR = sysdig
>  SYSDIG_CONF_OPTS = \
>  	-DENABLE_DKMS=OFF \
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
