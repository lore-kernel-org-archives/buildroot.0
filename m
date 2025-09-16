Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CDCAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 18:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D7680AF1;
	Tue, 16 Sep 2025 18:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGWryg57YnlZ; Tue, 16 Sep 2025 18:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4009680A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4009680A89;
	Tue, 16 Sep 2025 18:59:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC19279
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2556610D1
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMRlpxEu4Uto for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 18:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFA49610D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFA49610D0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFA49610D0
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:59:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6BB2A19F5C3;
 Tue, 16 Sep 2025 20:59:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 20:59:21 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 20:59:21 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916151344.164798-1-titouan.christophe@mind.be>
References: <20250916151344.164798-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <fa13d692c55a6b3a9b8289e80ad1875b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758049162;
 bh=wpHoBrT2YZUDolvBgBHhr4PuJhCNYBxUQhZKi/6mSuM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U23GfTS9NgaFNY2w/7J/1bOfdaaIpQ9KvR1gWI/O0DpzcLNtLZzNHJH9WGMFNARDg
 46l1U0/Mg1lK7nIRiOwfSjjwpHvrykrpZJgo3RxSipbwgeBvNlqZNs8lWmbgR5n/vt
 myFeCr15z64EoXANuMSWFDVZh5H4JKxX0VKSQ6jyAQ7opVG3ikbgPD2kSOxuXPtnwb
 OrQotOJjAaQjvYktdavVqeaTBKM7Z03m++9XjCO/fFoHUuKRTpxCKJV9gRJsxxxtRc
 E4658Hpz/mjmFVeSTR22orx8F3WFVyVNApe8OZsgU1UY3qBvPO26gwghJWxkRLR8SY
 4Oa3CSm8YBlCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U23GfTS9
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.2.1
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

On 16/09/2025 17:13, Titouan Christophe via buildroot wrote:
> From the release notes
> (https://github.com/redis/redis/blob/8.2.1/00-RELEASENOTES)
> 
> =============================================================
> 8.2.1 (v8.2.1)    Committed  Mon 18 Aug 2025 12:00:00 IST
> =============================================================
> 
> Update urgency: `MODERATE`: Program an upgrade of the server, but it's 
> not urgent.
> 
> - #14240 `INFO KEYSIZES` - potential incorrect histogram updates on 
> cluster mode with modules
> - #14274 Disable Active Defrag during flushing replica
> - #14276 `XADD` or `XTRIM` can crash the server after loading RDB
> - #Q6601 Potential crash when running `FLUSHDB` (MOD-10681)
> 
> - Query Engine - LeanVec and LVQ proprietary Intel optimizations were 
> removed from Redis Open Source
> - #Q6621 Fix regression in `INFO` (MOD-10779)
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
