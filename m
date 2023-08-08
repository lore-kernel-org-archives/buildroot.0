Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44963C04E69
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC3040917;
	Tue,  8 Aug 2023 19:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC3040917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-dQuSETAFzK; Tue,  8 Aug 2023 19:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A9B408D9;
	Tue,  8 Aug 2023 19:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A9B408D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8621BF341
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D1461196
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D1461196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNqBvFAHkyOu for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:48:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D97D060C25
 for <buildroot@uclibc.org>; Tue,  8 Aug 2023 19:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97D060C25
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44EA6FF804;
 Tue,  8 Aug 2023 19:48:36 +0000 (UTC)
Date: Tue, 8 Aug 2023 21:48:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230808214834.3de77057@windsurf>
In-Reply-To: <pan$23d9a$9e16430b$9042433f$15f9ab31@ID-313208.user.individual.net>
References: <20230807174515.3261136-1-bernd@kuhls.net>
 <20230807231438.6bfe2c7a__31533.8530390122$1691442911$gmane$org@windsurf>
 <pan$23d9a$9e16430b$9042433f$15f9ab31@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691524116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrZzHqQj3eUH1XgVBLLInxQNqkGT2/jyReHvS33WkSs=;
 b=hoi3l6DEA3BbW+cPNCKA3B/Z0ynGv9DzLm0FeTWOFzJiiYKqeZYeZG6f3P2YFAnXAkm/Ls
 mKDt5KphUTbOPShc/dUGi3MDivjiMXHP2Hy6rkpwuJL4ModvIlVp1KEnq3lai9KIP7nXXU
 oGlMKpuQXuSbqZf4LZU/NJ5Fk/1BJJs3/89+JWy1j2tbFeNIlXnuSce7cI6Fqd3C/9qJSy
 H/ji5SuM2iwmZq/o+JR+09DWZxcTO790o/42nQ1rnVtTzg768npT5+yL/5PzjapH4rAGqm
 5Qcp0Lm6CAUydHgt4TOZ4702FGE2LEUNqEeeokYdIvwHIupBqPe5McVrODVctw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hoi3l6DE
Subject: Re: [Buildroot] [PATCH 1/2] package/berkeleydb: add option for
 historic dbm interface
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 08 Aug 2023 18:01:40 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> the problem I am fixing is only about the detection during configure and 
> unrelated to the code of the dbm module.

I understand, but it raises additional questions.

> The detection logic in Python 3.11 tries to link a sample program 
> containing "dbm_open()" to -ldb: https://github.com/python/cpython/blob/
> d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4007
> 
> and fails, for whatever reason:
> conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

Absolutely, this is understood.

> The detection in Python 3.10 is aimed only at the existence of the library 
> file and does not try to link code: https://github.com/python/cpython/
> blob/b4e48a444ea02921ce4b701fe165e6cfd4cf5845/setup.py#L1430C34-L1430C65

Correct.

> > So I'm really confused. How does it work in Python 3.10 ? Did we already
> > need the historic dbm interface back then ?  
> 
> Me, too, but only because my knowledge about C functions, macro expansion 
> etc. is very limited, I can not comment your analysis why the dbm module 
> works despite missing symbols. Anyway, with Python 3.11 the dbm module is 
> not build at all atm.

Yes, I understand that, but rather than "blindly" fixing the issue, I'd
like to understand what is happening. Indeed, as I explained in
previous e-mail, the dbm module in Python 3.10 is *already* using
__db_ndbm_open(), which isn't provided by libdb-5.3.so, so I'm really
confused on how it can work today. Perhaps we have an existing issue in
Python 3.10, and your change needs to also be backported to our
maintenance branch? This is why understand what's happening is
important.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
