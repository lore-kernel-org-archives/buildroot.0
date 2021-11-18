Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE8FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 06:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02D261B1E
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 06:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B02D261B1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BCC2404A1;
	Thu, 18 Nov 2021 06:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuVO8LufgDeB; Thu, 18 Nov 2021 06:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 805524047E;
	Thu, 18 Nov 2021 06:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3162A1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20D0A4047E
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 06:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-iopGXhqfQe for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 06:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4508A40478
 for <buildroot@uclibc.org>; Thu, 18 Nov 2021 06:31:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mnawu-0008dl-Je
 for buildroot@uclibc.org; Thu, 18 Nov 2021 07:31:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 18 Nov 2021 07:30:46 +0100
Message-ID: <pan$e0907$be487130$672fe3cf$fd815ab@ID-313208.user.individual.net>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
 <20211113093009.6915-2-bernd.kuhls@t-online.de>
 <87h7catpaz.fsf__1784.76354792423$1637186493$gmane$org@dell.be.48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.147 (Sweet Solitude; afc1447)
Subject: Re: [Buildroot] [PATCH v2 2/3] package/glmark2: drm-glesv2 needs
 libgbm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 17 Nov 2021 23:01:08 +0100 schrieb Peter Korsgaard:

> We don't have BR2_PACKAGE_HAS_LIBGBM / the virtual gbm package in
> 2021.02.x / 2021.08.x, so I have NOT applied this to the stable
> branches.
> 
> What is the solution here? Depend on mesa?

Hi Peter,

yes, please pick http://patchwork.ozlabs.org/project/buildroot/patch/
20200104193919.91589-2-bernd.kuhls@t-online.de/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
