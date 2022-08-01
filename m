Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB1C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221464086A;
	Mon,  1 Aug 2022 20:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221464086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcUlFvXMyy7E; Mon,  1 Aug 2022 20:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB9EE405AA;
	Mon,  1 Aug 2022 20:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB9EE405AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 916431BF293
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AFFD81774
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFFD81774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2GWdJsenIPg for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:09:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD93581750
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD93581750
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:09:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 424CC1C0003;
 Mon,  1 Aug 2022 20:09:41 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:09:40 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801220940.678584a2@windsurf>
In-Reply-To: <20220727181304.440002-2-bernd.kuhls@t-online.de>
References: <20220727181304.440002-1-bernd.kuhls@t-online.de>
 <20220727181304.440002-2-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659384581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3iP21Osq6DUtOoPtXCMB/OmeMbkGNQ9stUcAKFzmWY=;
 b=Dijov8XrG0w0FtjsBF5ewwTaTmOaC/rXWsH27hT/Qe2/ZIrMS9BzRGgbzs547XNa/0CoZU
 rVZGeFRhVkjmuqz0xz+ELkAkQ0/G+8AS4EQGe/qFiz6TEM6Ad5dKLFcRM77WBPanYXkbwB
 WdtVVbHj+Tnlvo6z9Rf/W1NYEHbw+EUuuROr31KzdH7PDRhUgjc7mWAAk8ZPP3nUt/9+bo
 Zz74c+GJ4l07HVgEkGgIFE8+HbP7PIN+lEKu4e+AgfPE9pEWup9Dh8YgIuKwXbR5QgyudD
 hxe3R+x/MuJrJV0GDc36SzIRu72HVDtp40WQbeVvt7o38wWL9R/6VAimz7q13g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dijov8Xr
Subject: Re: [Buildroot] [PATCH 2/4] package/libdeflate: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 20:13:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for upcoming version bump of transmission:
> https://github.com/transmission/transmission/commit/d8d765c59551b97ffb10bedb6f66133a54954a0e
> 
> Build test using this defconfig
> 
> BR2_PACKAGE_LIBDEFLATE=y
> 
> was successful:
> 
>                              andes-nds32 [ 1/45]: OK
>                              arm-aarch64 [ 2/45]: OK
>                    bootlin-aarch64-glibc [ 3/45]: OK
>                bootlin-arcle-hs38-uclibc [ 4/45]: OK
>                     bootlin-armv5-uclibc [ 5/45]: OK
>                      bootlin-armv7-glibc [ 6/45]: OK
>                    bootlin-armv7m-uclibc [ 7/45]: OK
>                       bootlin-armv7-musl [ 8/45]: OK
>                 bootlin-m68k-5208-uclibc [ 9/45]: OK
>                bootlin-m68k-68040-uclibc [10/45]: OK
>              bootlin-microblazeel-uclibc [11/45]: OK
>                 bootlin-mipsel32r6-glibc [12/45]: OK
>                    bootlin-mipsel-uclibc [13/45]: OK
>                      bootlin-nios2-glibc [14/45]: OK
>                  bootlin-openrisc-uclibc [15/45]: OK
>         bootlin-powerpc64le-power8-glibc [16/45]: OK
>            bootlin-powerpc-e500mc-uclibc [17/45]: OK
>                    bootlin-riscv32-glibc [18/45]: OK
>                    bootlin-riscv64-glibc [19/45]: OK
>                     bootlin-riscv64-musl [20/45]: OK
>                       bootlin-sh4-uclibc [21/45]: OK
>                    bootlin-sparc64-glibc [22/45]: OK
>                     bootlin-sparc-uclibc [23/45]: OK
>                     bootlin-x86-64-glibc [24/45]: OK
>                      bootlin-x86-64-musl [25/45]: OK
>                    bootlin-x86-64-uclibc [26/45]: OK
>                    bootlin-xtensa-uclibc [27/45]: OK
>                             br-arm-basic [28/45]: OK
>                     br-arm-full-nothread [29/45]: OK
>                       br-arm-full-static [30/45]: OK
>                    br-i386-pentium4-full [31/45]: OK
>                 br-i386-pentium-mmx-musl [32/45]: OK
>                       br-mips64-n64-full [33/45]: OK
>                  br-mips64r6-el-hf-glibc [34/45]: OK
>                br-powerpc-603e-basic-cpp [35/45]: OK
>                br-powerpc64-power7-glibc [36/45]: OK
>                        linaro-aarch64-be [37/45]: OK
>                           linaro-aarch64 [38/45]: OK
>                               linaro-arm [39/45]: OK
>                      sourcery-arm-armv4t [40/45]: OK
>                             sourcery-arm [41/45]: OK
>                      sourcery-arm-thumb2 [42/45]: OK
>                          sourcery-mips64 [43/45]: OK
>                            sourcery-mips [44/45]: OK
>                           sourcery-nios2 [45/45]: OK
> 45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/libdeflate/Config.in       |  7 ++++++
>  package/libdeflate/libdeflate.hash |  3 +++
>  package/libdeflate/libdeflate.mk   | 34 ++++++++++++++++++++++++++++++
>  5 files changed, 46 insertions(+)
>  create mode 100644 package/libdeflate/Config.in
>  create mode 100644 package/libdeflate/libdeflate.hash
>  create mode 100644 package/libdeflate/libdeflate.mk

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
