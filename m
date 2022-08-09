Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A7DC25B06
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB43460BD0;
	Tue,  9 Aug 2022 08:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB43460BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEUUZYyoC04s; Tue,  9 Aug 2022 08:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DC060AF1;
	Tue,  9 Aug 2022 08:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1DC060AF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E63BD1BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0A0260AF1
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0A0260AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPWqNQoLefGa for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:15:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 533B760A9F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 533B760A9F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 08:15:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57F9D1BF203;
 Tue,  9 Aug 2022 08:15:48 +0000 (UTC)
Date: Tue, 9 Aug 2022 10:15:47 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220809101547.4ddace3c@windsurf>
In-Reply-To: <CAM70yxB7dHeOz-NQtVoot+8Q6E-OX7tCpCTLGD5S+mHz7V2wHg@mail.gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
 <20220807181220.7688111e@windsurf>
 <CAM70yxBzagJt5b-3_vKO=AaknpvLbKhyLMPhbs=VC5XO0RgbOQ@mail.gmail.com>
 <20220807191843.465aa42d@windsurf>
 <CAM70yxB7dHeOz-NQtVoot+8Q6E-OX7tCpCTLGD5S+mHz7V2wHg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660032949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJ9trRf/rsjTeL94XAGsfFiaPRo+xffukPLonKiuNUQ=;
 b=eKgyhInzGW2DNpfUI0CkrDTjgsOQHXJulqhxCs44VYAyEpFMSTaZgmudbYN2AGyJmO2KJv
 T1GNpJwRtwKlAtH33bAdlQuSPdkriEdqnZwOBlbmrKCcx9q8XRc43C/m4RkHxZ7DrhabYG
 5yg6yWXj9mA/Yc2dS6D4j7Fd3ezNHliRaAhtayV+YghNOJxS3HJGpXMu+3nSJlX26kNKKB
 Ql5iyGMAAKD6aaopcV+pI3PUQsIv0idC+Zab5BtDB7H8qlOUJ7xsn3yQz1FiIXM/3YaLOT
 vfYuoHT0cgkzazBcj6mHk2K1BVKEmbSCsSGUbpjym6dm/Cci7yZaFXFJT6Gh1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eKgyhInz
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

On Sun, 7 Aug 2022 14:37:59 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> Oh I see. My patch request was for the Autobahn v22.1.1 that was included
> in Buildroot at the time. If the Autobahn version was bumped up to 22.6.1
> then you'll have to recheck all the dependencies if you haven't already.
> 
> If you're planning on bumping Crossbar to the latest, be warned that you'll
> end up in dependency hell as it introduces a bunch of new dependencies for
> the XBR and crypto features. Crossbar performs checks at runtime to bracket
> the versions of these dependencies and you may have to patch some of the
> dependency version ranges (or patch the runtime version checks).

At this point, I do not intend to bump Crossbar. I'll leave that to
people who are interested in this :-)

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
