Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54EBE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C087406EA;
	Mon,  6 Jan 2025 22:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X4Y3oqimxhD; Mon,  6 Jan 2025 22:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0FD40705
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D0FD40705;
	Mon,  6 Jan 2025 22:33:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76034F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57B59606C1
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cmuDHn-JUNz for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9226F600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9226F600D4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9226F600D4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:33:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 74719B0059A;
 Mon,  6 Jan 2025 23:33:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41374])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:33:36 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:33:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>
In-Reply-To: <20250106210623.1296442-1-thomas.petazzoni@bootlin.com>
References: <20250106210623.1296442-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ee96f76b308948355c23d64afba400c6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736202819;
 bh=uDuxfW1v+fx+m5Vs6tzLBA1svLCGG/bJD8ik52hNBAM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LkdN59BLNTUTX8m1bpC/CyBZQ0fJ04Nb6mzbSwoKHfZ9sJ77jW2IgKDnK5GpBbVEa
 qf7B2heLGPJEQ7ix95lkfao5KInaRpF/TXOH75UpaUI1ToGvqAxMbK49pVxVjfzguu
 fVrxF8V01SRcyXVlD6PNp3Qp9OICuL9zUIESxkqia7SG8TlXaRp8Say7QJM4ZZ45Jb
 O79fx3J1P1ZlEK8ckIs1eW0an03VXDXpBe1fwT/74tSQ9VSGZ7MKEvRqy6LPk1YA6J
 5yTr3WzoUh+bvG4D7kTyW/Z3/IMv70a78b2LWrT86ahBaA4Ap2c1DSgPBEV0YkcJSu
 489ETB147gwcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LkdN59BL
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6quicktimeline: add missing
 select BR2_PACKAGE_QT6DECLARATIVE
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

On 06/01/2025 22:06, Thomas Petazzoni via buildroot wrote:
> qt6quicktimeline has qt6declative in its dependencies, but does not
> select BR2_PACKAGE_QT6DECLARATIVE. It does select
> BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
> BR2_PACKAGE_QT6DECLARATIVE, and does not select it.
> 
> Fixes:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_QT6DECLARATIVE_QUICK
>   Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE 
> [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_QT6QUICKTIMELINE [=y] && BR2_PACKAGE_QT6 [=y]
> 
> reported by kconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
