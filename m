Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8B9E936EA
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEEE60ACD;
	Wed,  4 Oct 2023 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CEEE60ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6k8-X7Xa74f; Wed,  4 Oct 2023 21:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 026F660E77;
	Wed,  4 Oct 2023 21:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026F660E77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D63F1BF2B1
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 21:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37C4940A7B
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 21:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C4940A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QCkdfSJXLsy for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 21:58:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A684D40A51
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 21:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A684D40A51
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45B041BF204;
 Wed,  4 Oct 2023 21:57:57 +0000 (UTC)
Date: Wed, 4 Oct 2023 23:57:56 +0200
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <20231004235756.255601f7@windsurf>
In-Reply-To: <20231003091539.5e26d558@booty>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
 <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com>
 <877co67fgz.fsf@48ers.dk>
 <CH2PR12MB50046780037DB7AF933A119FF0C6A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231003091539.5e26d558@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696456678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5LKTSmJsg/zoGUBCFUegO+dmawRLvWzyTIePVtIYUk=;
 b=fwqOQA0tnJZwZDd9ep1vrRH5x9Io5UcvIjhvWKypzz9LaOOe5YcRyqcgewosSVgCktnGdP
 NBSpbRtEiMVbAnmb2LGZCbAp50d7aG7ZpYAh1GUj3bSpcX4etKRgewDUUplLeJpIKR0b6o
 bbt5TZFIEXrmX90mr+0iM/d8t5VS3wNA54v0j17ufUKsUnXImRrrqGQSzZkLdnjnMub+jt
 gKdGGIaFYQaTVHhX5th4yNEhQZ/HX8JeaJSSXzepRg2efeAgrEdWWpBFWtkDnDq8es7Fiz
 rV6v+F6V0or+s8bA2xEyb9JrKdXN6QBarqosmi8tZyqiwY35ZPUMlUGySK/thg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fwqOQA0t
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Frager,
 Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

On Tue, 3 Oct 2023 09:15:39 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > > This series instead goes to the other extreme, E.G. we build the
> > > entire microblaze toolchain from scratch and then use it to build
> > > the firmware and use it in the u-boot package - This is nice
> > > because it is all in Buildroot and we have it all under control,
> > > but also brings quite some build time overhead for building the
> > > toolchain before building the    
> > (small) toolchain. You can naturally "solve" it by using two
> > defconfigs, E.G. one that builds the pmufw and another that uses
> > the prebuilt one, but it isn't very handy either.  
> 
> I think the approach taken here by Neal and Ibai is valuable,
> especially as it would allow Buildroot defconfigs to be self-standing.
> Additionally it is already proving useful as it prompted "the
> community" (mostly Neal -- thanks about that) to upstream patches
> needed to support Microblaze in binutils and gcc, that are currently
> downstream.

I agree.

> I fyou are thinking about toolchains.bootlin.com, I am not the
> maintainer of those toolchains but I think the idea is to only have
> Linux toolchains there, not bare metal ones, thus newlib is not
> supported. Also I'm pretty sure downstream feature patches are
> absolutely not welcome there.

Regarding providing a bare-metal toolchain on toolchains.bootlin.com,
we have a chicken-and-egg problem: the toolchains on
toolchains.bootlin.com are built using... Buildroot. So if we want
toolchains.bootlin.com to offer pre-built bare-metal toolchains, we
need Buildroot to be able to generate such bare-metal toolchains in the
first place :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
