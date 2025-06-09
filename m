Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D2BC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FAE640A06;
	Mon,  9 Jun 2025 20:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_pjv6CaQFcy; Mon,  9 Jun 2025 20:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EEA40BF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EEA40BF4;
	Mon,  9 Jun 2025 20:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E299CD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24FD782151
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taX5iNqkALoZ for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 20:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 825EA8214C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825EA8214C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 825EA8214C
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:01:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 014AC2003C6;
 Mon,  9 Jun 2025 22:01:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Jun 2025 22:01:13 +0200
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 22:01:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250519193818.3192717-1-neal.frager@amd.com>
References: <20250519193818.3192717-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f1cab9af399cbd7277c8d8d199b24dc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749499281;
 bh=Liv7vBHkbCjKWwG3aqS/9Lbk2i+vbpqs10se0juJINc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mrxIeqhRSGxv9N/I8T6V1+uQM1pE8I2I5+uv03Wn7eHMxj55tlfgAAlzFGbMZ+rcV
 1l+ViOZmBFXgFvkULoftfJ5M37vy/4/5H3puSbtXigk2O0eXThSTqGV3YehM8E7/tg
 gB5aQEgZRQF6vV1weCUNGQZezTEDhyu3AgcCHw1SFXuywr0Yy7ZasJDYbytv+N1iqN
 oUUj3xI+eBppKOW9Gs2tC76eulYmm5e8pIbXGUWItttPLI2s2oh/kLgKjTgOMgSvYy
 CBDyJVm8CGkaog8qQ7hpOyDu/AnZTttNLRU91MTS/zeBuJ0kiQVO9baNWVIB7ogqlo
 DvQiIsCMPbv4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mrxIeqhR
Subject: Re: [Buildroot] [PATCH v6 1/4] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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

On 19/05/2025 21:38, Neal Frager via buildroot wrote:
> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent 
> with all
> other toolchains built by Buildroot.
> 
> To build the Microblaze applications available with the 
> xilinx-embeddedsw
> package, the following config is now needed:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
> 
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
> 
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
> 
> Either vendor name is now valid, but there is a warning message to use 
> the
> Buildroot vendor name, and the support for the 
> "microblazeel-xilinx-elf"
> tuple will be removed once all zynqmp and versal defconfigs have 
> migrated.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
