Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8C9CCA47E
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5867541484;
	Tue, 26 Jul 2022 13:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5867541484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SM8_w2APhZLA; Tue, 26 Jul 2022 13:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450C14099F;
	Tue, 26 Jul 2022 13:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450C14099F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44E121BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED1C8474F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ED1C8474F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QekIa6uWNlHy for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A747484066
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A747484066
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:14:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5B4D1BF20A;
 Tue, 26 Jul 2022 13:14:21 +0000 (UTC)
Date: Tue, 26 Jul 2022 15:14:21 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220726151421.451706e1@windsurf>
In-Reply-To: <20220421215611.1362150-1-festevam@gmail.com>
References: <20220421215611.1362150-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658841262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZKIZG0bdKaGYM4pIcN1T4/kLgKIIRQOgTBhkJ+5ymA=;
 b=CSqxpaVUqYw9hghyLHERtv+gtnidxHCCoiPA4R2TapOdPRxlYb19ESI26q2zVpwzEKPMOq
 aukOXU8GnsOGS7kNg/TytjDrqcsBh0BV3TpyAjPMsHJVdVdeeeL44gnm3lnryPAUdSurQM
 V9SGI6cbAtCZAfA598hWkoRgoMxR4g84gImN6LZhVmRG0VZZeB7h3mKBsd65B/u5rWg29I
 QYARNysBr9SJsP9lQVkKy9rO4GxwOeUjstRSuf5rFwSfmLhnIc+TlYXf45gQwNQv+ORjsh
 uiqWevfDeYqEZqZc6qZt9/HhkKXpK2cxeNWG/booijaPaGpc7NJgnTIW1BaBZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CSqxpaVU
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: Bump
 U-Boot
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
Cc: heiko.thiery@gmail.com, frieder.schrempf@kontron.de,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 21 Apr 2022 18:56:11 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump U-Boot to version 2022.04 and remove the two patches
> that have already been upstreamed.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Hi Heiko,

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
