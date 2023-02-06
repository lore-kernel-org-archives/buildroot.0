Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D30C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 22:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E619560C30;
	Mon,  6 Feb 2023 22:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E619560C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYDVhdrBMCeB; Mon,  6 Feb 2023 22:02:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35BEA60C2C;
	Mon,  6 Feb 2023 22:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35BEA60C2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0F5A1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A0DF40566
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 22:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0DF40566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_-n4prCj5Dh for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 22:02:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 394B44016B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 394B44016B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 22:02:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 838ED240007;
 Mon,  6 Feb 2023 22:02:04 +0000 (UTC)
Date: Mon, 6 Feb 2023 23:02:03 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230206230203.70e2dbd8@windsurf>
In-Reply-To: <YywR+1YTnzQtkCrC@waldemar-brodkorb.de>
References: <YywR+1YTnzQtkCrC@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675720924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rRLvjo757/DCrOuuEZoKvj0LBklCw1WT1/WKkdqWe4=;
 b=oA47FqFVRv1w0sJXRABxQ3dkP6NVg6+ELph53pZYykozcPh7fleEfeO8QYYpKS4j5d3iDC
 WWw/RxCLfH6TY5v7GeQadhl1H7QsnaA5ShEdqwCY3y9FWgPA2i8IyGUXJSv4mbGtohslfl
 fcEyOQBGMM5Dxi6MX5geYbz5CfkjgdEeyNqGMAu7HZRNbouIBWihuqz35pyKPihoEuwjbF
 UXMsIlsc8yiE1IJoX8qnVXY0SOuRAmaOs/mD8ygWnExm/SOryC9ljhbIxj82dDu2JVig2H
 Jh/2bZK1EOXqaWrxpArydXXkZBI02LR2ePGLRBk2ZmNp4LyZ3phraKf4QEpyxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oA47FqFV
Subject: Re: [Buildroot] [PATCH] configs/stm32f746g-disco: new defconfig
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

On Thu, 22 Sep 2022 09:42:51 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add support for ST Microsystems STM32F746G-DISCO board.
> See here for hardware details:
> https://www.st.com/en/evaluation-tools/32f746gdiscovery.html
> 
> The LCD and Ethernet are _not_ yet supported by Linux upstream.
> The RAM is very limited, so the init script is stolen from the
> RISCV noMMU systems to support booting to a shell without crashing.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Sorry for the very very slow feedback. It mostly looks good of course,
but there are two things that bother me. One very small and easy to
address, another not so difficult, but I'm not entirely sure how to
address it.

See below.

> diff --git a/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init
> new file mode 100755
> index 0000000000..1285fd4420
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +
> +# This script replaces the default busybox init process to avoid having that
> +# process staying alive and sleeping in the background, (uselessly) consuming
> +# precious memory.

[...]

What bothers me is that board/canaan/k210-soc/rootfs_overlay/sbin/init
is exactly the same script, so we're duplicating it. Can we do
something about it? I'm not exactly sure. A minimal "init" package for
noMMU systems maybe?

Also, do you really need this minimal init?
stm32f469_disco_sd_defconfig doesn't need it apparently.

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10-rc5"

Can we switch to a non-rc version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
