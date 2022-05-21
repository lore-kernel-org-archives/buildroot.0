Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1D5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC2B40B3B;
	Sat, 21 May 2022 14:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doPsptXb_C6S; Sat, 21 May 2022 14:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED68F40B33;
	Sat, 21 May 2022 14:44:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E23F91BF475
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 14:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8C2846AC
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 14:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJ3cP5f6K266 for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 14:44:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95BE8846AB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 14:44:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2AB1BE0003;
 Sat, 21 May 2022 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653144281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CltAvpD1hq33TtM0p0yyYbEuD6WSnxQGO/clUyJWM14=;
 b=W7TrQk0iO5o2SC56Aik9j5jr6z40OBWEQAzgZlqUbwFkeOUN3ZuVrteHtnen0iyr5HgHDX
 PbA4WaVjgUcNIw9Ttx8dGQ7ABiVLQtZOM6vAoUcCxdM42YqSAW8BF2bPwNZzoFm8TFa4Zl
 aMSrReTIsS6n+7kX0yQ4y5hTMO7gHY84FV9L2tXDnh0ei3R9DUQoqwc29dwEMLd0DR1g5a
 EG+x/fvMiiGTgYKzaWRz1OhBeiiK1y8MaHXoFF3sOMIRS+LSKkqSnRqLQHlB6B1mp5RLiQ
 VXel+aprPq8FinTm8ikgE/pcSzPvY2oi2lECvUHLs2z+xnyGS8qQJmddzAigxA==
Date: Sat, 21 May 2022 16:44:40 +0200
To: Ramon Fried <rfried.dev@gmail.com>
Message-ID: <20220521164440.0f0df25f@windsurf>
In-Reply-To: <CAGi-RUKF09JmK_EACoQdBnS_Aw8G6Ep88Lx3rCHY3ZkxrqLvmQ@mail.gmail.com>
References: <62886d67.1c69fb81.ac372.4710SMTPIN_ADDED_MISSING@mx.google.com>
 <CAGi-RUKF09JmK_EACoQdBnS_Aw8G6Ep88Lx3rCHY3ZkxrqLvmQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-05-20
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

Hello Ramon,

On Sat, 21 May 2022 17:23:04 +0300
Ramon Fried <rfried.dev@gmail.com> wrote:

> > Build failures related to your packages:
> >
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >     m68k     |          bitwise-0.43          | http://autobuild.buildroot.net/results/9e3b9a148bc84004fde4dfe9b389ca2b359a92e2
> >   riscv64    |          bitwise-0.43          | http://autobuild.buildroot.net/results/348afc2a0fde85c098a12b58e8e2dcc3780bbb6b
> >
> >
> > Thanks for your contribution to Buildroot!
> >
> > --
> > http://autobuild.buildroot.net  
> Hi thomas.
> as I mentioned in an earlier mail, it looks like it is probably in dependencies.
> I took riscv64 as an example and built the qemu
> qemu_riscv64_virt_defconfig + bitwise locally.
> It is built successfully.
> 
> How was the config file for building the above created ?

If you follow the links above, you end up in a directory that contains
the full .config file (config) as well as the corresponding defconfig
(named "defconfig"). These are the configurations that triggered the
build issue.

You can also reproduce a build issue by downloading the script
https://git.busybox.net/buildroot-test/plain/utils/br-reproduce-build
and run:

 ./br-reproduce-build 9e3b9a148bc84004fde4dfe9b389ca2b359a92e2

Where 9e3b9a148bc84004fde4dfe9b389ca2b359a92e2 is the identifier of the
failed build, as visible in the autobuild.buildroot.net URL.

Let me know if this helps!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
