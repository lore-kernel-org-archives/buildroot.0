Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A818C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:46:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB6C610EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAB6C610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6E5400D4;
	Fri, 24 Sep 2021 19:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtEjnTjLZajE; Fri, 24 Sep 2021 19:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92A7140168;
	Fri, 24 Sep 2021 19:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 588421BF870
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4875D605B3
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgQ0MLx4w8GQ for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 19:45:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFC6C60765
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 19:45:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 437E2780310;
 Fri, 24 Sep 2021 21:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632512746;
 bh=hqAH6uERjpv7Q5Z3SddZ++y/Jk6gPVUXuzedzg0kkIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rCFjAdGhSc7pnNYyhep3t4mU6sJkk3Kv1ORtdv0W+p9+7Xtp3UYoK2kTjtK4Z7A0T
 aATnKQSkOCgiTN/Hdarp8YSK5wUbQ2MKET4L8owM712iNC6+48ecf2yDmPVYzOerom
 1QKCWxRgVi+odYzCk+MNskrisHONkx6s7kRVByw+rJhMk6f4CzlDGUMvn5ijSeqcjc
 +nZfLrcH3zSHkioDjPCKrcythjvnKdBwQsjOT1gIO7XVx07LKJ+5ymhOndcLzzUGrj
 G7ArL8OFSb76Ak7YRO8Y/bvYJyeQCZvseh/i45BO+jsktb9b2uUDsqd9FBTY+Ouims
 qRYTU60PJ9bxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 24 Sep 2021 21:45:41 +0200
Date: Fri, 24 Sep 2021 21:45:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20210924194541.GF3176@scaer>
References: <20210923154912.268966-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923154912.268966-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/mv-ddr-marvell: fix license file hash
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
Cc: nyanyamiau@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2021-09-23 17:49 +0200, Yann E. MORIN spake thusly:
> Commit 2cfdf8b8a269 (boot/mv-ddr-marvell: Bump to HEAD as of 20201207)
> forgot to update the hash a a source file that we use as license file.
> 
> Fixes: #14221
> 
> Reported-by: nyanyamiau@gmail.com
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: D. Olsson <hi@senzilla.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/mv-ddr-marvell/mv-ddr-marvell.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> index e1a86008db..5bfae8af45 100644
> --- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> +++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
> -sha256  69208236fc322026920b92d1d839ebdc521ca65379bfdb3368a24945e794fc78  ddr3_init.c
> +sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
