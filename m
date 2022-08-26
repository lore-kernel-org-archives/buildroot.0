Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2DCECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 11:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F7D40DA0;
	Fri, 26 Aug 2022 11:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F7D40DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgKqC-3Q35q7; Fri, 26 Aug 2022 11:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D40F40D79;
	Fri, 26 Aug 2022 11:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D40F40D79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6379B1BF289
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC3C419D8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC3C419D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnclAkRahnFt for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 11:49:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F024D419D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F024D419D1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 11:49:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E17F919F732;
 Fri, 26 Aug 2022 13:49:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 13:49:20 +0200
Date: Fri, 26 Aug 2022 13:49:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220826114920.GB2569@scaer>
References: <20220826111628.501636-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826111628.501636-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661514563;
 bh=UPBQqCrpsnXjJ/fatCrlSshHWW2kE//QRru30WORxVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWQ02RGk7/B0+agYKmUZF/9qlNoYZgrKg2R17YeEz7vlOshYYUSkUcrGQxMlKo3Yl
 9Dqzb7xPJSPcLRnGxiJCNUt90gGzsWbP3bUNptesjnqQlfm9xDqi5cHGKOl4412Imy
 CD4YgxNXK/oUM2vI1TH7EIEXqpJqUp4pixIcy2Y/0BSZdANVyFnnTHLnCXVhVo1vQt
 0I8qdrGS7ZTF1L1jjYm3lcJzcSksApAXmOv4oZ9IKtMVwkxVG96Hrofo92NzxxLW+o
 BPud7LOg2nHlwnLIXCNB3ZM5+WImui+CQGaoD+Z0Tttgr29qqeQm7AczSIFSZP8Ajn
 o/C3uvobt3UMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lWQ02RGk
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.7
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

Adrian, All,

On 2022-08-26 14:16 +0300, Adrian Perez de Castro spake thusly:
> Bugfix release, with a security patch for CVE-2022-32893.
> Release notes:
> 
>  https://webkitgtk.org/2022/08/07/webkitgtk2.36.6-released.html
>  https://webkitgtk.org/2022/08/24/webkitgtk2.36.7-released.html
> 
> Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2022-0008.html
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
> index ae86c97c0a..7c6d7d65b5 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.36.5.tar.xz.sums
> -md5  a876da9d8906468f4e1e3d08729cdeec  webkitgtk-2.36.5.tar.xz
> -sha1  49ff8873500a2ce82bad8879095277bb4dfd21de  webkitgtk-2.36.5.tar.xz
> -sha256  d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908  webkitgtk-2.36.5.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.36.7.tar.xz.sums
> +md5  466351cf35e4f742590919380b5dee93  webkitgtk-2.36.7.tar.xz
> +sha1  36078148b6e0ef002f0279b25b1caf173f851ac8  webkitgtk-2.36.7.tar.xz
> +sha256  0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743  webkitgtk-2.36.7.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index b098bccd2f..014d92bb41 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.36.5
> +WEBKITGTK_VERSION = 2.36.7
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.37.2
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
