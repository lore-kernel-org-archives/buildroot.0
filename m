Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2840C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55CCC81336;
	Sun,  7 Aug 2022 17:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55CCC81336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNHd1WaHUTNr; Sun,  7 Aug 2022 17:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F31A81323;
	Sun,  7 Aug 2022 17:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F31A81323
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136661BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956538131E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956538131E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJDkrTBExq9c for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:18:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5592D81316
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5592D81316
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:18:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D08DB240002;
 Sun,  7 Aug 2022 17:18:44 +0000 (UTC)
Date: Sun, 7 Aug 2022 19:18:43 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807191843.465aa42d@windsurf>
In-Reply-To: <CAM70yxBzagJt5b-3_vKO=AaknpvLbKhyLMPhbs=VC5XO0RgbOQ@mail.gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
 <20220807181220.7688111e@windsurf>
 <CAM70yxBzagJt5b-3_vKO=AaknpvLbKhyLMPhbs=VC5XO0RgbOQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659892725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9W+9VMjnjjZsQ52tRu2Zm3JerTkI7ePcmlZB8AlKTIM=;
 b=i/4elB06mYXpv2okuhm1C/4Jq6mWI7xiDOEp8BWTMYgZmqWSRkfS7NRjRpTmdStYb/0Pnz
 RMGBD6+MOf9UvxIt62MoKtYowsnWH6gb5BAOIa6SwuKN56PqXoMFqTaIuimBUjTIAZHMZN
 qZgx2jBgOl/KHMs9VM/eSfiTxIV7Ob0LDTK7FsMPDQ1IWBujQkH5TEaHNnODl564FQjTJt
 s/dCI1932a00JQe3Em7YnZeP6zdZVGDSTEJRhPyBB7dvEhTR8uzRCRZNQiHrGFSwGjkt5J
 N9bphK0Vwpp2hus6fOjPpHkCMNZD6/MVQX8vTEO3YNBDK2vZXeGVm28iTAVuPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i/4elB06
Subject: Re: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

On Sun, 7 Aug 2022 13:46:21 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> Are you sure you were checking in the 22.1.1  version of Autobahn?

No, I'm checking in version 22.6.1, because that's the one we have in
Buildroot now.

> The cbor dependency is here:
> https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/setup.py#L82
> 
> "import cbor" is used in both these places:
> https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/message.py#L36
> https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/serializer.py#L660

Looking at 22.6.1, I think cbor is really no longer used:

$ git grep "import.*cbor.*"
autobahn/wamp/message.py:    import cbor2
autobahn/wamp/serializer.py:    import cbor2
autobahn/xbr/_buyer.py:import cbor2
autobahn/xbr/_cli.py:import cbor2
autobahn/xbr/_seller.py:import cbor2
autobahn/xbr/templates/py-autobahn/test_obj.py.jinja2:import cbor2

Am I missing something?

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
