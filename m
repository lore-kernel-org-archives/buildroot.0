Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF72BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FDD82005;
	Sat,  4 Nov 2023 13:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68FDD82005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FucuzwD4JWqd; Sat,  4 Nov 2023 13:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A46648228E;
	Sat,  4 Nov 2023 13:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A46648228E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE811BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E0F60BC9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E0F60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcbqYvLJPH6S for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:38:16 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B90560BBC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B90560BBC
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD62640006;
 Sat,  4 Nov 2023 13:38:12 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:38:11 +0100
To: Javad Rahimipetroudi <javad321javad@gmail.com>
Message-ID: <20231104143811.0d9ba0f3@windsurf>
In-Reply-To: <20231104072458.7369-4-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
 <20231104072458.7369-4-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699105093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9SFDoFH73rbelYNF490uIAc4a0df7QI1EbN2jWTtgw=;
 b=MYn7Z1l9O7K3v4uAkbTGGnT3HUmAlOgOh/OxGSUvD+Z9NG7qLHsTxPk2Li0jR/RWSHHE+C
 yt5532UXSon0vmEyeJYobzrdSCxNOQM61sfXp0TVV+jmIUsdl1lMq/TG9yXumLARt/GNKB
 0YFwyyNyKZfOJqrjgkbAWkJKKnmzUwwoe33TRW1ZnS4DbVnMoCMdaOg6r+claJtz0K74/D
 5MxUgV9XwVHv1fuIG16K6lTkQ5ZN+xJM4lXWKLkz0ZVYRdDb6KO/iOyUR6HWRGeua/Iyx3
 ddF5NpD5uHG9a0/4Toj+A5coRzvahlv38LVanuNrjLD8CxWPrP2kQjZivOhqGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MYn7Z1l9
Subject: Re: [Buildroot] [PATCH 4/7] configs/pine64_defconfig: add dynamic
 mdev To add networking support,
 dynamic mdev is required to load network drivers.
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The commit title is too long.

On Sat,  4 Nov 2023 10:54:55 +0330
Javad Rahimipetroudi <javad321javad@gmail.com> wrote:

> Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
> ---
>  configs/pine64_defconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
> index b567462f5d..5cb4b4a0b5 100644
> --- a/configs/pine64_defconfig
> +++ b/configs/pine64_defconfig
> @@ -42,9 +42,13 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
>  # Filesystem
>  BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_SYSTEM_DHCP="eth0"
> +
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y

Why are you removing this package?

> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"

This is not explained in the commit log. Why does the size needs to be
increased? Is it because the Linux 6.1 kernel is bigger, and has more
kernel modules? If so, this change should be together with the kernel
update.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
