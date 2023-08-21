Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B4EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47EE6415F1;
	Mon, 21 Aug 2023 13:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47EE6415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jk77WY8iv2lD; Mon, 21 Aug 2023 13:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6260940977;
	Mon, 21 Aug 2023 13:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6260940977
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA021BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187204036E
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 187204036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55Iiu4M2V96x for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:05:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A86540134
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A86540134
Received: by mail.gandi.net (Postfix) with ESMTPSA id 929BEC0004;
 Mon, 21 Aug 2023 13:05:01 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:05:00 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230821150500.7f4b51d5@windsurf>
In-Reply-To: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
References: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692623102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbBq0gqn9Ygz7VTfHLrbMaf+FeCyQIcq+4ZxNBfihpE=;
 b=Ji/us4wSQwVHMwSgrUtYz5/vyO5LgK/ngmzibXhQ6kjPhQqoSs+wBowks6T2TDMnnPWnsO
 ladrz1kBDByt2KZuWAnEGSbMs50nh30iyTwLDk0M4vMHFRCjSt4nR8DdqUWhg0Vyv+8WH5
 mfjsj9XgNi65PqFAFoi9Rlez4e8RkXhOCyHoGRHhRM74me5v0i/veWIvVU4Wc6dEbolqTA
 6Avd5dPGGDMav8DctmqoeZh17TvZdHLd/UREsWV/8W3LeynvYIOFwe+FK5M21vAdXBcyjN
 L7qppW9/dDSuWlrACNcjV0dsgQIfFO/QmFDvM1+QSvDiXbZgAbGsCCErOnTbQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ji/us4wS
Subject: Re: [Buildroot] [PATCH 0/2] Fixes for Microchip MPFS Icicle
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
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 21 Aug 2023 12:30:32 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> Jamie Gibbons (2):
>   board/microchip/mpfs_icicle: update post-image script
>   configs/microchip_mpfs_icicle_defconfig: update RVC config option

Thanks, both applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
