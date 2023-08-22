Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F42EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5E4240583;
	Tue, 22 Aug 2023 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E4240583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuGdrx_ydYW2; Tue, 22 Aug 2023 21:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0DC940500;
	Tue, 22 Aug 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0DC940500
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0651BF20B
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9B11404BF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B11404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_AyGoKw7iC0 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:59:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3A5E403C8
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A5E403C8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B3C240004;
 Tue, 22 Aug 2023 20:59:50 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:59:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230822225949.2b326664@windsurf>
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692737993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFgkuOEXB22vBqIYpLAOfJd7utrn0GkI2FCruTQscyM=;
 b=JRnHNk+r+KCTotUyiVFSNolv3DunLITJv9LH3z78+TM0W+VK56na2BHEUpR6IwF/GOdATz
 I+xNNt9NQX2GS7pYQigajWN02mXg8m7ZMGAltAdBaAvy5XBU51j5HpwwsoorApGcASMey0
 PPDGFOLtDdMf/69G2bUoI3n31ucSfM7IsT1tI4Cxj0e1LL32DPJXEJ4806y+/i11WhMCOi
 k040b6EMzvH4NlQCe2V/xXzl+XV6EI99HY0+/RDot6J1c+4fFJnpQgKpOkXkI8LsPyNNvk
 Oe1dPU4J/qQ5MaQ89KT4xS+BR973LdNJG8sfhCVLIssmVzi0wIuN0Cccjrp3qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JRnHNk+r
Subject: Re: [Buildroot] [PATCH/next v9 00/12] Introduce libudev (branch
 yem/libudev-6)
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun,  6 Aug 2023 16:02:29 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bernd Kuhls (4):
>   package/kodi: only needs libudev, not udev daemon
>   package/libv4l: optionally use libudev
>   package/libcec: optionally use libudev
>   package/usbutils: only needs libudev, not udev daemon
> 
> Yann E. MORIN (8):
>   package/eudev: add option to enable the udev daemon
>   package/eudev: allow building only the library
>   package/libudev: new virtual package
>   package/eudev: provides libudev
>   package/systemd: provides libudev
>   package/libudev: make it selectable
>   package/qt5base: optionally use libudev
>   package/libinput: only needs libudev, not udev daemon

Thanks Bernd for working on this. I didn't look carefully at the
patches in this iteration, but I remember looking at previous
iterations, and it was good.

I just wanted to question the relevance of this, so I did a quick
experiment. I applied just patches 1 and 2 of this patch series, which
allow to build eudev with and without the daemon. Then I built two
defconfigs:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
# BR2_TARGET_ROOTFS_TAR is not set

which enables the full eudev (daemon included)

And:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_EUDEV=y
# BR2_PACKAGE_EUDEV_ENABLE_HWDB is not set
# BR2_TARGET_ROOTFS_TAR is not set

which enables only libudev.

The first defconfig generates an output/target/ of 7.4 MB, the second
defconfig generates an output/target/ of 5.4 MB.

In the first defconfig, the eudev package takes 1.69 MB, and the
util-linux-libs package takes 330 KB.

In the second defconfig, the eudev package takes 133 KB, and
util-linux-libs is not needed.

So in this "extreme" example, it saves 2 MB. I say "extreme" because a
realistic rootfs will have something that uses libudev and is going to
be bigger. util-linux-libs is used by a *lot* of system-level packages,
so it's relatively likely that it's going to be pulled in by some other
packages in most typical configurations. The size of eudev could be
reduced locally via post-build script.

I want to see if we really want to add this additional complexity of a
virtual package "just" to save 2 MB. I don't have a very strong opinion
on this so I could be convinced either way, but I find the extra
complexity quite high compared to the usefulness for most typical
use-cases.

Arnout, Peter, could you give your opinion here so that we can take a
decision, and either merge this patch series or reject it?

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
