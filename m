Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACBBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2500061002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2500061002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38044064A;
	Wed,  4 Aug 2021 19:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCm502aGQupP; Wed,  4 Aug 2021 19:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3554059A;
	Wed,  4 Aug 2021 19:30:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 791E91BF3FB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6668D40298
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9k3WfpnwPoo for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11001401D2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:30:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2EF4CE0004;
 Wed,  4 Aug 2021 19:30:20 +0000 (UTC)
Date: Wed, 4 Aug 2021 21:30:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20210804213019.6cf2a25d@windsurf>
In-Reply-To: <20210804172259.9143-1-petr.vorel@gmail.com>
References: <20210804172259.9143-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Petr,

On Wed,  4 Aug 2021 19:22:59 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Also upgrade to on RISC-V (that could have been done in d5ce3b5db5)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> I tested it with building pc_x86_64_efi_defconfig, adding nfs-utils,
> ltp-testsuite and few other tools. Not sure if this is enough for
> testing.

I think that what Romain Naour typically does is run all qemu_*
defconfigs (of course tweaked to use glibc instead of uclibc), and push
them to Gitlab, so that they get build tested *and* boot tested under
Qemu.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
