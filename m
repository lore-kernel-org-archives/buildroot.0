Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6A7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72375401C0;
	Mon, 22 Jul 2024 16:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc1iNnNCXqpF; Mon, 22 Jul 2024 16:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19AF9401C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AF9401C9;
	Mon, 22 Jul 2024 16:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3AA1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A3D280B4C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-e5wvFWlAaq for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4407C80484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4407C80484
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4407C80484
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:38:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41F1AE0009;
 Mon, 22 Jul 2024 16:38:30 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:38:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722183829.76708213@windsurf>
In-Reply-To: <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
 <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
 <20240722180634.0bb07726@windsurf>
 <CADvTj4o7gnjhSheMmrd5Dp-6Wug4ohBoRFpJb+Q4R8ow=KeH3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721666310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U2YBzHoildbafviD4IQTzCGbsKI9Yspyw4+veIU8Po=;
 b=hppr0h+GVJViR+W001wYoz8S137zSyFxaILHxIJxZowgHZO4B6p7s5dPg1yjiHMgJuOZ5V
 Rb3EL3ej1ax0REsUSeCdZxJtPSl5f2qXis9jH803L9jpnmiIr7+WosmV/WqmQSuhFKKepq
 ap1jLQkPsOJ+V16no33wfQgUQ5iM1je2sVxuJOodVH7drYKG0PjHSinD2V8MZsBrwyrFd2
 2oPbwhoCuzn9dHiP87a9rNwEJ3Gm4bn/pz+JDLGvFMXQtatVCCD3mqJwjP7DEm5l87tSnP
 2u7Cd+02m3D6Ve/T+qDG0bvQlSntadmmt4DvyXGQcPAiaqHHButhd/HH1UROoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hppr0h+G
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
Cc: ~bubu <bubu@bubu1.eu>, ~bubu <bubu@git.sr.ht>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 10:11:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > We have some updates to pydantic-core/pydantic pending:
> >
> > https://patchwork.ozlabs.org/project/buildroot/patch/20240719043739.3241372-1-james.hilliard1@gmail.com/
> > https://patchwork.ozlabs.org/project/buildroot/patch/20240719042632.3227242-1-james.hilliard1@gmail.com/
> >
> > (I was about to merge them)
> >
> > Not sure if they are related / solve the issue?  
> 
> These setuptools/setuptools-rust/maturin patches might also help:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240719045639.3336541-1-james.hilliard1@gmail.com/
> https://patchwork.ozlabs.org/project/buildroot/patch/20240719050134.3338117-1-james.hilliard1@gmail.com/
> https://patchwork.ozlabs.org/project/buildroot/patch/20240719052700.3427830-1-james.hilliard1@gmail.com/

I applied them. But could we have some better answer than "might also
help"? Like actually testing which thing is fixing what?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
