Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66090C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 084B040492;
	Wed, 27 Jul 2022 09:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 084B040492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4l56Y3pD8E4N; Wed, 27 Jul 2022 09:22:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28AB5404AA;
	Wed, 27 Jul 2022 09:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28AB5404AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 228CE1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BABF7408CF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABF7408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xijzsx5UFYIn for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:22:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5470408CC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5470408CC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:22:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA2D524000E;
 Wed, 27 Jul 2022 09:22:08 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:22:07 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220727112207.309f4ec4@windsurf>
In-Reply-To: <20220727083020.GD1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-4-thomas.petazzoni@bootlin.com>
 <20220727083020.GD1085273@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658913731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrcYVH/Kzlen+KPcW+7B9diXmtzHCtGqYjqcVlt0VmQ=;
 b=kKqcDLf9z1vx1eyxhicN9b/yWPlYiR4U3wwmNHupM7S5rpLlolCI0TVwUAFkAuAMWOTISn
 6JMH7j6M/cloNBYCCneBhFpLO4UWj1cn5uphISHDaTWeMjktXuglxWrQedtrZzDS1YWUFM
 yIyo2krQTGwbcbhxWcYKzNixiFjDJX9k4VtqxvUP8c+U6tzWyESIrfFyDjMZmhDPZE4dpt
 VV3/rDpGX8SQbeV2xQzGZCzpw5pH8NjI/W9Opk1dVnwmhuGC0IRH5hQH/+iGYhu40J62WX
 PL5Emou1n7bQV0PsTXn5pF33uYBJoG1dI+RwBftdPl4/lnSv5hQ50r1GnVFskg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kKqcDLf9
Subject: Re: [Buildroot] [PATCH v2 4/4] arch: rework MMU option handling and
 move to "Target architecture" menu
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Mark Corbin <mark@dibsco.co.uk>,
 Jonathan Ben Avraham <yba@tkos.co.il>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Thanks for the review!

On Wed, 27 Jul 2022 10:30:20 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I am not sure why you are removing a generic option in favour of two
> arch-specific options that behave exactly the same.

The motivation is explained in the commit log. Quoting it

================================================================
However, if we simply move it in arch/Config.in, it means that we
would have the following order of options:

 Target architecture
 Target architecture variant
 ABI
 MMU
 Binary format

But really, the MMU option should be right below the Target
architecture variant, and the available ABIs derived from that.
================================================================

> Why not just keep that:
> 
>     config BR2_USE_MMU
>         bool "MMU support" if BR2_ARCH_HAS_MMU_OPTIONAL
>         default y if BR2_ARCH_HAS_MMU_OPTIONAL
> 
> This still achieves what you want:
>   - arch/variants that have a mandatory MMU can directly select
>     BR2_USE_MMU as this patch does, and the prompt does not appear
>     in that case;
>   - arch/variants that have no MMU don't select BR2_USE_MMU, and
>     there is no prompt either
>   - arch/variants that have an optrional MMU select
>     BR2_ARCH_HAS_MMU_OPTIONAL, BR2_USE_MMU is default y, and there
>     is a prompt.
> 
> And then we drop one Kconfig knob (MMU_MANDATORY), and do not need to
> introduce two others (one for riscv and one for xtensa).
> 
> I.e. the case for arch-specific options is not clear to me...

See above :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
