Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95BBC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6A4820F4;
	Tue,  8 Aug 2023 22:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C6A4820F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Te-t5gKqG67; Tue,  8 Aug 2023 22:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58E682071;
	Tue,  8 Aug 2023 22:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58E682071
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 516301BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D36D40494
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D36D40494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gc6mUghAHqVa for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:06:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C06E4011B
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C06E4011B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79CC71BF204;
 Tue,  8 Aug 2023 22:05:58 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:05:57 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230809000557.50d91f53@windsurf>
In-Reply-To: <a811b514-4a8c-7659-c70a-f86c8915251c@gmail.com>
References: <20230808214153.1453666-1-f.fainelli@gmail.com>
 <20230808235433.671b0ca3@windsurf>
 <a811b514-4a8c-7659-c70a-f86c8915251c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691532358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZftOpQnK0qAMmlAsCjszUQDZfo5m4NKMJT7JrtCZGw=;
 b=VS1o1s2mAchRrk5PUgtsFL9ZbxwMEK+IXN7EF/o8IdWBkNJnlaCmAHj6XPyZP7kAPrGKJm
 oW5zecWdJOXN9nVVjRGBK6EatsslMH9Jkz33dkhgMPv9b7zp7e23QObrwzAvh9MFf2rPLx
 pB5PTkS3buBhyt5q2kJzbwXkKP1WtmhD6N864MBdd0a2cAu7Fw+iMoCEftI/qCel4G62ws
 eizP9YqooMgF3ZXIKv0On6Ap90sTY09CqGVOx5A/CnPH8GqxNtPTU4mUDHlHGhADwKK1/X
 rKxwBt3S4IrzJaatUirMy2qNrip4gS5R8Cb3Yq4wGbXeSWndga6dMxnUefVtjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VS1o1s2m
Subject: Re: [Buildroot] [PATCH] arch/mips: Allow building for MIPS IV
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 8 Aug 2023 14:56:56 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> > This list is quite odd, because it's not even an exhaustive list of the
> > MIPS cores that we support.  
> 
> Good point, I suppose that should be addressed in a separate patch.

Sure thing.

> > Is mips4 supported by glibc, uclibc-ng and musl?  
> 
> Yes, all 3 C libraries still support mips4.

OK.

> > Since IMG kind of gave up on MIPS, we have difficulties in getting some
> > help in Buildroot to maintain MIPS support and address issues, so I'm a
> > bit cautious about adding more MIPS stuff.  
> 
> If there are not too many issues, I suppose you can CC me when you 
> encounter them and I could try to take a look.

OK, sounds good. Sometimes it's not an issue, but simply trying to
understand what all those MIPS cores are, what they support, etc. We'll
definitely reach out to you when such questions arise.

Example of a MIPS-specific build failure:
http://autobuild.buildroot.net/results/4b4/4b488cc62c3c1496109528eb78020c64001d4300/build-end.log
(I haven't investigated, maybe it's trivial).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
