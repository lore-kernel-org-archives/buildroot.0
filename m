Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E625AC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:33:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A367D610FD
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A367D610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D73402C8;
	Wed, 18 Aug 2021 20:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iYE1wsymQiI; Wed, 18 Aug 2021 20:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A494401FE;
	Wed, 18 Aug 2021 20:33:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1F4B1BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D7A40191
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4skaQKtzWl9T for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBB7040224
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:33:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 059C81C0003;
 Wed, 18 Aug 2021 20:33:19 +0000 (UTC)
Date: Wed, 18 Aug 2021 22:33:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210818223319.6575da17@windsurf>
In-Reply-To: <CAPi7W80M_AFXgmMqK8DkLaNQV3O+BcLR+Wsv0rRarhpk47_dYQ@mail.gmail.com>
References: <20210813142626.2941588-1-fontaine.fabrice@gmail.com>
 <20210815175743.012d125f@windsurf>
 <CAPi7W80M_AFXgmMqK8DkLaNQV3O+BcLR+Wsv0rRarhpk47_dYQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: fix build of gdb on riscv
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Fabrice,

On Sun, 15 Aug 2021 18:07:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > While I understand the idea, I'm not entirely sure it's the most
> > logical way. What about instead changing the current:
> >
> > ifeq ($(BR2_GDB_VERSION_10),y)
> > GDB_GDBSERVER_TOPLEVEL = y
> > endif
> >
> > by:
> >
> > ifeq ($(GDB_VERSION_10),10.1)
> > GDB_GDBSERVER_TOPLEVEL = y
> > endif  
> This one won't work as GDB_VERSION_10 is not defined if host-gdb is
> not selected.

Sorry, I meant to do:

ifeq ($(GDB_VERSION),10.1)

which would work in all cases.

> > This way, it really expresses what we want: gdb version 10.x require a
> > different build logic.
> >
> > Alternatively, we could do a hidden Config.in boolean:
> >
> > config BR2_PACKAGE_GDB_TOPLEVEL
> >         bool
> >         default y if BR2_GDB_VERSION_10
> >         default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv  
>
> I'll test this one but I think that it should work.

But I find this alternative a bit better. Looking forward to the patch!

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
