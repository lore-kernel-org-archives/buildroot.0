Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1A0F506F6
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 22:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D6E612CC;
	Mon, 16 Mar 2026 22:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nR04tbBoNge; Mon, 16 Mar 2026 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 375A96128B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773700189;
	bh=0zVxDxXMI7aRM6o16atwOXddToLVQKYBdksbor/cTEc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E6CnkcIK9yHmCKGD6A3nzskSDlQWR3eXjAYraVE28Y2PUKSkYeOyAKYNy6ShulxeN
	 zk5XDWnhshevOPP+AcTrdnVAbyV7B55GBFiG3UrDoTTrO9rYJSP3oN8xcSHTvviUpu
	 ZxNVBcGgBEmAjYlq1p+XRTWzA1rPj76meeB2/PRpV6uc4ToKWOblR069NzTCoiFdjf
	 1VZ8/QcrO21AQxZ1ifj8xnx2bvPGqU1kUg7cxqMoqQkBEsH5llKyS5XQGjiaa5cP74
	 NkFOXCshUHW1Wrmet/3Ig+4zwsupoMH9ZtXVWTWtSsQP1E3LA8c7F4mKgffsaISBsc
	 xqa3TeT7AVwaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375A96128B;
	Mon, 16 Mar 2026 22:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DF97D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63AAB40EBA
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqreZYYbgM9u for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 22:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5928240E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5928240E55
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5928240E55
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 29E4478035B;
 Mon, 16 Mar 2026 23:29:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 23:29:40 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 23:29:40 +0100
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260314072049.267057-1-flaviu.nistor@gmail.com>
References: <20260314072049.267057-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <1bfaa4ce3269635aeb9396d050f5d224@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773700183;
 bh=8EfMQaXKi6dRASrZw8yXZ2uAy13CPqb9JYWSuncvz7w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iyz5mtBsTK00RJIxgTG6PrhYqE74BbEFvpcVsoWF/G27OGiwasw+WzOomcmrCNFR0
 ll6M2mzbf7B0fFIXEahxy9UTNTi7a0vTbMi3vdYkm/MUJfV2zTEb4V/t/GydpPXIPR
 o20KR0gd0upvYp0kLKwJZt0r4Daua+JZr4w33yYsqSaWNM0IxpKnETLFqpCaxQaq9V
 e51JLh/BxQmV7bm8KblZXQJg4BcHosqxTJWWXexXcGtr/TIUa7SJQo4Hzdhndc/BxB
 k/lzFzhOnMpTQasXAgXiWua2xXVMh0zBpW01tLTLqmA94I62ZW79TLrDUKk/rApx7I
 afbv5W7xX1vrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iyz5mtBs
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rich: bump to version
 14.3.3
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

On 14/03/2026 08:20, Flaviu Nistor wrote:
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
