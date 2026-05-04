Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B04FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 19:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A9D615AB;
	Mon,  4 May 2026 19:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzsE9XhbCVIR; Mon,  4 May 2026 19:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775C2612ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777922628;
	bh=AmabUOLfJ6fOj+vAO1VA2+8qTn2W4xO1lsAGpp9r3CY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bmDJt1BOUN7pWmvqxtNTf1xQV+xLo0bB/6pvnXUefDTdw7joiEfnRxJ9K3i+ssxkn
	 xeKs6j5GFuI9t1I0hP8y0w28IDfgljGTtTFCFr8aCQXiXuOHFCzqmtId8NWSZksOaN
	 jNanQFUKAcHOKySEtes7rdd5K+K1WnPO1NYttDvY+8pl1C+IBFeXUTONl9CNwBcTE8
	 KVhiNYyixgaRm2og3wbE29FzwZrFEsYXB3UUqxb2Uzeq18U6eGb7yy7DQSm8iqGRVR
	 bOpaosVRkcvsRFyib622A83sOWvBMQaUJeJ7fexyT6sDnUAsvm4DuX5YOOFfvZVH8K
	 jA7LQ7TKHLS9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775C2612ED;
	Mon,  4 May 2026 19:23:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57BAE25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9C640EF9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad2ugx6EPE6b for <buildroot@buildroot.org>;
 Mon,  4 May 2026 19:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FCB140533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FCB140533
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FCB140533
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E99F85FFA3;
 Mon,  4 May 2026 21:23:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 May 2026 21:23:40 +0200
MIME-Version: 1.0
Date: Mon, 04 May 2026 21:23:40 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260504184516.356034-1-peter@korsgaard.com>
References: <20260504184516.356034-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <78e69bf08262c04691fa1a2b77d4df39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777922624;
 bh=cvotf5moxcUfBvmC3zNttj0JGoDnokee6eQ887lKXp8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fHtEE3tjKtX9l2sUn2L04agzFqCmVz518xwQ6+6Y8nGR0m3mZl2IHH+NPNBeHtCq2
 fcqvHOtvgNWC5fuOncDUq52+zwPOmBaFRltfJleh4awp66zzCAXh/BlYfnctV5U949
 JUipLF/eCILclAt4Y567hd9rVHokGII7ODIy3oHFJoC9Zi3fMC30QdavdWTS2JgVpI
 TjjkYedgeO7WRNw6UipE6yMIO/tJug9DGvMU+5++C44eUFrvyW+ZIBHJ75ddwC4m+E
 hZKDSL4wqWhoVEb+UIjd4wuN8I0ZUN4S/GYUdTRJdMlKc0kOh/UypmbYB1tYanW07w
 NbgQU7H8b6qWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fHtEE3tj
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump to version 2.43-22-g8362e8ce1
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

On 04/05/2026 20:45, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2026-4046: iconv crash due to assertion failure with untrusted 
> input
> 
> https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0007;h=b880fb55449693b879beae443e5d9bc1070b938b;hb=HEAD
> 
> git shortlog  2.43-17-gdd9945c0b..2.43-22-g8362e8ce1
> Adhemerval Zanella (1):
>       elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
> 
> Adhemerval Zanella Netto (1):
>       riscv: Resolve calls to memcpy using memcpy-generic in early 
> startup
> 
> Florian Weimer (1):
>       Use pending character state in IBM1390, IBM1399 character sets 
> (CVE-2026-4046)
> 
> Michael Jeanson (1):
>       tests: fix tst-rseq with Linux 7.0
> 
> Xi Ruoyao (1):
>       elf: parse /proc/self/maps as the last resort to find the gap for 
> tst-link-map-contiguous-ldso
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
