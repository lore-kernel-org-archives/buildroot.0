Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB56C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06816108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E06816108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78446058C;
	Thu, 19 Aug 2021 21:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylhDdcAweK_a; Thu, 19 Aug 2021 21:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AC92605C5;
	Thu, 19 Aug 2021 21:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 234311BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1375081A23
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WtP7VXgnYcF for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5014981A1C
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 21:18:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 04CDAC0002;
 Thu, 19 Aug 2021 21:18:49 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:18:48 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: yegorslists--- via buildroot <buildroot@busybox.net>
Message-ID: <20210819231848.6eabdd3b@windsurf>
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org,
 Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

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
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

This patch no longer applies to our next branch. Could you respin?

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
