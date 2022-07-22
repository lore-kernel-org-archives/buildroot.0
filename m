Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3677C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 12:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 557BC81286;
	Fri, 22 Jul 2022 12:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557BC81286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rg7SM3VniguY; Fri, 22 Jul 2022 12:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E54F80C46;
	Fri, 22 Jul 2022 12:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E54F80C46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B33841BF85D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 12:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811B260FEF
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 12:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811B260FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLGvqAV47zUt for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 12:17:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44C8605B3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B44C8605B3
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 12:17:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 395141BF20C;
 Fri, 22 Jul 2022 12:17:52 +0000 (UTC)
Date: Fri, 22 Jul 2022 14:17:50 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20220722141750.0311355d@windsurf>
In-Reply-To: <CAMo8BfJ+AdrewRkuZzMq+_4w6=A-7SkC16MXneWkTHJ+i_=Crw@mail.gmail.com>
References: <20220722100920.00132969@windsurf>
 <CAMo8BfJ+AdrewRkuZzMq+_4w6=A-7SkC16MXneWkTHJ+i_=Crw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658492272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njj/ecZMvV2SWtKM3C8RSp3bwtEO9uAsRuco7xRXfGY=;
 b=ddfOtagN9XQyXPubLLWZPLjozlAcUX6NIlhXdIMtm4s0kbVLfKFEyq+3NPLuW1PpFGKDPH
 rX/q9GujZrqJ/MPashPubzIK1PYP/nEv5LliCa83NrZWcJMWknblwzwlqnXN9f5Yr/qzOq
 wJS2mX+HuJY8xB3bNzpo89FzAPPQS8azRCdAxv9p8COoLFsloA4CegThRBGkH3zvoKpeq/
 /7Ie5iy8MTyY7bTXDgPbJBogvO9NF9VCpqzGDd7aEbtL4LosGGyYGzYkiB+Sh1te+yiMhs
 EbzJv2UaNNYyyIaJPXGHPuj3ZHwG2Oqr1ixYGeancnXHvZlJgJ1Hn78+yeVEoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ddfOtagN
Subject: Re: [Buildroot] uclibc-ng build failures on Xtensa
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

Thanks for your feedback, very useful as usual!

On Fri, 22 Jul 2022 04:24:16 -0700
Max Filippov <jcmvbkbc@gmail.com> wrote:

> > And the default is BR2_XTENSA_LITTLE_ENDIAN, while normally for
> > BR2_xtensa_fsf, the endianness is BIG.
> >
> > Which configurations are supported?  
> 
> When BR2_XTENSA_CUSTOM is selected BR2_XTENSA_OVERLAY_FILE
> must be specified and selected endianness must match the endianness of the
> configuration in the overlay file. Empty BR2_XTENSA_OVERLAY_FILE is
> equivalent to fsf and it is big endian.

Hm, OK. So what should we do from a testing point of view? Disregard
any testing of the BR2_XTENSA_CUSTOM case?

It's kind of weird to have BR2_XTENSA_LITTLE_ENDIAN be the default if
the default is actually big endian (when there is no overlay file).

What do you think of:

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 45ad2dc487..a69964f515 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -31,7 +31,7 @@ config BR2_XTENSA_OVERLAY_FILE
 choice
        prompt "Target Architecture Endianness"
        default BR2_XTENSA_LITTLE_ENDIAN
-       depends on BR2_XTENSA_CUSTOM
+       depends on BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE != ""
 
 config BR2_XTENSA_LITTLE_ENDIAN
        bool "Little endian"
@@ -43,7 +43,9 @@ endchoice
 
 config BR2_ENDIAN
        default "LITTLE"        if BR2_XTENSA_LITTLE_ENDIAN
-       default "BIG"           if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
+       default "BIG"           if BR2_xtensa_fsf
+       default "BIG"           if BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE = ""
+       default "BIG"           if BR2_XTENSA_BIG_ENDIAN
 
 config BR2_ARCH
        default "xtensa"        if BR2_xtensa

i.e basically: don't choice the endianness choice when the overlay file
is empty, and enforce the fact that the endianess is big when
BR2_XTENSA_CUSTOM with an empty overlay file.

> > Is there something to fix here, or
> > we just need to disallow the usage of little endian?  
> 
> Little endian xtensa configurations are well supported, see e.g.
> configs/qemu_xtensa_lx60_defconfig that uses the dc233c core.

I see there are quite a few overlays at
https://github.com/jcmvbkbc/xtensa-toolchain-build/tree/master/overlays
for well-known cores. Would it make sense to have explicit support for
some of them in Buildroot? At least having support for one of the
little endian cores seems useful to increase the testing coverage.

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
