Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36F4C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 22:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF6D403D6;
	Fri,  5 Jan 2024 22:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AF6D403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G43L7I7by6kW; Fri,  5 Jan 2024 22:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70020437A9;
	Fri,  5 Jan 2024 22:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70020437A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8877C1BF2B4
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5784561488
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5784561488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEtsd4nrW6lK for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 22:50:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AEEC6146E
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 22:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AEEC6146E
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9C73C0005;
 Fri,  5 Jan 2024 22:50:52 +0000 (UTC)
Date: Fri, 5 Jan 2024 23:50:52 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240105235052.1f70db20@windsurf>
In-Reply-To: <20240105191710.1330461-1-abrodkin@synopsys.com>
References: <20240105191710.1330461-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704495053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtkZo/jh8HPfDviWKaiTzZ5RCNQPLpASG+X1c15Xm0g=;
 b=CiEt3y++chOAH0qsZU4ula0X1MQUUZpWtTrQXWe+U357tC+yJkXj2/VkdTgAVsHy5+a73y
 9TWL+mcmbznhgYmKuNDp4WVeNYz2FQYNEg4Lcxr4vS0v+qGG1injqYi4SAT+muvtAH2kyw
 pNYl6uW2jsr6pStSVqAZy8gRFiU19+gG1E/w9nnDM2TPB1dwCM2N3KaosBuKpjuIdtQgAB
 kEXOAvkCwFr/uzMtGlRXAKVrwiTpxfbys2XvZyH2uSxPALgLFlB+tQ/rlWkucCs0iGsB7I
 A3EuzYfsihdKjWtGE7ZtC62c8Fz1vRb4r4Q4c4x9qBCOQeYuJi5iSVTu8MtZEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CiEt3y++
Subject: Re: [Buildroot] [PATCH v2] arch: Set max/common-page-size for
 libgcc & libstdc++
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Vladimir Isaev <VVIsaev@gmail.com>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jan 2024 11:17:10 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> With [1], [2] & [3] we made sure Buildroot packages get built with
> proper MMU page size assumed. This was done nicely through insertion of
> required flags into the toolchain wrapper so that there's no need to
> pass these flags to each and every package separately - toolchain
> wrapper used for real building has all set internally and so proper
> flags are impleicitly used.
> 
> But there's yet another corner case which is not handled that way -
> these are binaries or rather libraries which are being used as a part of
> GCC compilation: libgcc_s.so.1 and libstdc++.so.
> 
> And so to make sure both the libraries get built properly we need to set
> TARGET_CFLAGS (cures libgcc_s.so) & TARGET_LDFLAGS (cures libstdc++.so).
> 
> In case of ARM by defaut 64 KiB page size seems to be used, as w/o that
> patch I see the following for BR2_ARM64_PAGE_SIZE_4K=y:
> --------------------------->8----------------------------  
> $ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

Applied to master with a few minor improvements in the commit title and
commit log. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
