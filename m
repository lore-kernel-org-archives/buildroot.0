Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F9C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 18:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFED40BFE;
	Mon,  7 Apr 2025 18:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW5kiRYplkrb; Mon,  7 Apr 2025 18:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C395440C92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C395440C92;
	Mon,  7 Apr 2025 18:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3A71F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A4540BFE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMvqbUfxwEei for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 18:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD3A5405D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3A5405D6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD3A5405D6
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 18:06:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 57E1DB0054E;
 Mon,  7 Apr 2025 20:06:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Apr 2025 20:06:07 +0200
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 20:06:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250406213130.3623145-1-giulio.benetti@benettiengineering.com>
References: <20250406213130.3623145-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ac702cfd5aa5139a0a1b47745f5010ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744049168;
 bh=9nugBFVE4xKAOphS/JoKsSBzZSmre9Ce4OFXSaHoC6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ejamP+0yOrkP2QzBdU6Rbixt3eoRUNsC1+8thQ1BEx4W1bEutItnnf+rnx3AshiVK
 M+wsINpUmWe4hqSSKfGGJsKay/byEWLKAMw9limlg0x9KW9LMo1jJ4ejm1nP2q+oWC
 HtYhzL2qBY1siVirnknzX+uQxgucEyr6phZkCXJ8+om+qUsPkm7oXx2+PaIf53p99d
 w2wOVcsCj5kCl83ebQvxM8rZ4wyaukO8TbqiCLq1nUqrQBZpW61FpvsOussOHcix26
 X8+DMACnnI537zxOjhAO3qX5vrHQZhNe6wWwu+zT2Um6fxQzXVYCUN2A87RBz5+Kc3
 iVFjBuV58uuAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ejamP+0y
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump to version
 2025-04-06
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

On 06/04/2025 23:31, Giulio Benetti wrote:
> This version builds up to Linux version 6.13.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e71/e71a5b46affe5948c16a0c83534d8f56f69b6e91/
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
