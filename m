Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C23C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16914109F;
	Sun, 23 Jul 2023 10:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16914109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RR8mnsgU94QO; Sun, 23 Jul 2023 10:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FD01410B2;
	Sun, 23 Jul 2023 10:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FD01410B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFB051BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B921960B6A
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B921960B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOV-hyi4LQGO for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:06:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A9BD60B2B
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9BD60B2B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8241AFF803;
 Sun, 23 Jul 2023 10:06:27 +0000 (UTC)
Date: Sun, 23 Jul 2023 12:06:25 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230723120625.53310553@windsurf>
In-Reply-To: <20230723092314.129079-4-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
 <20230723092314.129079-1-thomas@devoogdt.com>
 <20230723092314.129079-4-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690106787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsqNEvm5BIC7All5H12mnl60t7vIY6ZihhFmMuaBmdU=;
 b=VGe5alaVLk2+OgPgiTQeE6pTkm0NDtbLOZoTrXCnsbgqeGCjty2+0ubr/u/uTAgfzOuro2
 6DzwnGqyW9vOaLNnMBPnY0vQ9hMq+J76EM5QhG8IWQMEA/JNpKQjImDXwP7PJiR//zf3CG
 E4SxRNXUOvqAzwN/8b9heONkE2RrWGdC6p9PnrtfP+kuNkzuMvdbhrorLzGULE6lBieuHV
 tg+NJOpnjZJMLX5StWAp8bSjt6Zrq+qyS0q4M6VJlq/DnfO3rEvStQh5YEnm4JWVuQhkWg
 PcmCwiHpGQhnWKcBRrIa4PV87ke8l4p8CWXwxYjGa57YfCNK6aTTLV47GQT6+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VGe5alaV
Subject: Re: [Buildroot] [PATCH v3 4/4] package/fluent-bit: rework wasm
 handling
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

Hello Thomas,

On Sun, 23 Jul 2023 11:23:14 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> -if BR2_PACKAGE_FLUENT_BIT
> -
> -config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
> -	bool
> -	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
> -	default y if BR2_arc
> -	default y if BR2_arm || BR2_armeb
> -	default y if BR2_aarch64 || BR2_aarch64_be
> -	default y if BR2_i386 || BR2_x86_64
> -	default y if BR2_RISCV_64
> -	default y if BR2_xtensa
> -
> -config BR2_PACKAGE_FLUENT_BIT_WASM
> -	bool "wasm runtime support"
> -	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
> -	help
> -	  Support for WASM-based plugins.

Something that isn't explained in your commit log is why you're making
the wasm feature automatically enabled, rather than optional as it was?

What is the size impact? Would someone possibly want fluent-bit without
wasm support?

> Two failures:
> 
> - sourcery-mips64:
> 
> core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
> core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not
> supported on this processor: mips64r2 (mips64r2) `ldc1 $f12,0($sp)'
> core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not
> supported on this processor: mips64r2 (mips64r2) `ldc1 $f14,8($sp)'
> make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495:
> src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o]
> Error 1 make[4]: *** Waiting for unfinished jobs....
> 
> - sourcery-mips:
> 
> core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
> core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not
> supported on this processor: mips32r2 (mips32r2) `ldc1 $f12,0($sp)'
> core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not
> supported on this processor: mips32r2 (mips32r2) `ldc1 $f14,8($sp)'
> make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495:
> src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o]
> Error 1 make[4]: *** Waiting for unfinished jobs....
> 
> Fix see:
> https://github.com/bytecodealliance/wasm-micro-runtime/issues/625

This part of your commit log is really not clear: we don't understand
if the issue still exists, or is fixed in your commit. You're passing
-DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1 for MIPS, but your commit log
contains a test-pkg run showing that it still fails to build for MIPS. So?

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
