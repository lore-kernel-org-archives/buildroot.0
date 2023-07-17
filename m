Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1908C0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 20:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3050C81354;
	Mon, 17 Jul 2023 20:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3050C81354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsMPBB9FteK4; Mon, 17 Jul 2023 20:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 603D681345;
	Mon, 17 Jul 2023 20:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 603D681345
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D344C1BF2C5
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 20:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB8A60EAA
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 20:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACB8A60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aiqzk8SIsh2M for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 20:09:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2CA760D75
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2CA760D75
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 20:09:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A52B1C0003;
 Mon, 17 Jul 2023 20:09:33 +0000 (UTC)
Date: Mon, 17 Jul 2023 22:09:31 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230717220931.20b397c0@windsurf>
In-Reply-To: <bc55ba52-133a-d350-a935-432e852f19f6@mind.be>
References: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
 <20230714121834.22742681@windsurf>
 <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
 <bc55ba52-133a-d350-a935-432e852f19f6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689624574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+p05rvaJnDZSvTHzTQ8ID18GaGLFCmGo7T02sXW030=;
 b=Twe2auWuGOqNNzxYRAdXSLuUJ7QrKIHIl6p7kZUOLzMoNApLJ+EquV7Ejkb10/KIBJoiK6
 E2+60Z7JcOdvo2yqmaynGV1CXp1k8BWmVIuQBEVfAwLo3WJrShAC0ktidn/a47LL+wM7Pt
 78BomHApKEAU5wf+xtacW815aX5H1ij++w+B5UFT+KSuty27XN7cpXs7mkCn5pwn5o2HVJ
 zABJNaw9lkBUfJrgDW97pJXBF+1uaWLWGcTrG0rNlEAqFISDMaPQg5TLtZSlO2SsH8s5gw
 yv0ToFEfgpX0MWTfdCNFsB+iu6XBTbvrH2Sd0n52lrKVmKqBfINaeWnl94ZFnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Twe2auWu
Subject: Re: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jul 2023 17:31:19 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Yeah, we have version checking for GCC and kernel headers, but not for libc. 
> It's fairly rare that a version dependency is needed on libc. So we basically 
> just assume that libc is up to date.
> 
>   What we sometimes do in such a case it to add an exception in the 
> genrandconfig script, to make sure that that combination isn't tried.
> 
>   Ideally, though, that toolchain configuration should just be replaced with the 
> equivalent bootlin toolchain. Only, there is no bootlin toolchain for 
> mips64-n64. Any idea why not, Thomas?

Because I'm not super familiar with MIPS, so I don't know which
toolchain variants make the most sense, and I never got any request for
mips64-n64. I can probably add this toolchain variant in
toolchains.bootlin.com for the next rebuild.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
