Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E8C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA5440106;
	Sun,  5 Feb 2023 10:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA5440106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJNl7RH6RRzx; Sun,  5 Feb 2023 10:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46672400EF;
	Sun,  5 Feb 2023 10:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46672400EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB5A91BF3BE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C539960736
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C539960736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oJI94Olvjjo for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:19:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B237A60709
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B237A60709
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:19:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.161])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A9377802FE;
 Sun,  5 Feb 2023 11:18:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 11:18:55 +0100
Date: Sun, 5 Feb 2023 11:18:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230205101855.GB2960@scaer>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205081617.113018-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675592339;
 bh=krf/thj5xjvWpy2c6Wb6ywl3iLMLXcoZpFpTG657VVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vOtBVBQTENBB/GMXwkYEJOU8tlEIFD3jRAvzBb8rAxJPRFF+5/XLjM9Lhknq+i5kV
 tN191nKf72IcPAjJJWnk1UzcojkEynC1XKm/xduu+MqdYTaEEyAbKmZO5fpJrQGB6L
 3FpgmI9bVAdGVHoUvZCPuZTCu8ZZxyeJYWzA/W7htbEfkhzwB/Wg4Tjtes4roN1qfm
 M59oube4yYnADFFcXASC54LVXS5LES4aySs9s5MqPzICBY58HzTizWbdqjUyWp1krS
 4q8tFae7qYHBR7JwCwjTIxOM2VJgDgVnVyNdlbA2RfjGrRnhpTJcJ8bMZDXUOHDAqD
 V5HnssGW4fm8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vOtBVBQT
Subject: Re: [Buildroot] [PATCH 1/3] package/libks: bump version to 1.8.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-02-05 09:16 +0100, Bernd Kuhls spake thusly:
> Needed for upcoming bump of freeswitch to version 1.10.9.

Please also mention that in the package that actually requires the bump.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libks/libks.hash | 2 +-
>  package/libks/libks.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libks/libks.hash b/package/libks/libks.hash
> index d4ad7ebbbc..dba442bdd2 100644
> --- a/package/libks/libks.hash
> +++ b/package/libks/libks.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b42544a5544ac00ceeb0675a9e6a99c8e6ecc752452c7f38c6ffe32fbedb906d  libks-1.8.0.tar.gz
> +sha256  131d7896c81a7f3c9bf06860e4f564ca558d4be1614568fec688b3eb66d38107  libks-1.8.2.tar.gz
>  sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
> diff --git a/package/libks/libks.mk b/package/libks/libks.mk
> index 4aca5c5c4c..c4f0cd5c78 100644
> --- a/package/libks/libks.mk
> +++ b/package/libks/libks.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBKS_VERSION = 1.8.0
> +LIBKS_VERSION = 1.8.2
>  LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
>  LIBKS_LICENSE = MIT
>  LIBKS_LICENSE_FILES = copyright
> -- 
> 2.39.1
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
