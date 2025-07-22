Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28A9C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD4060FA0;
	Tue, 22 Jul 2025 17:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeJU62B8TlLv; Tue, 22 Jul 2025 17:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5AA860E9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AA860E9F;
	Tue, 22 Jul 2025 17:13:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 646A1E0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A245807CC
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NI5lw3VcQoo for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60656807C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60656807C5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60656807C5
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:13:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6B3C5780389;
 Tue, 22 Jul 2025 19:13:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:13:41 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:13:41 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <20250722111000.88565-1-titouan.christophe@mind.be>
References: <20250722111000.88565-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <89ea7ca109bb518019aa74799dacfef2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753204424;
 bh=MHiFzqOqSys7hsmhSDs2SJQgTGf+xEc+AsBy7lSJsyc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F0Kdb5N1f3810842TXfhvxwsvU9AtHjNoOHC4hStkmW7L8cUmf90SQyN4mBotevCB
 p9C+Q1YOvdetaBBkf3dyGwVKg5kHRwBMRJglJplU5M5H0tgrG0z1zLvr4I5M0+US0s
 feHOtZUmjRRTZ1cEG6hhdsrP7U3TmuNyZRySjVxy2XoPIprkq+9JXbk+xfpK5IZSAr
 ymIlUIU//0c/UgdcLtyW4NyXpNl9HWxpb7I7iwG/sth1ZFzF/3kZWmGkGjqIJq5Pek
 7PI43HpZkQ7Hb5/YRjJXjyzOmcnngHkBMWTQ6j8YD3F7UZIUhzZlXWsgL81mNiqhfa
 YKczPUDKjttjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F0Kdb5N1
Subject: Re: [Buildroot] [PATCH] package/python-starlette: security bump to
 v0.47.2
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

On 22/07/2025 13:10, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2025-54121:
>     Starlette is a lightweight ASGI (Asynchronous Server Gateway
>     Interface) framework/toolkit, designed for building async web 
> services
>     in Python. In versions 0.47.1 and below, when parsing a multi-part
>     form with large files (greater than the default max spool size)
>     starlette will block the main thread to roll the file over to disk.
>     This blocks the event thread which means the application can't 
> accept
>     new connections. The UploadFile code has a minor bug where instead 
> of
>     just checking for self._in_memory, the logic should also check if 
> the
>     additional bytes will cause a rollover. The vulnerability is fixed 
> in
>     version 0.47.2.
>     https://www.cve.org/CVERecord?id=CVE-2025-54121
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
