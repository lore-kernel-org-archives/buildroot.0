Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED5FCAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F044076C;
	Mon, 15 Sep 2025 20:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rLQ-OLtgn_X; Mon, 15 Sep 2025 20:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 676DE40810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 676DE40810;
	Mon, 15 Sep 2025 20:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 879711F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 819DF8123F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRNxwnRu0GMP for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67BDC81237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BDC81237
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67BDC81237
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:27:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 419305FFB1;
 Mon, 15 Sep 2025 22:27:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Sep 2025 22:27:32 +0200
MIME-Version: 1.0
Date: Mon, 15 Sep 2025 22:27:32 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250915132556.47191-1-titouan.christophe@mind.be>
References: <20250915132556.47191-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <847d2ff7f402a465c8d2fac38be47ed3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757968054;
 bh=08jyajnazOFwSEParH404qH/K8fnUvxcBiGatBb0TPI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdO9XG0ctw21HqcVHUWkLXd8c6eIpxZvKD0yfpkMbaX8YqudBgfP0hlRbaA1IFLnC
 KAC7V8/5sw4BU1CgYzE+xxngFZPwevLQXobS2uh+pCqeip6YR84grYxXdfL0kaT6z8
 YHnmPT/bx6njYmPzj4rKzFr0qc1tPQlEOvykSGnKdK0VodQPqGiTok/AbMfOLUHSxu
 GAgCyVH3zc1DevoPd11Ax8xrFxtA0eC3rAPFfkkhd2eAZizBBpMT6iMFhr1V6seSe7
 GI9ARyU+jZ+LoOe2idEWb6+gqQ4dmC8JrTrYBwCABaZk/y36lR3IcG5Yaej7Y570Qs
 8cy3cR9lCgZqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XdO9XG0c
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: fix PKG_SITE
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

On 15/09/2025 15:25, Titouan Christophe via buildroot wrote:
> python-flask-cors was security bumped in commit 04cd135b26 [1], however 
> this
> commit did not update the _SITE url; which changes with each new 
> release on
> pypi. Therefore, downloading python-flask-cors would always fail.
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

I applied this patch to master, including the comment from Yegor.
It fixes the source archive download.

While testing, I also observed that the license legal-info is also 
failing,
running "make python-flask-cors-legal-info". It would be great if 
somebody
could send a followup patch fixing this.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
