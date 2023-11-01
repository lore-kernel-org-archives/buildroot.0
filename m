Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A75C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97276430DE;
	Wed,  1 Nov 2023 11:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97276430DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8uvgm9PZkVT; Wed,  1 Nov 2023 11:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7A3430E5;
	Wed,  1 Nov 2023 11:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7A3430E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6989B1BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE2070354
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE2070354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvFJIhBIdfOf for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:50:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 570367034D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570367034D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C54B20003;
 Wed,  1 Nov 2023 11:50:49 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:50:48 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231101125048.01553f76@windsurf>
In-Reply-To: <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698839449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMHn835A5UE2SukFllsZNbTgsIV3jVi1PLCA96yop1A=;
 b=FSXC2K9mP8AprxwLPcxbT5C7nTI9MBcXgRDqo9zJVps2h1mWD4GhS7arGfII9jqZ91RxTg
 vIzkurVJqohxiEtTGKGoBMyE80YTxw6b2NSeeGGBWkI6zhqGpgyfLGOEgqoVaQh1FE2Ty/
 gpGzQOFwaRxjPp78v/M47DCFmlilNPKepRYESPq6uHIqZTw/b5Q8PbKfwXXv66oBWo6Ufg
 KMEGKC7ZS7+dRjNtWNCv4sBUF2H1uNAFN/pYgjxYLlNtLbDGShILF48fEoZJnmLaE11wGo
 hzfNaM73Xgo+jx90CXJS8GIRSz13Ia7b3cDpvNCyGsjVKn96XU2XwVkyP9I1XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FSXC2K9m
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 1 Nov 2023 11:43:34 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Are you sure that the Config.in files can be dropped?  
> 
> When I drop them, I am stuck with the following build error:
> Makefile:576: *** newlib-bare-metal is in the dependency chain of toolchain-bare-metal-buildroot that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> How can we deal with this without selecting the packages and having Config.in files?

Ah, yes, I asked to change the newlib-bare-metal package to be a target
package. In this case indeed you do need a Config.in file. However, its
option doesn't have to be visible, it should simply be selected by the
toolchain-bare-metal-buildroot package.

config BR2_PACKAGE_NEWLIB_BARE_METAL
	bool

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
