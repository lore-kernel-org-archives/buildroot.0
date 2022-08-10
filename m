Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C769BC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E30040231;
	Wed, 10 Aug 2022 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E30040231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkYpvq8NC1Ay; Wed, 10 Aug 2022 21:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20002401F9;
	Wed, 10 Aug 2022 21:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20002401F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27AB01BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E99E360F9B
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99E360F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSivioA4mnSJ for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:23:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A87A60F2A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A87A60F2A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:23:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 415F91BF203;
 Wed, 10 Aug 2022 21:23:24 +0000 (UTC)
Date: Wed, 10 Aug 2022 23:23:23 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220810232323.15c2150b@windsurf>
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660166604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EENlcCj9Sq5+r+8NdfsK3Tq2iEwak512BsmA2kYPzFo=;
 b=TmkdSWDNL1yAezPmad/H6u0akOjmjEmvyfD0QQUaADrc3hx5DVr8cXIYstTFw+Ncwy2/bs
 eiURiJ04+dxBIKttwwLzCF3qArKteJlqNWOImj+dIrblvypOqGSTLGpunsABS56xzYATNk
 w9wncJvs5pDR6I/LcS6ObR9Babb8fCnxSZ5a1e+CxZyptkQB3F3CBZ2tVyrQAeURVUHAaj
 mRTD5iqRiKs78zro2gNRoVVrjHY8nS713DjgevBkXO3GQXpd68CNs02w0OETMpcmVyI3yP
 Zgx3krPy813PtJWzVGwO9CsFvXkDxtdy79Exg3mSHaBimdMASjyPHg8BTcs2cQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TmkdSWDN
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue,  9 Aug 2022 10:56:51 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> I tried to build nodejs from Buildroot master, but I couldn't.
> It could be that I did not setup something properly with regards to the
> 'v8-qemu-wrapper' stuff. I kept getting execution errors, when trying to
> run the nodejs build-tools scripts (see details in the patches).
> Either the host-qemu stuff isn't working correctly, or it needs some extra
> setup.
> 
> That eventually sent me down the rabbit-hole of trying to get nodejs to
> build for ARM64 (where I wanted it). It seems that nodejs cross-building
> can be done via their own infra-structure, which isn't perfect, but it
> seems usable; and it also looks like a good idea.

You could also have a look at the OpenEmbedded packaging of NodeJS:

  https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/nodejs?h=kirkstone

The idea and some of the logic for the Qemu wrapper comes from
OpenEmbedded.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
