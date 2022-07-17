Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2941EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B274B4170A;
	Sun, 17 Jul 2022 13:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B274B4170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9c4-yJ6kxO6e; Sun, 17 Jul 2022 13:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C035416F7;
	Sun, 17 Jul 2022 13:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C035416F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C635F1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC2A6400DD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC2A6400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wc44yikoP4ws for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:22:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A1F400F2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0A1F400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:22:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 95C72780502;
 Sun, 17 Jul 2022 15:22:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:22:03 +0200
Date: Sun, 17 Jul 2022 15:22:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20220717132203.GG2249625@scaer>
References: <20220711103814.19895-1-br015@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711103814.19895-1-br015@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064126;
 bh=8Adme1oZlFK7heHsZyabwp82P4gp9RudAPlZ5j1fROM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EI5+CCM1jhBB5k+eK6PtFvNErcXvYv6rNQHk5l5qM8fK6H8gbWdwwGEbBkZEimZjW
 tsspGUYD8q/rbNybCtCTKqfUvBv3JvP5/G4CacMdn22gEyYEoZPVRMYSBQlMBtx0aD
 EEV3LuFo+wT0sLzdWNuGnN04G371ysdX37aqppJX0cjvT8YNnq6BMA7TBGnfJgyADO
 STCkzvn9R4dF6a1pHhddyEMnJoZzoqyDPJRZGxWBRW7NTBZnHvzr0S4fNpdzvU1OjX
 JXzVB4xq85r7PYw2UTYUnRRSes0m6Hidcu5ehixpydx7lLvcCBgHOYwh+r3M+P+ReK
 gJd80Az1sylRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EI5+CCM1
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.8
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2022-07-11 12:38 +0200, Andreas Ziegler spake thusly:
> Minor bug fixes and corrections; add fmt 9.0.0 support.
> 
> Full change log:
>   https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.8/NEWS
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index 353df25b39..e5f587fefc 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256  960dcbac717c388f5dcc4fd945e3af19a476f2b15f367e9653d4c7a948768211  mpd-0.23.7.tar.xz
> +sha256  86bb569bf3b519821f36f6bb5564e484e85d2564411b34b200fe2cd3a04e78cf  mpd-0.23.8.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index 20c8f77fa8..e265a9fc4f 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPD_VERSION_MAJOR = 0.23
> -MPD_VERSION = $(MPD_VERSION_MAJOR).7
> +MPD_VERSION = $(MPD_VERSION_MAJOR).8
>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>  MPD_DEPENDENCIES = host-pkgconf boost fmt
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
