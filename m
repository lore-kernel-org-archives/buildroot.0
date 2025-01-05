Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C594E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 12:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB7EC80DD4;
	Sun,  5 Jan 2025 12:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSwASHjPFEPN; Sun,  5 Jan 2025 12:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CBC880DD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CBC880DD5;
	Sun,  5 Jan 2025 12:04:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE63FDB4
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 12:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC68F80DD5
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 12:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx0aJ9uhaMDC for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 12:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58E9680DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E9680DD4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E9680DD4
 for <buildroot@busybox.net>; Sun,  5 Jan 2025 12:04:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C0D4360132;
 Sun,  5 Jan 2025 13:04:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57946])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 13:04:25 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 13:04:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20250102102326.30250-1-mf@go-sys.de>
References: <20250102102326.30250-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <3e3c99348cb6e09d20150d4c586dc656@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736078667;
 bh=iv/CHS+AoXF+d9xbOOjGMzV0jq7ZmF+Jf6VKZqWebIQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eA+7omzLF8WkEj/X9T/WQWQkA7F2B6vcBkhkVeMny6gDsVQCj1LLaRMtSrzptqCBS
 eIWPwM2mMaG0GvH6n1Ernzu3snM/dkNwZ2ohZHLMCCs/H7h4SAjQCKaxGc5CS6Rqlj
 QCVLu/8vvD1fMIQwAYR0H7I3p5XGAQCnU1gfNoHZgA3h9uMh+C4j+e6Q/0Vt12SOhi
 grqsWZofHh2HNaLLX/zuNvZaJZSb/+xZ8hoG/9CjiLVGHxvjboLaTn4KfX4GLTbCkt
 fCl92QrnhRqzTp2FrZIjnB1jEiL9Q9Iv1a9E4iLSU1VhPu+NgW4nJMFFQKl3M8v33P
 ZxnBhF4HVu66w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eA+7omzL
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.11
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

On 02/01/2025 11:23, Michael Fischer wrote:
> Update the license hash because of a change in copyright year:
> - Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>
> + Copyright (C) 1997-2025 Sam Lantinga <slouken@libsdl.org>
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
