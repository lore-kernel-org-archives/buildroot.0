Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6113C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D67560778;
	Sun, 21 Nov 2021 20:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTkna-XfOUyX; Sun, 21 Nov 2021 20:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31A060673;
	Sun, 21 Nov 2021 20:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBA601BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB03F60673
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yocHLFayvY0t for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:54:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B87D2605BE
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:54:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1E0E9C000A;
 Sun, 21 Nov 2021 20:54:41 +0000 (UTC)
Date: Sun, 21 Nov 2021 21:54:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20211121215441.28e40b6d@windsurf>
In-Reply-To: <20211118093813.474-1-luca@lucaceresoli.net>
References: <20211118093813.474-1-luca@lucaceresoli.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/zynqmp_zcu106_defconfig: fix
 arm-trusted-firmware build failure
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

On Thu, 18 Nov 2021 10:38:13 +0100
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> This defconfig uses arm-trusted-firmware version 1.5 which fails since
> commit eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f ("package/gcc: switch to
> gcc 10.x as the default").
> 
> Backport a patch from v2.2 to fix the build.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1768915296
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  ...-fix-Remove-GGC-ignore-Warray-bounds.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
