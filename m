Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04461C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:54:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA47561077
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA47561077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F30180AB6;
	Thu, 12 Aug 2021 21:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BY2R2WIrk20J; Thu, 12 Aug 2021 21:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D446280DCE;
	Thu, 12 Aug 2021 21:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEF1B1BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDAE640769
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rELjxsOQJFp for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:53:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 164F74075B
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:53:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 751C8E0004;
 Thu, 12 Aug 2021 21:53:51 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:53:50 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: yegorslists--- via buildroot <buildroot@busybox.net>
Message-ID: <20210812235350.1dce1d70@windsurf>
In-Reply-To: <20210806100144.12444-1-yegorslists@googlemail.com>
References: <20210806100144.12444-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libqmi: bump to version 1.30.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Yegor,

+Fabrice and Adam in Cc.

On Fri,  6 Aug 2021 12:01:44 +0200
yegorslists--- via buildroot <buildroot@busybox.net> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This release introduces meson build system support that fixes
> gobject-intorspection issue with autotools.
> 
> As meson files are only available in git, switch the location to
> https://gitlab.freedesktop.org.
> 
> Add support for bash-completion.
> 
> Add an upstream patch fixing the compilation without gobject-intorspection.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c13877a5700445253900e312bc87904152be429a

It seems like this gobject-introspection issue was not specific to
libqmi, but was actually affecting a number of other packages as well,
and Fabrice fixed the issue in the recently committed
https://git.buildroot.org/buildroot/commit/?id=34da8f96141f14abd98bc4cab3fa05c0b7a0a895.
Could you check if that indeed fixes the issue with the current version
of libqmi in Buildroot master?

Indeed, as we're past 2021.08-rc1, we'd prefer not to bump libqmi at
this point in the master branch.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
