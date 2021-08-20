Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA22DC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:45:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919CE6115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 919CE6115C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6069E60624;
	Fri, 20 Aug 2021 21:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0X0VQ1UkuOF; Fri, 20 Aug 2021 21:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB519613B7;
	Fri, 20 Aug 2021 21:45:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38EEC1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28D6980EA2
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbEfhJM2H_AH for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:45:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3F0880E82
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:45:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1585C240003;
 Fri, 20 Aug 2021 21:44:58 +0000 (UTC)
Date: Fri, 20 Aug 2021 23:44:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: dopsi@dopsi.ch
Message-ID: <20210820234457.45903346@windsurf>
In-Reply-To: <20210802202035.405287-2-dopsi@dopsi.ch>
References: <20210802202035.405287-1-dopsi@dopsi.ch>
 <20210802202035.405287-2-dopsi@dopsi.ch>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/stm32mp157c_odyssey: new
 defconfig
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Simon,

On Mon, 02 Aug 2021 20:20:57 +0000
dopsi@dopsi.ch wrote:

> From: Simon Doppler <dopsi@dopsi.ch>
> 
> STM32MP157C-Odyssey reference:
> https://wiki.seeedstudio.com/ODYSSEY-STM32MP157C/
> 
> Signed-off-by: Simon Doppler <dopsi@dopsi.ch>

It all looks very good to me. The only last missing bit is a
board/seeed/stm32mp157c-odyssey/readme.txt that briefly describes how
to use this defconfig. See
board/stmicroelectronics/stm32mp157c-dk2/readme.txt for an example.

With this added, your defconfig will be ready to be merged in Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
