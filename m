Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145CAC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E2D6FA9A;
	Sat,  9 Dec 2023 20:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E2D6FA9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enHrIVa13QA8; Sat,  9 Dec 2023 20:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEF46FAD0;
	Sat,  9 Dec 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEF46FAD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0D071BF267
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9AF56FABC
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AF56FABC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-cit_X7hKh5 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 20:09:54 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 585C16FAB5
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 20:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585C16FAB5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AE74E13F8B3;
 Sat,  9 Dec 2023 21:09:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 21:09:48 +0100
Date: Sat, 9 Dec 2023 21:09:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZXTJjGzVXqSNyOPu@landeda>
References: <20231209183501.207637-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231209183501.207637-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702152590;
 bh=okoel2tNH2aKNIVn7Z1anxXBJxMPTp+Dfs34irXy0Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ia3OOkEXugc9ugH54LH26+TYYlddbiGuvg+LKC5zZiX+gey/U5pYL795L/fvj1vjQ
 hYcmqxaRZAZOwvnCxLzBZ9fsj+rRL6voTGmGsPKVryNzbNo9oipTbcZWitSY39YZ93
 Ua46pLj4/O6i7QFFV4S228F7qex+HtsWJScTZrHz8Yv/lbkcoXoBw2AVAW/YBmzrk8
 uen5XDK/ARlXBAssMuRXB+iYqdqjglbKeEk4chv6xbmdb/NuHsrbip0p8R8/jgQvK8
 b65iNOSNRwFYsa16Vddu2oxflHyAVzpTzVvtjgrsM4Jt4evSokujkhw+QtT7dpq5Zl
 LCmW7FlaRxe9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ia3OOkEX
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version
 1.22.7
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

Peter, All,

On 2023-12-09 19:34 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series of 12 applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
> index 65045c1c30..7d62d05fec 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.6.tar.xz.sha256sum
> -sha256  f500e6cfddff55908f937711fc26a0840de28a1e9ec49621c0b6f1adbd8f818e  gstreamer-1.22.6.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.7.tar.xz.sha256sum
> +sha256  01e42c6352a06bdfa4456e64b06ab7d98c5c487a25557c761554631cbda64217  gstreamer-1.22.7.tar.xz
>  sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 352567ed52..9ee41392b2 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GSTREAMER1_VERSION = 1.22.6
> +GSTREAMER1_VERSION = 1.22.7
>  GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
>  GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
>  GSTREAMER1_INSTALL_STAGING = YES
> -- 
> 2.39.2
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
