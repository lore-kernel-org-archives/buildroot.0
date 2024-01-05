Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CF3C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45C9143553;
	Fri,  5 Jan 2024 08:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45C9143553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNKlt_c0_HgF; Fri,  5 Jan 2024 08:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 412BE4363F;
	Fri,  5 Jan 2024 08:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412BE4363F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313121BF3AD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08749834F4
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08749834F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRF3jjWAEHQw for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:36:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78C71821B3
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C71821B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A93220009;
 Fri,  5 Jan 2024 08:36:45 +0000 (UTC)
Date: Fri, 5 Jan 2024 09:36:44 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240105093644.50646ce4@windsurf>
In-Reply-To: <20240104171224.1469776-1-abrodkin@synopsys.com>
References: <20240104171224.1469776-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704443805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfbeN16zZDQGp+UoSsIU8hainNfmPJmGGoI+ooZHIbQ=;
 b=cqXN4emc43jeVsB+7Wc2wzc1D1zD4aLOYcHgtIPRiXqtRQPhX51+1WVHARCD27S3S0LQbD
 mnsJfb2X6eaVJFkw11a34l05f4W/++Cok4TvpH65YmMBYxcOFxUFA3OUx4CJBrjCB449kY
 CZhVqK+pp0ca9oClv4gKv42p48uPesSWyFo2LPBDy58YIOWvUSJIdE96mG1KB4EWyUl4k/
 ycklDdy2UixKsNEQiKtS+rZi1gZywgkkZ2xhSguqibN1ZbJKlFp2CHoNIQgtCeax2AgVrw
 f/szgDNoS0WQtm8m2czHZyiSQFbwAfx1Y+KOo6dz7wKEPPvjj/fo4yAdvLLVkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cqXN4emc
Subject: Re: [Buildroot] [PATCH] ARC: Switch toolchain components to
 arc-2023.09-release
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Thu,  4 Jan 2024 09:12:24 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> With the most recent ARC GNU toolchain version released [1]
> we may switch to its stable and verified components for Buildroot's
> built-in toolchian.
> 
> And while for ARCompact (i.e. ARC700) & ARCv2 (ARC HS38 & HS48)
> processors upstream components work just fine, in this new release
> of ARC GNU toolchain we have also support for newer ARCv3 procesors.
> 
> And so that update is more of an enabler for introduction of ARCv3
> in the next series of patches.
> 
> [1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.09-release
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>

Thanks, applied, with one small change.

> -ifeq ($(BR2_GDB_VERSION_14)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
> +# GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
> +# requires MPFR as well.
> +ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc)$(BR2_PACKAGE_GDB_DEBUGGER),yy)

Changed to:

ifeq ($(BR2_GDB_VERSION_14)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)

I know BR2_GDB_VERSION_14 and BR2_arc are mutually exclusive for now,
but I prefer to make this clear here.

BTW, could you submit a patch that aligns gdb with binutils and gcc: we
should be able to chose an upstream version of gdb even on ARC, while
for now, the ARC special version is forced on ARC (note: perhaps it is
in another series from you, I haven't reviewed all of them yet).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
