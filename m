Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A3C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A15784046;
	Fri, 23 Sep 2022 20:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A15784046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ux3MQaQl1p0A; Fri, 23 Sep 2022 20:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B6881985;
	Fri, 23 Sep 2022 20:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B6881985
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8693E1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 20:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31E29418BC
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 20:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E29418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZ9InISEujtK for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 20:40:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2BA4181D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF2BA4181D
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 20:40:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16E47E0002;
 Fri, 23 Sep 2022 20:40:39 +0000 (UTC)
Date: Fri, 23 Sep 2022 22:40:39 +0200
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <20220923224039.31d67d9c@windsurf>
In-Reply-To: <20220811094049.798010-1-niklas.cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663965641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcOFGoH4nC7FwZEw3D+g/OrXcgabol8DaO+/7mG+cBI=;
 b=H3Hw7uTxeAQ+n20rbjktWMonNGwwmNr7FkXqyLX+FCwA5rOG21epKz3p7k5sPlGynCk2QB
 DR/qApYOa6rhtJt6IS8yaruP6wCHeluiCYEgR+vMcFX9nqdhLz/LW1QCoifx5XkwkjliQs
 eYKMKzxWdkQio6s7iZnkVjg0jqWkOJJYsTbtocCrlU4dgfSh3+G0OTL8BRS/wnwMX5YDJ4
 bGAZPRraKZEd4J5AEK1iXu9SLJpnq90L2zjx7y0gPo0aQVR+1FuxY/U4lDX1QIbBFZp+sX
 ikOPnTEUCJYIkGznEq+Mtl4ze7Nu7zrqO+TBuMgt+USpwHjh1hjFOFc4wenY/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H3Hw7uTx
Subject: Re: [Buildroot] [PATCH v2 0/2] fix elf2flt on m68k, xtensa, riscv
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
Cc: damien.lemoal@opensource.wdc.com, alistair@alistair23.me,
 geert@linux-m68k.org, "buildroot@buildroot.org" <buildroot@buildroot.org>,
 romain.naour@smile.fr, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Niklas,

On Thu, 11 Aug 2022 11:40:47 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Niklas Cassel (2):
>   package/elf2flt: remove broken patch
>   package/elf2flt: fix fatal error regression on m68k, xtensa, riscv64

I am sorry to report that on Buildroot 2022.08, which has those
patches, the following defconfig still fails to build:

BR2_m68k=y
BR2_m68k_cf5208=y
BR2_KERNEL_HEADERS_5_4=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_39_X=y
BR2_BINUTILS_GPROFNG=y
BR2_GCC_VERSION_12_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_GCC_ENABLE_OPENMP=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON3=y
BR2_GDB_VERSION_12=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails with:

/home/thomas/buildroot/outputs/m68k-coldfire-uclibc-bleeding-edge/host/m68k-buildroot-uclinux-uclibc/bin/elf2flt: ERROR: text=0x3c826 overlaps data=0x256e0 ?

while building gdb for the target.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
