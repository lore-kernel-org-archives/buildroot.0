Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7618C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 09:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2458A41999;
	Sat, 12 Aug 2023 09:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2458A41999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yI-kldb308v4; Sat, 12 Aug 2023 09:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 139A6418CB;
	Sat, 12 Aug 2023 09:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139A6418CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED0CF1BF863
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95570418CB
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 09:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95570418CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsHbSX8fQoLW for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 09:56:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D988141847
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 09:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D988141847
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3B5AFF805;
 Sat, 12 Aug 2023 09:56:40 +0000 (UTC)
Date: Sat, 12 Aug 2023 11:56:39 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230812115639.140bd2d5@windsurf>
In-Reply-To: <10318595.nUPlyArG6x@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
 <10318595.nUPlyArG6x@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691834201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFgOzlubJ0OzsGS/e8rAuOgnvV9fok0+r7YU2V2X39c=;
 b=n3as5JIAOb2JhQTyfbvdybgsKj+H/57cJYbLJEzUV91wDCSVFB2NuFekNkGqcIDJqHhVOv
 TbR0B4PGUhhFARh3AbjPBg+E8WkTWBfX68YMh1kjwOqLt+mATtGorT9EetqXYRQjIIBFFI
 EnX9k38LyHbZaa2PGtbintA+3g2cAxsZD5r/KE4KDZeRAonMbEJUG3Vj3VHoW5jgO8Js1t
 yVbkPshOiPeJT2xp2iXPoM3yCcNH13gV1C1A7yX1SP8F64dielqYEY/32JwQfLQQjvI562
 yigMa2LJAoOCHcwgc87t9LUBrgE8yjxSBId+BJYAnqRMA/IpbUgsaWQHdp4zXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n3as5JIA
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
Cc: Robert Nelson <robertcnelson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 11:51:47 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> > Okay Kilian, these all build with
> > x86_64-gcc-13.2.0-nolibc-riscv64-linux.tar.xz  
> 
> Where exactly do I find kernel.org's x86_64-gcc-13.2.0-nolibc-riscv64-
> linux.tar.xz toolchain? (Yes, my questions are that stupid ;)) Should I prefer 
> it to the gcc 13.2 toolchain build by buildroot natively?

Kernel.org toolchains are at https://mirrors.edge.kernel.org/pub/tools/crosstool/.

However, this is not very relevant: if it doesn't build with the
Buildroot provided toolchain, we cannot take it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
