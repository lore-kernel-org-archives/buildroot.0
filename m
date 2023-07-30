Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317C0C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 11:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1814146F;
	Sun, 30 Jul 2023 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE1814146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JI6hEq80vHe1; Sun, 30 Jul 2023 11:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0D5410C6;
	Sun, 30 Jul 2023 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0D5410C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCB4A1BF3DC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C578410C6
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C578410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhZxsn1azVXI for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 11:26:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4F52410C8
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 11:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F52410C8
Received: by mail.gandi.net (Postfix) with ESMTPSA id C09CE60008;
 Sun, 30 Jul 2023 11:25:59 +0000 (UTC)
Date: Sun, 30 Jul 2023 13:25:58 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230730132558.3bb1a428@windsurf>
In-Reply-To: <6c02501e-2414-4611-97cb-1460352f55a7@benettiengineering.com>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-2-bernd@kuhls.net>
 <20230730122650.5592af4b@windsurf>
 <6c02501e-2414-4611-97cb-1460352f55a7@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690716360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWs4KPq+ZpfiLUZ+SoiOvEFlbJ3TwvA1m00lVPZkKdM=;
 b=ewL1+vduyKmRFcW0jUsJdlUdviccx8YWFNNLPh84Oc3ESBkNduHCjrpR/tK3LenMj8SDcX
 jLThtLj9vVtczu/gaN2EqTbfYvpe13UVvRPGCYRH7D9lw/YEb++/yvZIND8DyBLDd5Ff6m
 /7xgk2A1mX4qARMjiUDZCnXJTGfmr3aUPc6/oxz32SzHzQbrZ8uV97jNf5RWSpAbCpsfPC
 qwP8U2Isy8Bad5cELD32tnKPQaTpx8QDfCtmfVP9zuCzHpATjfyLyTcXqjXnP4Rj9By+rD
 vHcWACbypYkAhBcJ2eqPxQvY2tVtZqTHHluJTzSpRCO7PlfMxvJKCDqEuG4esA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ewL1+vdu
Subject: Re: [Buildroot] [PATCH 2/7] package/libheif: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jul 2023 12:56:42 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> there is a possible toolchain gcc bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
> 
> but they point this to be a binutils bug, so I'm going to open a bug
> in Sourceware. I can't find it already, so yes, it must be open.
> We then need to add a BR2_TOOLCHAIN_HAS_BINUTILS_BUG_ and then I can
> check against it with the workaround(-fno-dwarf2-cfi-asm) and see if
> someone will fix it in binutils and backport patches.
> BUT I see only now that for BR2_m68k_cf C/CXXFLAGS have by default
> -fno-dwarf2-cfi-asm enabled and if that doesn't make the trick I need
> to find another work-around, or maybe it's completely another bug at
> this point. Soon I'll be on holidays and I will have more time so
> I will look into it.

Thanks for the feedback. I don't think we really need to find a
workaround, as I don't think we care much about m68k_cf support. It's
just that I prefer to have a clear relationship between an exclusion in
Buildroot (don't build this package) and a gcc or binutils bug, rather
than random architecture exclusions.

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
