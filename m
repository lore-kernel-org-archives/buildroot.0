Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0708C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7510041CFC;
	Sat, 19 Jul 2025 19:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yplbtCdhOiGG; Sat, 19 Jul 2025 19:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1AC41CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD1AC41CB4;
	Sat, 19 Jul 2025 19:28:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD36C222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF9334053D
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gspdEKFcYpTY for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 19:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C656401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C656401FE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C656401FE
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:28:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E5C3A19F733;
 Sat, 19 Jul 2025 21:28:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 21:28:39 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 21:28:39 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Marcus Hoffmann
 <bubu@bubu1.eu>
In-Reply-To: <20250710114207.1394265-1-buildroot@bubu1.eu>
References: <20250710114207.1394265-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <a5c19673b277f35c3c1b2063fadbfb03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752953324;
 bh=riEDr7S1j8teGOHK/CVqQR7IWScnkgJ8GIRxXJCBliA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wm9S3o+zt5zXYRI3N9cL8ahyrrQRPPfTxFGsJnkB/fm59XqWzjMKgj3KTrFZ84z4u
 Rs5SrR9HPMQJ5B7oaly4/EQucZ2g1XEdvqjap1Q/Grlk7xR3yerzFcTpfz57E0KA3r
 3F/TCJTX0hVmt0RMETZdP1byHHrrSOfZn9Lkjzuo9R+Uj0+nS+c7HtyHGim9xi+l+Z
 7vzFLB3u145XGuE6PsIBee4OpB3QELDw1zZNr6VRhwlBOD9ajvFpNGfOueiReMzyMl
 /DXHQ7PDIA9cIWIWHKqU734jxy8jaD0yFMXqSKlgRb05C8XmETb5DPxV2W0IkhGn9D
 Z5OaCSCRqHqTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wm9S3o+z
Subject: Re: [Buildroot] [PATCH] package/python-log-rate-limit: new package
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

On 10/07/2025 13:42, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
