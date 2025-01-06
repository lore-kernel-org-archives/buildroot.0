Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CE2E77199
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6729180F75;
	Mon,  6 Jan 2025 22:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUUrFj2vpSAh; Mon,  6 Jan 2025 22:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB9C80F7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB9C80F7D;
	Mon,  6 Jan 2025 22:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27F76F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2304580F65
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OE4l8dlIEc1p for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C02C80F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C02C80F75
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C02C80F75
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:24:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 59FB719F73B;
 Mon,  6 Jan 2025 23:24:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:24:47 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:24:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250106202116.3135771-1-yann.morin.1998@free.fr>
References: <20250106202116.3135771-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <9af7a329c1fb3f06113a4eb5226863d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736202288;
 bh=g77ZpA87AmW1pnVdeGZSxnMnZ81oFFd1MYb1ja0t9b8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sZxgJomh3lAqF3Ws3bcXzk3a4+EMU+3m0e96FDBtGK2IUR2tYovr6Y9fM8nBgvX2n
 xunG1iwzqu5JEsVlJ/XEQ+DmSAAk9Tcpufp3hdvdIsz9fZxwC69kva3K6loh1KhR9u
 TlF1M18u71CFe0yOQjITBOuzyDDPl50GZGwkADc5GZ/HBMjZWaNtiY+olxH4E/+Q0e
 YmHYeVHXv7jC2xf02uvcwRWA+S0i+UPL5b5yaLK69S7Sq5o0gJ4TELBHc774WS6Dk0
 zX48+JdZ9nimkohUI1Fsmldof7YinAuGqdxzaGGvXsgTuNahX1VP6Fj9GhhXI6DTXA
 ezVx/dVchfNaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sZxgJomh
Subject: Re: [Buildroot] [PATCH] support/dependencies: remove confusing
 comment about host system python
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

On 06/01/2025 21:21, Yann E. MORIN wrote:
> Since commit 9c0c7846cdb6 (support/dependencies: don't check for python
> on the host), we no longer check for a host python interpreter 
> installed
> on the system.
> 
> Drop the comment in support/dependencies/check-host-python3.sh, as it 
> is
> now confusing.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
