Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1063BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E6F60BDB;
	Sun, 11 Dec 2022 20:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E6F60BDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSezdv9VEbML; Sun, 11 Dec 2022 20:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63F660B49;
	Sun, 11 Dec 2022 20:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63F660B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF181BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 096D88141B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096D88141B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2lS7kSLmfXj for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:31:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9C38140D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9C38140D
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:31:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E494B240004;
 Sun, 11 Dec 2022 20:31:00 +0000 (UTC)
Date: Sun, 11 Dec 2022 21:31:00 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221211213100.02469948@windsurf>
In-Reply-To: <20221130074444.829636-1-christian@paral.in>
References: <20221130074444.829636-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670790661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ULitTiF/d3LHAEf+E+0td9HRk6ekt+hOcQHR9HFGXs=;
 b=kui65U5N9oFzITY4dxR4/vfpdz9IGYr3AkL/DmWSFC2a6gT6Q31Sqi/422ZJOSIQ4zzvUG
 kmHULafu8JY9l3pBl0VHP+TYo3gHsiSRZpDCUheAPKT3XL+ksuVkoDfQd0BYCLwEQuRJzr
 Ti7SyyKQ7De01JnBa19JX1LtKdGYyMN5PLiPqxQbQmCjgXOrRIeDua1udJHU9dAxkrjJVg
 mHMV9lY+keNfgSPDde31INMaQGsye2vL7A5ak2fO5IpcF8L3HjSr/nltboRKt5erDEP6y1
 vZG+gZptyBPSczXnKzY6gVglIr5BOqdJ6rbYQUNFIIcF/ab6PS0KW86y9vlzSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kui65U5N
Subject: Re: [Buildroot] [PATCH 1/2] package/balena-engine: bump to version
 20.10.21
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Nov 2022 23:44:43 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/balena-os/balena-engine/blob/v20.10.21/CHANGELOG.md
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/balena-engine/balena-engine.hash | 2 +-
>  package/balena-engine/balena-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
