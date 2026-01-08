Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411FBD1D478
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49C040A70;
	Thu,  8 Jan 2026 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1--yDnMp2dJ; Thu,  8 Jan 2026 19:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A4DF40A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767902330;
	bh=KLz1/Go1y93oa0fb8y7JQEOPMCXcTSv+EdmehDU3XTw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hN0bb/qOqlBDB4vADVOIBuqggAIf7Rg4wNngoQl7Jh3noXbOcfgc1KkwoWo6Opm05
	 26csGW6RHozaCaERM6VWmA56Ta9fAiykgr5jgzN389WxfrzBj4tGiObIOeFrTiaOsf
	 VISaelG7QG8d2y6SB2koKs8TZbzP8X7peHXtZdJLFxujQVdBZf3cCzjh1zdBeU7wqS
	 Yf5REzk/zf1bxmJr3b3SRVl++SlEHEPD6Fg49k5jK5WT04ESO5899kD8AoyRHmwpD5
	 YZKI4/5szDJylTgfqJn1RHy1IhZ64LdPmjmiYuOpkedsrDBd4kqE940wycSa2gji9Z
	 3CJjwy8s9pcNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A4DF40A5E;
	Thu,  8 Jan 2026 19:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C54278
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A3B40A5E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iqtnxqi97Giy for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0A9A40A5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0A9A40A5D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0A9A40A5D
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A3BFC2003DA;
 Thu,  8 Jan 2026 20:58:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 20:58:42 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 20:58:42 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Lothar
 Felten <lothar.felten@gmail.com>
In-Reply-To: <20260107194357.1843652-1-dario.binacchi@amarulasolutions.com>
References: <20260107194357.1843652-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <88ac79132e7411f4ecb1ef23f961dc6e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767902325;
 bh=504VsVPwBKudQV91wtQYTUZA9Yxgynrh9/2EN14lHho=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KAXoImx4Yhc6rul0U6lgFhbMN2VJMyNu8duPyW1kJ3r9IRniksLID6RHRl8TuZ3CU
 QRPToUgdoidTqPWsN4mwiq7IlSUdvimlea8icLRBD/lOu93iPdwN9RiAmCMQ/KFv0b
 O9klcYGwFlhuxnu54k9WKaUz8OEjFfgfjm9NO5EXVyqKNzFs+6RYYYC1hOvJ6YUpy9
 GMmoBDW1T6rktjeMxvBRd0WV5io42jNVtiaDFH6hK0GWACibuB8ZPZQx28e3HQySfK
 fnbulAaE2oJKA8l4U/T/Hg/XSuUa5khw9qkQoZf/MKGojJc+iSlMX6k/bUXNLMNkXA
 Yp8KykEvmJaPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KAXoImx4
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot to
 2026.01
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

On 07/01/2026 20:43, Dario Binacchi wrote:
> The patch bumps U-Boot to version 2026.01.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
