Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF61E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 12:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE0B605DB;
	Sat,  4 Jan 2025 12:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUm25Nw2LJnH; Sat,  4 Jan 2025 12:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E66D60A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E66D60A58;
	Sat,  4 Jan 2025 12:33:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21C81AF0
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F70860A58
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5NwdaLqh-hh for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 12:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 277A9605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 277A9605DB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 277A9605DB
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 12:33:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9A26A13F861;
 Sat,  4 Jan 2025 13:32:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36226])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jan 2025 13:32:57 +0100
MIME-Version: 1.0
Date: Sat, 04 Jan 2025 13:32:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250103224827.4074447-1-thomas.petazzoni@bootlin.com>
References: <20250103224827.4074447-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6469675955cad94f440f60ee21e6cdda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735993980;
 bh=VJggQX8e2h9+ctxIEjPA5oW0bz7qibNoTBF484ZiDrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uwctKzVRtSjn7m/v78t/9rowfU4sg0kf92CbQ/pMbM8on3o6Rz58uej68l7qgRiq2
 OYvJJnIIlEIhp06hDyYoRHqwWT0X9m07qr10hI1MylQd7h2bbl8pg7WJW7LEftfHYa
 Gr3L6m61pijlVPyk7E+NmYSOJvv+UCXN8opXcditGz2CcNfUio1MjWe6dfHNPH99PS
 CYWRcNDQnobIyVwN7NM+cXkJiE3azjrnzOGW5H9jGDqFR/VT1h4JoR++b895eeKJN4
 QBpr3H6CZ1g38+QRiWO6mpPUnALf16d7fQ48fHy3oEiILuVyi/GHuS90zuZplH5S6k
 4qL814lTVfDbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uwctKzVR
Subject: Re: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: needs NPTL
 threads
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

On 03/01/2025 23:48, Thomas Petazzoni via buildroot wrote:
> With classic thread library, the build fails with:
> 
> ../lib/igt_kmod.c:1090:21: error: implicit declaration of function 
> 'pthread_mutexattr_setrobust'; did you mean 
> 'pthread_mutexattr_settype'? [-Werror=implicit-function-declaration]
> 
> igt-gpu-tools needs NPTL threads.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/85311ce68ae1fff771ca00b434be1c4f8453d357/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
