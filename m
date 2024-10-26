Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93820D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607B980C1D;
	Sat, 26 Oct 2024 21:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVcEAIXPPWF6; Sat, 26 Oct 2024 21:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FAE080C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAE080C27;
	Sat, 26 Oct 2024 21:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A8C5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D49AA60597
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bno8KTHq9nn0 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:31:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 822326058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822326058D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 822326058D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:31:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E38AFF804;
 Sat, 26 Oct 2024 21:31:02 +0000 (UTC)
Date: Sat, 26 Oct 2024 23:31:01 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, Asaf Kahlon
 <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20241026233101.323e096b@windsurf>
In-Reply-To: <CADvTj4qxs4=Er411V1-baHEVmr9FrTpOWzD3s-3oqM7ppqAb-Q@mail.gmail.com>
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20241026174451.0b1e2c89@windsurf>
 <CADvTj4qxs4=Er411V1-baHEVmr9FrTpOWzD3s-3oqM7ppqAb-Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729978264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPmvHIf/+Rdr6BzP47zMwsLUC9cEggyAbKKbz+RgNBc=;
 b=XfgkFfP8RTOcq4QJGDk+NLWjK+jpsr3M5V60GD3f1YFbImlFUg+/8NnM4oHPu6UdqSNAnR
 MdvOH5ICg0OMnMrwkP2CIr1NGdGcS+d0dL3R9DiRIYmNrae7W3qeV3qsaXmSkrXrG6Hl1Z
 UtqLEoCBRbO72JQkYlKiRJRrUmN86Jsq7zqp41S39/KxuKtMBahczj3F+ncS//Y1MGsa4d
 wkONF6mXxno6EnmmMj1MnBLSWf9+Q/ghnmRIl1p/PDi2mHIT93LAb4kBuudHVRdQwZKr2n
 CCYx0uQMWuRQNil3ecDuJbwYefV9EpIu+Ga+k0v7uvkyzdnsH51CkJdikyl+2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XfgkFfP8
Subject: Re: [Buildroot] [PATCH v5 1/3] package/python-numpy: bump to
 version 1.26.4
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

Hello James,

On Sat, 26 Oct 2024 15:15:03 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Please document in the .mk file how you could those values. You
> > explained it in a reply to your v4, but I believe it should be kept in
> > the package for posterity. More comment on this below.  
> 
> Not sure the best way to describe how I got these, like should I put my
> test output somewhere?

A comment that explains how you got it, maybe even the test program, etc.


> > # Some good comment here about how those values were found
> > config BR2_PACKAGE_PYTHON_NUMPY_LONGDOUBLE_FORMAT
> >         string
> >         default "IEEE_DOUBLE_LE" if BR2_... || BR2_... || BR2_...
> >         default "IEEE_DOUBLE_BE" if BR2_... || BR2_...
> >
> > config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> >         bool
> >         default y if BR2_PACKAGE_PYTHON_NUMPY_LONGDOUBLE_FORMAT != ""
> >
> > This way we cannot miss any case :-)  
> 
> Yeah, not sure what style is best, I kind of just went with this one
> because we essentially do the same sort of thing for meson:
> https://github.com/buildroot/buildroot/blob/2024.08.1/package/pkg-meson.mk#L32-L69

Yeah, I agree both options can work. What prompted me to suggest the
Config.in solution is precisely that you had forgotten some
architectures in the .mk file, showing that it made sense to tie
together the list of architectures with the long double format list.

> > Could you have a look into this? I wanted to rework myself, but since
> > the value is missing for some architectures (i386), I couldn't really
> > do it easily.  
> 
> Oh, I did actually generate that value here, must have forgotten to copy it:
> https://gist.github.com/jameshilliard/b057791b55bd32884301734df5b781db#file-numpy-qemu-test-txt-L16-L18

That's my point: your list of long double format in the .mk file was
not matching with the list of supported CPU architectures described in
the Config.in file.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
