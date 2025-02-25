Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFDFC021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C1260EE2;
	Tue, 25 Feb 2025 20:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIfVvEU0BkSF; Tue, 25 Feb 2025 20:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B8960EF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B8960EF2;
	Tue, 25 Feb 2025 20:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07B632DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE6840C69
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyF-iArvEAk1 for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 20:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B648D40C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B648D40C20
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B648D40C20
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 20:45:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2C2F5B0057C;
 Tue, 25 Feb 2025 21:45:34 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Feb 2025 21:45:34 +0100
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 21:45:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250221220000.149303-1-giulio.benetti@benettiengineering.com>
References: <20250221220000.149303-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e2f3eae6c2ad405b4cfd11d195e4c65c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740516335;
 bh=7henIxH6xv2WxVEXVjFYKupdIFZ9vz/Th3AQr+jPT4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o7LGNlDkr+8bR7rvFY9USOIRN8/rWZJ6InBE7FDuPCfQ7ZS5e9NzFlLr4fkpcUgZZ
 y+1mEs7lNH6870wYHY8CeJyNNbUCGNNd/iPMBjUY++0BRJhCqkqwsgXvhfMDJ95Puo
 FePgyF2EPCczfn3+B9Woul4rXsrdpnSDXgT2WpvJRUZCnt29PP2ee+yQO2BHwCMj/M
 EqnZmtS9D4FiDp9kEJqufdZPu86B+3DUPgvxR5tOXFLL55SXm/oIowb3a9xbb1Z4+q
 KamknM+2hkueypkQz88lUWaN5wKrPS8SmNNZ8yeuDllkkN/eqYw0wQgs2j4ZaBThkD
 bNnzovYofr7pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o7LGNlDk
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.3.0
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

On 21/02/2025 23:00, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/10.3.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
