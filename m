Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05882CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7BB83927;
	Sat, 16 Sep 2023 13:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE7BB83927
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSIZVTKy9Ckk; Sat, 16 Sep 2023 13:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5ED5839F9;
	Sat, 16 Sep 2023 13:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5ED5839F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3EE1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCA8640B4A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA8640B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJPB7gt3D-J1 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:10:37 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1D5540B3B
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D5540B3B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0A18D20039C;
 Sat, 16 Sep 2023 15:10:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:10:31 +0200
Date: Sat, 16 Sep 2023 15:10:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916131031.GC415981@scaer>
References: <20230916045622.1272999-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916045622.1272999-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694869836;
 bh=oR/GlIDOXS4yrbIeVg9DI2MQOdUS/oqdQ/Ft69DHuHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwsXJwfjaWrMgCnkQRcrX8fhlUbMGmcH/rTyCRsxOXpDIqm+7s1Lfzb+6KRm0PCWS
 wBuTAtxrXVEawxOEuL9kadKCipHy1LwQ4lHzh5TEJhu+H+/WDf3iaFWWW4mw9JDN84
 374ZPmbSO5G/Yx/L+hT//QfNahhMDKBF+72ycmq17Sg61Br4Bmpe/9ddkx/4hJM30T
 H7AgekwoFBItWLGE8tSxna1hLoh/0wnNVywzA+IABmEUWYe1aonL2djYeu/JryeBc6
 vy4lKtC2KSr4EcJ4bObci7mvY0CuUHmIBWWzPi/s8xC7q6GLI4zd+Y0vnfYgZ78iCW
 L+YV4Kdy/BE+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dwsXJwfj
Subject: Re: [Buildroot] [PATCH] package/python-bleak: bump to version 0.21.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2023-09-16 06:56 +0200, Marcin Niestroj spake thusly:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-bleak/python-bleak.hash | 4 ++--
>  package/python-bleak/python-bleak.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
> index aae230dac2..8462e19d39 100644
> --- a/package/python-bleak/python-bleak.hash
> +++ b/package/python-bleak/python-bleak.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/bleak/json
> -md5  97e2987748f1def21e1910a258027c17  bleak-0.20.2.tar.gz
> -sha256  6c92a47abe34e6dea8ffc5cea9457cbff6e1be966854839dbc25cddb36b79ee4  bleak-0.20.2.tar.gz
> +md5  5e27e052efc45b64da1a1f017610c561  bleak-0.21.1.tar.gz
> +sha256  ec4a1a2772fb315b992cbaa1153070c7e26968a52b0e2727035f443a1af5c18f  bleak-0.21.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
> diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
> index 9532774ae8..ed3c3f2f93 100644
> --- a/package/python-bleak/python-bleak.mk
> +++ b/package/python-bleak/python-bleak.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_BLEAK_VERSION = 0.20.2
> +PYTHON_BLEAK_VERSION = 0.21.1
>  PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
> -PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/95/a6f614fae12a6fe1cf517f8600004dd6abd4af0e0e1177c03164d0637e81
> +PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/6a/c0/3aca655fa43b8ff5340d99fac4e67061f53f42f092fc847bdd0559d67846
>  PYTHON_BLEAK_SETUP_TYPE = setuptools
>  PYTHON_BLEAK_LICENSE = MIT
>  PYTHON_BLEAK_LICENSE_FILES = LICENSE
> -- 
> 2.42.0
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
