Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56519C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C2961004
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C2961004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C42A040320;
	Tue, 20 Jul 2021 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbnnbBIqcDDl; Tue, 20 Jul 2021 20:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD6E402FB;
	Tue, 20 Jul 2021 20:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1FC71BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B156160769
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UoALM6Hii3jN for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CFD46063F
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:27:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5519AE000A;
 Tue, 20 Jul 2021 20:27:03 +0000 (UTC)
Date: Tue, 20 Jul 2021 22:27:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210720222702.66a8604d@windsurf>
In-Reply-To: <20210705191533.29763-1-ps.report@gmx.net>
References: <20210705191533.29763-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/rtl8812au-aircrack-ng: new
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720202702.oRdArA3D-KZj2BYdphw3fSiAEaCc4ru2snxl5bVnYGY@z>

On Mon,  5 Jul 2021 21:15:33 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add rtl8812au-aircrack-ng (alternative to rtl8821au), recommended
> e.g. for Alfa cards ([1]) and as opposed to rtl8821au does not crash
> in case of configured for IBSS mode and supports iw set freq command in
> monitor mode.
> 
> [1] https://docs.alfa.com.tw/Support/Linux/RTL8811AU
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/rtl8812au-aircrack-ng/Config.in        | 10 ++++++++++
>  .../rtl8812au-aircrack-ng.hash                 |  3 +++
>  .../rtl8812au-aircrack-ng.mk                   | 18 ++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/rtl8812au-aircrack-ng/Config.in
>  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
>  create mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk

I find it very sad that we need an alternative driver for the same
device... I've applied, but it would be good to see if this package
could replace the existing rtl8821au package.

Also, I'm confused about the naming: rtl8812au vs. rtl8821au. Are they
for the same hardware ?

I wish there was more effort to push such drivers in the upstream
kernel...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
