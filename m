Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEC2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB0A60B30;
	Thu, 12 May 2022 19:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOzFLifh9Ump; Thu, 12 May 2022 19:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E0360B22;
	Thu, 12 May 2022 19:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2521BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BB07416D5
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sct4Wd9V-9NX for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3B98416EE
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1D45719F58A;
 Thu, 12 May 2022 21:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652385071;
 bh=VPSTdr5Zg9x+41UdT8yFWfiIZDpejEn5zgOtgbJYu5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vHEnmCgFBZFUB+9wfG/w36EJIBkzbwwguTk9hcjah02SMSnTqZctMYEa/3kOpSVt0
 wlCYsd3qkPBHEGu1CgMzNi6pAStDwAs/uj62zb9k9aBTYHD3ou5DWBr8aAhPO3CMRX
 U2lTWwYAe24syDtv/TVWLG7rrageqhikc5e0ExRrTXgHhRJTIf49DhjZbYPA1LPvbm
 y0MxAnN2slWp6K0osGNweo5cFzvsq+vDeYffVSEpM3gU/hFInBstaMdUWRmWyCvBKl
 kARgwted7LlEPE3p8zjWW9pL4WI7jlRhq/CBH5hbXRTZ48LxcNI3OdkKH363wD8NsK
 5+J5GB9RbZxfQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 21:51:08 +0200
Date: Thu, 12 May 2022 21:51:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512195108.GC1597494@scaer>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 01/25] package/x11r7/xlib_libXvMC: bump
 version to 1.0.13
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

Bern, All,

Series of 25 patches applied to master, thanks.

I replied specifically to the xsm patch, please have a look at it.

Regards,
Yann E. MORIN.

On 2022-05-12 20:53 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2022-March/003132.html
> 
> Removed md5 and sha1 hashes, not provided by upstream anymore.
> Reformatted license hash.
> Switched tarball to upstream-provided .xz format.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 11 ++++-------
>  package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   |  4 ++--
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
> index be4ba751aa..15221969e3 100644
> --- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
> +++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
> @@ -1,8 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2019-September/003023.html
> -md5 3569ff7f3e26864d986d6a21147eaa58  libXvMC-1.0.12.tar.bz2
> -sha1 4871f92a83faa86aff5c630a2d6016c67bf11b97  libXvMC-1.0.12.tar.bz2
> -sha256 6b3da7977b3f7eaf4f0ac6470ab1e562298d82c4e79077765787963ab7966dcd  libXvMC-1.0.12.tar.bz2
> -sha512 62cb9a72b20af3b081d2d555a253b0e2b8b26b31f4fad10bd3e53bbf96e1663b61bd8df2b78b16f18218cd37cce0c9e6809ae16ded226b37a8b199e41b223955  libXvMC-1.0.12.tar.bz2
> -
> +# From https://lists.x.org/archives/xorg-announce/2022-March/003132.html
> +sha256  0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c  libXvMC-1.0.13.tar.xz
> +sha512  c9d0f73884a586efb9ea4f77fc8555f60d940077d7dff8eaa765b86345c8b4e3d80b860f68191d2830c272b9e464c08450fbb51bb64819753a6f4228c71861ac  libXvMC-1.0.13.tar.xz
>  # Locally computed
> -sha256 b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
> +sha256  b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
> diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
> index 7980f17493..c1fe31277e 100644
> --- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
> +++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -XLIB_LIBXVMC_VERSION = 1.0.12
> -XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
> +XLIB_LIBXVMC_VERSION = 1.0.13
> +XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.xz
>  XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBXVMC_LICENSE = MIT
>  XLIB_LIBXVMC_LICENSE_FILES = COPYING
> -- 
> 2.30.2
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
