Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AD8CFA44E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B3424034D;
	Wed, 23 Oct 2024 16:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8cOi_g4c5aW; Wed, 23 Oct 2024 16:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC6840232
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC6840232;
	Wed, 23 Oct 2024 16:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E58127ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697DC810C7
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ncn2UUcMArL for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BB87810C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB87810C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BB87810C6
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CB6660007;
 Wed, 23 Oct 2024 16:19:19 +0000 (UTC)
Date: Wed, 23 Oct 2024 18:19:18 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241023181918.13ba7a70@windsurf>
In-Reply-To: <ZxgeOudkPEBVJBkz@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-4-niklas.cassel@wdc.com>
 <20241022224945.4dc67b89@windsurf> <ZxgeOudkPEBVJBkz@ryzen>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729700360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKo+uO08fOdPtobU49NuxrV1HT6tCX+UccPD3wVoD5E=;
 b=enTqEmRe5NvT0QyrVC/5DXbNqD59qunDZs85fnQpovZPy8Rj5ui9pP4YMnGE55eiNVNV5r
 NZeGqRhiJHSeWt7IdOU8GtvO/YRoof6FK3FTKI0lbYcDwrFutWGGaiQMwH50rl6bhSdnBn
 DuNNl00vXQ3Og6gdh/RCdfmA43gUxj2EGrElkJstRQ8QTXtluOFwDzVNvk2Z1YQSPFXS20
 3d1LmCSL6p2jwem+uS/q5UjzoebS4XnZ32WigG4O9xoGKoKuxZs5r4K0FzGxAXBMTDAWat
 N+zFB4FkmTasl+/UxKF6zc3i/Kb2Y2s8mTkPQTPS0/rNMJcQrovpNuwHIG2I7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=enTqEmRe
Subject: Re: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
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

Hello Niklas,

On Tue, 22 Oct 2024 21:50:51 +0000
Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> I don't feel comfortable to change it for platforms that I don't have
> access too.

Absolutely, but we can evolve what we can consider to be "the best
practice", documented in the manual.

> The reason why I saw this was because u-boot has support for searching
> for a suitable rootfs (if CONFIG_PARTITION_TYPE_GUID).
> 
> and then specifying the type using type=
> in e.g. PARTS_DEFAULT.

PARTS_DEFAULT is used to assign the "partitions" environment variable,
but I don't see anything that uses that except the fastboot
implementation. So I believe this PARTS_DEFAULT is only used in
conjunction with fastboot, which is irrelevant to our discussion.

> However:
> 1) rock5b does not have the uboot CONFIG_PARTITION_TYPE_GUID Kconfig enabled.
> 2) rockchip is incorrectly specifying the arm64 partition type GUID:
> https://github.com/u-boot/u-boot/blob/master/include/configs/rockchip-common.h#L19
> using uuid= and not type=.

Again, this is only used for fastboot I believe, so not relevant.

> So currently a uboot built for rockchip will only automatically find the rootfs
> partition if the rootfs partition (incorrectly) has set the partition UUID to
> the arm64 partition type UUID.

I don't think so, at least based on the evidence that you provide.

> Rock5b in buildroot does not rely on this automatic finding of rootfs anyway,
> so all good.
> 
> However, there might be other uboot configurations in uboot that actually has
> set the type= a specific partition type GUID in PARTS_DEFAULT, and I don't
> want to risk breaking any platform.

See above.

I must say I'm a bit confused by your reasoning, which I have a hard
time following. Could you walk me more step by step? Either I'm missing
something (very possible), or you're missing something (also possible,
considering how crazy the U-Boot environment and boot flow is...).

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
