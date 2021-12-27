Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0903FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AADBC40994;
	Mon, 27 Dec 2021 10:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atGl9413O2z4; Mon, 27 Dec 2021 10:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9FA440354;
	Mon, 27 Dec 2021 10:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 179AB1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04FD040354
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQmIofhcEI7j for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:23:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0F5B40210
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:23:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8CF921C0004;
 Mon, 27 Dec 2021 10:23:09 +0000 (UTC)
Date: Mon, 27 Dec 2021 11:23:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20211227112308.43614f93@windsurf>
In-Reply-To: <20211222083020.49627-1-buildroot@heine.tech>
References: <20211222083020.49627-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/boost: fix interprocess with musl
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
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Wed, 22 Dec 2021 09:30:19 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Interprocess in 1.78.0 broke on musl with commit efc75031f568a16e8520019deeb71e272818c467
> by using stuff from sys/stat.h without including it.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/8af247ad084d510cd1100f76cb57a7fd32fcdb69
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...stat_h-include-on-musl-based-systems.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/boost/0001-fix-missing-sys_stat_h-include-on-musl-based-systems.patch

Thanks for the patch. However, Fabrice sent a similar patch 2 days
before yours, so I applied Fabrice's patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
