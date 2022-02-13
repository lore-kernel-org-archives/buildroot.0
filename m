Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2327EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B922E817B5;
	Sun, 13 Feb 2022 15:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZyBr_TYZNik; Sun, 13 Feb 2022 15:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F121381777;
	Sun, 13 Feb 2022 15:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8C61BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E8540159
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty88o4Hc4JOO for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:01:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AC9940116
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:01:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F83D13F86A;
 Sun, 13 Feb 2022 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644764483;
 bh=h8ebQypioqXovENqc+PPFNf7ovvU1h0z6WaeUSs5h58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sT52YqJreNakSLjDDKqYRQckSO6xddEX/9E5FlNTB1+f8Obo2msoZ9vWZu9lmT1Rw
 MAYV42bn5/N/mog3Kc0Q/QjVrN2O/HnIstTMVnlYNCz+B+l98dCb1NPdPVfE+IhGz7
 Cn/NobeswKsl8aQXtl2/sQtiTFSOLnEjolvvQyUCnU8AJY7paB5ST50YFb+RCk4Hkv
 t+dKWzShm7y2xp1nNLhLv2wdoIMd9VPXjaHpBmxBt9aYGObV0cWYISEuR6iwVkShwE
 OUQT+D4x8zFPMyasydho4VcMb3gSQ6083WWgYKkC3a+/LHtmlaahRi1U9zV4oLSl09
 XP2u4WxyVOR8Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Feb 2022 16:01:13 +0100
Date: Sun, 13 Feb 2022 16:01:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220213150113.GC4462@scaer>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220205201837.3324085-3-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v6 3/8] package/icu: don't disable renaming
 for host build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> Using a different renaming option for the icu host build can cause
> issues for packages such as qt5webengine which expect target and
> host packages to be built with the same options.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I forgot to add:

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/icu/icu.mk       | 3 +--
>  package/nodejs/nodejs.mk | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/icu/icu.mk b/package/icu/icu.mk
> index 7e0c96e43a..ebbb1968fc 100644
> --- a/package/icu/icu.mk
> +++ b/package/icu/icu.mk
> @@ -45,8 +45,7 @@ HOST_ICU_CONF_OPTS = \
>  	--disable-tests \
>  	--disable-extras \
>  	--disable-icuio \
> -	--disable-layout \
> -	--disable-renaming
> +	--disable-layout
>  ICU_SUBDIR = source
>  HOST_ICU_SUBDIR = source
>  
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 727af6dc50..2e41c11dbd 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -94,7 +94,7 @@ NODEJS_HOST_TOOLS_V8 = \
>  NODEJS_HOST_TOOLS_NODE = mkcodecache
>  NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
>  
> -HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
> +HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS)
>  
>  define HOST_NODEJS_BUILD_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
> -- 
> 2.25.1
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
