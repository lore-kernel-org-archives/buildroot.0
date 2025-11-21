Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E25ACFC283
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 15:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6C86F6A0;
	Fri, 21 Nov 2025 15:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wWZZYsJiZglv; Fri, 21 Nov 2025 15:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E9860DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E9860DBF;
	Fri, 21 Nov 2025 15:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF44F122
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B6C84AB7
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugAx0a5UQqrf for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 15:13:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E80684D2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E80684D2C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E80684D2C
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 15:13:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5638D60136;
 Fri, 21 Nov 2025 16:13:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Nov 2025 16:13:35 +0100
MIME-Version: 1.0
Date: Fri, 21 Nov 2025 16:13:35 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20251120221558.1138538-2-thomas.petazzoni@bootlin.com>
References: <20251120221558.1138538-1-thomas.petazzoni@bootlin.com>
 <20251120221558.1138538-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0a4122d8a302d456424d8e61b9ea06fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763738018;
 bh=UM8M2UaEzrxd/xQceyb+MrG1BQrbuRAYRGzyvzApHFo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cSl0SsHFXO2004FAanCJChXb+uqRSEFHRtBuyVquawDkHWMQdoTgRlR0sSQff7n2I
 nfQU/agd7l6q4B/RxARHVsrPJCrk4D1jjjOjWpWTdGNESWQBVbUFW9bNDdgSPMf+ZC
 aH7kUuSJufq85t2jVICTyUPVdwqA82YwP1bclQ7Uc6Ffp9QTj9dl5Gh4LM4GlGnOoP
 Q41s9RzfkSYAp3xsAr4QREtWciLSB+IW0pAuAG8UNHGx8AC6AYjseADnp0dP3XCrjx
 QCPqsdjvfu0M10fI7+QDnPGOsp56iKsxERY3MC2JfRmeAIxwKfzmnP9huhRkBrWmIw
 ohHEBRFtCNLOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cSl0SsHF
Subject: Re: [Buildroot] [PATCH 1/3] package/binutils: add support for
 binutils 2.45.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/11/2025 23:15, Thomas Petazzoni via buildroot wrote:
> We bring patches 0001 and 0002 that we carry for binutils 2.44. Patch
> 0002 requires a small update as a nearby configure option has been
> removed between 2.44 and 2.45. Patch 0003 that we have for binutils
> 2.44 is not needed as it is part of the 2.45 release.
> 
> Changes in 2.45:
> 
> * New versioned release of libsframe: libsframe.so.2.  This release 
> introduces
>   versioned symbols with version node name LIBSFRAME_2.0.  Some new 
> symbols
>   have been added to support the new flag SFRAME_F_FDE_FUNC_START_PCREL 
> and
>   retrieving flags from SFrame decoder and encoder objects:
>     - Addition of sframe_decoder_get_flags,
>       sframe_decoder_get_offsetof_fde_start_addr, 
> sframe_encoder_get_flags,
>       sframe_encoder_get_offsetof_fde_start_addr.
>   This release also includes backward-incompatible ABI changes:
>     - Removal of sframe_get_funcdesc_with_addr.
>     - Change in the behavior of sframe_decoder_get_funcdesc_v2,
>       sframe_encoder_add_funcdesc_v2 and sframe_encoder_write.
> 
> * On s390 64-bit (s390x), gas, ld, objdump, and readelf now support 
> generating
>   and processing SFrame V2 stack trace information (.sframe).  The 
> assembler
>   generates SFrame info from CFI directives with option "--gsframe".  
> The
>   linker generates SFrame info for the linker-generated .plt section 
> and merges
>   all .sframe sections.  Both objdump and readelf dump SFrame info with 
> option
>   "--sframe[=<section-name>]".
> 
> * For SFrame stack trace format, the function start address in each 
> SFrame
>   FDE has a changed encoding:  The 32-bit signed integer now holds the 
> offset
>   of the start PC of the associated function from the 
> sfde_func_start_address
>   field itself (instead of the earlier where it was the offset from the 
> start
>   of the SFrame section itself).  All SFrame sections generated by gas 
> and ld
>   now default to this new encoding, setting the (new)
>   SFRAME_F_FDE_FUNC_START_PCREL flag.
> 
>   Relocatable SFrame links are now fixed.
> 
> * Readelf now recognizes RISC-V GNU_PROPERTY_RISCV_FEATURE_1_CFI_SS and
>   GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_UNLABELED for zicfiss and zicfilp
>   extensions.
> 
> * For RISC-V dis-assembler, the definition of mapping symbol $x is 
> changed,
>   so the file needs to be rebuilt since 2.45 once used .option arch 
> directives.
> 
> * The LoongArch disassembler now properly accepts multiple disassembly
>   options given by -M, such as "-M no-aliases,numeric".  (Previously 
> only the
>   first option took effect.)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to next, thanks.
For info, I fixed the binutils version 2.45.1 Kconfig prompt. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/b7d5ff9d51507dcef721ff3d5db862f8715d3351#48ea993dbd04b7e5bbf317a81c0aa3446cd106dd_36_39

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
