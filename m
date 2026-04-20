Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3BF5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D6441115;
	Mon, 20 Apr 2026 17:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8ueuZODrdG5; Mon, 20 Apr 2026 17:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3471141110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705805;
	bh=Jllkst/YWS46yG8uSNLTCBY8m/EfVL7ZtJH6k8kpoD8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a6GD29T7aoAumqxxgCVmi4awTrb0X7SgyBn3vk+SX4CX997xaBg0giT/hoJ9VXaVi
	 hEMewP1bFDWZKAEP2+XUX6qScQfcLqSrWDsoF/iz+XyXtC6dNXOm1lnEkp0rRedaOS
	 g132KwJkTLaeaZrM2h74bNwwJjvte29yQTAJmjSPDfaHeHZXK+BXfCBADwsDTf6Y2e
	 WqiKDMmfyJzPjB9vR8KZb1Qc5OnzERVerTkPXNPVHh9B/KfEHzLZsfZunu9CiVL2tE
	 rJB0ScLd+Ho860LNP7YCu5RQ0xVQk9RDHM544UZf8OBcniOPIOdwxBlTCEX7JFbHmX
	 f/mrq4H6zcYfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3471141110;
	Mon, 20 Apr 2026 17:23:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBC5257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E7E82CAC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dpw-4qCx2Kd9 for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8A5182BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A5182BA1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8A5182BA1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B843A780395;
 Mon, 20 Apr 2026 19:23:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 19:23:18 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 19:23:18 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260420142814.753135-1-buildroot@bubu1.eu>
References: <20260420142814.753135-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <9cd836be0bc0e28b30cc77a1ee4243a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776705801;
 bh=e3m1a6FzPsK1Y1BYEeUDKrnbRmrNBJd8euuMJ2nk5N8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=px4UywxBw5fDwwO4eBXXfWPF4WUoN4xWnua4V7c5xhipT9XlSafjwogOrd/K6n/Y8
 3lGauMgz2+hT40QpGJdnbAVf9ReHS4cr+i/MwttPbqTlUIxXWRPA3AV11BCTnDOiud
 fafsyqGPCOyhi6ygQbkWxf0Rhfm+hQau1gs0Vd+RYhnvEHT2rZDytibHIv1caGs7T0
 pclL6Zu5aGx0q6XUimN5oH9BM2ZU4cUC+TDV/3uFI9dnfE2fW1w8mSgVZEL//xKquA
 PbLTFANvywC3nDd8DomMM9vkM+DoumJEluKUGwL+uBQThlVjyw15XIyDm/QyN86hWm
 6oE8npWY+8FPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=px4UywxB
Subject: Re: [Buildroot] [PATCH] package/util-linux: security bump to 2.41.4
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

On 20/04/2026 16:28, Marcus Hoffmann via buildroot wrote:
> Security fixes:
> 
>  CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
>    The SUID mount follows symlinks when resolving loop backing file
>    paths. On systems where non-root users are permitted to mount loop
>    devices (via 'user' option in fstab), this allows access to
>    arbitrary files.
> 
>  CWE-190 - Integer overflow in libblkid parse_dos_extended().
>    A crafted MBR disk image can cause uint32_t wraparound in EBR
>    chain processing, causing reported partitions to not match the
>    on-disk layout. Tools like udisks may then register a partition
>    at logical sector 0.
> 
> Full release notes: 
> https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
