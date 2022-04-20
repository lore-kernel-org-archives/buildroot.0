Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D804C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F198884179;
	Wed, 20 Apr 2022 20:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoV1ik1VO6Sg; Wed, 20 Apr 2022 20:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7704784107;
	Wed, 20 Apr 2022 20:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE8DB1BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCDB061162
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9_mmgrFlKpb for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:43:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDE4F6114D
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:43:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 928585FFA1;
 Wed, 20 Apr 2022 22:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650487435;
 bh=CO0fQWNgr3AKzGFTIMlZh/14G3oyPgpP/M6hU0IHn8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tyNwQGTMi1gvJyT77dBqMtg05cF0JNFkE0uuMo51mteBoqshZPKNa88aRwaUWaHNT
 7IJcf3lNaaBQMeP3HU6zLTv9cYsyqhlm8V9FZysmpI3v2QfWH+nPwUP244Sel3Vpj7
 Ca5GwpEFYMABJXinVmySPBGjxUp3b34vhXa298kQi/mE7Bh3IZyo1+mwAF2s1dKwUy
 Lkql5NB1WjqoKcBB2qIexNdGX91R3xpc1dj5i0Kb7fN3iebVk4gHHBkS32g9NBPAB7
 XLjXkzK7U1he5XfRpiELooUPfJ2l5RYoWtEgzm9Zmjv/jMsLeEfOzJfu5CsyhJ6CB5
 YJ54laGOF6Eqw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 22:43:53 +0200
Date: Wed, 20 Apr 2022 22:43:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220420204353.GH2730@scaer>
References: <20220420185656.794855-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420185656.794855-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zchunk: bump to version 1.2.2
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

James, All,

On 2022-04-20 12:56 -0600, James Hilliard spake thusly:
> Libcurl is now an optional dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zchunk/Config.in   |  1 -
>  package/zchunk/zchunk.hash |  2 +-
>  package/zchunk/zchunk.mk   | 10 ++++++++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
> index 2d2a78a210..11463dd4bd 100644
> --- a/package/zchunk/Config.in
> +++ b/package/zchunk/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_ZCHUNK
>  	bool "zchunk"
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> -	select BR2_PACKAGE_LIBCURL
>  	help
>  	  A file format designed for highly efficient deltas while
>  	  maintaining good compression.
> diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
> index d6b425dc70..fa097d4ae0 100644
> --- a/package/zchunk/zchunk.hash
> +++ b/package/zchunk/zchunk.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  33934adecddc50c64615dd8cdfe52a79df674a5bb1d5e83a9c09e1d1e6e9b92c  zchunk-1.1.16.tar.gz
> +sha256  bc36f13b1bcb2ab52d046bfc3ec04a9bd1f89b070b4e8fca52eded235a583526  zchunk-1.2.2.tar.gz
>  sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
> diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
> index 6f7ac799a0..5582c21e77 100644
> --- a/package/zchunk/zchunk.mk
> +++ b/package/zchunk/zchunk.mk
> @@ -4,15 +4,21 @@
>  #
>  ################################################################################
>  
> -ZCHUNK_VERSION = 1.1.16
> +ZCHUNK_VERSION = 1.2.2
>  ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
>  ZCHUNK_LICENSE = BSD-2-Clause
>  ZCHUNK_LICENSE_FILES = LICENSE
>  ZCHUNK_INSTALL_STAGING = YES
>  ZCHUNK_DEPENDENCIES = \
> -	libcurl \
>  	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +ZCHUNK_DEPENDENCIES += libcurl
> +ZCHUNK_CONF_OPTS += -Dwith-curl=enabled
> +else
> +ZCHUNK_CONF_OPTS += -Dwith-curl=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  ZCHUNK_DEPENDENCIES += openssl
>  ZCHUNK_CONF_OPTS += -Dwith-openssl=enabled
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
