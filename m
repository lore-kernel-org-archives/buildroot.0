Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4063CC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C6B60645;
	Tue, 20 Feb 2024 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E243cqDCbcyb; Tue, 20 Feb 2024 21:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D939D6062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D939D6062E;
	Tue, 20 Feb 2024 21:12:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09C931BF955
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E988B414D0
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPcHIknzKITv for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64C5840162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64C5840162
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64C5840162
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:12:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4A19513F86A;
 Tue, 20 Feb 2024 22:12:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:12:29 +0100
Date: Tue, 20 Feb 2024 22:12:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZdUVvX2EvkdcjqBI@landeda>
References: <20240220151931.2141682-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220151931.2141682-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708463551;
 bh=cYJR9WpvOfEwrJn6ta72YWiQ4htm8XMRY5N+TYbE5TU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=azMpaap+3kKdBoeSgNotvQXpmkcRavXx9g3m9r6CUaAfMlgc7LgV9vAi0kMKqLS8T
 4dkuZRzEIU2bwZ7V4lL9DWOszCVjaulfESTJiJidHTbbdEgLE3tGiH9nxU8AA4/V/E
 hCvgQ+V4lRHVjfFJ8cbUVyPUPlXxikU9lx/PDgMGvQSxHitRPsGW8a+rUQmthJZUOZ
 e6LhI36OX5+Zrz71DBEUlcIbPFrLtfNlZsdXl5j96ewXf/LIbWSqW4VmO7oDspqd2i
 HOEFaknBTUZCo8oUO6gi4Qv2C+7gswFchfdyHhU7PT6zkHvgrGIgeb0/wQqwonYGJ/
 cBd72/gplfk/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=azMpaap+
Subject: Re: [Buildroot] [PATCH] package/c-ares: bump to version 1.26.0
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

Marcus, All,

On 2024-02-20 16:19 +0100, Marcus Hoffmann via buildroot spake thusly:
> Changelog: https://c-ares.org/changelog.html#1_26_0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/c-ares/c-ares.hash | 2 +-
>  package/c-ares/c-ares.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
> index c2897f6e44..ee097a53c9 100644
> --- a/package/c-ares/c-ares.hash
> +++ b/package/c-ares/c-ares.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
> +sha256  bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50  c-ares-1.26.0.tar.gz
>  
>  # Hash for license file
>  sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index 586fde9afb..29da6baa4b 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -C_ARES_VERSION = 1.20.1
> +C_ARES_VERSION = 1.26.0
>  C_ARES_SITE = http://c-ares.haxx.se/download
>  C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
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
