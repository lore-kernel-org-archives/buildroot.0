Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DC3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B724408D0;
	Sat,  4 Dec 2021 22:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPUUoTSVbufc; Sat,  4 Dec 2021 22:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62514063E;
	Sat,  4 Dec 2021 22:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5CF71BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A37401E5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiJwj5u3nkAx for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 863D6401AF
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:15:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DE6DD60006;
 Sat,  4 Dec 2021 22:15:10 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:15:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211204231509.2507f151@windsurf>
In-Reply-To: <20211122020804.535891-5-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
 <20211122020804.535891-5-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/inadyn: refactor start script
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joachim,

On Mon, 22 Nov 2021 03:08:03 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> This patch is a complete rewrite of the start script, reducing code
> duplication by using a helper cmd() function and adding support for:
> 
>  - INADYN_ARGS that can be overridden from /etc/default/inadyn
>  - reload command that sends SIGHUP
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Actually, for init script, we are now trying to use a common style and
construction for all, based on package/busybox/S01syslogd.

We don't want each init script of each package to be its own creative
work of art, but instead we prefer consistency.

It would actually be good to document this in the Buildroot manual.

Could you try to rework your init script according to
package/busybox/S01syslogd ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
