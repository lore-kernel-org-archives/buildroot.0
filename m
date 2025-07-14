Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03A2C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 17:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A28608BD;
	Mon, 14 Jul 2025 17:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otgEdxtI3JnH; Mon, 14 Jul 2025 17:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08DA0608EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DA0608EA;
	Mon, 14 Jul 2025 17:40:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 923CC967
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84307403B5
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMTCGtVrgjRP for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 17:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98C0C40367
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98C0C40367
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98C0C40367
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 17:40:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D21F62003CE;
 Mon, 14 Jul 2025 19:40:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Jul 2025 19:40:13 +0200
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 19:40:13 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250714144618.65723-1-buildroot@bubu1.eu>
References: <20250714144618.65723-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <21a6335b109fab7c6e34ec79cf0e1319@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752514816;
 bh=hyqOGWcOzVNHSGCq+OiFxfl7LUNoqeMNfsuzPFmDvow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QG1EPUkcsoEebnNrmYa5zQTxIRT4M5SowURJfLDiCvqdvsS45ERmUHRAl5otR37GP
 Xj+wLEJwoQIHGE7Twk2BNgjXia9xuB+kzPjDF7n7+YRGe6iNdXK4gl/w+5/4OFAbLg
 Ny1lnxBZmJSdrinL0X+5XhK2WbxPTqTPpTaRfMFO1+TLsJGEIG+0Btk2v2XokfY+Wk
 z+Ywg6ztpXZG/vl8M+K3D9dX9TNFYJ1aDTUXyV7M/ihOcNky6rIP9Qr8toJF3c7SO2
 rwaW2bDHufj6s5wuMleIhqkeiIJlVWANEQF7+/a/xKvwMeaJYMaAiI3LFKTBJrEdVS
 Xxl0s35vnddnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QG1EPUkc
Subject: Re: [Buildroot] [PATCH 1/2] package/python-fastapi: bump to 0.116.1
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

On 14/07/2025 16:46, Marcus Hoffmann via buildroot wrote:
> Release notes:
> * https://github.com/fastapi/fastapi/releases/tag/0.116.0
> * https://github.com/fastapi/fastapi/releases/tag/0.116.1
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
