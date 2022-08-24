Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F26AC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D9DA40B53;
	Wed, 24 Aug 2022 11:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9DA40B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CNS1ZpN_6IN; Wed, 24 Aug 2022 11:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22AA140B1D;
	Wed, 24 Aug 2022 11:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22AA140B1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7A61C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7264E40B4F
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7264E40B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meQ59enn_Eko for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:15:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B3A240B4A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B3A240B4A
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:15:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8EA0D240005;
 Wed, 24 Aug 2022 11:15:46 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:15:45 +0200
To: Chris Dimich <chris.dimich@boundarydevices.com>
Message-ID: <20220824131545.3f3d245e@windsurf>
In-Reply-To: <20220824024904.2529728-8-chris.dimich@boundarydevices.com>
References: <20220824024904.2529728-1-chris.dimich@boundarydevices.com>
 <20220824024904.2529728-8-chris.dimich@boundarydevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661339747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWt40opNwiLAwgCSPYtZFrvXEhvrPO8vGGs6bUgbe48=;
 b=m3u1LTQBmBXFVjQiT+1slB1xd5X7RmPsOu4uF6vsyOlJmfJxnWLe1LVGSH8nwS0wP1fMWk
 jE6ZHXRAEJ5FkT/7C2PtTcGff5y/2Om1Oy9QJI+hRADvviEmw6jAp9hf5fAs/+7FqCWX/k
 53JBNjZdq56gTmknxtk67mkoBZ4pr4eqc2aEQjRZqrFOWYaKS91GjqkypC0i5lb7/eR9uy
 NZPUY3jUMkqSBs2Z07vVI2vrC/PXE+mDAxEoWzWz3MloAsKXqt3jdE1XuNjZ77VRX6SH3P
 hi8mODLW3OIKg43ldduB87ktdCWVPPOGu09P/rCFDrR+9kKJ8Bs3Ss0YKWnIpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m3u1LTQB
Subject: Re: [Buildroot] [PATCH 1/7] toolchain/toolchain-external: update
 Arm AArch64 toolchain 11.2-2022.02
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
Cc: Gary Bisson <bisson.gary@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Tue, 23 Aug 2022 19:48:58 -0700
Chris Dimich <chris.dimich@boundarydevices.com> wrote:

> Updated to gcc 11.2, gdb 11, binutils 2.37, glibc 2.34.
> 
> See "Release Note":
> https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/downloads-1

This link does not exist, I replaced it with
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads.

> 
> Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>

Thanks, I have applied your patch to our next branch, with some fixes.

> ---
>  .../toolchain-external-arm-aarch64/Config.in                | 2 +-
>  .../toolchain-external-arm-aarch64.hash                     | 6 +++---
>  .../toolchain-external-arm-aarch64.mk                       | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> index 9eb5d64a9d..b5b4d137b8 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
> @@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
>  	select BR2_TOOLCHAIN_HAS_SSP
>  	select BR2_INSTALL_LIBSTDCPP
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>  	select BR2_TOOLCHAIN_HAS_OPENMP
>  	help

This file also contained the version of the toolchain, so I updated it:

-       bool "Arm AArch64 2021.07"
+       bool "Arm AArch64 2022.02"

> diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> index ca1ea48bcb..6d81f58594 100644
> --- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> +++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
> @@ -1,4 +1,4 @@
> -# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz.asc
> -md5  07bbe2b5277b75ba36a924e9136366a4  gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
> +# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz

This is not correct. This file is directly the tarball. What we want
here is the link to a file from the upstream project that provides the
hash.

> +md5  712ee3fa6247ac3f619dd193f714fbc1  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz
>  # locally calculated

Calculating locally a SHA256 hash is no longer needed, as upstream now
provides a SHA256 hash directly.

So I replaced the whole file with just:

+# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  52dbac3eb71dbe0916f60a8c5ab9b7dc9b66b3ce513047baa09fae56234e53f3  gcc-arm-11.2-2022.02-x86_64-aarch64-none-linux-gnu.tar.xz

Also, we have the AArch64 BE and ARM32 toolchains from ARM, so I
updated them as well:

  https://git.buildroot.org/buildroot/commit/?h=next&id=f4a78565db49b90d96b5e28cd06e6b07cb0a7e61
  https://git.buildroot.org/buildroot/commit/?h=next&id=22d10e294cc9cd30fa8adc3672a337167e6241a3

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
