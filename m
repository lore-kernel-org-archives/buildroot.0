Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B559AC2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D54740AB4;
	Wed, 21 May 2025 17:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiLPYysP4plA; Wed, 21 May 2025 17:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C3D40AF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C3D40AF1;
	Wed, 21 May 2025 17:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 066C061
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B0B81EF4
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 823K79j_-i16 for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9731581E81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9731581E81
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9731581E81
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:18:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1psI-1uFa9d3nUO-000yYJ; Wed, 21
 May 2025 19:17:57 +0200
Message-ID: <84ee5308-0c43-4c05-8511-c54870577d33@gmx.de>
Date: Wed, 21 May 2025 19:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@cairnwater.com, Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot <buildroot@buildroot.org>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
 <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
 <ce099431e6ef3f34d075533934004d29@cairnwater.com>
 <94c4f329-b903-49df-a1c2-8e91185469cc@gmx.de>
 <e147c44847cdb3c965cbf99e41751d26@cairnwater.com>
 <06288a46ae8ca333eb295497dece6254@cairnwater.com>
 <122ba5b5-9769-42b3-8bee-7bd535eda97d@grenoble.cnrs.fr>
 <a5a0d49d46a4abc8eaa9a41a4646fd34@cairnwater.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <a5a0d49d46a4abc8eaa9a41a4646fd34@cairnwater.com>
X-Provags-ID: V03:K1:2DduKiL8HhkFbDqTNYs5UqOEkr3knd66o+HUU00lvX/VOvyP3bC
 2pf2RZ5Mon0rYkxekLXODCdDuqKrgaz9qKgGJmW2enT2n/aoSzkix8i69MCFVD2BovQJVNW
 /hTbOAmpFaDjagGshCD4x6rNUY5KrW8oqvdA7B1YraTJ6dZIUL9+dMSq8V/tfRnqR3/ALpl
 fiwhjcmLTSy/gLDfxnscQ==
UI-OutboundReport: notjunk:1;M01:P0:PpMBuprHZuM=;xfJJWGoE1cmEjiBBnf2L7vpefye
 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
 Z7j4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747847878; x=1748452678; i=fiona.klute@gmx.de;
 bh=0N/qR/kXXMTR2jflU9UI4oGq0Ri34JjhCTs5yAoiPII=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BfyX+u8NOKrNZwFom7faXcfIVrjAK9KgN+sQMrLCoPaWuVqG9JWo2e0vwWrVsN5e
 zNaGsgsrLJEXCyGgvo6FWAyrgsAP09koHWjTJ1cK2Jc9oY1jRs2aT52pER1+Z3bNB
 qs6ZE7JkFzbH71XXaB0GOlg9FrvCIidY2sOKHgFTZBpi/ZbbOGFtXfhellsmK+/VB
 9VNnkXLkDSR/zUbMSgh/x/LxsdP4N7zhG5TvmEUT3SpUV+wqVlut3Bf/SanUovtg8
 4YdMkekj1cwGhabVFOE1Lv1ZR0TvLapdmPFx2rhG5ng5lWOEmvfKpBpuKwvpGCgas
 QROBCfdjsIKw81DY1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BfyX+u8N
Subject: Re: [Buildroot] Adding Device Tree Overlays for MIPI-CSI2 Camera
 and libcamera to a buildroot Build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Will!

Am 15.05.25 um 18:11 schrieb buildroot@cairnwater.com:
> I see that in acmesystems defconfig :-)
> 
> https://github.com/buildroot/buildroot/blob/master/configs/ 
> acmesystems_acqua_a5_256mb_defconfig
> 
> I hadn't understood that I could add lines to the defonfig file.
> 
> What's the best way for me to keep my changes separate from the 
> underlying defconfig? Should I write a short config file that inherits 
> the defconfig and applies my changes?

The approach I usually use is to create a custom defconfig, and maintain 
that in an external tree (assuming it's a customized one, not a basic 
one that could be contributed to Buildroot).

Usually you shouldn't need to modify the defconfig file by hand, instead 
just use "make nconfig" (or "make menuconfig", etc., whichever you 
prefer) to adjust your config, change BR2_DEFCONFIG to whatever location 
you want, and run "make savedefconfig" to create the defconfig file.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
