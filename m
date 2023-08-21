Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE84EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 12:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4BB408AA;
	Mon, 21 Aug 2023 12:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4BB408AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrHbY6o6c9b5; Mon, 21 Aug 2023 12:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A35408A8;
	Mon, 21 Aug 2023 12:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A35408A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0491C1BF388
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 12:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06B8408A8
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 12:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06B8408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22dvdxlLiFqM for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 12:54:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 712FF401BE
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 12:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 712FF401BE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 819B7E000E;
 Mon, 21 Aug 2023 12:54:16 +0000 (UTC)
Date: Mon, 21 Aug 2023 14:54:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230821145415.4b714ed0@windsurf>
In-Reply-To: <20230817191414.106738-1-bernd@kuhls.net>
References: <20230817191414.106738-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692622456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=valbH5MlOlnhhjEyjWQFTSq5hS+ih/6EDgjfsFvicM8=;
 b=AxbGkzchkcylEOAsnhtDPl3ofX8PxI0gtJVbVtf0+6GRyO/Q2Ph3d3n67X2Nz1tAIpo2x3
 ExJ6c4VpfxgauVQetUN/dCe4rUf+FwoTKeMtqMXClMcvAcc1dwMQegcktrtUS0PRDEWTUQ
 Zb2TPj8iVtefhIpssJIrFnJckxuHkDRDfCHsSS5STL+qAnZp2bnjULkSOizxy3Ha72oESL
 hh+ioAkKWJljHU/QdkR5LeSnY/hcdUZW/Ax0fqmXj2+UzCuIIXSzeuoyBghAHzPLj3Tg5E
 qMA+eyt5VEEgyN3e1YMneXFydoc8KZ955VE2CDrjaxqqeSORsC6bXiLVdSpLEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AxbGkzch
Subject: Re: [Buildroot] [PATCH 1/2] package/libks: bump version to 2.0.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 21:14:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated license hash due to copyright year bump:
> https://github.com/signalwire/libks/commit/52a3f2a54663d7bb50a498153975d4dfe1f8fe63
> 
> Needed for freeswitch bump to 1.10.10:
> https://github.com/signalwire/freeswitch/commit/7c1faeff48aef815b4cc5f22eb9ead52726dbd95
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libks/libks.hash | 4 ++--
>  package/libks/libks.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
