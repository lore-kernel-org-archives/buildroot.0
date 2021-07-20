Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50B3C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A29E61004
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A29E61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F37682B81;
	Tue, 20 Jul 2021 20:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYLw3ZU85UfJ; Tue, 20 Jul 2021 20:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC7D682B49;
	Tue, 20 Jul 2021 20:48:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33E921BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2387282B49
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuP6ZkRZSzxI for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:48:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26DFE829FD
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 20:48:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 505AD20006;
 Tue, 20 Jul 2021 20:48:07 +0000 (UTC)
Date: Tue, 20 Jul 2021 22:48:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Patricia Holden <pholden@nklabs.com>
Message-ID: <20210720224806.09e5a5b2@windsurf>
In-Reply-To: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
References: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Question about pkg-config pc files
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Patricia,

On Tue, 20 Jul 2021 16:41:40 -0400
Patricia Holden <pholden@nklabs.com> wrote:

> I am adding a package that has dependencies on QT pkg-config pc files.  I
> see the pkg-config pc files in
> output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig/, but
> I don't see any pkg-config files installed to target.  the QQmlApplication
> code is trying to include multiple qt packages but they are not found.
> Running "pkg-config --list-all" results in none found at all.
> 
> How do I get pkg-config pc files installed to the target?

You don't: Buildroot doesn't support doing development on the target.
Why would you need .pc files on the target ? Is QQmlApplication using
pkg-config at run-time on the target ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
