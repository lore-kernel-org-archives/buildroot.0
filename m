Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33557C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E76E381120;
	Sun, 19 Jan 2025 12:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jhnONwsqXgk; Sun, 19 Jan 2025 12:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A23811D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4A23811D8;
	Sun, 19 Jan 2025 12:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8477C69
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72D9D81120
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G57BL_MRN8Kx for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35AE88111C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35AE88111C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35AE88111C
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E050F19F5AF;
 Sun, 19 Jan 2025 13:24:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38758])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 13:24:50 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 13:24:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119084511.2816892-3-thomas.petazzoni@bootlin.com>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-3-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5269dac5ebf278f2c8b644ebaecb5e69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737289492;
 bh=WrTG0TgZRTP/7qV9ngKpYPtLWJ0seyG5mdkjEXPRx40=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oxVvuPTks4Sxnxwczlr6Y061YUVJtR6F+Uo0RHJElpNx5zmRv74ldsSPa5a5ibFq+
 mf3/8ZcHi9+8W180CDhQY6Y9d60t0VGv/uS+5QzxOJLf2I1723lfqEo3tvPMnid2mq
 T9YJJx2wnhTdG4DvTFL+SFlKDTFLLjr3J4l5ZylPKAG/eQjzXzLFEDbRFICu8BqDok
 i1dspyfw8fTlI/KqDUOeXsBQEkFj2vyA5fRavb4W7xsvZ9aWEUUfHSds7ENYJA3YsU
 R9b7VGUEpQaOo0bUzhCXxdQ5JGVMV+nBdzEX+uArL+cweBqPreBk/BWdqySjqJfl3J
 hmDHcCW3hKUeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oxVvuPTk
Subject: Re: [Buildroot] [PATCH 2/4] boot/syslinux: add multiple patches
 fixing build issues with GCC >= 14
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

On 19/01/2025 09:45, Thomas Petazzoni via buildroot wrote:
> No autobuilder failures reported, but it fixes build issues that can
> be reproduced with:
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> BR2_TARGET_SYSLINUX=y
> BR2_TARGET_SYSLINUX_EFI=y
> 
> First patch is backported from upstream. Last 3 patches are not from
> upstream, and they have not been submitted as upstream is basically
> dead (last release 10 years ago, last commit 5 years ago).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
