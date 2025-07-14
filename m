Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063C0C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 09:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48DB81FA7;
	Mon, 14 Jul 2025 09:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96kAU_rJLKyQ; Mon, 14 Jul 2025 09:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFCB81FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECFCB81FB9;
	Mon, 14 Jul 2025 09:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61B8FDF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DF8481FAB
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVlERkew7aNs for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 09:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6903381FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6903381FA2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6903381FA2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 09:46:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3166A6013A;
 Mon, 14 Jul 2025 11:46:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Jul 2025 11:46:45 +0200
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 11:46:45 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20250714091150.17718-1-buildroot@bubu1.eu>
References: <20250714091150.17718-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6f2109cf3b616e0fd13245e4e15bc039@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752486408;
 bh=SxvZbvKPogsxEfrkv1lYxOfmlRxQfEip+geqQ5Hu0/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PjRCSygcd3u1RYm8gYSy0GeEQO4cou16JYRUzZNAGWNU3TcnmFI1Wmzd1cQW3Rmx0
 dNIx/oDDR/KWdFYLQwaFQIZwgYz9yRRhQfJPWELiFtoJo6yxzCG8Kvs2K4obd28E4l
 taCWHCM8J8RdHBuwNPJkS8H2vdliQ8zzmBlwlh5LhC+qeeSCgmPQyKIqSmmTqNBzhI
 bUPIjXMHpNl2gslvpdC7cEAsmX3B8p07R+4LPIrBu1PoMJyRsyrhiTaJTkNKm7ni91
 ZLx0+4TcbcLsOiX+y1HolUYxItgeHHcBA3g3+UVK2fmMAu27tYxERu+CY3/liHSLhu
 TpxZEAPSrzhTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PjRCSygc
Subject: Re: [Buildroot] [PATCH 1/2] package/python-typing-extensions: bump
 to 4.14.1
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

On 14/07/2025 11:11, Marcus Hoffmann via buildroot wrote:
> Changes: 
> https://github.com/python/typing_extensions/releases/tag/4.14.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
