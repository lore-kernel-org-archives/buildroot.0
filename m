Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7BFC61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 20:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E30F8144F;
	Sun, 29 Jan 2023 20:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E30F8144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y4k9PkvbdNnZ; Sun, 29 Jan 2023 20:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730E481452;
	Sun, 29 Jan 2023 20:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730E481452
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4811D1BF3A9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 222BB402A8
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222BB402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSx_pb2WJJpf for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 20:40:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDED9400CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDED9400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:40:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E90095FF96;
 Sun, 29 Jan 2023 21:40:09 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 21:40:09 +0100
Date: Sun, 29 Jan 2023 21:40:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20230129204009.GT2632@scaer>
References: <20230129190720.186357-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129190720.186357-1-angelo.compagnucci@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675024813;
 bh=CvMrSeWrjM/HSlyNpwijBGtYc4/zFqyidb548dXagfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMN1SeeZmz7oVHUBcAhQeDqRDYoxU6N5spT8Ickite34OMjh5TxGTts3qiaMlYDjO
 8TcttVbTvW8Mx7nUa/vLbVQV9nsBHKkZtWXVz14/mZ8LOLqJRllnDoYb1ztbrhC/FJ
 gkEq+402Ji/bt0aMIwdUKGt4oonTK1RRGCvRLBrD6yAmrjENFCMpdqo/RpZibEBKwc
 6UX5VRD6ru472tzPa70kK5/AnSEK7bspXbpM0GxKuIaKvp0RFBoeB0h/i98GlUDG/V
 RWJD0tN4raVsZh2FNAu5tOo4fQJar+AAv7bHsTEYH5dlyc/Luzi1ws33qJO4Ot6EXA
 rTEm4rT+r3oIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lMN1SeeZ
Subject: Re: [Buildroot] [PATCH] package/apparmor: bump to version 3.1.2
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Angelo, All,

On 2023-01-29 20:07 +0100, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
> 
> Bump also the dependency library libapparmor.
> Update also the hash computing method because the hash is
> not provided anymore on the main website.

In fact, they still do, but it is in the per-release page, now:
    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2

So I've used that instead, and lo and behold, your hashes are the same
as what upstream provides. Woot-woot! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apparmor/apparmor.hash       | 4 ++--
>  package/apparmor/apparmor.mk         | 4 ++--
>  package/libapparmor/libapparmor.hash | 4 ++--
>  package/libapparmor/libapparmor.mk   | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
> index 497491b6c9..7ee5ef6275 100644
> --- a/package/apparmor/apparmor.hash
> +++ b/package/apparmor/apparmor.hash
> @@ -1,5 +1,5 @@
> -# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
> -sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
> +# locally computed
> +sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
>  
>  # locally computed
>  sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 76c9f2cafe..eeedd805e6 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  # When updating the version here, please also update the libapparmor package
> -APPARMOR_VERSION_MAJOR = 3.0
> -APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
> +APPARMOR_VERSION_MAJOR = 3.1
> +APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).2
>  APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
>  APPARMOR_DL_SUBDIR = libapparmor
>  APPARMOR_LICENSE = GPL-2.0
> diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
> index 9fbfe3b92e..147e357993 100644
> --- a/package/libapparmor/libapparmor.hash
> +++ b/package/libapparmor/libapparmor.hash
> @@ -1,5 +1,5 @@
> -# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
> -sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
> +# locally computed
> +sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
>  
>  # locally computed
>  sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
> diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
> index af59335933..7f3cfcab2f 100644
> --- a/package/libapparmor/libapparmor.mk
> +++ b/package/libapparmor/libapparmor.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  # When updating the version here, please also update the apparmor package
> -LIBAPPARMOR_VERSION_MAJOR = 3.0
> -LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
> +LIBAPPARMOR_VERSION_MAJOR = 3.1
> +LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).2
>  LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
>  LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
>  LIBAPPARMOR_LICENSE = LGPL-2.1
> -- 
> 2.34.1
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
