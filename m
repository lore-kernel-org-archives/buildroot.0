Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71124CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AAD183BF9;
	Mon, 17 Nov 2025 20:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32Dnifi3rkjQ; Mon, 17 Nov 2025 20:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD2E83BAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD2E83BAB;
	Mon, 17 Nov 2025 20:44:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE0AED5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C402B40B98
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IczPZlh447M for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0BE740B92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BE740B92
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0BE740B92
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:44:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2F6F55FF95;
 Mon, 17 Nov 2025 21:44:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 21:44:09 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 21:44:09 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117110117.40028-1-shirokovalexs@gmail.com>
References: <20251117110117.40028-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fe0875dc7fc706297c5005d3faa0c253@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763412250;
 bh=pxecC8nRxrASc9BPV/sQx2UOMbZqzzSEaZpo3aWdD4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dPx+68KvnFnzAOo/GbhkLrvmkfh9Nc8bcfuu3hKHVruFPazK7cnaqEI8X8Ng/ZhWK
 mo0EkZx3KuWLqeMc6JGH2LavrmRM/YQJPOyNGiFRUE72y+9V42kYmWkNPrBl4r8jUu
 mMLuFAwY/TQTyTnMuLrxzTq0/Zu9UwiuLYrETE+aAi4EekOVwNs3p2qpGB0enBEKwX
 265OWdM5I0hbAtVspOBJVngKVsgI35c7n3C7U8+nn7pZ82SLUmLlr3qO7mOPYxzCnH
 mebNqeoZOdQtyf8OswEX/uCjcTgyALCs0qKKfNfnEsIiad4xprjjAMYC4frz6pVGUT
 q5wdKy8rKZTNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dPx+68Kv
Subject: Re: [Buildroot] [v1, 1/1] package/broot: bump version to 1.53.0
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

On 17/11/2025 12:01, Alexander Shirokov wrote:
> Changelog:
> https://github.com/Canop/broot/blob/main/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
