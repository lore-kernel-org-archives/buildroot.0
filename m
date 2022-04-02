Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A4360D70;
	Sat,  2 Apr 2022 17:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-qwFXajtk5v; Sat,  2 Apr 2022 17:30:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986E660BBC;
	Sat,  2 Apr 2022 17:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 298881BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192AF84066
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRFmIZJKRpve for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:30:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E57184065
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:30:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bcfa:8d59:a850:4621])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7ACB978034E;
 Sat,  2 Apr 2022 19:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648920633;
 bh=OZ4292kqmIPJ9Pn43QS4V/ra+HM56uxLBc9iWkLhBgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UjqaSVoUWWIn2bOnZ88oany1+GeWPueU5lnMBixPFCYVkLQw/Lk+Id/a76EZ+fJs0
 EqiN5Mrhq4402aEZEMMDa5wW3XMu2GC3pvmoqvzNgsoUE6yZAPrpHbaEDIA9FdqlP7
 KiW2PA9sqPvFdfn7HXq5c2DyP7kMFA1TE/+G1WdKhDYZIFJpulCojThDzlt3KXKEg5
 Ie6XEnai2Kqym6Gs/o+XLgGwSmYmmD+PiPp0vrW6rgWPLwPqIauuaoy7C6AU0cpBAV
 +8BEVRZTGCv4jO3zTJQPmXwzIRCQ/c89w3CITx3VLxpw2oyYusXGOumQBFW1bVhU0o
 KqYXD6MWLeA/w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Apr 2022 19:30:30 +0200
Date: Sat, 2 Apr 2022 19:30:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220402173030.GD1811301@scaer>
References: <20220401180520.15772-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401180520.15772-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/4] package/apr: change download url
 from http to https
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-04-01 20:05 +0200, Peter Seiderer spake thusly:
> - change download url from http to https

A commit log that jsut repeats the commit title is useless, so I dropped
it.

I also squashed together commits refering to the same package.

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/apr/apr.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index c45829aacc..7ff2c007b4 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -6,7 +6,7 @@
>  
>  APR_VERSION = 1.7.0
>  APR_SOURCE = apr-$(APR_VERSION).tar.bz2
> -APR_SITE = http://archive.apache.org/dist/apr
> +APR_SITE = https://archive.apache.org/dist/apr
>  APR_LICENSE = Apache-2.0
>  APR_LICENSE_FILES = LICENSE
>  APR_CPE_ID_VENDOR = apache
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
