Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13072C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF11940806;
	Wed, 26 Aug 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eurKxdbWJxR; Wed, 26 Aug 2026 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777037;
	bh=3XBTnPddgRZyj5t+bPmVUKAasClVjxoZPhHAtNyzk5s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LGo7DZKKNTt6fUtBP/oJ5Mgsk1sYgU7y4oJIKE9JrAW9otcia8mozzR7SdVi/caWt
	 yJ4KHO5JF1oVrqjezqb6KnRzIgxyUuUJvYTIxo2fF51D5NdD9yQoX4C8+ad0seQ7K9
	 qJhtPDVN8DDA7Y0BUB+SkyBuuLy650XC4TG7H/s2f1x/jn47zPeb12yRzSH2gKOAkF
	 pqR/McgYDavWGWnz2n5ffsJFWb5n7BaHQNPdokhCwQQpGEv7QbEbTinx/hpR0p0D22
	 KP/WQWXpvAshJub90zr5V9+RdafPrw8b+rYx3vAsh8A/1jeLluHwY/6HvFFFbOrC2Q
	 PlNNRpZ86YSTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC00406E6;
	Wed, 26 Aug 2026 20:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40A283A4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331844024A
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48T9oDLk3rHq for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDD6540247
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:43:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E89DC5FFAA;
 Wed, 26 Aug 2026 22:43:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 22:43:48 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 22:43:48 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260826073716.32029-1-titouan.christophe@mind.be>
References: <20260826073716.32029-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.18
Message-ID: <982bf20b671814cc8d6ad12330e3a40b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/{avro-c,
 python-avro}: security bump to v1.12.2
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

On 26/08/2026 09:37, Titouan Christophe via buildroot wrote:
> This release includes a broad round of hardening against malformed and
> adversarial input across the Python SDK (bounding allocations and 
> enforcing
> decompression limits before trusting size fields read from the input).
> 
> See the release notes 
> https://avro.apache.org/blog/2026/08/12/avro-1.12.2/
> 
> Also update the download url, because www-eu.apache.org/dist/...
> is a redirection to downloads.apache.org/...
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
