Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF1C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432A941B5E;
	Sat, 29 Jul 2023 09:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432A941B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSZ-Df5fy6jZ; Sat, 29 Jul 2023 09:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FAD408DB;
	Sat, 29 Jul 2023 09:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FAD408DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50B1F1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286D4408DB
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 286D4408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAKLNAc_qNmj for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:03:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D270240261
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D270240261
Received: by mail.gandi.net (Postfix) with ESMTPSA id AABF040002;
 Sat, 29 Jul 2023 09:03:49 +0000 (UTC)
Date: Sat, 29 Jul 2023 11:03:48 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20230729110348.51238431@windsurf>
In-Reply-To: <20230515142744.3719070-1-bisson.gary@gmail.com>
References: <20230515142744.3719070-1-bisson.gary@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJkVLZmdU5GDQLSZHZg15R56OyP6FA58PW+vIas7ef0=;
 b=e971flgT9cYB0JVKkZQRbMD8sK8cFMoliocg5noI6LYYmjOnlbI83HCPfCnxvdPNig4PXq
 LPSwR64fw2+JFszyRVkSFLlSQ8jZDMdyPJzHqO/PP3yY3z+KKbZBJHS+kCsV0/8NAIMIML
 KJ//5NXRzx8PFZZk43foX4kLVUKE3d+13bsmP3ax7edm+nmrY2LU2/sLG6XGN4WM3UwnoS
 q+epMgeHa/vyu0YxwBWnC1dyTxf4PfzOxow+rMuTwJzyM5K25uQYcpVfpPChy1zZQQXfcx
 cWw/E9Lr5elamXFDDZaYrFHGCKjeHmX2sl1Y/NlSZAx8FC2mWLBC9oW99SuaUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e971flgT
Subject: Re: [Buildroot] [PATCH] configs/nitrogen*: bump kernel rev to
 42598e4b
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

On Mon, 15 May 2023 16:27:44 +0200
Gary Bisson <bisson.gary@gmail.com> wrote:

> - bump to latest NXP release (5.15.71)
> - various enhancement (8ULP support, M-core stability)
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
>  configs/nitrogen6sx_defconfig | 2 +-
>  configs/nitrogen6x_defconfig  | 2 +-
>  configs/nitrogen7_defconfig   | 2 +-
>  configs/nitrogen8m_defconfig  | 2 +-
>  configs/nitrogen8mm_defconfig | 2 +-
>  configs/nitrogen8mn_defconfig | 2 +-
>  configs/nitrogen8mp_defconfig | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
