Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9BFC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A8F60B27;
	Mon, 14 Apr 2025 18:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceHjZTQMGl-B; Mon, 14 Apr 2025 18:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15AF560B79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15AF560B79;
	Mon, 14 Apr 2025 18:22:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 012CE205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAC7281463
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG4vVgkU7QTw for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D9D2814C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D9D2814C1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D9D2814C1
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:22:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B5DEF2003A4;
 Mon, 14 Apr 2025 20:22:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 20:22:04 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 20:22:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250414053258.465718-1-troglobit@gmail.com>
References: <20250414053258.465718-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7270af6bdf03919a8fe7040db68d4325@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744654925;
 bh=QNjRZ5IacWaM2TwgQsYjaW//VIHm7DIZDWpPuOkG7T0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=doopN8WMQY6NcZ095oQrQQfOrJwFOYq9RpXeaV5fGi2iLzaRO/5nFIrXi1gB004ns
 YnE1130O/nH72lU/s/BeNJ0Ac2sg9RjeKAgNsh/ASmhVyLbixIZF67iE/nVTz5wNDi
 8OwZmhjvOnT12G/hvJZtxGv171LD4S+f0CTWXikV0sCph317xRcrFaYfR78MieInIR
 EF2xHE+CBORHO0l5Lf7tA+5ykwk6o/Yfat/FiggshLDzDofGfvf2fsrZmmOz/YlyjE
 XHLdEzYS1svuTXxrsDByTfMN0uNcRPDNYsyDGl5Ij2jI02KaNV9EGo7P1tbiQXNG7W
 VUaEPnILZM9RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=doopN8WM
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.2
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

On 14/04/2025 07:32, Joachim Wiberg wrote:
> From https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
> 
>  - logger: improved error handling for invalid arguments to -p and -o
>  - Fix regression in v2.7.1,  allow '.' in tag names, eg. in.tftpd
>  - Fix various typos in the documentation
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
