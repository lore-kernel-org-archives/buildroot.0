Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170FEC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E183460A83;
	Sun,  4 Jan 2026 10:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf1Mc7ZNwK-6; Sun,  4 Jan 2026 10:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB579607A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522771;
	bh=4YYfSm7zeQuXs5E7M+wP2BFLrzMmF8g2UVMR88xUbMQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DYizsrG7r/USuI/2lfb5t4puhNC2pqo2NR6yHs5ZYDrIX42pqBe/VvsxWVQSIANsa
	 /7iqqvDCjwFha95R8I1jX8jFvqzXHRUbNvF1rq2XZ/M7aJGANDzzVW537iftzJQ7g+
	 12VOsWvgRunf5j1Yg825A3zlozk3RaY9dPeRgJUhpXcgbuFkTiE35rn0sP5WmaYBN2
	 Dsx26B8zBTh+vF2UJ2ZVM5xqze45vqPQg29oU2gSvV/xVTuh81vINyIzsYFrsZ3UQ/
	 gq52OR1wsFVDKFOhwmHEISNhtYVMFBwHOYVf1PITCiuRcaXtRumxfuoNn0ENXUNEKM
	 cv1NWvMbDvoqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB579607A5;
	Sun,  4 Jan 2026 10:32:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B8E249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4E4D607A5
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktnBA_tJJHNt for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:32:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC1B6606A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1B6606A2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1B6606A2
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:32:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CBC8BB00576;
 Sun,  4 Jan 2026 11:32:44 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 11:32:44 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 11:32:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260103180254.1999810-1-james.hilliard1@gmail.com>
References: <20260103180254.1999810-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3109d6ee27d68739f47c1b852e199f87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767522767;
 bh=sNDG+K78x9qmnzKA9TWUDNTeI2WbI4kHQlpVYLpmXac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iO0Z7QWNh00ORHskTmTxzGPHozzD9Gojd+iAiiSfhkPmx60EXhK4tPaqqlz5eOrKJ
 P6GdURdwtRr8MzeLk8iSPJnTmi9bwnF6QWWfBI096xjokY1FMVTGsMzYgIgXo/GJzw
 GnffGTxQD3BYEqoOOWypiuogBPFIKoB499Hz7MBBsldbChZnDOJDNVb07s6TSE897w
 siKBjDM6+V31feDHw/kAh61wZnNGgOiqsBBr0SsXHii9i/fhS8CeGAY9I2ZZAPc9cr
 aSFBdAchCcSERESYK6H70DsO8u+a9rQQrl25erUJ2QAg/QeRWU3hSJIOMOWnyWgCsn
 ywrd9u4yf3l/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iO0Z7QWN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-platformdirs: bump to
 version 4.5.1
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

On 03/01/2026 19:02, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
