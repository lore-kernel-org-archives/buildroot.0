Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792D3C001DB
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 19:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230EC837A4;
	Thu,  3 Aug 2023 19:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 230EC837A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ce1R3vsicUWF; Thu,  3 Aug 2023 19:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445CF8390F;
	Thu,  3 Aug 2023 19:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 445CF8390F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5277E1BF2BD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 564E94091F
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564E94091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mRo7uNKMPnk for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 19:12:16 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54D7E4032A
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 19:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54D7E4032A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:220a:a3fc:7608:6165])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 46AB878038E;
 Thu,  3 Aug 2023 21:12:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 03 Aug 2023 21:12:09 +0200
Date: Thu, 3 Aug 2023 21:12:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20230803191208.GM421096@scaer>
References: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691089933;
 bh=9R/cMp45LsjOnxBAVJZxPzQPjU4K0FQVZAdYJRux+qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ndHAEIThjI3z8jgvsMzDDrAKXTODrossAPX0EFM/dvANyqjKFzPRw4jlBw4TXDfS7
 906JjM4HqcrVu/k8YMyn4EKQBFVgIEDcXYYFTrIaor7JCLZp6rXmQsfoylRqejwdWL
 OK50Vl/UPGQChgVl9nDDUy1jREOTwuPecYyq6a2DdbL71N5CSgHBMQDo1avdgoeBBw
 Wjs7mstC0S8/HB2K43Xmrxvqi/VR0YvGYVLwgY2ErCbYUoJGAmybclxPPVBcpzYFIb
 dKEYJFlVjWYCaCg69Ox0r+DWM+uCWfMOLLOfVlCSVkuW4ajoPrSIIj/2F8FaXpjNNt
 7x0O0mXGIXMIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ndHAEITh
Subject: Re: [Buildroot] [PATCH 1/2] package/systemd: fix typos in comments
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-08-03 09:37 +0200, Luca Ceresoli via buildroot spake thusly:
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Both applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 0aa1da3fb80c..86b1715076a9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -661,9 +661,9 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK
>  
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
> -# systemd provides multiple units to autospawn getty as neede
> +# systemd provides multiple units to autospawn getty as needed
>  # * getty@.service to start a getty on normal TTY
> -# * sertial-getty@.service to start a getty on serial lines
> +# * serial-getty@.service to start a getty on serial lines
>  # * console-getty.service for generic /dev/console
>  # * container-getty@.service for a getty on /dev/pts/*
>  #
> @@ -671,7 +671,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # * read the console= kernel command line parameter
>  # * enable one of the above units depending on what it finds
>  #
> -# Systemd defaults to enablinb getty@tty1.service
> +# Systemd defaults to enabling getty@tty1.service
>  #
>  # What we want to do
>  # * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
> -- 
> 2.34.1
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
