Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96518D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0D640167;
	Sat, 26 Oct 2024 19:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2vz5DzfH2Pr; Sat, 26 Oct 2024 19:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 283B440170
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283B440170;
	Sat, 26 Oct 2024 19:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B820E5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98EB340003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTQfMLZ2u_pT for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33E2A400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E2A400B9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33E2A400B9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:02:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 456751C0003;
 Sat, 26 Oct 2024 19:02:09 +0000 (UTC)
Date: Sat, 26 Oct 2024 21:02:08 +0200
To: Ludwig Kormann <ludwig.kormann@ict42.de>
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Message-ID: <20241026210208.6f3f37ab@windsurf>
In-Reply-To: <02e0b707-f491-45f7-93f9-7c237ec237ae@ict42.de>
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
 <20241016124537.2645119-3-ludwig.kormann@ict42.de>
 <CAOMZO5Bw4WEUL9692jEd1bS6e_NRugNzaAxd96neyGiBsamxCQ@mail.gmail.com>
 <02e0b707-f491-45f7-93f9-7c237ec237ae@ict42.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729969329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fs24pFkiDsOzELDhEsJjU+6ph0NmS1gfSq9Sr/nyxMo=;
 b=aY5yYnCRq+lHWcfU9OVcVJ1Bj8fZ0LWamjs2m/Ro8Yh5nmPPxPywqhiHiovqzlkHs1wN22
 fCI7nuQYbzgObkHwFhvpw+GjSlpdKeUyqVMyHo6+M8sE2pthrJGXyTqKDSkvp2YBLQO0gP
 SJzbKYBtftoUq41jxx/eT7zZKjqKennm3UA9U1Xur75NLMfGqGhofJOf9iirYeHxNLKDDX
 IG8b2DPfg1vHTfXszIMO35nsLJd4XKX9Cr1NlpSN4nUME13gmYEb8yDmm/TwWelB/K4S8u
 hc7TszF45Zr+vxpuB+KLm3Tqz2QkecpAcTKZsjAiF3YX/Ak1/MKOjj/pS3Y+lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aY5yYnCR
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/icnova-a20-adb4006: add
 uboot patch for reliable bootclk
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ludwig,

On Mon, 21 Oct 2024 08:38:06 +0200
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

> Maybe I'm misunderstanding what the "Upstream"-tag is meant to be used for.
> 
> This patch will most likely never be upstreamed to u-boot. I had 
> attempted to do this:
> https://lists.denx.de/pipermail/u-boot/2024-January/544897.html
> 
> But the conclusion was that introducing a KConfig option would be a 
> better option, which i started working on in:
> https://lists.denx.de/pipermail/u-boot/2024-February/545080.html
> 
> But as of now the KConfig option is not available yet, so I'd like to 
> use the patch as an intermediate solution for our cpu module.

OK. I applied your patch as-is to move forward, but we really need a
solution that is accepted in upstream U-Boot. We can't keep
board-specific patches forever in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
