Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4981FC83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC5760901;
	Sat, 19 Jul 2025 10:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VKnaMby5pTC; Sat, 19 Jul 2025 10:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61FBA61423
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61FBA61423;
	Sat, 19 Jul 2025 10:24:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24EC2DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1702B400F9
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwFInJjetiKY for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4705F40458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4705F40458
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4705F40458
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:24:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 21DE02003E8;
 Sat, 19 Jul 2025 12:24:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 12:24:31 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 12:24:31 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250717224738.1048325-1-titouan.christophe@mind.be>
References: <20250717224738.1048325-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <d20dafc96cd09e040b50d938ba240643@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752920673;
 bh=tZ8bjbewf3MrSIHbKhJ2h3PKfHZS2QW7Khx6yrRAaKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tjyr9MtFVTIvS/Gea/nUyVUJPVpsL15IgQz6r+lqTnGjT/MxrSBIH6WrpzIGxp747
 RiNoBRXCmK6GbxenxK1YHUnnXoVf8PlSlouPLc8tEzW5aJ1jVzTv6pfxy+sTrzrWcv
 cP/mvOLNV3is52EfM0brck32iRQ2hTJB/N9rKjMF9juHWiN649F1CU2ccHFSAPbg7O
 kXnNA74aRil4AiNDn0NClATFuTs5z2civ2klZIKEZfNmdSXRY5qh90hj+JEysu0flP
 2vWQ96Nmzo6w2DyAp0GBQoZaRA4gyalI0SqWKiV9WBlD2Z9q++Ib1co6kVS6h9JaMt
 +EfZf4yL70KSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tjyr9MtF
Subject: Re: [Buildroot] [PATCH] package/python-aiohttp: fix missing build
 dependency
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

On 18/07/2025 00:47, Titouan Christophe via buildroot wrote:
> Since aiohttp was bumped in e4451602ebee8ef6f6b354e8f9b6dcc80206f079,
> it now requires pkgconfig at setup time, see upstream commit
> https://github.com/aio-libs/aiohttp/commit/40563751adf02b811d5acf95696c096a4dbd9ed4
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
