Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34111C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F246D80CA4;
	Sun, 26 Jan 2025 11:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grSiDy_U-5Ft; Sun, 26 Jan 2025 11:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120C780CB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120C780CB2;
	Sun, 26 Jan 2025 11:02:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35CAA941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168FA60712
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ5Oht0KmVHT for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CF65606E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF65606E1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CF65606E1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:02:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4C8312003CC;
 Sun, 26 Jan 2025 12:02:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50794])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 12:02:47 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 12:02:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125223600.3920642-1-fiona.klute@gmx.de>
References: <20250125223600.3920642-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <1660e41aa8a09029f47b983df077ddb0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737889368;
 bh=6lvtbagALS2rtTfDnChXZX32E96qfY9qL5bpy6J0B9c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jTg7XUd4EsGxl4XT/39X/LLPpKQhDDGt+E4IO3JHdDeRFbh4CRYwJWzQ00GpVLiT+
 p1QJtjji5t+c9mZKRSPOBkwWQ5Eh/LH2h2d1muo9epensQBCT1fy/DPAfb8etSKiSd
 pyhv1qDsT33zCyMe+62ItQ8sgaJU1NjVvr33JSuOfzgKrt9LY0IZah9gyBLjYI9J4v
 JvZ9Bf6vhLBJbMUVBEEXK7nkXNNM8+dlRTU0YMYxdJ1LzSurMfXKa3pmXSu/+Gx/e7
 p8XK1JslDXEfSYFVb3b5mqn0Bn6q7VKL6WFSh5uvNOqG3bLzYQLJAk4pKlZLmJskUv
 2cdle7wQIM9RQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jTg7XUd4
Subject: Re: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware:
 replace host-python3 with BR2_PYTHON3_HOST_DEPENDENCY
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

On 25/01/2025 23:36, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The mipi-dbi-cmd script does not require a particular python3
> version. Using BR2_PYTHON3_HOST_DEPENDENCY avoids the need to build
> host-python3 if python3 is installed on the host, and nothing else in
> the build depends on host-python3.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Suggested-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
