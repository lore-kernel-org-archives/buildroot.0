Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD049C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA4341635;
	Thu, 12 May 2022 19:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWnVMvdpjJQF; Thu, 12 May 2022 19:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA652409EA;
	Thu, 12 May 2022 19:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 505DA1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EC03409EA
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMF9oTlAHarI for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:48:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1FE9409E3
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:48:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AA50C19F5A5;
 Thu, 12 May 2022 21:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652384907;
 bh=yAMrg0cURZL8Mb7w4+Nd8QZWH5icl/St6F9IUhirXOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2hO12KDQ3LhjBJ/8nNY3brIPohOK4nFU3K+VCwzJ1/Pa0mHhfuakDjVp0MBE0i+0
 f/Todx9glEYyEUahABW32pe0acEFjM+XON4pR9VBgmKil6W6GcmblP/qDUc173hLMX
 lVY7ok4ea9uNaDIvo6B3D9rB/uoOCw2xNrezxchQLu79gsUXNQGsPUcnwR+6TDYMCw
 KBE89Zvame6Ly//63/EYe3+091X7W5rB4qWk2m7Sa6HeD8U/oRwUIWUyPggth1+Tx9
 +Sxr5pCb00U2IO7jzfwrhIh4MlfcN5ATnN6r8rFwJgRWZEehnfZGMmMgfEdhrziYJB
 rvYRBaLIzedAA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 21:48:21 +0200
Date: Thu, 12 May 2022 21:48:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220512194821.GB1597494@scaer>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
 <20220512185355.873825-17-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512185355.873825-17-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 17/25] package/x11r7/xapp_xsm: bump version
 to 1.0.5
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

+Arnout +Peter +Luca

On 2022-05-12 20:53 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2022-April/003152.html
> 
> Updated license hash due to upstream commit:
> https://gitlab.freedesktop.org/xorg/app/xsm/-/commit/e552f2d4980d41d7a219dbe0c5dbaf33c4d752f3

I was a bit surprised that the new licensing terms are not really those
of the MIT license, so I checked, and that's what SPDX knows as the MIT
license:
    https://spdx.org/licenses/MIT.html

However, the license for the xsm is not exactly those terms, but is
known by SPDX as MIT-open-group (MIT Open Group variant):
    https://spdx.org/licenses/MIT-open-group.html

So I had a quick look at a few other xapps, and they all use that same
license.

Wikipedia still lists it as MIT:
    https://en.wikipedia.org/wiki/X.Org_Server

And the Xorg website also insists it is MIT:
    https://www.x.org/wiki/

So, I am not sure. I would tend to think we should switch listing them
as MIT-open-group.

Thoughts?

Regards,
Yann E. MORIN.

> Removed md5 and sha1 hashes, not provided by upstream anymore.
> Reformatted license hash.
> Switched tarball to upstream-provided .xz format.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_xsm/xapp_xsm.hash | 10 ++++------
>  package/x11r7/xapp_xsm/xapp_xsm.mk   |  4 ++--
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xsm/xapp_xsm.hash b/package/x11r7/xapp_xsm/xapp_xsm.hash
> index eda231fe93..9568836bbc 100644
> --- a/package/x11r7/xapp_xsm/xapp_xsm.hash
> +++ b/package/x11r7/xapp_xsm/xapp_xsm.hash
> @@ -1,7 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2018-March/002875.html
> -md5 bd32c14f09d58f46084b6a8f20e6e8f1  xsm-1.0.4.tar.bz2
> -sha1 dd41234e276fe8b2d0a853879568f73b6d98812a  xsm-1.0.4.tar.bz2
> -sha256 9934b6893a4e52cf7435368fc8d425c371b5e32d96e420ead30166eb82d64425  xsm-1.0.4.tar.bz2
> -sha512 d4e4da7c309a4eae126d2b58a13684f4dbc06b09f76dde9c89c707375df2843614f3d83bc44f9cd02f239200db3397abd86796dca0dbafc69f60482b0af5a176  xsm-1.0.4.tar.bz2
> +# From https://lists.x.org/archives/xorg-announce/2022-April/003152.html
> +sha256  9c30fdaa3fc132e4ff201cfc478669056e6e15502e77df88df11fb94e4e6fb2d  xsm-1.0.5.tar.xz
> +sha512  df3777b3aab813ec8aa906f5a03f93b8ca645978970290cf7baf732e175c36c00ae19baeb45ea7404d35838c21e6f8fca28f0da3e2f398d17adac5f2acb7b351  xsm-1.0.5.tar.xz
>  # Locally computed
> -sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff COPYING
> +sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING
> diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
> index 6d752b4d15..1c73f5c65c 100644
> --- a/package/x11r7/xapp_xsm/xapp_xsm.mk
> +++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -XAPP_XSM_VERSION = 1.0.4
> -XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
> +XAPP_XSM_VERSION = 1.0.5
> +XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.xz
>  XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
>  XAPP_XSM_LICENSE = MIT
>  XAPP_XSM_LICENSE_FILES = COPYING
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
