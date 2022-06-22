Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A08C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1605C612C1;
	Wed, 22 Jun 2022 20:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1605C612C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3OqAq46lxpz; Wed, 22 Jun 2022 20:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A871612B5;
	Wed, 22 Jun 2022 20:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A871612B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A83E1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 434D083F41
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434D083F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjuVCjBCqE_G for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:10:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC93C83F2B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC93C83F2B
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:10:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d108:8c48:c119:a22b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2F8E3B004EE;
 Wed, 22 Jun 2022 22:10:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 22:10:09 +0200
Date: Wed, 22 Jun 2022 22:10:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas POIROT <ni.poirot@laposte.net>
Message-ID: <20220622201009.GA2608@scaer>
References: <20220622171129.31658-1-ni.poirot@laposte.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622171129.31658-1-ni.poirot@laposte.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1655928612;
 bh=v6q6lMQjJfZmt06190x+bfgb5TDDuhi8aDci4wFeurY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qA99nVxyzrYEgkPLZmY5Y0+5GqBQaG01F6LBT0cJK+oqlCHxcs2i71muwTbQU1yW6
 8BypxdqT3oeYJucjwBZ9n19xMqxSPmnjLB/sWPxYHWwxjnrOcMGQ/gZXVpYJVmd5C1
 3QTFYvnRjqxSPL0zaXf5G5vQCgZsr7lpdWUi6FciOVVIIBE/BwIIU6VLZ/TGDxVBnq
 TFw4UOwWZ3q8Iq+4BGEeZHa0VQpqoVMexl5aHz7vtMpN7PIrxs8UOTdNOx4iyZi3Jd
 T/ZcIBtcjGAaUwbh3tSahd7a3wJCbmgf9dLo1tXipHx4BVZGNNO3mjZwp7HZbcwxmm
 ZSGEVGZGcm56Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qA99nVxy
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: fix configurations listing
 command
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

Nicolas, All,

On 2022-06-22 19:11 +0200, Nicolas POIROT via buildroot spake thusly:
> Signed-off-by: Nicolas POIROT <ni.poirot@laposte.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-configuration.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
> index ae6cebe6c4..fa8f454674 100644
> --- a/docs/manual/customize-configuration.txt
> +++ b/docs/manual/customize-configuration.txt
> @@ -15,8 +15,8 @@ make with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.
>  
>  The recommended place to store this defconfig is
>  +configs/<boardname>_defconfig+. If you follow this recommendation, the
> -configuration will be listed in +make help+ and can be set again by
> -running +make <boardname>_defconfig+.
> +configuration will be listed in +make list-defconfigs+ and can be set
> +again by running +make <boardname>_defconfig+.
>  
>  Alternatively, you can copy the file to any other place and rebuild with
>  +make defconfig BR2_DEFCONFIG=<path-to-defconfig-file>+.
> -- 
> 2.36.1
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
