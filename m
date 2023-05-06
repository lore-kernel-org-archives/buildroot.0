Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E77C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E5684001;
	Sat,  6 May 2023 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E5684001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XW-rYNl3c0YO; Sat,  6 May 2023 15:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE39884007;
	Sat,  6 May 2023 15:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE39884007
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B752D1BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 913A98224A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 913A98224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LUqjsxDOJP3 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:18:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBA08400F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BBA08400F
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:18:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D001CB00585;
 Sat,  6 May 2023 17:18:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:18:04 +0200
Date: Sat, 6 May 2023 17:18:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230506151804.GC252090@scaer>
References: <20230321060120.175812-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321060120.175812-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683386289;
 bh=iDoL4l5Rq09ietGhbWugu+aDkiZhI4//RAe1FhBkblw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJM9m/mMtwO6YnAbIxYa3nju85IJQZSTYrlC21CrW0ZpmXCbmBR54DaWsFGacwI84
 8Ge8CuKG1lxbg96criZZ8EsElaFYc8btkYhVi6FRVbTAJgeJNicbSeWSfnCELtHu4n
 6OlZFTVqgRyKeVwIQOtWG8enJzWkZXtuaFS3kTMe7uJ2kUdzEp3m2Fgn0/HyMYJwux
 jTCquj7fEF3Jte0Gb4ythWqqhcJ7sFiHojtwLShmok9C+Y63IQy+vLdcu193UPE9Ih
 urVGS//XskMmmYjorSvRJUfcWs4/qkdAjXijO7qlhNzusT26hiOm22OtGLMiAW0DR7
 WSbEGSTj/kh6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EJM9m/mM
Subject: Re: [Buildroot] [PATCH] package/atkmm: bump to version 2.36.2
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-03-21 07:01 +0100, Daniel Lang spake thusly:
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/atkmm/atkmm.hash | 4 ++--
>  package/atkmm/atkmm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
> index 9e2bb2830c..08cf86b3df 100644
> --- a/package/atkmm/atkmm.hash
> +++ b/package/atkmm/atkmm.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
> -sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
> +# From https://download.gnome.org/sources/atkmm/2.36/atkmm-2.36.2.sha256sum
> +sha256  6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079  atkmm-2.36.2.tar.xz
>  # locally computed
>  sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
> index 7ceb87b047..8afd058643 100644
> --- a/package/atkmm/atkmm.mk
> +++ b/package/atkmm/atkmm.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ATKMM_VERSION_MAJOR = 2.36
> -ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
> +ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
>  ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
>  ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
>  ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
> -- 
> 2.40.0
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
