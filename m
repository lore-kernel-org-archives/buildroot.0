Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454CCC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 22:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8088660D78;
	Sat, 26 Aug 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8088660D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pa8xS0HQs755; Sat, 26 Aug 2023 22:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A2360E29;
	Sat, 26 Aug 2023 22:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A2360E29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92F421BF5A3
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BA5A40201
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA5A40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yLCIxLjuiH4a for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 22:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B005E40122
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B005E40122
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44C8AFF803;
 Sat, 26 Aug 2023 22:11:04 +0000 (UTC)
Date: Sun, 27 Aug 2023 00:11:03 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230827001103.555c79a7@windsurf>
In-Reply-To: <20230626181531.2312002-5-james.hilliard1@gmail.com>
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-5-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693087866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/DSwDquIU6J1CJaxjW17nu1s135Lt08ufYgdy9xt1C8=;
 b=dJMpXkriZQWjcRJda8Wi1Z2hVYgx73fXc2g9kFGILTXsmprVq7/OA1x5UIDy8Q4hZhnwM6
 KaDRPhqPDbRmObXYTHrPP8mjJPu/IWRW1xKSypzEPFMWQLPmmEqoyEDIZLbBhL3O5KH7s9
 sMG3oXzniky4de2Q8vs6BPQruBrhwsmI9hKbbrs1JoK7C+R+RgufBQGIUL8MUcpQOF9A5N
 NjlqbEkXiLiKDKRgiI7Dx3WfWMYd7eomRy4xkirTt3RxjRUqNn1rSptwJG13TCTCwek2wE
 cn7ut51pqv9HEu3NdJefH/Va9/xBOvRtxnla/ENCQjIFLsumn0ZXtH8zqTHE9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dJMpXkri
Subject: Re: [Buildroot] [PATCH 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 26 Jun 2023 12:15:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Now that setuptools and its dependencies are using pep517 we can
> migrate the setuptools infrastructure itself to use the pep517
> build frontend.
> 
> As part of this we need to migrate the all python packages using
> _BUILD_OPTS to the new config settings format used by the pep517
> build frontend.
> 
> We also need to add a patch fixing a bug in python-pypa-build which
> was preventing the config settings from being passed to some of the
> pep517 build hooks.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I looked at this patch again, and one thing I believe I don't really
like is that it requires a "flag" day, at which "<pkg>_SETUP_TYPE =
setuptools" will change its semantic from the legacy setuptools to the
PEP517-based setuptools. We generally try to avoid this sort of "flag"
day as it's a pain... but also your proposal changes the
semantic/behavior of "<pkg>_SETUP_TYPE = setuptools", which can break
external packages (Python packages people have in their BR2_EXTERNAL,
or Buildroot forks).

One option is to add create a new pep517-setuptools <pkg>_SETUP_TYPE,
and gradually convert packages over. This way we allow the co-existence
of "SETUP_TYPE = setuptools" packages with "SETUP_TYPE =
pep517-setuptools" package. The obvious drawback is that we have 449
packages with <pkg>_SETUP_TYPE = setuptools, and I suppose that 95% of
them work just fine with the PEP517-based setuptools.

I'm not really sure how to proceed here.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
