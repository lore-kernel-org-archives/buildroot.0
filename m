Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FADC83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A034418D5;
	Sat, 26 Aug 2023 18:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A034418D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GB3ecibXL-jU; Sat, 26 Aug 2023 18:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D90B415DF;
	Sat, 26 Aug 2023 18:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D90B415DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7E241BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAEF881FCF
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAEF881FCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcv0tvTvsrjq for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:05:16 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6354681E69
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6354681E69
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91B131BF204;
 Sat, 26 Aug 2023 18:05:14 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:05:13 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230826200513.42cd456e@windsurf>
In-Reply-To: <20230815174600.290776-1-romain.naour@gmail.com>
References: <20230815174600.290776-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWtbVuoY5N9SI8U4mnzqGYiW80ZKNu/w3EZjf1cAK8s=;
 b=o4MyKB8x9kYoPdoFRoSIezr6EQUt+3ILPgsvPbN2B0grgUgxXXADd3S8isAIALUBU2Esgz
 q+X44lA6ti5u2owPoh/jBnunX/uO8hUEm3UrqiLdf3tNliRMRZ6hhvexGXTbElaSkc62cc
 /P521kmahdpp1u5/EkZZj1+y0u0WAs3P9N51eULeuSIswDgunwlAM/QpeOObXF8hZK4Fsl
 z+gNwYt1gwlSDRHDumwIksQxttVvjES/Fj7VTxobyKl6HpbZAZnu8NH79CNlGAomD1uds7
 rN3Mhl17sBl6bBfLRiFy3H+tcGWwotl+orGj1I3SgWSECJzt++EgFr0TOujhEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o4MyKB8x
Subject: Re: [Buildroot] [PATCH 1/2] configs/hifive_unleashed_defconfig:
 uboot needs pylibfdt
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

On Tue, 15 Aug 2023 19:45:59 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> uboot needs Python libfdt to build:
> 
>   pylibfdt does not seem to be available with python3
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060137
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  configs/hifive_unleashed_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
