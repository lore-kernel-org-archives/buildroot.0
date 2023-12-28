Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F94C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC38F4179E;
	Thu, 28 Dec 2023 20:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC38F4179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US2DrAudqmcp; Thu, 28 Dec 2023 20:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0320F4179A;
	Thu, 28 Dec 2023 20:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0320F4179A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15BAF1BF84C
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E05E540A76
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E05E540A76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoN20mHYdb4g for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:16:55 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 520FE402F2
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520FE402F2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 266EAB0053E;
 Thu, 28 Dec 2023 21:16:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 21:16:49 +0100
Date: Thu, 28 Dec 2023 21:16:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZY3XsVK9oklEwDwJ@landeda>
References: <20231227202344.599971-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227202344.599971-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703794612;
 bh=KAHWnr5Z/TIFRBu2XY3u3oje7pa5zE+zhu5Lx6x3yPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=molM1mxX4YovdUENUafjX3P39bVhlmt7nrB4V1d1+ERfmvOyRTQ8d2YXWN3O/mzXo
 nq2EP8NUG7Ys1yVCQP1/lIJM5LvPTKknFPNwLeBni6V0UFLPw/GELHr8xdpoLnqMUT
 9ZFcXrNxYHSFdeKe6WjPHvHc5jvP86RkjDNqazkZvGeKM5IIESOvI/KVSSu4xpVmDL
 zqsHxl1nRzYKLEUlUhqzy19HD041TvniLHY+zAzY+rt3cWGog3C2baknXmAuP0kjKi
 H45ebcx5Z8120D/r1fgdZhAK02nJT4dVHP9Y5sLKNe9CKvXERMkKzGBt8qfSgTgD3S
 JJGU/A5/NzoBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=molM1mxX
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version
 1.22.8
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

On 2023-12-27 21:23 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series of 12 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
> index 7d62d05fec..89cc25674e 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.7.tar.xz.sha256sum
> -sha256  01e42c6352a06bdfa4456e64b06ab7d98c5c487a25557c761554631cbda64217  gstreamer-1.22.7.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.8.tar.xz.sha256sum
> +sha256  ad4e3db1771139b1db17b1afa7c05db083ae0100bd4da244b71f162dcce41bfc  gstreamer-1.22.8.tar.xz
>  sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 9ee41392b2..88c528d4b5 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GSTREAMER1_VERSION = 1.22.7
> +GSTREAMER1_VERSION = 1.22.8
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
