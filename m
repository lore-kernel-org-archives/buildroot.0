Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F0BC87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 20:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B239F8293D;
	Sun, 10 Aug 2025 20:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2IZmvVp_vhI; Sun, 10 Aug 2025 20:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA9DB82923
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9DB82923;
	Sun, 10 Aug 2025 20:16:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19C5231
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B63740A41
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UF91b28y55ba for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 20:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1C3E40A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C3E40A3E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1C3E40A3E
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 20:16:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B83A4436A;
 Sun, 10 Aug 2025 20:16:09 +0000 (UTC)
Date: Sun, 10 Aug 2025 22:16:07 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20250810221607.487515bf@windsurf>
In-Reply-To: <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
 <0ead42e3-6522-4f92-8a21-a8c8352375c2@smile.fr>
 <20250810175224.788ea11f@windsurf>
 <875xevow94.fsf@dell.be.48ers.dk>
 <28185e62-aff8-4cad-ac61-a466c85e05a0@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedtheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudduueeftdejhfetledugfevgfevtefgudfgueeffedutedvuedvteefvdduudeunecuffhomhgrihhnpehgnhhurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhop
 egsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754856970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5p4aZF7A2IEO4bEGKf0R11TQuN9MqQxk00ZcjnRGsek=;
 b=dljPe+F9GsI37vuluF6XCMqL5EgJ27l7HRS0EYOSDYNLV5Qm9BMqHf97rRA0nk3lpKJ7bl
 otPaUb29kS1R92wVWcdWEk4GssM26dpszo2Qh81VEM1fiqZL+qCI3kCQg/VCuLux/Bl0c2
 UYTAhy/uID8zPBeruyHk/rd127FiNXUXc/kngI1gVyFia/3Yp4+WrHkH1KQ3BvpoH5mJ0W
 FdWkUQFQETgqtqwgxVXIvt5+4ATV21u5TvOwQYiZUrts4HZq7JqsP+xfcHn/4izRibMMLP
 vEDIBgYdkCIZbRPodBYTbPlg6khpUUcAmQM7ZgE7r+NcGAfCwzWjdEIr4WST6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dljPe+F9
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Aug 2025 21:08:00 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Yes, we need another patch [1] to be able to test the rootfs with Qemu.
> Obviously this patch [1] is still unsure (except if you let me patch gcc code :p)

I think this patch is reasonably OK. First of all, it very obviously
only touches Microblaze code, so at worst we risk breaking
Microblaze... which is anyway already broken. Also, this patch
basically restore the behavior that was happening on Microblaze prior
to
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b.
So overall, I think Romain you can submit this as a proper patch to
Buildroot, I think it's a "good enough" workaround for something like
Microblaze.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
