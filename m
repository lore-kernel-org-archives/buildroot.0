Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6A9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E017060E9C
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E017060E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A57714019B;
	Sat, 23 Oct 2021 16:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3CRN-a-VNUD; Sat, 23 Oct 2021 16:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE975400D5;
	Sat, 23 Oct 2021 16:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269971BF2AA
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23805400EA
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Xl_8FpEbRim for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 16:48:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 429C34015E
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 16:48:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cf8:eeb7:8c5b:1909])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4E2DC78034D;
 Sat, 23 Oct 2021 18:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635007721;
 bh=4JiyYmx+DBpBCSGnuQ3n+AYUPcu+hU8N1EpVKOB5h2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMPpbvjoYj4gfGyXga/LlCyV/oTxkFayVEV/SnjVpxIrF+AhuVxOL/XfCJ3ZyqeDt
 TDlIaKIP3hoJKknkGhVDUfzkkRkoJccN+oCR6KdIaXrVpT4Oq+79QY+kmvhtI6MIju
 JE/FfYChfB3tlzaEBc47IRdHvU0ldM8QtgOUEM0iO4KuyC9yiEcnKibzIFBQhFaVhY
 iEyTO2pe1oeKmjJm3/GRjtwRdnVvvRn80LXhSYHbyGIVAweKGEpq8e1dIoAvuvgmqw
 wV30R92BiJuw294BpTzNYhlXj5rLx79jq7Qtx1hY7g9SkshiM/ib6dkv72qTIfGoP2
 FBqNqOd2U2BsA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Oct 2021 18:48:35 +0200
Date: Sat, 23 Oct 2021 18:48:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211023164834.GJ2400@scaer>
References: <20211021211850.149120-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021211850.149120-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/firmware-utils: requires DES
 support in openssl
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
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-21 23:18 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 21d2a0c2ecfdddb250007ce75d1839ba81278e5b:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4/src/mkhilinkfw.c:54:8: error: unknown type name 'DES_key_schedule'
>    54 | static DES_key_schedule schedule;
>       |        ^~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0563b24ccb7dd242998e1b59b217405c6340e276
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/firmware-utils/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
> index 9e47263d73..501b89b453 100644
> --- a/package/firmware-utils/Config.in
> +++ b/package/firmware-utils/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_FIRMWARE_UTILS
>  	bool "firmware-utils"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  Firmware utils are tools that can be used for managing
> -- 
> 2.33.0
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
