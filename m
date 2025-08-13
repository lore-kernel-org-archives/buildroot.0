Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F126CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE96E42AFF;
	Wed, 13 Aug 2025 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ3Ok_9SIzuy; Wed, 13 Aug 2025 20:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12DA442B03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DA442B03;
	Wed, 13 Aug 2025 20:59:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C411C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CF6F61C2F
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pV7NnB9qcDfk for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 20:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BC5261B2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC5261B2B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC5261B2B
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 20:59:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663EF44377;
 Wed, 13 Aug 2025 20:58:59 +0000 (UTC)
Date: Wed, 13 Aug 2025 22:58:58 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Andrea Ricchi
 <andrea.ricchi@amarulasolutions.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 linux-amarula@amarulasolutions.com, Angelo Compagnucci
 <angelo@amarulasolutions.com>
Message-ID: <20250813225858.3323ca6c@windsurf>
In-Reply-To: <20250813192605.1540321-2-dario.binacchi@amarulasolutions.com>
References: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
 <20250813192605.1540321-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeelvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedvheeugfduieekueegheffgedtuedvgfelgeduhefhieetfeevveetuedtudelnecuffhomhgrihhnpegtohhnfhdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghui
 hhlughrohhothdrohhrghdprhgtphhtthhopegrnhgurhgvrgdrrhhitggthhhisegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhordgtohhmphgrghhnuhgttghisehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnghgvlhhosegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755118739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/Oz5qx+r+U57KgFdIgtNR7ST7f55Hw1hcA99n8DpDI=;
 b=e3eJwfBeNS4ey/jMG7TCNGGJJ1mInQlx4smfSWLazSJ3Hxk4DbG05Dz6u08xEF8RyYjAj6
 usYn22Ml6BizljOw+Qhw5KJTYzowlDSDoV4d5gSDPUIE53aLujs3sC6KjaHeGdtPnLD0tN
 iNJuOIG/DYqoejqNB5aIXi6Ix7aHXVVsmgisutWdk0gTcVQk4d3vSMv2IsIM97O2x5qHCD
 AgHpimyb9bkZ783cCfMEHE9YNoQD+pvT7oDcWPb3IqP+0PohFnwT1fKM/ICswe+wcHmD3h
 vTeuQLlv7anI6BWiBzRs7rJuXFOgZesXfNakp8BbOa7jEqJfzNgaEra2Xch9qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e3eJwfBe
Subject: Re: [Buildroot] [RFC v2 1/5] package/qt6: Add qmake functionality
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

Hello Dario,

Thanks for your work on this!

On Wed, 13 Aug 2025 21:26:01 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

>  package/qt6/qt6.mk                  |  18 ++
>  package/qt6/qt6base/qmake.conf.in   |  36 +++
>  package/qt6/qt6base/qplatformdefs.h |   1 +
>  package/qt6/qt6base/qt.conf.in      |   7 +
>  package/qt6/qt6base/qt6base.mk      |  18 ++
>  package/qt6/qt6base/qt6base.mk.save | 455 ++++++++++++++++++++++++++++

Are you sure this file is supposed to be part of the commit?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
