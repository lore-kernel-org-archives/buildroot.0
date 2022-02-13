Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A164FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7C04033B;
	Sun, 13 Feb 2022 15:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4aOQjBaf3yP; Sun, 13 Feb 2022 15:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66CD5402FD;
	Sun, 13 Feb 2022 15:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53EBC1BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 501BA402FD
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmbcn2Vbg13K for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BD5C402A8
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:01:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8910:5bc5:ca35:1c76])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 918DF13F80A;
 Sun, 13 Feb 2022 16:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644764461;
 bh=WCuTeET2ddEYgZ6yQ+N+LIWPGFZaU+cWVr5ucZicc5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=psMbzoEAcMDp6lZDrtAUrEv09VJk7nJKwUHfhOINGy7N4dfPWiaCxjuIDVzyTjH8T
 zoJT6c8SfPthmaeK/v4V+Ldu667ED7vsAMd+LTipcFq88zNdXxGcU3BvvOQz4n5lyD
 Bn9m7xMXpr5Z6f5o3pnHDzVxWTyb7ETb96cMNwBYhDmei5ki0NYozv7DOe5R4vEO0+
 8igAT8bZzJKh8J5GtwFYZ6NduJL2jArLtc+jsyzyO4hmA+uiBClq3pvcbK8BBPgP9Y
 S15c2bfmQbWVMblfoGL+BTuyEzVxdXz2WwhYlEFkVoXX9UbnwvQKomAutnQst87hmL
 1BlUIEhRucCJQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Feb 2022 16:00:51 +0100
Date: Sun, 13 Feb 2022 16:00:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220213150051.GB4462@scaer>
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

James, All,

On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
> Using a different renaming option for the icu host build can cause
> issues for packages such as qt5webengine which expect target and
> host packages to be built with the same options.

This little hand-waving is not explaning the actual error that those
packages encounter, nor the root cause for that error.

A package that needs both host and target to have the same options is
most probably doing somethig wrong, like linking a host program and
taking the result as valid for the target...

However, our adding the --disable-renaming in the first place in
3911e67151b (icu: security bump to version 51.2) did not provide any
explanations why it was needed to begin with.

So it is not much uglier to remove it without further explanations
either.

Yet, a reference to the original commit would be nice, like the little
blurb I wrote above maybe...

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
