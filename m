Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75970C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E0D4190E;
	Wed,  9 Aug 2023 18:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E0D4190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-oXNzVFLNv5; Wed,  9 Aug 2023 18:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14D7B4191C;
	Wed,  9 Aug 2023 18:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D7B4191C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19ECA1BF331
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D60A983B5E
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D60A983B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJZ2bHzKpveV for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:47:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B730B83B3C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B730B83B3C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 847EDC0004;
 Wed,  9 Aug 2023 18:47:15 +0000 (UTC)
Date: Wed, 9 Aug 2023 20:47:14 +0200
To: David Johnson via buildroot <buildroot@buildroot.org>
Message-ID: <20230809204714.188fc17e@windsurf>
In-Reply-To: <20230501203647.1177608-1-dave-git@centerclick.org>
References: <20230501203647.1177608-1-dave-git@centerclick.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691606835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xunif7g86qwTKhXljA4uFowRjBeJzp/fYaZFX1ZPhVI=;
 b=TDPBNxk54u2geXqCVoSBoEcuQTteg8fvvH1VKOvcBZI6uVIWb0j4kUYdonInsLtsLvESaI
 E0qsNLv4Ck6Xv+MXVig5WxmVNNcHsQcgrM6QF7oAocS1tTeIDTgLiZqo0C4hAvqSPiqn8y
 Xli9X0e9mYDCiv6/9mhDr1CG7JSesu2/bT1teCMCvaQadWCxezVha9vWZZSAYwHZsMZdAj
 GledO92iI0C02muHqy7UdiIMOf4FtzWrrGkoHO+pgDs5+W86c3mfyrKMGzqsS4fdhisYdJ
 zfGeh7UJUfPeM99ym6eOBXC3BC22N6JnlESFWuuhZ/QS6+30eeRtIVz39QyBWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TDPBNxk5
Subject: Re: [Buildroot] [PATCH 1/2] package/netsnmp: add systemd service
 file
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
Cc: David Johnson <dave-git@centerclick.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 May 2023 16:36:46 -0400
David Johnson via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: David Johnson <dave-git@centerclick.org>
> ---
>  package/netsnmp/netsnmp.mk    | 10 ++++++++++
>  package/netsnmp/snmpd.service | 15 +++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 package/netsnmp/snmpd.service

Sorry for the super long delay, but I've now applied both of your
patches to our next branch. Thanks for this contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
