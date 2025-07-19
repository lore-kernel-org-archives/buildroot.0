Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158A7C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE95D6116F;
	Sat, 19 Jul 2025 10:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jl4tLP1CeHaH; Sat, 19 Jul 2025 10:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C0B660B6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0B660B6A;
	Sat, 19 Jul 2025 10:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF289117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0FDB6116F
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niUcPcJJB4ES for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2167860B6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2167860B6A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2167860B6A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:41:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0112A20040F;
 Sat, 19 Jul 2025 12:41:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 12:41:15 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 12:41:15 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250714133657.3564-1-fl@n621.de>
References: <20250714133657.3564-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6b4f4a1d1449ac349cc94f106e7d30d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752921677;
 bh=+2zPKlSkNBQXR1xaCaUigyNZYblPtOFmbs5Kh708eZc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HtUOUiVtMGoW2Hf0EqsbZNqwAlkUe7pYSP0dLYEruTbYElefQq3wZDk3B4xN0y50q
 DsW3I4Ezt0Krs500p/bhTqcaCHpjP64Oh+6y0FXuTMCvOBJRQcTZWa1cC601WBbtXT
 yVzeDCU43MSAVbciUgIgbczeJxepQPgTUn285rGHcsxvfELLKID3YLXkH0VAvRujFl
 syuT5Y1bmkkH0FzMYj1avtHHOfK546puh85WgAxdpJh2qFJyjUlSfrNor0qSMaco17
 24J44F+JxGW/2WUQDOVhS/ttGvhIfL7RFdzYOnM7j5PPMq+lZKXB7vq96ZEMxV0cyM
 EWR1NL/hAHNlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HtUOUiVt
Subject: Re: [Buildroot] [PATCH 1/1] package/wireplumber: bump to 0.5.10
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

On 14/07/2025 15:36, Florian Larysch wrote:
> Release notes:
> https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/7a4d3177550b6b53fe0a49396da5b07f5353daff/NEWS.rst
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
