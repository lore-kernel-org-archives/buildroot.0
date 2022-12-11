Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECC0C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B872A81417;
	Sun, 11 Dec 2022 21:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B872A81417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ma9Vcx7yuMI7; Sun, 11 Dec 2022 21:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B5381414;
	Sun, 11 Dec 2022 21:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B5381414
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 007B31BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2A1560BDE
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A1560BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bMqb8a1AgGm for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:47:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9019F60BD8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9019F60BD8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:47:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5535A1C0002;
 Sun, 11 Dec 2022 21:47:53 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:47:52 +0100
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Message-ID: <20221211224752.2f4ae448@windsurf>
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670795273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwIc4VsCGklO3+rcUROML5J7/3DXKkw57fHa+f8ZoK4=;
 b=G9FByCiUSJt0upYR4OpW44Dg9I0RUVaBZeb1hQnMVOqTUDVCd+MAGc9nTWKC4tyVjDsowg
 MMwdyCmFjOI++XfQPM11JYTvHk4di5iBydjVU0DGkNuIlRTWpTrcnWHZ9GD3nCma2WMDt9
 phmJtWDGjdfyvkzSQoB7hMWRYLJnqDFqhnSKxjoN6sNC9cHCdYngscNuNOB5uF0HL5eNaT
 Exj4aRzESdJMoB/4+FrWSu88s3+pgl/ZgRTPbKqkoS2EK66YF5lRuGsSWdWMPr+4iPyzTg
 cMvG7VdeOkU/N3nF+EvNkBsvh1kFI8DApiBYJG23yzc1pSV5TiGNABGscpUeKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G9FByCiU
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Dec 2022 22:17:00 +0200
Indrek Kruusa <indrek.kruusa@gmail.com> wrote:

> kernel: bump to version 6.1.0-rc3 in d1/wip branch
> u-boot: use the version with full SPL support from d1-wip branch
> opensbi: take in the latest fixes from d1-wip branch
> 
> Other:
> remove patches directory definition as no patches are needed anymore
> update linux headers version
> update binary name as the new uboot generates it
> 
> Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> ---
>  configs/nezha_defconfig | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Thanks for this patch series, however PATCH 3/5 has apparently not made
its way to the mailing list. Could you double-check?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
