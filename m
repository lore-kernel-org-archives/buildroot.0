Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CEDC5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 17:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02BF80E89;
	Mon, 24 Aug 2026 17:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icNaiCPJv_dz; Mon, 24 Aug 2026 17:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787591125;
	bh=ccRA5zPrcVAN0Hg0Us7n04erIx7Crd09nChRAt+EHN4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X/Ch+0URyZuRtjTBD92hiclSfno3vyHJsg7wPNRnLnAhn2jlFCd4cWhuUrNDSDY9K
	 MGqOZr911uKebyLlxjFphTY1VSYEfIwgmcoBlHS+W7xVa6bb8DbAioZ6qYPfntoThD
	 VeSeWcbt1Tu5Bp9e01976hx23jpH2khQjXujuK3OXIkrVX/TEoIDLceFvK6H6sk3RD
	 48evmTDZG6/bE5BgGKnMbdrn+yie9SZ/KMZkMSThm3JDzN+jXgwQZ7clEAqLEiGv9d
	 6HjRQMx7G9MIj5ExACBeebgqc2hRP/ZIDlvbXa6s2EBq1Gi3C9VeGVHe6+sTPw5SHV
	 dbfR5eLknx7Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435A080E72;
	Mon, 24 Aug 2026 17:05:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B0634E
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B43C180E79
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmQM1PkgZF5Z for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 17:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8689880E5B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:05:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D6667B00548;
 Mon, 24 Aug 2026 19:05:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Aug 2026 19:05:17 +0200
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 19:05:17 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20260824101600.3179888-1-titouan.christophe@mind.be>
References: <20260824101600.3179888-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.18
Message-ID: <8d01897aa7ead81143d7989d34458143@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.10.1
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

On 24/08/2026 12:16, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/redis/redis/blob/8.10.1/00-RELEASENOTES
> 
> Notably, this fixes CVE-2026-62356: miscalculated buffer size in
> `CMSketch` RDB loading may lead to heap OOB write, as well as other
> security fixes without CVE number
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
