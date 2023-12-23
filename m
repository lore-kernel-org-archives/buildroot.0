Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EA8C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4AF782195;
	Sat, 23 Dec 2023 20:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4AF782195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTvCsdKMVkSv; Sat, 23 Dec 2023 20:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DAA881A95;
	Sat, 23 Dec 2023 20:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DAA881A95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3371BF388
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D8B81A95
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D8B81A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKo33RDxLXp1 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:10:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0259D814B6
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0259D814B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AFEA20003;
 Sat, 23 Dec 2023 20:10:18 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:10:17 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231223211017.73b6f21a@windsurf>
In-Reply-To: <ZXQzLeF6j3U1TOjU@landeda>
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
 <ZXOehwwVDyiGPpRf@landeda>
 <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
 <ZXOi7tN9L6o6nEmp@landeda>
 <CAPi7W81SxGKzj7feR4i6TtwJZNjBYsADqMw-2ZriWb2oLc+bTQ@mail.gmail.com>
 <ZXQzLeF6j3U1TOjU@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703362219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Yc19wriAjUEoFRqn7Qe4YZ2iRCRhAo0CBt3OelwzB8=;
 b=fVahp6DJ6ir/bw0gzDUq4AbTpVlpL3nEb5fouEbvd8vYNrbkjo+tPiD4i78IzG05DpkfnV
 RrShT4vobJK/9QXBgAeClpX11s70ZAZJ4DbAcZObwHdVb5uy0a1eW84Q1DbVPEiJBuF0Gh
 pKVnigAwhydIsCqBWY+kq3fXdUi541QOSx8njRC16qBZGgEmy7/W3bxxiFeY03cPO1irrz
 ZzuVbfX96b4J66pEnkE0mZYWKtrTeAZ896HPqqeqFb2Wu6bzALJ5CdDDwdipfCekVpJYi4
 cwSrjJyENogTZ1wMl2X6y7maeyto3IvTVoko1vAQdsnLJwWPmLcbRf5H9y6yUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fVahp6DJ
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 9 Dec 2023 10:28:13 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Can you please respin to account for AS and OBJDUMP, and add a blurb
> that CFLAGS is overriden but that's OK?

Then, does it make sense to pass $(TARGET_CONFIGURE_OPTS) in the
environment altogether?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
