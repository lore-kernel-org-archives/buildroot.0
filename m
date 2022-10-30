Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216C4ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A221E403EA;
	Sun, 30 Oct 2022 16:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A221E403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVpBkyV-8up1; Sun, 30 Oct 2022 16:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1C48403A2;
	Sun, 30 Oct 2022 16:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1C48403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53381BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89948607FE
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89948607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nZV5Mx9R3v3 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:45:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314236058B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 314236058B
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:45:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4C5D813F86F;
 Sun, 30 Oct 2022 17:45:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:45:45 +0100
Date: Sun, 30 Oct 2022 17:45:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Woody Douglass <wdouglass@carnegierobotics.com>
Message-ID: <20221030164545.GU1058960@scaer>
References: <94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667148349;
 bh=opakCcBmy+5tloRMDCOYo9lQIbj570iaWr1Ydm6QpZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGaRL2PHaI2l07RYSN/zhhnlvOI3sgbHJXfbxyzHeMFPj027AcdRDG1DSWWd2ZM+l
 HgyNsbPjS/GKHEcpMDFoV2c0jFEsGxkmeCwm1w37Dx3mYB0qAuppfiUs09Bsj0cade
 7fy54ZQnm3aqm9xAkN4bcgN3HABTNqMmimlraw37LZS4EHwisv4oosE61QzR3AMM7t
 kt0mDfg7y3UwbgubGh6xeh8FRPlNyto5cbaUcUoQ7o/5JJPTmEX9FFvhU/8jO8LrQF
 p2uK6v+HfhNssGUwFzAwOP0+9288GS0eHg1ZkaD463qJOpTfy2LA/czNwuX1ExLY0G
 M081nvaotILVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WGaRL2PH
Subject: Re: [Buildroot] [PATCH 1/1] Force cmake packages to use makefiles
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
Cc: "s.martin49@gmail.com" <s.martin49@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Woody, All,

On 2022-10-07 16:27 +0000, Woody Douglass via buildroot spake thusly:
> 
> Force cmake packages to use the "Unix Makefiles" generator
> in case CMAKE_GENERATOR is set in the host environment. This
> patch further isolates the buildroot build environment from
> the host.
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 081960b5bf..db9fdebb8d 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
>         rm -f CMakeCache.txt && \
>         PATH=$$(BR_PATH) \
>         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +               -G"Unix MakeFiles" \
>                 -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/to
> olchainfile.cmake" \

Your patch was damaged, so I had to manaully fix it when applying.
Normally, sending patches with "git send-email" takes care of properly
formatting patches.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>                 -DCMAKE_INSTALL_PREFIX="/usr" \
>                 -DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> @@ -118,6 +119,7 @@ define $(2)_CONFIGURE_CMDS
>         PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>         PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
>         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> +               -G"Unix MakeFiles" \
>                 -DCMAKE_INSTALL_SO_NO_EXE=0 \
>                 -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>                 -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> -- 
> 2.20.1
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
