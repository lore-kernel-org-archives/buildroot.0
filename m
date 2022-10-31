Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0AAFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 21:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1569740522;
	Mon, 31 Oct 2022 21:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1569740522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYD6r4gTgvlL; Mon, 31 Oct 2022 21:07:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E73A402FE;
	Mon, 31 Oct 2022 21:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E73A402FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4C91BF2EA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A80860B65
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A80860B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4VcuGhKqG1o for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 21:07:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D223B60A98
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D223B60A98
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 21:07:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E47D60008;
 Mon, 31 Oct 2022 21:07:14 +0000 (UTC)
Date: Mon, 31 Oct 2022 22:07:13 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221031220713.5c81cc21@windsurf>
In-Reply-To: <20221010030937.6432-1-ju.o@free.fr>
References: <20221010030937.6432-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667250436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8+vd9A3lPXc86Ek6lliBuYLkj3xtstsmwNhKodOfLA=;
 b=b0Ey/KgWr+KaS/lwcLvCAR2Xp2lDlYPX3QjhpARuoTXOh5wGFNLXGClbDjXIxsivRXjG4U
 IssERX0HSUPVB1E6RUssCyKM3veWT3ymgZo7Bqzssc+tHGWFq+sOdGzpiZdJXIi3zfYAPH
 YbOi5FbyPZyFHzIt0wTg8MErTtPwLgbyrPWAHf5ROAtnUn+98c+4z0Z9g6+2rmlsudUKgV
 +LpSQt1HMZUbrD19SbA4wNhNzWwcRm3DGCPp0GagEMry+hjWK1Kygtdx+9jK1w6BJoQ1lL
 o2yMKg87EG232js5OGv2By2t+pMz35zCL+U5+bRLTq4q2H/XwGmvA1YuYAGJpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b0Ey/KgW
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 bootlin-xtensa-uclibc.config
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

Hello Julien,

On Sun,  9 Oct 2022 23:09:37 -0400
Julien Olivain <ju.o@free.fr> wrote:

> Commit 4cbf7336914f25478aea943456ba7dc3c892c21a
> "arch/xtensa: custom configuration requires an overlay"
> added an error message if BR2_XTENSA_CUSTOM is set and
> BR_ARCH_XTENSA_OVERLAY_FILE is unset.
> 
> When testing a package with the command:
> 
>     ./utils/test-pkg --all --package somepackage
> 
> bootlin-xtensa-uclibc toolchain is always failing with error in the logfile:
> 
>     arch/arch.mk.xtensa:4: *** No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting.  Stop.
> 
> This commit fixes the toolchain config fragment by adding the same overlay
> file found in qemu_xtensa_lx60_defconfig.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/config-fragments/autobuild/bootlin-xtensa-uclibc.config | 1 +
>  1 file changed, 1 insertion(+)

Thanks, but adding an overlay here is not the right solution. The
problem is that 4cbf7336914f25478aea943456ba7dc3c892c21a is incorrect.
I already sent a series to fix that on Sep 25, 2022:

  https://lore.kernel.org/buildroot/20220925090920.1585682-1-thomas.petazzoni@bootlin.com/

but it did receive some comments, and therefore was not applied. But
the solution is more along the lines of changing how Xtensa is handled
rather than working around the problem in bootlin-xtensa-uclibc.config.

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
