Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F84C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0072360F6D
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 12:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0072360F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F8C60818;
	Mon,  2 Aug 2021 12:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8m8Br4JILeL; Mon,  2 Aug 2021 12:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFBD60687;
	Mon,  2 Aug 2021 12:55:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42C551BF402
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3024140190
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 12:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuva4X5R3cGD for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 12:55:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ABCF40004
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 12:55:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4089724000C;
 Mon,  2 Aug 2021 12:55:45 +0000 (UTC)
Date: Mon, 2 Aug 2021 14:55:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Frank Hunleth <fhunleth@troodon-software.com>
Message-ID: <20210802145544.62e46f99@windsurf>
In-Reply-To: <CA+-urNS33eBwcaCSTMAb690j7r2M4674MuPkDhEX1X=Qr7YYXQ@mail.gmail.com>
References: <20210508222419.586915-1-fhunleth@troodon-software.com>
 <20210728233513.4097848b@windsurf>
 <CA+-urNS33eBwcaCSTMAb690j7r2M4674MuPkDhEX1X=Qr7YYXQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] erlang: support builds when gcc
 __atomic_* exist
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Mon, 2 Aug 2021 08:46:37 -0400
Frank Hunleth <fhunleth@troodon-software.com> wrote:

> As you expected, a SPARCv8 build fails. I updated erlang.mk to pass
> linker flags to link to libatomic, but still received errors. The
> errors were of type:
> 
> /tmp/cc1Mog0n.s:230: Error: Architecture mismatch on "cas [%g3],%g2,%g1".
> /tmp/cc1Mog0n.s:230: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8;
> requested architecture is v8.)
> 
> I ran out of time this morning to track this down (sorry), but it's
> sounding like Erlang is doing something that's not causing function
> calls into libatomic.
> 
> Right now, I'm thinking that trying to be more generic about what
> platforms Erlang supports may not be worth it. I.e., change this:
> 
>         default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
>                 BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
>                 BR2_TOOLCHAIN_HAS_ATOMIC
> 
> to
> 
>         default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
>                 BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
>                 BR2_RISCV_64
> 
> What do you think?

I'm fine with that. Note that it's also causing problems on other CPU
architectures:

  http://autobuild.buildroot.net/?reason=erlang%

You will however see that even on ARM64 there are some failures in
erlang-jiffy.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
