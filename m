Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4003C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6988B60BA6;
	Tue,  4 Feb 2025 13:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMSfpWsvEAbK; Tue,  4 Feb 2025 13:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67AFE60E73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67AFE60E73;
	Tue,  4 Feb 2025 13:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70EB8185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5314360F05
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfC_FqbuFjx7 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07FBC60BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FBC60BA6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07FBC60BA6
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:08:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D571E442EA;
 Tue,  4 Feb 2025 13:08:09 +0000 (UTC)
Date: Tue, 4 Feb 2025 14:08:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, Adam Duskett
 <adam.duskett@amarulasolutions.com>
Message-ID: <20250204140808.5c6fe0fa@windsurf>
In-Reply-To: <20250204-repair_foot-v1-1-498406d0a384@bootlin.com>
References: <20250204-repair_foot-v1-1-498406d0a384@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekudffgeettedtfeeuheekjedthfelgefhffdtfeeujefgvdefveetudffhefgleenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 heprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738674490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPgkA48N6RGJzzug9afRxctjWkhbSyuwpP/D6kZy7mM=;
 b=Hxl1BJJl3uSZEZK5O5Fd2A5OySCUjPSgnC9bPgwW2d1f6PTnzsl0YZork3BwJZJf//A/NO
 w9g/krngJM/kOpX0AHkqO4UkgQZZQUI/th3Ws6bA2XeWVGGPfEt6eDYCQdZAO/CSg8AvAZ
 Mrj97IhZfPGW4zZFVcSrh+nRV7QluW1NiuseKM3Yaljwk+4G19xL4BtbzTpyH+RJPKEXse
 OBSwI8tHqY+j4Ibh4TU64TDQxHrs2bE+NNjlYH0iY1En73GEGR2axzzW+MAzX6K+glk3aE
 rlvxQOnNNUMI5DZxoNQXIkAIZsudAG231/0sWQ0paaaP3aeg4Ykf/M/NHaWS1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hxl1BJJl
Subject: Re: [Buildroot] [PATCH] package/foot: support soft-float
 architecture
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, 04 Feb 2025 12:27:31 +0100
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> Architecture using soft float don't support the math FE_* exceptions.
> This commit adds a patch to conditionnally build the FE_* exception
> handling.

Are you sure it's related to soft-float? For example, ARC has floating
point, but does support some of those FE exceptions.

See for example:

# z3 supports arch for which libc fenv.h provides all four macros:
# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
# See for example in glibc https://sourceware.org/git/glibc.git
# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
config BR2_PACKAGE_Z3_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64 || BR2_aarch64_be
        default y if BR2_arceb || BR2_arcle
        default y if BR2_arm || BR2_armeb
        default y if BR2_i386
        default y if BR2_m68k
        # BR2_microblaze has only FE_TONEAREST
        default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
        default y if BR2_or1k
        default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
        default y if BR2_riscv
        default y if BR2_s390x
        # BR2_sh has only FE_{TONEAREST,TOWARDZERO}
        default y if BR2_sparc || BR2_sparc64
        default y if BR2_x86_64
        # BR2_xtensa supports only uclibc which does not have fenv.h

We have this sort of stuff in a few places. Maybe we need to factorize
that?


> +diff --git a/box-drawing.c b/box-drawing.c
> +index 1c613051..e5f67ca7 100644
> +--- a/box-drawing.c
> ++++ b/box-drawing.c
> +@@ -1468,8 +1468,11 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
> +         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
> + 
> +         /* See math_error(7) */
> +-        if (errno != 0 ||
> +-            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
> ++        if (errno != 0
> ++        #if defined (FE_INVALID) && defined (FE_DIVBYZERO) && defined (FE_OVERFLOW) && defined (FE_UNDERFLOW)
> ++            || fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW)
> ++        #endif

Is it OK to just compile out this code? I mean yes it fixes the build
issues, but is that correct from a runtime perspective?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
