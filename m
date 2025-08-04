Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010D0C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4C961352;
	Mon,  4 Aug 2025 19:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRGJ-KWE-XNg; Mon,  4 Aug 2025 19:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E920D60BBE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E920D60BBE;
	Mon,  4 Aug 2025 19:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57100118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 495B160ED4
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-c7-sl1dT2d for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E5E960A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5E960A42
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E5E960A42
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 808CE4434F;
 Mon,  4 Aug 2025 19:40:48 +0000 (UTC)
Date: Mon, 4 Aug 2025 21:40:47 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>, <giulio.benetti@benettiengineering.com>,
 <ju.o@free.fr>, <romain.naour@gmail.com>
Message-ID: <20250804214047.5cfcf471@windsurf>
In-Reply-To: <20250728045145.132333-1-neal.frager@amd.com>
References: <20250728045145.132333-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudefudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeuudfhffdutdelleeiffevheeuffethfegieejffevvdeuveduudejleejfedvnecuffhomhgrihhnpehgnhhurdhorhhgpdhoiihlrggsshdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrm
 hgurdgtohhmpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754336448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5ZBtZovRZ7m4CSzxZzjKsJ2jdVU/K8MuVKYcR0fRTo=;
 b=azYt6RdUSjfPW5Y/3IQSHpQgidyUt5X2Z5w5pNtlFMT8Ju80aVrDLy4zymh9mgAD/1ULNI
 KDAqGPRctJrjv48J8V91yg/HSt1n25FCn4OD/rJp1oBTsDUKUeWb9tKn1/xTXMDx4IlZ+c
 gjtDuAr4HeC8ysaCTwfff1J/9Jet1IyuB8a4CyNVholpbUPD7m1TdR/6eJsP/iFEGZPml8
 Lyzqf3ua/gI5JpYRNwctVHE1XchzpvJgtT0sO85WzV7HMjw3HEOsLvrOi47wLle5R30S3b
 NlvcO1He7x8Ndu9oLmhzkM9e1782q+E2rRruOYYx/IMjsxIKbKhPKfrkk0Z3uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=azYt6RdU
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze atomic
 support
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

Hello Neal,

On Mon, 28 Jul 2025 05:51:45 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds atomic test and set support for the microblaze arch.  A patch
> is required to use atomic test and set with gcc 14 and 15 which has been
> submitted upstream.
> 
> To test this patch with gcc 14:
> $ cat > .config<<EOF
> BR2_microblazeel=y
> BR2_GCC_VERSION_14_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ACPITOOL=y
> EOF
> $ make olddefconfig
> $ make
> 
> To test this patch with gcc 15:
> $ cat > .config<<EOF
> BR2_microblazeel=y
> BR2_GCC_VERSION_15_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_ACPITOOL=y
> EOF
> $ make olddefconfig
> $ make
> 
> Fixes: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
> Upstream: https://patchwork.ozlabs.org/project/gcc/list/?series=466193
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thanks a lot for this patch, which I have successfully tested, so:

Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

However, there is now a separate problem: a build with gcc 14.x
generates a working user-space, but a build with gcc 15.x does not.

Try to build qemu_microblazeel_mmu_defconfig and then run it under qemu:

  ./output/host/bin/qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

it works fine.

Now, change to GCC 15.x, rebuild from scratch, try again: the kernel
will boot, but the boot will stop at:

Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux

and never go further.

Any idea?

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
