Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F6AEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BD54159F;
	Sun, 20 Aug 2023 21:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BD54159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uM6n1FrUupg3; Sun, 20 Aug 2023 21:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37299415E4;
	Sun, 20 Aug 2023 21:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37299415E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8113D1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D6464032C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D6464032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNurqTqmPz-E for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:49:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35B1440136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B1440136
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8644860003;
 Sun, 20 Aug 2023 21:49:27 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:49:26 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20230820234926.1dc52113@windsurf>
In-Reply-To: <20230819030849.3966233-1-Mr.Bossman075@gmail.com>
References: <20230819030849.3966233-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692568168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVpvcdacaeUMjrD75sbB5ZdLDxILKkSJAPpOuyrIxxk=;
 b=pvB3R419Gs2mPuvFYBXxGoCa1d13IlIzw4CU4wZP0gMcwKOh/etkdfuVUShHAdYmoN+CTj
 Bt5Je+n6I7VP2JzHfIGXcUNhMNKxru0XajqYDkfPgaw0Dg+jOim8swzUxSl+5z5qhNxsoM
 FX9AyDXkMIucVXq4MX2yKs9eJizYwAwOJpJf9JfErVHx9XQqe3P5e56OO7Ah2tCpTBmDEr
 K5nDlDCPbF6Un8ETIeH3vqGyqpQ21DkByxH+qkYAM5nrniZQQOYQi9WPrrf6cPFwHZIO6I
 Yg16quXeOMpID6yIw0YfKV+hlzvZzyI6aR0+DPiSBTGLr9AB2gT8buf8I+tuFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pvB3R419
Subject: Re: [Buildroot] [PATCH] package/elf2flt: Fix build by updating to
 v2023.04
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Greg Ungerer <gerg@kernel.org>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Fri, 18 Aug 2023 23:08:49 -0400
Jesse Taube <mr.bossman075@gmail.com> wrote:

> In elf2flt Greg Ungerer committed "elf2flt: remove use of BFD_VMA_FMT":
> 
> "In binutils-2.40 the BFD_VMA_FMT definition used for printf style
> formatting specifiers has been removed. For reference this was done in
> commit b82817674f46 ("Don't use BFD_VMA_FMT in binutils") in the
> binutils git development tree.
> 
> BFD_VMA_FMT is used in a number of places in the elf2flt code to output
> bfd offsets, values and the like. So it is broken when using the bfd
> code from binutils-2.40 and newer.
> 
> According to the binutils change PRIx64 (and friends) is used to replace
> it, with appropriate casts to keep it clean for 32 and 64 bit platforms.
> Change the elf2flt.c use of it in the same way to fix."
> 
> This patch updates elf2flt to version v2023.04, and rebases all the
> Buildroot patches.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Could you clarify which build failure this is fixing? The commit title
says "fix build" but you don't explain which build failure is being
fixed.

If it's the BFD_VMA_FMT issue, it has already been fixed by commit
https://gitlab.com/buildroot.org/buildroot/-/commit/d79f9c9f416ac5da90cd428916cff0b5288cb03a
in which we have backported the upstream commit you're referring to.

That being said, bumping the version of elf2flt is certainly a good
idea moving forward. However, we should be careful when doing this, as
updating elf2flt has several times in the past proven to come with a
number of regressions.

Romain: do you have some suggestions of defconfigs/configurations to
test/check after doing an elf2flt bump?

Also, Jesse: your bump is not only rebasing all Buildroot patches, some
are dropped. It would be good to mention which patches are dropped (and
what is the corresponding upstream commit), and which patches are
rebased.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
