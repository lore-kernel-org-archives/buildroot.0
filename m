Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16700CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 20:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12C6613F6;
	Mon, 27 Oct 2025 20:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cx0oiVMFpgWV; Mon, 27 Oct 2025 20:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAAC61390
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAAC61390;
	Mon, 27 Oct 2025 20:48:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD83B70B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EC2461390
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SWNNZTlNSi9B for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 20:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFA4B6134D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA4B6134D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFA4B6134D
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:48:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4BEA113F861;
 Mon, 27 Oct 2025 21:48:18 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Oct 2025 21:48:18 +0100
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 21:48:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251013210940.511743-1-bernd@kuhls.net>
References: <20251013210940.511743-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f9a591d1fafb4848c8532b4a0a1cd70e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761598101;
 bh=zM4hjOokw5vx2OB4ZR8sf1nQuGVS7QAOlDUx62JTtmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AiB/zBTFSnBVq/iMmwwnkGNE3sJtjjEQ2RbXHgHvQTxHs00ZzNz4kBXZhdWshGrEL
 lM/ZYkAHxaT5wookzCqVJMRjo6Nc8U6bFDxmrWIQuqbBjYVcOWsjqQG1nGGMPkpe83
 4PyTrm2dp+I5dxIdbY58LD6iBbrcDg9BG334qnpxxzBhnzkTDYpOc6yTT2HYDPEX+l
 NrfPuw4CQKGn4zO3nBym4Vq6A/LDd61LiJtc+B5EiiG722whbvFN/jMhAlnIAHHhSp
 ww/N2FPQ0T38MAERrScE4bHHbswcNhUhE+RY0sEIOCJgRQy4IiWUdX+cyO7W3nCZNZ
 lPKU8ItkM7mNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AiB/zBTF
Subject: Re: [Buildroot] [PATCH 1/3] package/xmlstarlet: Fix build with
 libxml2-2.14+
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

On 13/10/2025 23:09, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
