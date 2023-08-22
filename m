Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CB2EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 22:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1624154A;
	Tue, 22 Aug 2023 22:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1624154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DFb-Wn88Lpz; Tue, 22 Aug 2023 22:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B9A141610;
	Tue, 22 Aug 2023 22:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B9A141610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0781BF31A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 22:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4694981F6E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 22:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4694981F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntDWQTOB8Y37 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 22:01:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD88481F30
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 22:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD88481F30
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88F74240002;
 Tue, 22 Aug 2023 22:01:17 +0000 (UTC)
Date: Wed, 23 Aug 2023 00:01:16 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>, Neal Frager
 <neal.frager@amd.com>
Message-ID: <20230823000116.5f8ec3c5@windsurf>
In-Reply-To: <20230407171648.6fca3a4d@booty>
References: <20230327170604.22854-1-neal.frager@amd.com>
 <20230407171648.6fca3a4d@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692741678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYyvlTz4C3R3XLQTx37KvX+Uy92HJOeQRy6W1nMrfeQ=;
 b=LYT2/VUj1kXIzNL9VuFHVRVSjswj0svxJ2lQilrRFuC5u9ys+Gf79qzbe1WnRntBbJuxeG
 D7R+LOmbfXTRyxAKNXw/c1UAhzVMKoRm7C9nrZqTvIfPUsbSh6WzzHDMa8RRX/4ieJG+bT
 OEjGsKygb/JJ1IGEHhsvZBI3qYm8g3xbTLzjhgI33tYBPnnNwocA2nFOel7mqni4PwOvEO
 sEPVc6tiEVHLEXGZXOqm0Mrpa6vrN1UTSb1ZH1Le9i9K6k3LUoiuMekSISL1HONqEM0Rim
 WvumEBvLuKc4iYOgXcY0mfiL0FkWX2Y65Kte4Y1v8p4vgo52m7r3THdq4Wh4fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LYT2/VUj
Subject: Re: [Buildroot] [PATCH v2 1/2] package/zynqmp-firmware: new package
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
Cc: michal.simek@amd.com, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 ibai.erkiaga-elorza@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 7 Apr 2023 17:16:48 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> These two patches look good, and I appreciate a lot your effort, however
> I'm not sure it's a good idea to support both an external and a
> generated toolchain. It makes things more complicated on the Buildroot
> side and I'm not aware of any actual benefits.
> 
> Moreover if we take these patches now we would to some extent encourage
> users to use an external Microblaze toolchain, possibly reducing usage
> of the generated one for initial users. And I guess we would stick to
> the external toolchain as a default for the future because it's what
> was there initially.
> 
> So I would prefer waiting until we have a working
> Buildroot-generated toolchain and initially support only that. Support
> for an external toolchain can be added easily later, in case the
> generated one were not suitable for good reasons.
> 
> Do you have any updates on your work to generate a minimal Microblaze
> toolchain within Buildroot? Should you be facing any issues, remember
> the Buildroot community can be very helpful!

I agree with Luca, but I would relax a bit the requirement and say I
would be fine with a pre-built external toolchain to be packaged, like
package/arm-gnu-toolchain/ does for a pre-built ARM32 bare-metal
toolchain.

I looked a bit for such a pre-built Microblaze toolchain, but all what
Xilinx provides is hidden inside multi-GB archives with zillions of
things, and these archives are themselves accessible with a proper
login on the Xilinx site.

So either Xilinx puts online a bare-metal toolchain that we can package
like package/arm-gnu-toolchain/, or we look at adding support for
building a bare-metal toolchain in Buildroot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
