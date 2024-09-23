Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3ECF9C71
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9282481D67;
	Mon, 23 Sep 2024 19:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qKs5zJy6_BT; Mon, 23 Sep 2024 19:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BD1180F5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BD1180F5C;
	Mon, 23 Sep 2024 19:49:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68171BF307
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB81780F5C
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5BvkV34j71g for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:48:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3CE680DAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3CE680DAB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3CE680DAB
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:48:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E66645FF3F;
 Mon, 23 Sep 2024 21:48:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 21:48:54 +0200
Date: Mon, 23 Sep 2024 21:48:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <ZvHGJv5KM7q5j0hx@landeda>
References: <20240922205744.3811678-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922205744.3811678-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727120937;
 bh=Z8zd6BUuEo1axvMd4QpueXH8/VJUrJLDb6ce0KT3VKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aDyOP0j/rKF5ka5YhEUvmiO1yQq0XcUEAlIAaxssbqwKM6UzDGvSjRDM/04n186L9
 1t/N0K50Xa17Bc9IzFpZl9pJwotmIuD4VunIPe9lIJqg3WIz/wLxBgAloGnMgo58cX
 SOD0viuRvSiiCDmRoVVrXQwkchDPb4PWEStmpsTcTAeKlGm9CI/9dotdxb3T0HZuNB
 Br+35In9fLJMPLI6n9gB2dsSeGHTdv+4chEpSrts+JaMpZz9gALnnpLdJYo64+8Qrt
 fl3605HQHKRUkx5B+xT0LzWYnbIaCVzl72hWkhwZXYidoOB9rQLTXUwknLCGc09eeH
 U+8gGmQ440x7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aDyOP0j/
Subject: Re: [Buildroot] [PATCH 1/1] package/libpcap: bump version to 1.10.5
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

Akhilesh Nema, All,

On 2024-09-22 13:57 -0700, Akhilesh Nema spake thusly:
> Changelog: https://github.com/the-tcpdump-group/libpcap/blob/bbcbc9174df3298a854daee2b3e666a4b6e5383a/CHANGES
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpcap/libpcap.hash | 4 ++--
>  package/libpcap/libpcap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
> index 34339c1261..7f53b99b8c 100644
> --- a/package/libpcap/libpcap.hash
> +++ b/package/libpcap/libpcap.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz.sig
> -sha256  ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f  libpcap-1.10.4.tar.gz
> +# https://www.tcpdump.org/release/libpcap-1.10.5.tar.gz.sig
> +sha256  37ced90a19a302a7f32e458224a00c365c117905c2cd35ac544b6880a81488f0  libpcap-1.10.5.tar.gz
>  
>  # Hash for license file:
>  sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index 3d05590da3..67adb0a978 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPCAP_VERSION = 1.10.4
> +LIBPCAP_VERSION = 1.10.5
>  LIBPCAP_SITE = https://www.tcpdump.org/release
>  LIBPCAP_LICENSE = BSD-3-Clause
>  LIBPCAP_LICENSE_FILES = LICENSE
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
