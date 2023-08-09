Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B80C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9380560DA5;
	Wed,  9 Aug 2023 20:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9380560DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zOEuufmLwg2z; Wed,  9 Aug 2023 20:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C3F60E1D;
	Wed,  9 Aug 2023 20:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C3F60E1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 420121BF3EB
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1517C60B73
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1517C60B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOeMrI2dnabv for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 20:49:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7892E60BA8
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 20:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7892E60BA8
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6FE8C0005;
 Wed,  9 Aug 2023 20:49:25 +0000 (UTC)
Date: Wed, 9 Aug 2023 22:49:24 +0200
To: Indrek Kruusa <indrek.kruusa@gmail.com>
Message-ID: <20230809224924.5204e05b@windsurf>
In-Reply-To: <CA+fTLhjjLcwANZ4uatWLQKXq8FObG7-ZOUvpir0bFQVpDZzY+w@mail.gmail.com>
References: <CA+fTLhg9R0KwFb-EZKEYy2U_WgdRzBZyJ6QrmCUv4dCB_kfo8A@mail.gmail.com>
 <20230809195745.5d51785c@windsurf>
 <CA+fTLhjjLcwANZ4uatWLQKXq8FObG7-ZOUvpir0bFQVpDZzY+w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691614165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoikcts4OnNFnREAkcvumDU14DLPCChdsnLxyceFr+M=;
 b=V0yiz1QyUEyYrAXp4N73w0OIDFT+qxPtdTIf0F8m/xs5eR8eygBug2A/l/Vgbco0P8MhTw
 3MvI8idnH0SQEE0De9FvKXJJAscyF0GQacX1ox+2E3nt3uDLBuHb0+BH1dy+BeHKUu/5tT
 Zh2+nuPSHuOMNsqOMiv+cwlSeGELsOocrG6W2U03BSUO0rxhV5LY2NOhA2r6mTA/xbcTIa
 zLZncFfXRtvfxRGQy0n0FlA+AHbCMo0SO/pF7r4gsDLxRQ+X0Nmj3yf7Bo2M30gC9OdplN
 36/V/+z6BepsHVzWXClk4POMR19gk6vtgCLer13QYimxFzLv4kli6WfvFD4/RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V0yiz1Qy
Subject: Re: [Buildroot] [PATCH 1/1] configs/mangopi_mq_d1s: new defconfig
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Aug 2023 22:40:14 +0300
Indrek Kruusa <indrek.kruusa@gmail.com> wrote:

> > We normally try to have board/<vendor>/<board>/  
> 
> I was considering that but it's rather tricky for such boards. MangoPi
> boards are manufactured by AWOL (there is a logo on the board
> usually). In fact this is a subsidiary of the Allwinner but I tend to
> think this name doesn't ring a bell for most people. Second, there is
> a website mangopi.org which consolidates information about different
> mangopi boards. So the 'mangopi' could be the "vendor" also... kind
> of. I really don't know what to do about it.

Lets do board/mangopi/mangopi-mq-d1s/ then. We can always revisit later
if need be.

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
