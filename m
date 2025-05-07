Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD68BC3ABC5
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 08:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5177F80C5B;
	Wed,  7 May 2025 08:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtwUjGzf4OLh; Wed,  7 May 2025 08:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BE780B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BE780B29;
	Wed,  7 May 2025 08:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9021ACD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 08:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7627F414D6
 for <buildroot@buildroot.org>; Wed,  7 May 2025 08:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPKvQchHR6TD for <buildroot@buildroot.org>;
 Wed,  7 May 2025 08:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BB8C40BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB8C40BA5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BB8C40BA5
 for <buildroot@buildroot.org>; Wed,  7 May 2025 08:49:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B7A8B19F741;
 Wed,  7 May 2025 10:49:09 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:42606])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 10:49:09 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 10:49:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>, Richard
 Braun <rbraun@sceen.net>
In-Reply-To: <20250507045650.5514-1-kadambini.nema@gmail.com>
References: <20250507045650.5514-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <bbb6788d52bdc76bd58e3a47a368e747@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746607753;
 bh=21xN3SWAKAGOE3ce+4wiHh0u6c8roqkJXurZCkqgRUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=skGYnlHDJKo6qOR7ht26gOhK5g0o6t2Ywa0+sftaFIvcae3h55pz4XtYw+v2jkYg9
 7Q3HtkUrK9ahVIp0HVtslqZO1hN1j4TwB+IiidTZ9nbKFth+npdhv36ZL7remaAFaE
 qjEwkc3mTHQA+69jDslVI7vZJBKIsTMiDhv4so83ilMWZ+0ZWdxUoe8EFBNiXkGb59
 TtOhHHTdvtC4dPmXVT8J407dCfl3gpcRNGxKUndMyjeKQwAsj/4jppVXzwXXvHZE7O
 ZXLGzpuTnqAtKxXnRttSD9uD3pqS8q/rZM9f5me71atY2h5yVeWSvbrkjkRGttjX7x
 zwNnMyZXQcZeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=skGYnlHD
Subject: Re: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2025b
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

On 07/05/2025 06:56, Kadambini Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
