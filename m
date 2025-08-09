Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B130C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0933840C45;
	Sat,  9 Aug 2025 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JO1VM2pvXpkt; Sat,  9 Aug 2025 14:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C10240C35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C10240C35;
	Sat,  9 Aug 2025 14:05:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40EE21D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3324C60BC2
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJY2QXzNVRr5 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 14:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5132E608D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5132E608D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5132E608D0
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:05:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 44FC7B0056A;
 Sat,  9 Aug 2025 16:05:01 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 16:05:01 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 16:05:01 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250808220710.4062162-1-romain.naour@smile.fr>
References: <20250808220710.4062162-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6119979e02977d90f246d6e517d3140@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754748303;
 bh=r4PW/kDTjFO6VgQgDiJ9XFucaMzwvaBurltyWgQAoTU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cvooKq4IVz7qGeMC0RzDPk8qiy6N1PIouCZXhq9cHjSqjzDn1s/dtZeWPV2NC4CbV
 JHcxuypSn8BYkiDPtGRUXE3Y3JAdR1BnjXyejYZ8cq03MNmlr7+jQb1fVV6B0VEH7u
 WieGjxTdhZz5Cbulge2cvl7isi6TJz3nX8ySI7zImsvGk1Q0hZC44YBZ+msaG31/iD
 BdblNSQmlDhfJnqL3whOzHA1nVoVcvnT1YzNfg/HgR6r4EfKOeegOqVp+ZvYYDuaYY
 pvVOztXeq+XpsKOdLd6cORNaW6cScZ5L+jwsTMjAWCdhx0b5LGvwrfABeeuaIsP0ZH
 Asop2n13HhYNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cvooKq4I
Subject: Re: [Buildroot] [PATCH] linux: add missing hash for linux 6.1.147
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

On 09/08/2025 00:07, Romain Naour via buildroot wrote:
> When building a toolchain with kernel headers 6.1.x, the build fail
> due to missing hash for linux-6.1.147.tar.xz
> 
> The hash was removed by mistake when bumping kernel 6.{6, 12, 15}.x
> series.
> 
> Fixes: 51b27bad915c95499877c8bf9a16a221c904bf82
> 
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
