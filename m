Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A33EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 13:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722E160E39;
	Sat, 24 Jun 2023 13:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722E160E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrT_GgEDhKsi; Sat, 24 Jun 2023 13:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975B760AD5;
	Sat, 24 Jun 2023 13:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975B760AD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFE91BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B8740497
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B8740497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTCvwSh-VRBs for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 13:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291DD4011C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 291DD4011C
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 13:46:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F3434B0053D;
 Sat, 24 Jun 2023 15:46:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 15:46:33 +0200
Date: Sat, 24 Jun 2023 15:46:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624134633.GO24952@scaer>
References: <20230624081308.1883140-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624081308.1883140-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687614396;
 bh=bSou9tlE2Rft9Lf7+UTL6idubBPTyUWP4UWqoxCbB/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sejHzJY4F7NnaAw4g3sxi8c8UscU2lV22v4vKBp82PkHkhyM83lehEi2Kvx/On2IY
 xFiLoG37c/a6aZzseQ9nlDkINt5J8cuZI5PXqRkyb1yQs7r6Ud0Ou5JF/SpwpBwIMM
 K/eKRvuYyQwSSYEYFiTAxqVG/hnPjUmB1k29WZgwy6EcXvYnooLL9zCAHYzwKZF3Rl
 tfO/USip8l9gs6/Q9N4zZgGPd863g1T/V1yjpzl2+a4Fe4JXkCUH8DAmQZoXNHzkeA
 sCWxpsmoFtZr+/IF5INUjUT9jkHH827z/mK99C+kJFlxqhjs/9U7EZCTFp/cWB+GN5
 wV660iTatTirQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sejHzJY4
Subject: Re: [Buildroot] [PATCH 1/1] package/fftw: bump version to 3.3.10
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

Bernd, All,

On 2023-06-24 10:13 +0200, Bernd Kuhls spake thusly:
> Release notes: http://fftw.org/release-notes.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fftw/fftw.hash | 6 +++---
>  package/fftw/fftw.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
> index b07aad8f18..9e7364d76c 100644
> --- a/package/fftw/fftw.hash
> +++ b/package/fftw/fftw.hash
> @@ -1,5 +1,5 @@
> -# From http://www.fftw.org/fftw-3.3.8.tar.gz.md5sum
> -md5  8aac833c943d8e90d51b697b27d4384d  fftw-3.3.8.tar.gz
> +# From http://fftw.org/fftw-3.3.10.tar.gz.md5sum
> +md5  8ccbf6a5ea78a16dbc3e1306e234cc5c  fftw-3.3.10.tar.gz
>  # Locally computed
> -sha256  6113262f6e92c5bd474f2875fa1b01054c4ad5040f6b0da7c03c98821d9ae303  fftw-3.3.7.tar.gz
> +sha256  56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467  fftw-3.3.10.tar.gz
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 279244a5dc..1bb537aeb8 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FFTW_VERSION = 3.3.8
> +FFTW_VERSION = 3.3.10
>  FFTW_SITE = http://www.fftw.org
>  FFTW_INSTALL_STAGING = YES
>  FFTW_LICENSE = GPL-2.0+
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
