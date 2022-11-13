Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8976CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD9E81416;
	Sun, 13 Nov 2022 21:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD9E81416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hk-TrrdhHtwL; Sun, 13 Nov 2022 21:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5534B8140C;
	Sun, 13 Nov 2022 21:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5534B8140C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4E8B1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526D98140C
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526D98140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8hsEDr_C-HT for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1459581406
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1459581406
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:47:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FAF8E0002;
 Sun, 13 Nov 2022 21:47:11 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:47:10 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221113224710.72a83c33@windsurf>
In-Reply-To: <20221113100057.3893656-1-bernd.kuhls@t-online.de>
References: <20221113100057.3893656-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668376031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRtltL7j8m8aagcXaF9olt/8xSiRT1tuPkM9DTAGJoU=;
 b=HPqo9huGuj+p7EucXcDYi8qsyW/6QYUAsvK5f4EVYRkWFBboCncfswEiEOfwoRWfVxKPi0
 XSY5GSTNTVCCFI5BYhxbpCYKFaOR+LfgzG/BQFjNMhInDYhXQo1NQRQOCxpVW66Vbyb5CU
 kvT0+5U9R577quhAPQhAZPP/QtolnfEcF6i4WyXLZN83hjvNGO8MDsraOrfgnvLWnIMQFr
 hw4pmOciizlTjRfV6F8eyCe+4JxO1xjqfzSbF4lDSrbdu0BCxeObtKrOvqiuOO0Opj0QyT
 h8QBZcD+3bovscds1OloBvpG1ykCnwcKOfL4gbsJbo0Bckya7x1C6z86RdzQ0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HPqo9huG
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: fix opengl library check
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
Cc: Simon Dawson <spdawson@gmail.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Nov 2022 11:00:57 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/9710753984a38b8c6f83a136b39c3bc320ba558b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks!

> ---
> While this upstream patch fixes the insufficient check for opengl the
> reason why we saw this bug is due to the fact that the libglvnd package
> installs GL/gl.h to staging dir even if the defconfig does not enable
> libgl support, but fixing this is another topic.

Indeed, just tested:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBGLVND=y
# BR2_TARGET_ROOTFS_TAR is not set

and GL/gl.h is there, but there's no actual OpenGL provider. Didn't
think too much about how to fix this, though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
