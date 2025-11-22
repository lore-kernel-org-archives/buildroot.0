Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D6CFC533
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3901460A75;
	Sat, 22 Nov 2025 12:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWUfRYzsmM4a; Sat, 22 Nov 2025 12:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80EAD608B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EAD608B6;
	Sat, 22 Nov 2025 12:57:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33270158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1974340EDB
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62V3m6HmAwgr for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01EF440ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01EF440ECA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01EF440ECA
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:57:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 80407B0054E;
 Sat, 22 Nov 2025 13:57:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 13:57:03 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 13:57:03 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20251120124427.1374845-1-buildroot@bubu1.eu>
References: <20251120124427.1374845-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <5567e6da7f2689a4c90d17f9a4c178c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763816227;
 bh=tzeZruJ4QGc61yvL7FeyIj5OwIS+a5MVp8TDYVG+1jE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AHzfmONx+XrdyfDr7vpUlfGA367pYYMD575G4oFInprj4Bk99AGwJ3nCilCoaCGOn
 42p093dM8uQfd+DXf25CJz56gfxfBqx+fDT4w5q0NX94KMRry3KcnwWjjS1kMvMqUq
 dHtg/Usy66Z6nCRcmSLiFlLO3iqW13ctaRnCzr6jq3MBzRllv8iYBT0MTquK0AhgXi
 5H2pB54bJqeFYutWK9dclZLx7XWPImnZnkbdHz9oGCZjducCnmwijG8TNA1+Q8nvot
 nPJObink489DoAgaDSulDLmO0TY8sdDcpmQ2uds8kPG+WTMbESqKGJb5bQK4Z/9pM1
 iWuPaMpqeyaIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AHzfmONx
Subject: Re: [Buildroot] [PATCH v2] package/python-gpiod: new package
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

On 20/11/2025 13:44, Marcus Hoffmann via buildroot wrote:
> This adds the python bindings of libgpiod for version 2+.
> While the python bindings for v1 were optionally built and
> installed as part of the main libgpiod build, for v2 they have now been
> published to pypi.org for easier consumption in the general python
> ecosystem.
> 
> We need to set LINK_SYSTEM_LIBGPIOD=1 to actually build against the
> system version of libgpiod which we install and not use a separate
> bundled copy.
> 
> The package is licensed as libgpiod, but as published to pypi doesn't
> include the LICENSE file that's part of upstream repository.
> Reference pyproject.toml as that has the license identifier as a
> workaround.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
