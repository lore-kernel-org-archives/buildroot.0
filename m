Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D5C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CFBA41D2E;
	Mon,  8 May 2023 20:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CFBA41D2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCHustYgoN8L; Mon,  8 May 2023 20:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8DA841D30;
	Mon,  8 May 2023 20:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DA841D30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FB251BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55A546FF86
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A546FF86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a__tUoDxlu9V for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7446B6FF83
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7446B6FF83
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:07:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 70A7D2003A4;
 Mon,  8 May 2023 22:07:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:07:35 +0200
Date: Mon, 8 May 2023 22:07:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230508200735.GJ252090@scaer>
References: <20230430183533.2488112-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230430183533.2488112-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683576457;
 bh=tRUWu0PorpuDfVuXR8ri8ZF0xzsO89NLrzvLXG8vnxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjApw7ZLAc4f5QNjXrR9PNVjFP40IPzQgNdsxE1KFosgr7ezn5eXzxC9qv2NE9RXm
 gxfPJjyNeqULxJdw3nNNDM8zraIGyqqveh/2cTwImrFSM9TSpReUu+PSV7q97baB7j
 Lgc8jltYR24cClusI0OqM6SSrRN4KLlDIOu8IUe0J09M4IS46Tf4888cm+afBiSppS
 wgd97018/U/Ai4ac227SPS2z2lyJFy1iL4d8XuPbtxI1CWUU8RCwksQhFczCJUiBBX
 DBhG5XMufu2dlKnQBxQnIZDEzWQ0rSw6XWH2kjB9m9BrHz5mX9RRI63XoBwsKai+Ar
 hndDf+O16Bqyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EjApw7ZL
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.5.0
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

Joachim, All,

On 2023-04-30 20:35 +0200, Joachim Wiberg spake thusly:
>  - Add support for -c and -cc to disable log compression
>    A single -c disables compression for pipes, another -c (or -cc)
>    disables compression for all other log targets
>  - The default syslog.conf now logs debug messages again (disabled in
>    v2.4.0) due to problems (confusion) reported in the field
>  - Dropped not recommended KillMode=process from systemd unit file
>  - Fix loss of early log messages running under systemd
> 
> Full changelog: https://github.com/troglobit/sysklogd/releases/tag/v2.5.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index e370716bd9..30ce6d9c0b 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,5 +1,5 @@
>  # Upstream .sha256 from GitHub
> -sha256  01f25931d1508c3e6be4e182f49356c993abc7d035d5835db35f9b61d5085549  sysklogd-2.4.4.tar.gz
> +sha256  e1d635944e5a6062c8ea18b9506668ebdaefacea1965147f60cf3fb3a25770e8  sysklogd-2.5.0.tar.gz
>  
>  # Locally calculated
>  sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index 68023c9ae2..ebc9f89cf7 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSKLOGD_VERSION = 2.4.4
> +SYSKLOGD_VERSION = 2.5.0
>  SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
>  SYSKLOGD_LICENSE = BSD-3-Clause
>  SYSKLOGD_LICENSE_FILES = LICENSE
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
