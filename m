Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EE9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC88661250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC88661250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A065F83B8D;
	Sat, 16 Oct 2021 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9gAnUVFtHGPX; Sat, 16 Oct 2021 08:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F082883B7A;
	Sat, 16 Oct 2021 08:31:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F105A1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE8E9404F6
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-18ApeP810X for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2AC1404B2
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:30:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 070C57802D1;
 Sat, 16 Oct 2021 10:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373028;
 bh=F0ZzXbPUiswo08D9iULNHZnxYcASWcUDDXCbIPcIrCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rFhm0/0Ib/QqVTT74aBSfGodQOijNN3WDy07NGIKpWGZ+rKlodqO7TP0iE6HrRZT2
 JbvPlPUGp8LFUfpseb8O/nRVoNvTA4dwHC02UrKEL4Q4U3WKbv4xRGkcSbbMTImtVa
 hy8MxkKPvIqQBDlJkSC7bNUFmykXGYMz81xIJSbXyIDPPbmy/tManHuq+gNLYFHS7y
 IDn+UygL3r2EMQFk1BplNbHDRL7RpnmAYHGm7u6njsQ/ZgIl2hFToPUtphRDVZtInX
 tRlDD9qzSL6uc4Co61CjGNzyHo2xaaUFo+M2l4ZGrxRAxNsksQU/AKYLUib6cNBADX
 2P9k32ZldeH6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:30:23 +0200
Date: Sat, 16 Oct 2021 10:30:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211016083023.GH4165837@scaer>
References: <20211015201448.1651232-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015201448.1651232-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lockfile-progs: bump to version
 0.1.19
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

On 2021-10-15 22:14 +0200, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lockfile-progs/lockfile-progs.hash | 6 +++---
>  package/lockfile-progs/lockfile-progs.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/lockfile-progs/lockfile-progs.hash b/package/lockfile-progs/lockfile-progs.hash
> index fc3d4b68bc..bf318350f3 100644
> --- a/package/lockfile-progs/lockfile-progs.hash
> +++ b/package/lockfile-progs/lockfile-progs.hash
> @@ -1,5 +1,5 @@
> -# From https://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.18.tar.gz
> -sha256	a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6	lockfile-progs_0.1.18.tar.gz
> +# From https://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs/lockfile-progs_0.1.19.dsc
> +sha256  2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e  lockfile-progs_0.1.19.tar.gz
>  
>  # Hash for license file
> -sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
> +sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
> index d2f8f61188..6045aa713d 100644
> --- a/package/lockfile-progs/lockfile-progs.mk
> +++ b/package/lockfile-progs/lockfile-progs.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -LOCKFILE_PROGS_VERSION = 0.1.18
> +LOCKFILE_PROGS_VERSION = 0.1.19
>  LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
> -LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20180903T205652Z/pool/main/l/lockfile-progs
> +LOCKFILE_PROGS_SITE = http://snapshot.debian.org/archive/debian/20210903T205304Z/pool/main/l/lockfile-progs
>  LOCKFILE_PROGS_DEPENDENCIES = liblockfile
>  LOCKFILE_PROGS_LICENSE = GPL-2.0
>  LOCKFILE_PROGS_LICENSE_FILES = COPYING
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
