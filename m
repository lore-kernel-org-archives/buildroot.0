Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088ABC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC196608DB;
	Sun,  6 Jul 2025 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0siR4SQJaXa; Sun,  6 Jul 2025 14:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0359B608F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0359B608F1;
	Sun,  6 Jul 2025 14:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D78C912E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8EC4608F1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRQdC8jYYJLo for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:29:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E00D7608DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E00D7608DB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E00D7608DB
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:28:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 095F213F8BA;
 Sun,  6 Jul 2025 16:28:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Jul 2025 16:28:54 +0200
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 16:28:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706124029.1590242-1-bernd@kuhls.net>
References: <20250706124029.1590242-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a3efe9d2d47ed2bcfb2865f5e04b236d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751812136;
 bh=5xM2+r9AVtiWofNKuKM/G4p5lUzyj4IwocJRZ9SEidk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=orMoZDzYe8u5MjalE1yfbdGy/lwZBr3oyCT7qRSUns03rw7EtEZnxuz9dNOGo0g7h
 ouJaLJAvIopxi7I2VAYr+HqX9jI80wUOple/pNY9NRDQWxE8J+c6UntaLgPmBe9dER
 YXVYBg0daKZUWSkJfwuGOsyba4PvfYxxyDIwPnmxCkSi4XwMMPMWr9k3cJud4L82iG
 jNxkB+Wc6fZbsjeO/3G9nbcnLvFU/tVnbwgpqv1Nv9Dl/oiOWS0T/LJhCPr1xMKatR
 R4au2m2s9N7ryu5XpOWJ99mOqgrFzerwhU5lbHh5OvXGgN+l3ybUAXC4B7jTXxcRXq
 mWJvKryxG4z7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=orMoZDzY
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: bump version to
 2.1
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

On 06/07/2025 14:40, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-June/003614.html
> 
> Removed patch which is included in this release.
> 
> Switched _SITE to tarball and added sha512 hash, both provided by
> upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
