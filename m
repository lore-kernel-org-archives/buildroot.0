Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFACE95397
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAC960BD9;
	Wed,  4 Feb 2026 12:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB5aUjF3igu5; Wed,  4 Feb 2026 12:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7111760B74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770208526;
	bh=z7XzmtCbqRJFakLM4fFEYtnANL8EJyvrnV21Ki+WCm8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hONOnXn/VGOJFk9vyT2R2ppqsUnrb0M2PDg3PZGZj49eVDRlKix5+nPs4OAJqAxQN
	 tGIVg1tg0SQrypQN4UmOWejAWp02egOyncwFOAW4XdpFrrHjVtsJqNIC9wyqEqJYrX
	 LktdmANfh0PFmKSGmsB12b0uW7qzPdG0iOeK/hm2cYX2WIIKHu4Q995yvPl9SCuO90
	 FQ9FfCdcKe8vqFCurpesk5UlYmZaKZu/uENPFvzvoxj/eUmA010v5+kxk9lP5jMkr1
	 JeS+bFsFQvURrQ6DB5iQrfRzK3z2xFuRdD+zz4fhp7gx/WnKxlBzpYQspa7tiOiHj7
	 M/NaS5axZWM2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7111760B74;
	Wed,  4 Feb 2026 12:35:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A2D173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E76405F7
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaQ6DVzkRqd7 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:35:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63CF5405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CF5405F0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63CF5405F0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:35:22 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 25986BDE3A79;
 Wed, 04 Feb 2026 13:35:19 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 04 Feb 2026 12:35:18 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: buildroot <buildroot@buildroot.org>, guenther.harrasser@mobileye.com,
 Vladimir Kondratiev <vladimir.kondratiev@intel.com>, Chris Packham
 <judge.packham@gmail.com>
In-Reply-To: <mailman.20273.1770054247.2009750.buildroot@buildroot.org>
References: <mailman.20273.1770054247.2009750.buildroot@buildroot.org>
Message-ID: <838e68729209415796298901bc72a55d@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1770208519; bh=TIc9hB5ZvCobqXBaqxCfwJlMl06de+WhelDttbBtUCc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=B+UsPX4yFU9WgWxhch+x9x3hkvMdYn06TMtjP1mnvEFDV9QMRlV26H4a8DAkPQiqN
 c00I1fcOvp0viEDNZQdMR1j56vgcHPc9NxQjLpoIyHaF/2loxwbUEzz+EBYIUPEVZ6
 9CvMJ7NjTMiWKqj04QOcNw9gO1iRTaCtX+QJYnFI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=B+UsPX4y
Subject: Re: [Buildroot] [PATCH] package/coremark: port for mips-i6500
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy, all

[add Chris Packham -> DEVELOPERS file]

This change is normally something that would be handled in a private 
overlay (e.g. BR2_EXTERNAL). Also Buildroot will never pick up these 
modifications, unless you also add logic to 
package/coremark/coremark.mk.

More remarks below:

On 2026-02-02 16:53, Jimmy Durand Wesolowski wrote:
> 
> Compile for MIPS I6500 CPU 64-bit, with all compiler flags as
> recommended by MIPS
> 
> One missing flag -s "-Tmsym32.ld" since linker script
> "msym32.ld" does not exist in the MIPS toolchain
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Acked-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  .../0001-skeleton-for-mips-i6500.patch        | 804 ++++++++++++++++++
>  ...iler-flags-customized-for-mips-i6500.patch |  35 +
>  2 files changed, 839 insertions(+)
>  create mode 100644 package/coremark/0001-skeleton-for-mips-i6500.patch
>  create mode 100644 
> package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> 
> diff --git a/package/coremark/0001-skeleton-for-mips-i6500.patch 
> b/package/coremark/0001-skeleton-for-mips-i6500.patch
> new file mode 100644
> index 0000000000..e71dc980c8
> --- /dev/null
> +++ b/package/coremark/0001-skeleton-for-mips-i6500.patch
> @@ -0,0 +1,804 @@
> +From c8f187ca290e65f9d6b14ef5ad57fa61f7f8b95f Mon Sep 17 00:00:00 2001
> +From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +Date: Wed, 27 Feb 2019 09:55:55 +0200
> +Subject: [PATCH 1/2] skeleton for mips i6500
> +
> +port for mips-i6500 created, copied from linux64
> +
> +Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +---
> + mips-i6500/core_portme.c   | 336 
> +++++++++++++++++++++++++++++++++++++
> + mips-i6500/core_portme.h   | 291 ++++++++++++++++++++++++++++++++
> + mips-i6500/core_portme.mak | 140 ++++++++++++++++
> + 3 files changed, 767 insertions(+)
> + create mode 100755 mips-i6500/core_portme.c
> + create mode 100755 mips-i6500/core_portme.h
> + create mode 100755 mips-i6500/core_portme.mak

A more elegant way to create the baseline would be to add an appropriate 
rsync command to COREMARK_POST_EXTRACT_HOOKS.

<patch body removed>

> diff --git 
> a/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch 
> b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> new file mode 100644
> index 0000000000..1fdef1f300
> --- /dev/null
> +++ 
> b/package/coremark/0002-Compiler-flags-customized-for-mips-i6500.patch
> @@ -0,0 +1,35 @@
> +From 59542343c82a936326345455036d33ba30a646c5 Mon Sep 17 00:00:00 2001
> +From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +Date: Wed, 27 Feb 2019 10:05:52 +0200
> +Subject: [PATCH 2/2] Compiler flags customized for mips-i6500
> +
> +Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> +---
> + mips-i6500/core_portme.mak | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/mips-i6500/core_portme.mak b/mips-i6500/core_portme.mak
> +index 5cfabee32658..8e0ac11d7854 100755
> +--- a/mips-i6500/core_portme.mak
> ++++ b/mips-i6500/core_portme.mak
> +@@ -24,13 +24,16 @@ OUTFLAG= -o
> + CC = gcc
> + # Flag: CFLAGS
> + #	Use this flag to define compiler options. Note, you can add 
> compiler options from the command line using XCFLAGS="other flags"
> +-PORT_CFLAGS = -O2
> ++PORT_CFLAGS := -DRTELinux -DITERATIONS=0 -DUSE_PTHREAD  
> -DMULTITHREAD=4
> ++PORT_CFLAGS += -O3 -funroll-all-loops -falign-jumps=16 
> -falign-loops=16 -falign-functions=16 -finline-functions 
> -finline-limit=1000
> ++PORT_CFLAGS += -fgcse-sm -fgcse-las -EL -mtune=i6500 -mabi=64 -mmsa

Why not use the project's CFLAGS? You might always wonder why the rest 
of the stuff is so much slower than the coremark score suggests ...

> + FLAGS_STR = "$(PORT_CFLAGS) $(XCFLAGS) $(XLFLAGS) $(LFLAGS_END)"
> + CFLAGS = $(PORT_CFLAGS) -I$(PORT_DIR) -I. 
> -DFLAGS_STR=\"$(FLAGS_STR)\"
> + #Flag: LFLAGS_END
> + #	Define any libraries needed for linking or other flags that should 
> come at the end of the link line (e.g. linker scripts).
> + #	Note: On certain platforms, the default clock_gettime 
> implementation is supported but requires linking of librt.
> +-LFLAGS_END += -lrt
> ++LFLAGS_END += -lrt -lpthread -static
> ++#-Tmsym32.ld
> + # Flag: PORT_SRCS
> + # Port specific source files can be added here
> + PORT_SRCS = $(PORT_DIR)/core_portme.c

Shouldn't pthread and static normally come from the Buildroot 
configuration?

Unless the sequence of library includes is significant (PORT_CFLAGS ... 
LFLAGS_END), you might just override PORT_CFLAGS and be done.

COREMARK_CFLAGS = \
	$(TARGET_CFLAGS) \
	-DUSE_CLOCK=1 \
	-DMEM_LOCATION='\"initramfs\"'

define COREMARK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
		PORT_CFLAGS="$(COREMARK_CFLAGS)" \
		PORT_DIR=linux EXE= link
endef

> +--
> +2.19.1
> --
> 2.43.0

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
