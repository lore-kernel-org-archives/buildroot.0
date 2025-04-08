Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A504C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32857605AD;
	Tue,  8 Apr 2025 17:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOu2eGNGoTxC; Tue,  8 Apr 2025 17:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70904607BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70904607BC;
	Tue,  8 Apr 2025 17:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E871F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6727540881
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSkusPM2P917 for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83D6C4084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D6C4084A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83D6C4084A
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:38:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 327552003DA;
 Tue,  8 Apr 2025 19:38:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:38:05 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:38:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Petr
 Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
References: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7861f9dd238780f619e19b6f84051cf3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744133888;
 bh=SV6jGx7ZLxOg0XTyUCK7EEjDmK6nn6VS6i4gcJPZGZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XcUh2PYinVtQF9YT8x/pr9DKrnu/K4tHN9486fNJMFQUy1/UaaD9/T9uwNoTylJtP
 Qr9IY4fP5bDiaZCJiuze/GZEigzkdV4k7d4LiztC7g+8i5nsDkMMfyIJVXBf3Fdew/
 OFYvojT7chr3bC2+kkRMQm7LwCrJABIX/Koimn9rPVCwyh0+vNEqBAnSq3NllGqwEa
 mX3OPoYR00o1hg75D7R2rghQCiKp40QBspwQSrH3wRwNXc5R3vbDKtgpvIBW0efKr6
 T5i2rgMvPAgMrFfXOApLCAwixe4kr/t09fVTn4suRIIEZ9irMCJR7MBsweMCQfT1cv
 JMrRMGjC+10aQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XcUh2PYi
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.110
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

On 07/04/2025 21:19, Giulio Benetti wrote:
> For release note, see:
> https://hg.mozilla.org/projects/nss/diff/997c76f8a94c85b05ce85c9ae0ba3b3d600c26f3/doc/rst/releases/nss_3_110.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
