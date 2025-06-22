Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD51FC77B7F
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 13:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8514980E27;
	Sun, 22 Jun 2025 13:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGag8u7Vvehp; Sun, 22 Jun 2025 13:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23F381757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C23F381757;
	Sun, 22 Jun 2025 13:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10BAC12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA8C281757
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rXcbgX-oYN7 for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 13:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2841780E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2841780E27
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2841780E27
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:58:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D767A780507;
 Sun, 22 Jun 2025 15:58:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 15:58:45 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 15:58:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250622100333.3836532-1-bernd@kuhls.net>
References: <20250622100333.3836532-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5f15849d16a0caef94970b20e754e76f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750600729;
 bh=gLiW3FMZaLW+QCv2ZAnHP7fixP/FticES7I4tbusj0s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A4a8M59beIcrzvnjWYy2t2QhJkEmmD6p3LR3Zdn02hnB5//JqulMCI4i2wVZqImYv
 3Fhex0UOj8QtkeZhPNe8sg/9HDT2ADaDM49F10/TFgODccBXOApMOhI1m9n3PuNBUE
 jgoHH4WSw/dtGd3hbBotM7M8drOIlNB6ECTi6x2JOcpehhms7eO16UukbZAB5c4K6g
 TE8fcsFetDAFaQKmsxqLAMDawQbivt1MmQrygixXDJkN1K89i2ZxJfncWiFds0BrLU
 MOl9uoBzPtVbOQDdQJ6PXClJSGNqcMlhh/fRCLLOqumcwMTjZmYDU4b6VDjKtlM0Wk
 lV07X7rMcQ8FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A4a8M59b
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump to 3.13.5
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

On 22/06/2025 12:03, Bernd Kuhls wrote:
> 3.13.4 fixes CVE 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 
> 2025-4435
> and CVE 2025-4517 but introduced some regressions fixed in 3.13.5.
> 
> Release notes:
> https://www.python.org/downloads/release/python-3135/
> https://www.python.org/downloads/release/python-3134/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
