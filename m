Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA32E937EB
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B1E42389;
	Sun, 12 Apr 2026 16:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-6dXQQPiSYW; Sun, 12 Apr 2026 16:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF79D422D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776009743;
	bh=2igE76oGQ9S+buzh2p7RuinzTLlSjuUBq3CkQU19FfY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WTXwn9z5LRYvO5E6sf3e2/0e4R36EEnsjhS6oC7pvU5AsBU5pPgxe5H33Eyrwab8Q
	 sZazqWtPp3OyWjqNgARYmYN092lGMPuOoJfKjXp/4lVqnLB/DOrnGKIuoz6LSdUbfS
	 Ingz2VvbJwrAPGPPahP5kCwHNC1BOL97lRx4zOlfks3t48ggbJuasp4sVJEDDckGMa
	 b+kJuXmLoVCmr6nvzADZpERoZmg/g7TL/6wfvZXmThP6ulA6mIIabaBPjhtpjG9hgm
	 QwC5KyzQD8KWUtmXZwCttXpb253+pMgJ6/GCazRH0EPndnn+WSVAq/KOCYwD0KEC9l
	 oisYaDWCy9Feg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF79D422D9;
	Sun, 12 Apr 2026 16:02:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EB12237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24EC9400C7
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Kw2XrPDqvC1 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67165400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67165400B0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67165400B0
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:02:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 243AA78035B;
 Sun, 12 Apr 2026 18:02:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 18:02:18 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 18:02:18 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260410162857.1449619-1-dario.binacchi@amarulasolutions.com>
References: <20260410162857.1449619-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <2608528f878bd2a7f5e94ba2edada1cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776009740;
 bh=j7mf1gohjZ+hASclmJHRV94fag0t4aVHF/6hJUTpk90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y9aPf3O+K7jCIVC+fOQRe/XTAOMt9EtmNehK2st/WjUvV89DTECNOYZaLM22OnqOc
 +HRb9sCdM549C4cpFBzgS1tcJNAmnUmQSTUQloCFCdeC0fbTX/Vyk8O1D5YAVy/35z
 GXwOIYQ2IuUvYxJruEflmvmt5Ol1LqX7/ybIy7w5lyL2C2boedZ+fCc7Hhbwz/ne7S
 NrX3z8Fz5kF0T6ShPVMs0nGTp9059H8ODe+0KnMgWIybKm/nZVXpyjx39FT64gKm6v
 JswfrWrIFYuJvSvpVrDItLY/t00ILxevJJGCk/nGkmY8gZiwBLqtX/9eUl0Z7PxHYW
 W4HxdWtxTdUNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y9aPf3O+
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: bump Linux
 to 6.18.21 and U-Boot to 2026.04
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

On 10/04/2026 18:28, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.18.21 and U-Boot to
> version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
