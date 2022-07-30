Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65E7C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A67640586;
	Sat, 30 Jul 2022 12:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A67640586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zefzFwjNG45f; Sat, 30 Jul 2022 12:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33B4A40145;
	Sat, 30 Jul 2022 12:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B4A40145
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D81781BF391
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC18B61164
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC18B61164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izwMG4-QiSm3 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2006105B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA2006105B
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:11:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E46F660137;
 Sat, 30 Jul 2022 14:11:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 14:11:03 +0200
Date: Sat, 30 Jul 2022 14:11:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220730121103.GR3168@scaer>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
 <20220727184850.2857314-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727184850.2857314-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659183070;
 bh=vsESsSAVuJ2JI4d16lmYbucS6VrWJYK80OfApMN2eEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLjKGpGTv02CDQXf2W63yUXyReolM63/7YY+ilhBCrbK4bfMReNh6AkNOlMKDSQ6T
 +4pDfHV+xRJLpqBqfO3Q5utu36tOPTeAvsMyfj0xCFrcqbkN1hUh8GNkcOPptTQMdv
 py8yzdTvEp2J3xW3N+M74XrQ4XPKGlng/Q2ns9mOOsTxPvqTPzkjCCACFxwPlBss7O
 7FAPg4Py8PgRu22rulRTN9vDjRaqkDQR+9bmZOIUVpgwL8bwc7mDb6tBEVDt3KkJVy
 POpoUIk3ycAoFsKs8CQFY3PO3BhY8Zbbp+kHO9467Tc8AjgL8NM0vsZ7lFd7h58eH3
 OxN7x699Z/aPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rLjKGpGT
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/toolchain-wrapper: don't
 hardcode CCACHE_BASEDIR
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 20:48 +0200, Thomas Petazzoni via buildroot spake thusly:
> The CCACHE_BASEDIR variable was hardcoded to $(BASE_DIR), and
> therefore when moving around the toolchain-wrapper as part of the SDK,
> the CCACHE_BASEDIR would still point to the original location of the
> Buildroot build.
> 
> Instead of doing this, leverage the logic we already have in the
> toolchain wrapper, which determines based on the toolchain wrapper
> location itself what is the base directory.
> 
> So now, toolchain-wrapper.mk is only passing a boolean to
> toolchain-wrapper.c, that tells whether the BR2_USE_CCACHE_BASEDIR
> option is enabled or not.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  toolchain/toolchain-wrapper.c  | 6 +++---
>  toolchain/toolchain-wrapper.mk | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 37b24dd24a..bed90d6292 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -538,9 +538,9 @@ int main(int argc, char **argv)
>  		return 3;
>  	}
>  #endif
> -#ifdef BR_CCACHE_BASEDIR
> -	/* Allow compilercheck to be overridden through the environment */
> -	if (setenv("CCACHE_BASEDIR", BR_CCACHE_BASEDIR, 0)) {
> +#ifdef BR_USE_CCACHE_BASEDIR
> +	/* Allow basedir to be overridden through the environment */
> +	if (setenv("CCACHE_BASEDIR", absbasedir, 0)) {

You forgot the one instance in the debug code, lines 524 and 525.

And once this is fixed, you'll notice that the old and the new
CCACHE_BASEDIR will be different:

    (before)$ BR2_DEBUG_WRAPPER=2 ./host/bin/arm-linux-gcc --help
    ...
    Toolchain wrapper executing:
        CCACHE_BASEDIR='/home/ymorin/dev/buildroot/O/master'
        '/home/ymorin/dev/buildroot/O/master/host/opt/ext-toolchain/bin/arm-linux-gcc.br_real'
        ...

    (after)$ BR2_DEBUG_WRAPPER=2 ./host/bin/arm-linux-gcc --help
    ...
    Toolchain wrapper executing:
        CCACHE_BASEDIR='/home/ymorin/dev/buildroot/O/master/host'
        '/home/ymorin/dev/buildroot/O/master/host/opt/ext-toolchain/bin/arm-linux-gcc.br_real'
        ...

So as you can see, before, CCACHE_BASEDIR was pointing to BASE_DIR, but
now it points to HOST_DIR. This is one-level too deep, as it will not
match the path where packages are actually built, which is
BASE_DIR/build, and hapenned to be CCACHE_BASEDIR/build.

Even though I had the debug code path fixed, the second issue was not
trivial enough for me to fix when applying, so I amrked the patch as
changes requested.

Regards,
Yann E. MORIN.

>  		perror(__FILE__ ": Failed to set CCACHE_BASEDIR");
>  		return 3;
>  	}
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index cbf46f15fa..c87120f0f7 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -70,7 +70,7 @@ endif
>  endif
>  
>  ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_USE_CCACHE_BASEDIR
>  endif
>  
>  ifeq ($(BR2_PIC_PIE),y)
> -- 
> 2.37.1
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
