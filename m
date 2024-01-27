Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E9C47DA9
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C02D83D81;
	Sat, 27 Jan 2024 20:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C02D83D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcxD2faiYSjG; Sat, 27 Jan 2024 20:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450CB83D70;
	Sat, 27 Jan 2024 20:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450CB83D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97D4D1BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 712E060A80
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 712E060A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nESC0wvrB17 for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:39:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84BB360A6B
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84BB360A6B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CEAD013F861;
 Sat, 27 Jan 2024 21:39:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Jan 2024 21:39:31 +0100
Date: Sat, 27 Jan 2024 21:39:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZbVqA30ytIeWoj0m@landeda>
References: <20240126113636.2371665-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240126113636.2371665-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706387973;
 bh=4uzSPjGjEsOdajDHpEW2yysgEfqGmS1r/mn9SwT+hUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQl8RnzSnYrgR5BgEWkPSztwU955/oG0Y9mgoNhBeZ8KbZYkYclG/qEf6Ju8WsV4+
 zQaMOyHMGgzsYvIE80ACcEF8uPXJB+qyAzy6azPEwTNjWyHfRBtVexj3nrE/5yy4eT
 ojERAMrZCdo/6YMINuhLq2hfz4QvcfL2lJ68kjGA80n1swBil/pedYWq7dAEkJYxq0
 LZvBqIsxQiwa2yhlkB48eVQBtRNJiE6JiYzDRu+q9HJbbrH/sAqW3qM4o7XJari2LP
 hHu9PTzD4ehxtbEgCHqVpLVLRC9Me9RzR84RwiheY/YjuFlo0mhLc5Y4Fmz7WqBpti
 18/y/cS7fercA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IQl8RnzS
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version
 1.22.9
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

On 2024-01-26 12:36 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Whole series of 12 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
> index 89cc25674e..b6ed001eb3 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.hash
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
> @@ -1,3 +1,3 @@
> -# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.8.tar.xz.sha256sum
> -sha256  ad4e3db1771139b1db17b1afa7c05db083ae0100bd4da244b71f162dcce41bfc  gstreamer-1.22.8.tar.xz
> +# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.9.tar.xz.sha256sum
> +sha256  1e7124d347e8cdc80f08ec1d370c201be513002af1102bb20e83c5279cb48ebd  gstreamer-1.22.9.tar.xz
>  sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index 88c528d4b5..5b9125e62a 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GSTREAMER1_VERSION = 1.22.8
> +GSTREAMER1_VERSION = 1.22.9
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
