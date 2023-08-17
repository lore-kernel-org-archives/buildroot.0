Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1A4C27C7A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 07:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409C483C1D;
	Thu, 17 Aug 2023 07:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409C483C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5niV1ipBsn2W; Thu, 17 Aug 2023 07:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D09F83C19;
	Thu, 17 Aug 2023 07:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D09F83C19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76BDF1BF3EF
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F925417DE
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 07:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F925417DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqPeyulUJASL for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 07:40:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E7E6400B8
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 07:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E7E6400B8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66BAB1BF209;
 Thu, 17 Aug 2023 07:40:16 +0000 (UTC)
Date: Thu, 17 Aug 2023 09:40:15 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230817094015.5324e023@windsurf>
In-Reply-To: <20230816150442.GB1340200@scaer>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
 <20230816092439.570839-2-jamie.gibbons@microchip.com>
 <20230816142316.76d45449@windsurf> <20230816150442.GB1340200@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692258017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wj+CM0P9xVqoX5ivQbundj9EiyGmCzs01BR0jwEhVk=;
 b=VaDvhpX5PC2OHqoe0yNDo7LUZjxLAAravuhQZYg8LJgA3qS+P3UMT+Rw7dVrhPsgQ6gIXA
 ODiVLjiCm2l5/WsicNeo/5WJvfZK3mexzTUVAYVwBmMpeMOVKvtDlyEGqYF6CXqdEqGjn1
 fnsQpUQdw4A7EQPuSlxLKuQfUcEyeKIFXgENuLsD+Vf51tPTt7RvY8u6tx3jsEn9AUbFqp
 V8N/W3gaO6gGiztSgSt3Gu2T5AGFfX33HJbCCHkgczdaJ+Kt95vvQpAnZ48S12bV2BxcMw
 U/WsyGksL8ajowg0P5OYeAYtMFLJ2zOLw0btuBdj0W22RRlA9prX6v05zu7ccQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VaDvhpX5
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 16 Aug 2023 17:04:42 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Basically, I think what Thomas expects is something like:
> 
>     diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
>     index 3dfbb4165f..997f7a631d 100644
>     --- a/arch/Config.in.riscv
>     +++ b/arch/Config.in.riscv
>     @@ -1,26 +1,5 @@
>      # RISC-V CPU ISA extensions.
>      
>     -config BR2_RISCV_ISA_RVI
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVM
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVA
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVF
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVD
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVC
>     -    bool
>     -
>     -config BR2_RISCV_ISA_RVV
>     -    bool
>     -
>      choice
>          prompt "Target Architecture Variant"
>          default BR2_riscv_g
>     @@ -41,38 +20,28 @@ config BR2_riscv_custom
> 
>      endchoice
> 
>     -if BR2_riscv_custom
>     -
>      comment "Instruction Set Extensions"
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVM
>     +config BR2_RISCV_ISA_RVM
>          bool "Integer Multiplication and Division (M)"
>     -    select BR2_RISCV_ISA_RVM
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVA
>     +config BR2_RISCV_ISA_RVA
>          bool "Atomic Instructions (A)"
>     -    select BR2_RISCV_ISA_RVA
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVF
>     +config BR2_RISCV_ISA_RVF
>          bool "Single-precision Floating-point (F)"
>     -    select BR2_RISCV_ISA_RVF
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVD
>     +config BR2_RISCV_ISA_RVD
>          bool "Double-precision Floating-point (D)"
>          depends on BR2_RISCV_ISA_RVF
>     -    select BR2_RISCV_ISA_RVD
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVC
>     +config BR2_RISCV_ISA_RVC
>          bool "Compressed Instructions (C)"
>     -    select BR2_RISCV_ISA_RVC
> 
>     -config BR2_RISCV_ISA_CUSTOM_RVV
>     +config BR2_RISCV_ISA_RVV
>          bool "Vector Instructions (V)"
>     -    select BR2_RISCV_ISA_RVV
>          select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
> 
>     -endif
>     -
>      choice
>          prompt "Target Architecture Size"
>          default BR2_RISCV_64
> 
> Thomas?

Not quite, because we want the IMAFD options to remain under the
"custom" option.

Essentially what happens today is:

 - RISC-V G implies IMAFD, but there is no way to say I have G + C + V

 - RISC-V custom allows any combination of IMAFDCV

What we want is:

 - RISC-V G implies IMAFD, but also allows to select C and V

 - RISC-V custom allows any combination of IMAFDCV

So something like this:

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 3dfbb4165f..df8499c7a0 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -41,10 +41,10 @@ config BR2_riscv_custom
 
 endchoice
 
-if BR2_riscv_custom
-
 comment "Instruction Set Extensions"
 
+if BR2_riscv_custom
+
 config BR2_RISCV_ISA_CUSTOM_RVM
 	bool "Integer Multiplication and Division (M)"
 	select BR2_RISCV_ISA_RVM
@@ -62,6 +62,8 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 	depends on BR2_RISCV_ISA_RVF
 	select BR2_RISCV_ISA_RVD
 
+endif
+
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
@@ -71,8 +73,6 @@ config BR2_RISCV_ISA_CUSTOM_RVV
 	select BR2_RISCV_ISA_RVV
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
-endif
-
 choice
 	prompt "Target Architecture Size"
 	default BR2_RISCV_64

Note that indeed the blind options BR2_RISCV_ISA_RVC and
BR2_RISCV_ISA_RVV are no longer very useful, but I guess I would keep
them anyway to keep the symmetry with BR2_RISCV_ISA_RV{I,M,A,F,D} blind
options.

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
