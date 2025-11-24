Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7716CFD355
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE7183CFA;
	Mon, 24 Nov 2025 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-d25XKdtWZT; Mon, 24 Nov 2025 20:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC8D83C9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC8D83C9B;
	Mon, 24 Nov 2025 20:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70659E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6288F83C9B
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZHuvLp9FN4E for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 20:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3670783C4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3670783C4A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3670783C4A
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:22:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9F416B0051E;
 Mon, 24 Nov 2025 21:22:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Nov 2025 21:22:28 +0100
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 21:22:28 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251124165718.3127354-1-buildroot@bubu1.eu>
References: <20251124165718.3127354-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6f4388de8db42613dea2e83fda2ed009@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764015750;
 bh=+Icbt1UkoE20cbj38VqoPhFsbmKt3z4hqIJQzbep8gk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GUfl0PBMWuRYEOLz7Ja9H+yN2HuFdEhA87jYLYQV9skp94da5T6WBltNKk0ztw3aw
 nnuKWBTdgB0f2PSFbOSf24YBiPBtVr6Q6Zx/E4sezCJ6uoIRM4BHF4H5seVFh5gucC
 ZXwooArxyt+vqockABrIffBbyErCEbyJcygP56EMPUAdHRWqqznARB1Hj7HEHBsZHg
 zEZFUAbiVRH2jBQrsydZUvTzaIt73H4rawuQL/S1EbmlKQW2bghSxuHDki7uHrz5cK
 ddRVLmEjv+eUFtVl8n83kUUFteUS7B1nmZBLRQ/OLuaiUR4cH4MSZyY9fhnSUKFSvl
 9T1dG2R/rzg5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GUfl0PBM
Subject: Re: [Buildroot] [PATCH] package/python-starlette: security bump to
 0.50.0
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

On 24/11/2025 17:57, Marcus Hoffmann via buildroot wrote:
> Starlette 0.49.1 fixes the following security issue:
> https://github.com/Kludex/starlette/security/advisories/GHSA-7f5h-v6xp-fcq8
> 
> Other changes:
> * https://github.com/Kludex/starlette/releases/tag/0.49.0
> * https://github.com/Kludex/starlette/releases/tag/0.49.1 (the security 
> fix)
> * https://github.com/Kludex/starlette/releases/tag/0.49.2
> * https://github.com/Kludex/starlette/releases/tag/0.49.3
> * https://github.com/Kludex/starlette/releases/tag/0.50.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
