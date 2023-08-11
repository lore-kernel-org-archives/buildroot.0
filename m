Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE45C001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 14:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FDA08406E;
	Fri, 11 Aug 2023 14:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FDA08406E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0xiCJ-41ANK; Fri, 11 Aug 2023 14:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D59384068;
	Fri, 11 Aug 2023 14:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D59384068
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF171BF295
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46659402A7
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46659402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9bxsDaiO58D for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 14:41:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21B7C4015E
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 14:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21B7C4015E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0997A20002;
 Fri, 11 Aug 2023 14:41:45 +0000 (UTC)
Date: Fri, 11 Aug 2023 16:41:45 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230811164145.2b978818@windsurf>
In-Reply-To: <1766550.VLH7GnMWUR@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec>
 <1766550.VLH7GnMWUR@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691764906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZG2YaHMG2MEaJWCVmJhEKtPgv2Cj4lfBjd/V9PkO06E=;
 b=KhU1zmzRtElWFAEq4EnZQtGRThwR2+yIKNP2QG+ScmHXWTDbJ0bqjAc2Dyk0yQhZW/SZHI
 TFTZm/K1YCCUqQzPZ725WxCYfWVzYAcNkh1N3ee4wiMwFR2iSEXkj7koxyWv8jNjg+0180
 UXHsANNlM81Ul1RXua1e2xzuvIuKQb2YqZIPYRbiE45ZaM646X/GlfLTF43JMSJJZ+BGyV
 hLRLaaKGMN+oTIDr1EBFbaWlw9Szb5MWBBjFEvbOCy7p2YYiixuI31E2uXyqAvwJYotwRZ
 Snncm4H9+oHw5mtnBAhn3lIwyk79vv/4FByFVYCwYlY3iouHwkkq9n49MJiv0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KhU1zmzR
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Aug 2023 13:02:32 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> I also think that there is are similar issues regarding the beaglev_defconfig 
> and the used, very old opensbi version and maybe also the used starfive custom 
> kernel version.
> 
> I could try to bump the versions or add patches until it compiles again. 
> However, I don't have a BeagleV currently at hand, so I would not be able to 
> really test what I produced afterwards. So it might be better someone else, 
> which has access to a BeagleV, has a look.

I do have a BeagleV (not here with me though), but as I replied to
another e-mail, I think we could simply drop beaglev_defconfig as not
many samples of this platform were shipped, and it's no longer produced.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
