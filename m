Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84406C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B6A42C36;
	Tue, 31 Oct 2023 12:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B6A42C36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCxmHEL5V2Mw; Tue, 31 Oct 2023 12:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8B542587;
	Tue, 31 Oct 2023 12:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8B542587
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B62411BF321
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 817F842587
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 817F842587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKCexYuo_5dp for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:51:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAA2A42435
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA2A42435
Received: by mail.gandi.net (Postfix) with ESMTPSA id B38311BF206;
 Tue, 31 Oct 2023 12:51:11 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:51:10 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031135110.3927dd18@windsurf>
In-Reply-To: <20231020114236.4129636-4-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698756672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xtc2LYi8Okso6lNa5STY4j0iAdMsDzcsPVsjQ/n0WYc=;
 b=QFhLFqWlZcgzjlPnwvn2dxUzrzL2duTQ71uV3MrRZzgczq6XDEdr9lhapeMguuo3Tr0Oii
 yZHkZ9gMUuVb8tkBa74EGzzUptsONyHtqPIvh9pFHKNsc0yCjI2S0FUGQa8c05fq6H7V4T
 ugD88bkxlpTcxrSn5WevueXa5Jku6XGTDO0MtkzWiQ7Q5TnFXLVUNIi6G/QPUQ6GRsXJxh
 QzG0BIcB6z6K3AAFvgQRJzd2Rr5j5UpH5xIqdjNMcy5IAZfsYA+3LwiMPNGVw9T7dB3bOA
 EfCXgQI4ohlqabtp+UqROoKVq93gG6htcgyzouLTWCllSfPbKZNbvhFcH/678w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QFhLFqWl
Subject: Re: [Buildroot] [PATCH v6 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 20 Oct 2023 12:42:30 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:


> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index d8081f1b9d..b1333f92f0 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -59,6 +59,7 @@ config BR2_TOOLCHAIN_EXTERNAL
>  
>  endchoice
>  
> +source "toolchain/toolchain-bare-metal-buildroot/Config.in"
>  source "toolchain/toolchain-buildroot/Config.in"
>  source "toolchain/toolchain-external/Config.in"

I'm not really happy with where this ends up showing in menuconfig.
Indeed, in menuconfig, we end up seeing something like this:

    Toolchain type (External toolchain)  --->
[*] host toolchain-bare-metal
-*-   host binutils-bare-metal
-*-   host gcc-bare-metal
-*-   host newlib-bare-metal
    *** Toolchain External Options ***
    Toolchain (Bootlin toolchains)  --->

So basically, right in the middle of the settings for the "normal"
toolchain, we have those options about the bare-metal toolchain.

Maybe something like this instead:

diff --git a/toolchain/Config.in b/toolchain/Config.in
index b1333f92f0..278d1de65c 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -59,7 +59,6 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 endchoice
 
-source "toolchain/toolchain-bare-metal-buildroot/Config.in"
 source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
 
@@ -919,4 +918,8 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
        default y if BR2_i386 || BR2_x86_64
        default y if BR2_POWERPC_CPU_HAS_VSX
 
+comment "Bare metal toolchain"
+
+source "toolchain/toolchain-bare-metal-buildroot/Config.in"
+
 endmenu

Basically, move it at the end of toolchain/Config.in, with a small
Config.in comment separating it from the rest.

>  
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> new file mode 100644
> index 0000000000..6ebf2cdf86
> --- /dev/null
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT
> +	bool "host toolchain-bare-metal"
> +	select BR2_PACKAGE_HOST_BINUTILS_BARE_METAL
> +	select BR2_PACKAGE_HOST_GCC_BARE_METAL
> +	select BR2_PACKAGE_HOST_NEWLIB_BARE_METAL

Those selects are no longer needed, as all those options will be gone.

> +	help
> +	  Build a bare-metal toolchain in addition to the main Linux toolchain
> +
> +if BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT
> +
> +config BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
> +	string

This option needs to be made visible (with a prompt), otherwise nobody
can chose a different architecture/tuple.

> +	default "microblazeel-xilinx"

Is "xilinx" really relevant here? I don't think it is. I'm also
wondering whether having a default value actually makes sense. It
should probably just stay empty by default, and be defined by the
specific defconfigs that need this?

> +	help
> +	  select architecture for bare-metal toolchain
> +
> +source "package/binutils-bare-metal/Config.in.host"
> +source "package/gcc-bare-metal/Config.in.host"
> +source "package/newlib-bare-metal/Config.in.host"

These file inclusions can be dropped.

> +++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
> @@ -0,0 +1,7 @@
> +################################################################################
> +#
> +# toolchain-bare-metal-buildroot
> +#
> +################################################################################
> +
> +(eval $(host-virtual-package))

I'm a bit rusty with virtual packages, but I don't see where this
virtual package pulls in host-newlib-bare-metal as a dependency. Don't
you need:

TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = host-newlib-bare-metal

to make sure you trigger the build of host-newlib-bare-metal ->
host-gcc-bare-metal -> host-binutils-bare-metal ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
