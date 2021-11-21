Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E29C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669C9403C7;
	Sun, 21 Nov 2021 20:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofMORxY4iCtL; Sun, 21 Nov 2021 20:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A7240394;
	Sun, 21 Nov 2021 20:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED4CB1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCDF040394
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHnZFJZqzhX0 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:48:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD204036E
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:48:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 32AA21BF206;
 Sun, 21 Nov 2021 20:48:27 +0000 (UTC)
Date: Sun, 21 Nov 2021 21:48:26 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211121214826.7db900a2@windsurf>
In-Reply-To: <20211120150446.447240-1-bernd.kuhls@t-online.de>
References: <20211120150446.447240-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/2] package/x265: bump version to 3.5
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Nov 2021 16:04:45 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch 0001 based on Gentoo patch
> https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/x265/files/arm-r1.patch
> 
> Removed patch 0002, a different fix was applied upstream:
> https://bitbucket.org/multicoreware/x265_git/commits/ec7396adaa6afd2c8aab1918cfe4bb6e384740c3
> 
> Update project URL and _SITE.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x265/0001-fix-gcc-options.patch    |  78 +++--
>  package/x265/0002-arm-asm-primitives.patch | 354 ---------------------
>  package/x265/Config.in                     |   2 +-
>  package/x265/x265.hash                     |   6 +-
>  package/x265/x265.mk                       |   4 +-
>  5 files changed, 63 insertions(+), 381 deletions(-)
>  delete mode 100644 package/x265/0002-arm-asm-primitives.patch

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
