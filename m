Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23C1C432BE
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1B760EAF
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 20:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B1B760EAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E60D80D05;
	Mon, 23 Aug 2021 20:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeDrt-Wn02wt; Mon, 23 Aug 2021 20:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EC380D22;
	Mon, 23 Aug 2021 20:10:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D29741BF321
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10EF6077F
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 20:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdIzt-hYfsIi for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 20:10:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 715CF6077A
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 20:10:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 57EEEE0004;
 Mon, 23 Aug 2021 20:10:39 +0000 (UTC)
Date: Mon, 23 Aug 2021 22:10:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210823221038.290a2d8f@windsurf>
In-Reply-To: <2bc67042-6651-caab-c88e-75c40afb1c73@gmail.com>
References: <20210626133238.144893-1-thomas.petazzoni@bootlin.com>
 <20210626154257.GN104638@scaer>
 <2bc67042-6651-caab-c88e-75c40afb1c73@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: use .assertRunOk() when
 possible
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Titouan Christophe <titouanchristophe@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org,
 Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun, 22 Aug 2021 17:00:17 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> >>      def check_network(self, interface, exitCode=0):
> >>          cmd = "ip addr show {} |grep inet".format(interface)
> >> -        _, exit_code = self.emulator.run(cmd)
> >> -        self.assertEqual(exit_code, exitCode)
> >> +        self.assertRunOk(cmd)  
> 
> What about exitCode argument?

Indeed, this change is wrong, we should revert it.

> 
> Theses two tests are expecting check_network() failing (exitCode = 1)
> tests.init.test_busybox.TestInitSystemBusyboxRw
> tests.init.test_busybox.TestInitSystemBusyboxRo
> 
> Maybe define assertRunNok?

In this specific case, an assertRunNok would not help: the
check_network() function receives an argument that says which exit code
we expect.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
