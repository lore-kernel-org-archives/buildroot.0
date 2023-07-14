Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F29EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74276409C9;
	Fri, 14 Jul 2023 21:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74276409C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5LQSMMNYYEv; Fri, 14 Jul 2023 21:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99D72405B0;
	Fri, 14 Jul 2023 21:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D72405B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFE361BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C5A382065
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5A382065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79_cWNChi33O for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:24:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B47181F35
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B47181F35
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:24:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EF460002;
 Fri, 14 Jul 2023 21:24:11 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:24:10 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230714232410.7f038bd2@windsurf>
In-Reply-To: <20230714143752.10215-1-tianyuanhao3@163.com>
References: <20230714143752.10215-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lspvmONAqE/Th8gK1QEL55NtRx6QKoRqwK6gV8f4dqA=;
 b=g2Bscr9GP5PJZRAIMe76IagUWPeoyHcVBPehchx0isttKNG5TQeIG8RD94bxDSdjaMHTQA
 jao33t2zc25FmVQeuN0CaISfUhQE2tb1Gy+7Y60VxTesIhtqnO6GGcfc0fAxh5cvkve7Gp
 YDJ3AXcjxRBBd/qo7cCA41vP7GedRS5fjOV4atQBzz00p9RVAgt7656nnFsaQvvlEkSGdA
 llNMS40crn0khiHpGnaKxnW/4RymOsPLxnLEehaHmmTPpUPv/UXhKYj7hBh4r3dXQiCifs
 AAuyph+e9ly+wSnMzSMiHNBhTHJIyPXjCx6DXqOeJOlWcWfiLtKfc9q19bdOUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g2Bscr9G
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: move old
 Mediatek WiFi firmware to mediatek
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Jul 2023 14:37:52 +0000
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/linux-firmware/linux-firmware.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I've applied after adjusting the commit title (the commit is not moving
the firmware, it is fixing our package to work with the new location of
the firmware), and after adding a reference to an autobuilder build
issue fixed by this commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
