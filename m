Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A7C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC23B612FA;
	Fri, 25 Apr 2025 16:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mPaxSXPm7r6; Fri, 25 Apr 2025 16:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 078776128A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078776128A;
	Fri, 25 Apr 2025 16:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC827127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C33FF83DDF
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKogTfcE2VaI for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE83B83DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE83B83DD9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE83B83DD9
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:05:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AA507780511;
 Fri, 25 Apr 2025 18:05:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:05:31 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:05:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250424060143.2985301-1-dario.binacchi@amarulasolutions.com>
References: <20250424060143.2985301-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <13ac6a768f68a903f3d2de46c2a6f92e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597137;
 bh=E474l+1jcJrHEWFcyuk17oFQe8GpBQWEFxUOEVjIdB4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rmJhCY0v0z3MJ2ZRMKuYvla9WpJHsKwbKMofA53ROh0SbucMNe1cyn6qMKkTvWLtH
 Tr6j9+R6pp8NbEYBCcPEegWNm9Mud3PFK63FXu6cFsBpOgZc8FR3mKzl7C1uCizX7A
 aO7wjFMKvA+QbYhVYjuE3780iVSvj2bPinVDtdEAqpktVFgRWokwD9kVwr/XUmO9i8
 RlnVfKogZknJMJVMHNLFP6+a1+gJYx2/9V0f2ZJD4oSVgfdNy6dmdEuLF3yn3QJtql
 Ws0Hz2KmOIdF59RBXQhSyNqvEDRKNE41is6UpnluKLR2GdMj350PF56Fnvs0MSSXnl
 Y8JhMd1SIeMCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rmJhCY0v
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump TF-A,
 U-Boot and Linux versions
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

On 24/04/2025 08:01, Dario Binacchi wrote:
> This patch bumps:
> 
> - TF-A to version v2.12 (LTS)
> - U-Boot to version v2025.04
> - Linux kernel to version 6.12.24 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
