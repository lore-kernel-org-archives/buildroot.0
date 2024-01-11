Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA812C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A216F767;
	Thu, 11 Jan 2024 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A216F767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJOdh-QrfhPO; Thu, 11 Jan 2024 20:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1FC6F762;
	Thu, 11 Jan 2024 20:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1FC6F762
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3261BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 618D46F75E
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618D46F75E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chm_CaHHzRUe for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:08:15 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C7CE6F741
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7CE6F741
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0BC77B00571;
 Thu, 11 Jan 2024 21:08:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 21:08:09 +0100
Date: Thu, 11 Jan 2024 21:08:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZaBKqXz2UVRc2lB6@landeda>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <20240111105621.2321957-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111105621.2321957-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705003693;
 bh=EdtHDRW+NN/H5fAhKAUlN3rP+/FySUyjxTWYEZJ8Tv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yc37Nyi8/MHh3JbByQa07PHvSmsstd/WO7rX6Td6ygGkhdqRtLFqf5nljYlQU6ruD
 usHnUO6TdWGrLY6sU3oNxbuMFlJwR681fWH4sXqxUCFIydy3SIDUeR5xUHopcYKmia
 yp54rDlcfT75/pt+xbw4d66hRQVYY4Bx6S5VtLr1dxUbozGaULlpSEQQ8kD+fofwfj
 TL2lKqR10y5fLgkTFRRrXk4TxMtjS0A/uI17zneJkZcIB53m8dA1CsCH9bPe4Z0kv0
 9DLFFZTaah91aGHiSnGJTa3eZ309fXJyoNYXIN1zERbVjGJVzfH3EOOUf5zfKB6paV
 zl+q9E8R2FTTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yc37Nyi8
Subject: Re: [Buildroot] [PATCH 2/2] package/micropython: drop GIT_DIR=.
 workaround
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-01-11 11:56 +0100, Peter Korsgaard spake thusly:
> Now that it is handled globally in TARGET_MAKE_ENV.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/micropython/micropython.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index e6eb536ea5..3d356c51d8 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
>  MICROPYTHON_LICENSE_FILES = LICENSE
>  MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
>  
> -# Set GIT_DIR so package won't use buildroot's version number
> -MICROPYTHON_MAKE_ENV = \
> -	$(TARGET_MAKE_ENV) \
> -	GIT_DIR=.
> -
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
>  ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
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
