Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D111C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB26B404EB;
	Sat, 16 Jul 2022 15:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB26B404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxqXXbi9g1XP; Sat, 16 Jul 2022 15:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFB240476;
	Sat, 16 Jul 2022 15:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFB240476
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2473B1BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27D540476
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27D540476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdqzhGwp8PDd for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:41:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D34400FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9D34400FB
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:41:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 239B2B00720;
 Sat, 16 Jul 2022 17:41:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:41:47 +0200
Date: Sat, 16 Jul 2022 17:41:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716154147.GJ2543@scaer>
References: <20220613211419.296864-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613211419.296864-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657986112;
 bh=1dTJEZy2SaB0Qg6hFZKKxALLQLTe9ac0KokzVT9Sals=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rk3f1PenwKGXixJ+bUD2F359opcYYUTCOAaQaclG5RQ2pO2QKtTnmXA73BudA7S8Z
 cZWe6Jd4u66J0j5vrM7rHV8AsPrYDQNbQpflWeegVUAqQp/YnZNGjxAwDzB5dY7V5G
 NNBw651cRGPATp8HQjUtUqdK9WQgTwt0pzXSS7NWpT4ZdnxYgNZ+BrMeK5iUeZ6d3K
 ZyuOVwgEPpLQJ9/KDE0qsbqQWaWTyOkb4V5W6kA6C1GrY9xdZqI6IiEv8dNU92zB2R
 N9MgXHbfrOn4zY4cGu4B9ia2OujFBnIN7ak1MMfZ5U+oYsOd3nP9UMP64n6iS+0arl
 tJbakSvDr/LvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rk3f1Pen
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: security bump to
 version 9.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-13 23:14 +0200, Fabrice Fontaine spake thusly:
> This release addresses several security problems including
> CVE-2022-30595.
> 
> https://github.com/python-pillow/Pillow/releases/tag/9.1.1

Thanks for the reference, but Peter applied a later patch.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pillow/python-pillow.hash | 4 ++--
>  package/python-pillow/python-pillow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 2e259c1caf..ff23ed6299 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
> -sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
> +md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
> +sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
>  
>  # Locally computed sha256 checksums
>  sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 2abe5e04ef..8c9cb86863 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_PILLOW_VERSION = 9.1.0
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
> +PYTHON_PILLOW_VERSION = 9.1.1
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
>  PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  PYTHON_PILLOW_LICENSE = HPND
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
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
