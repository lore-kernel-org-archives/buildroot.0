Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6332CC4167B
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 001CF43127;
	Sun, 29 Oct 2023 08:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 001CF43127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOSpe3rhDxG7; Sun, 29 Oct 2023 08:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD9D14312D;
	Sun, 29 Oct 2023 08:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD9D14312D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA531BF20B
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6353743125
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6353743125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cxdy3l7hSDI3 for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:47:41 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5360743122
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5360743122
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A4F592003AE;
 Sun, 29 Oct 2023 09:47:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:47:37 +0100
Date: Sun, 29 Oct 2023 09:47:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231029084737.GS687180@scaer>
References: <20231026173442.4149220-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026173442.4149220-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698569259;
 bh=1TaIvxo7FGywIpXNh5IHrrN5S3EYghYAI3sHYB5oxeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hx/Nny6vF4toNFmgaV1AlXWQa3A8wGAZFrVr+86yTCzRpUc9BYq5FhNUdoAwbiixC
 aq+xyxOuFjO4aDVKZ0/YPIWj8tUrFX3ptTxkoB269PlZYk1go1QLs+R7Yeah/RFmwZ
 tw7aNx84nLYBM054bXVTtHe/35kOZC6HgOfHXJ9V9H5K+Snkbg7CysR0LvI1Te0P6u
 uEPBdvjYjUoKH73mIFgksmEo22Jn7zhKiS8NyYGnQFhavDDASWP3fsk/wraeBchBN4
 KpPkLQAH+t4AYl+KQMoqm5qA45kGh5XJs0WXB8Bzac8p9RPSlsa1B/DtCFN+16djWS
 0XV1lkyiN6JwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hx/Nny6v
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.0.4
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

On 2023-10-26 19:34 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://blog.clamav.net/2023/10/clamav-121-113-104-010311-patch.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index c140a2df07..cb4f67156c 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  8779458dc31fdee1232eb8986f092d25568b39f5d337c0cbcd9c1abb5dc2886b  clamav-1.0.3.tar.gz
> +sha256  3d6b99644874558b7de5faf9b340737a9bbc1083878fcd95a49f989c7c980146  clamav-1.0.4.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index e1e0fa8c63..c9012261fa 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 1.0.3
> +CLAMAV_VERSION = 1.0.4
>  CLAMAV_SITE = https://www.clamav.net/downloads/production
>  CLAMAV_LICENSE = GPL-2.0
>  CLAMAV_LICENSE_FILES = \
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
