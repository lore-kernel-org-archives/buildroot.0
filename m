Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E37FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BE061250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42BE061250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E455606C0;
	Sat, 16 Oct 2021 08:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfH9xUA_R-kw; Sat, 16 Oct 2021 08:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C2D606A7;
	Sat, 16 Oct 2021 08:31:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01DD51BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BA883B8A
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98pz_Xvj35Ha for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:30:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DB9283B63
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:30:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9A7D978035D;
 Sat, 16 Oct 2021 10:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373014;
 bh=4Klsng1SOTsjn0ymrahLUTXxGR+4sreNiuB5kEUuMQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsYcGIN9DUuMzs8DB0e/KvyITag/Qs/p86ie0ga8/3T+JZl1Q0w2PAdSjl1sdMzQP
 6Jio/Cs5SMlWtsG02nLzxsbQyPRMLdXspYhX7f45J1595+7crwP952mo6+Qmjpp3qP
 S5k0g/FG5FdGwMUvNWMNO9rGgj2vOoKzmtGU8FfUt7e9PI2tiPRb7aqxM3eeODjhKl
 s4jjRYjDHQTg0+d9Cez+372vv2o/HnFwGSm+y2OcCAV+baxwACFCUpEOJvKIU0WRJu
 ui+raJxLLkk6iwdN3rVRENd3B2DPRuwen3VlBQsmLR3DYTHvF/tV/svg/F1T9Jdtew
 Fj1UiRcPW81Fw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:30:10 +0200
Date: Sat, 16 Oct 2021 10:30:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016083010.GG4165837@scaer>
References: <20211015202802.1669233-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015202802.1669233-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dante: bump to version 1.4.3
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

Fabrice, All,

On 2021-10-15 22:28 +0200, Fabrice Fontaine spake thusly:
> - Update indentation in hash file (two spaces)
> - Update hash of license file (update in year and authors)
> 
> https://www.inet.no/dante/announce-1.4.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dante/dante.hash | 4 ++--
>  package/dante/dante.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dante/dante.hash b/package/dante/dante.hash
> index cb87cdc04a..a76018fdb6 100644
> --- a/package/dante/dante.hash
> +++ b/package/dante/dante.hash
> @@ -1,5 +1,5 @@
>  # From https://www.inet.no/dante/download.html
> -sha256	4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7	dante-1.4.2.tar.gz
> +sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
>  
>  # Hash for license file
> -sha256	954ab6dbcf994711e28e603d8657d6eceef333cd6f9ca6705f0e9d118ab7d69a	LICENSE
> +sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
> diff --git a/package/dante/dante.mk b/package/dante/dante.mk
> index 2c6ddad7ad..ae60252bed 100644
> --- a/package/dante/dante.mk
> +++ b/package/dante/dante.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DANTE_VERSION = 1.4.2
> +DANTE_VERSION = 1.4.3
>  DANTE_SITE = http://www.inet.no/dante/files
>  DANTE_LICENSE = BSD-3-Clause
>  DANTE_LICENSE_FILES = LICENSE
> -- 
> 2.33.0
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
