Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AC2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:34:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451DD610FE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 451DD610FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08AF60769;
	Sat, 13 Nov 2021 09:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j63u9UqZVgFV; Sat, 13 Nov 2021 09:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5955160685;
	Sat, 13 Nov 2021 09:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 442941BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2FA4023B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_k6UHFRxRx3 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:34:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49BB540236
 for <buildroot@uclibc.org>; Sat, 13 Nov 2021 09:34:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1mlpQF-0003e3-7K
 for buildroot@uclibc.org; Sat, 13 Nov 2021 10:34:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Nov 2021 10:33:02 +0100
Message-ID: <pan$592bf$4b5d782b$717424ed$c336ebd9@ID-313208.user.individual.net>
References: <20211109202921.2031664-1-bernd.kuhls@t-online.de>
 <20211111203813.GB2609__12237.069783599$1636663125$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.147 (Sweet Solitude; afc1447)
Subject: Re: [Buildroot] [PATCH 1/2] package/glmark2: drm-glesv2 needs libdrm
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

Am Thu, 11 Nov 2021 21:38:13 +0100 schrieb Yann E. MORIN:

> Globally, I think glmark2 needs a bit of refactoring: it is very unusual
> that the feature-set is before the main symbol. Usually, we have, in 
order:
>   - ARCH_SUPPORTS et al.
>   - main symbol
>   - if-block with all options.
>   - comment(s) about toolchain features et al.
> 
> Could you look into that, and respin a full series that fixes all these
> issues in glmark2, and adds the missing dependencies, please?

Hi Yann,

sent v2 with a minimal set of changes

http://patchwork.ozlabs.org/project/buildroot/list/?series=271843

which should fix the technical problems in Config.in while lacking time 
to do a full refactoring, sorry.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
