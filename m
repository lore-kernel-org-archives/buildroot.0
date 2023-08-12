Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EBCC0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 09:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFC041BCD;
	Sat, 12 Aug 2023 09:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FFC041BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jikueudYfXkm; Sat, 12 Aug 2023 09:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8F741999;
	Sat, 12 Aug 2023 09:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C8F741999
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29F8B1BF863
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 026E160BE6
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026E160BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IAkOxZ6Fjof for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 09:56:49 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED78060BDC
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 09:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED78060BDC
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 6DFA0A081F;
 Sat, 12 Aug 2023 11:56:46 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 51BF98014D;
 Sat, 12 Aug 2023 11:56:46 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 1400A1001A7;
 Sat, 12 Aug 2023 11:56:46 +0200 (CEST)
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Aug 2023 11:56:45 +0200
Message-ID: <21974407.EfDdHjke4D@kilian-aisec>
In-Reply-To: <20230811164858.36987e01@windsurf>
References: <2691942.mvXUDI8C0e@kilian-aisec> <2160318.Mh6RI2rZIc@kilian-aisec>
 <20230811164858.36987e01@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1063
X-purgate-ID: 154282::1691834206-5F7FA7B6-DA344344/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691834206;
 bh=l9fc7bbKhroZLhAjybPGCEuiRn2lZaz4XEJdbH6oP64=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=IOqN/XLEjeEinU/WmJyVElo3QkBt2t0WIZZ5MkT95mU2EQU9EakhFHqjZe7s2Dn/S
 RHQzJh7usjKzWhfMYbZoS5A9M6tc9TS03BV0QUV/m5RYR9TJ7pe0AAfvou5lqMxnBt
 62dJK15BFcrYWitqX8q+Pay5tIt5hk9AVvv1A0ElQ5X28/C8I2hmPaluIpUpO9tyei
 0nj7+glu5G4vrLZZTsptQZHO4P3ywbcrNLVMhGe3MxE2e5whwdnlbu6YhCNavTXDgg
 y27z1CKJCi1CpA3d34ta87EWW3g0zQwDAMnlWRkPZS/x97tA1GhLA9u2rpnPeSewzl
 H0Ihu3tk+HXjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=IOqN/XLE
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

[--SNIP--]

> From the gcc documentation, it seems like there is no -mcpu=thead-c906,
> but only a -mtune=thead-c906, which only changes optimization
> "details", I don't think it will do anything in terms of supporting a
> non-standard vector extension. However, I'm not an expert in RISC-V
> extensions, so maybe I'm wrong on this.

Yes, I agree. I must have confused it. So it makes sense, that this switch did 
not help.

[--SNIP--]

> > Now I don't know, whether the compiled uboot, kernel and rootfs would
> > function. I would have to test this. But to do so, I guess I would have to
> > figure out how to assemble these parts into an image and how to flash it
> > into the eMMC of the board.
> 
> I only briefly started looking into this. Let me know if you want me to
> summarize my findings.

Yes, I really appreciate all information that may help! I am not very 
experienced, especially when it comes to assembling a boot image from the 
artifacts, so it would be a great help.

Best regards,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
