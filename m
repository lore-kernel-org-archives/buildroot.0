Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC23C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69397832E6;
	Sat, 22 Jul 2023 21:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69397832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ATjEMavrBMi; Sat, 22 Jul 2023 21:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513DF832E7;
	Sat, 22 Jul 2023 21:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513DF832E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD1F11BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8697760E19
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8697760E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZiZ7nSc15o5 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:09:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CECFB60DFA
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECFB60DFA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 431C620005;
 Sat, 22 Jul 2023 21:09:22 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:09:20 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230722230920.02c0a571@windsurf>
In-Reply-To: <20230711220849.1702358-2-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-2-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeWMMEz1aV3BiTmnXIYdkzpkJYC/UzTqAYifO3xicnk=;
 b=bNwqwMtQPwBryC4XvOdVXblqdVnRm3qTrqk/jAlEM23kCTVJ4OTU/NaOXtwEEm75Y/+SOK
 92l8FATviLF+s7Vi13kEJYLDmd06IkKsqFyrqPhdFmR2JUvCTIgjNO/2eIimPQ2nMfzTy1
 4mj2nwCTBlNrs/yCXkWhK5/8R6KP7ieF3H9MP3/9Y/YaIG94ikxphqEThNQVBWE2Qflqgz
 ZODgUOF2vojbbeoXQXL6ZmTbNIFn/d2WDTdtiXHjy2CTLE/uBlq7/lKtt6wJdx756eJRXG
 kWHXmqWRsWo8je7oQ5psAVqjyej0a73IpBhoCHhECGV4PeUh4zy6RV0jZ1DLQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bNwqwMtQ
Subject: Re: [Buildroot] [PATCH v7 2/4] package/go: adjust comments
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 15:08:47 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> -# The go build system is not compatible with ccache, so use
> -# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
> +# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.
> +# See https://github.com/golang/go/issues/11685.

I dropped this chunk, which isn't making any useful change, and
actually my text editor liked the previous wrapping better, so I left
it as-is.

Applied with this chunk reverted. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
