Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FDDC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97920607FF;
	Mon,  6 May 2024 10:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClzfvAPIZV3Y; Mon,  6 May 2024 10:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9958F60801
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9958F60801;
	Mon,  6 May 2024 10:26:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A593B1BF5DE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92691607FF
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tz1d2_ZwrqU8 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93CC260658
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93CC260658
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93CC260658
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:26:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A2E17C3391
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AABD4C0003;
 Mon,  6 May 2024 10:19:17 +0000 (UTC)
Date: Mon, 6 May 2024 12:19:16 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20240506121916.67df083b@booty>
In-Reply-To: <20240430203708.75367-1-jesseevg@gmail.com>
References: <20240430203708.75367-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714990758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b46scYmZ6IPcDsdFZJXvVRg5YSeVgSPo1cU3aJAWRk4=;
 b=pj2vSeBXtzUKirH3BIw68gmLVeb+airgTMEKwJaM9Ji0wpxHhsOQ0M0Boy98DpIrOieOS8
 tw7vnPdamRK+cr4err1R/Gkb4n1R+69sB9XWhLiRHldRUmjBgThjmykHU3fTSY95/UKsFp
 P5m4LdOUQD2xYHx2+sOZ4G19uUJxEyKevGYxNGKVt/rgyCLUMypTVdWgSeiVV5AlgyF7sV
 OxVzkMHdJpjYrqTgcrQISkE2CyZalvIjutqb1Pwv2JDtD4ZKLlBplSNSprBoWxxB1Kcy8o
 Xh+MB20m3eyWodTXhFi3SvMtn4EKydPvJNrMimHKPwVus8MUzfvasnyP0iA4sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pj2vSeBX
Subject: Re: [Buildroot] [PATCH 1/1] package/snmppp: bump to version 3.5.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Tue, 30 Apr 2024 22:37:08 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Drop non-v3 fix patch as this was upstreamed
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
