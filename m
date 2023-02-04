Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D43C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 11:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3840E813CA;
	Sat,  4 Feb 2023 11:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3840E813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erTX1qR-EpLR; Sat,  4 Feb 2023 11:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DDE81330;
	Sat,  4 Feb 2023 11:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65DDE81330
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A35691BF42C
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D53D81330
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D53D81330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YedXQkU9o4Uu for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 11:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C068132D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16C068132D
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 11:49:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f055:ed24:459b:7ee:752f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B9DABB0057F;
 Sat,  4 Feb 2023 12:49:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 12:49:00 +0100
Date: Sat, 4 Feb 2023 12:49:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20230204114900.GA14083@scaer>
References: <20230203212417.874198-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203212417.874198-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675511343;
 bh=XEC+4lxqYedmztTF4qIeFWcfXqu2hLUjLvizYfcVdZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANOYqX2kdRQhOjYx2UiRF1IVBPLRuohi/uKFteLV0TbGxP/QnF8ZkqHfK7cwhpMSO
 WmixMZYeaJ4VlFUr97L0JmBLA6Kl8uCbEEfO57SSPGyMuCMKhmjzBip5MrpYtd5p1l
 /hMZu1PCTTCtnolqi8uLjVa5tb3vMyjZ5PYEIGBWyQdsgR8+D3p/vRh0QRzFvZD2WA
 O/fCoCmu/7phOk4rq4i2XGN75N2BFG0vdHT+TR1sGbrXExfxIbatq4OQtZMTPUV5IA
 ksT6cEUoDsXJbRlxph1bkw9u4PVZYGYclJDZqF6xcASwB3v+7jo2ynSjl81J+o75AA
 sj5GSGwC9cN5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ANOYqX2k
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.38.4
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

Adrian, All

On 2023-02-03 23:24 +0200, Adrian Perez de Castro spake thusly:
> Bugfix release, with many security fixes, including (but not limited to)
> patches for CVE-2023-23517, CVE-2023-23518, and CVE-2022-42826.
> 
> Release notes:
> 
>   https://webkitgtk.org/2023/02/02/webkitgtk2.38.4-released.html
> 
> Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2023-0001.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index eff7f5c18f..34fd19d3de 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.38.3.tar.xz.sums
> -md5  1c1cc5eb59273091e228406937b23947  webkitgtk-2.38.3.tar.xz
> -sha1  04cb5923d8ac6f435424b74115c3219ec597e9ad  webkitgtk-2.38.3.tar.xz
> -sha256  41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a  webkitgtk-2.38.3.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.38.4.tar.xz.sums
> +md5  1c9ca83a0ad7e4ca9e933094572cb7d9  webkitgtk-2.38.4.tar.xz
> +sha1  38b47df2be9bfb97d68fce8c7fa2819966a79036  webkitgtk-2.38.4.tar.xz
> +sha256  4f47ea29a2d4d5f15eef3dc9e2d6c6f067e8de863a3f64455e1ccf9693cc1d36  webkitgtk-2.38.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index b1bca7b88a..b42ac3b644 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.38.3
> +WEBKITGTK_VERSION = 2.38.4
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.39.1
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
