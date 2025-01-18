Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA5C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB29C606C1;
	Sat, 18 Jan 2025 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-9dl6jcQcI3; Sat, 18 Jan 2025 21:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0171A606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0171A606AE;
	Sat, 18 Jan 2025 21:41:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C2FF69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1991640112
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIccCeRXEYL7 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:41:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D263040109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D263040109
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D263040109
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BA434B00535;
 Sat, 18 Jan 2025 22:41:27 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38856])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 22:41:27 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 22:41:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250118211037.3251797-1-bernd@kuhls.net>
References: <20250118211037.3251797-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <12dd29a2a9e6a430df3700cf7e732c94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737236489;
 bh=HnE6TJbc8mEbFLydn79o7kC7DLz28SJ8e7OP5Q4I/FU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yd0jdRYHT+GR2NYumvei1eLjReSUbteR7/goDTySX3Zp1Grvl7v8xBV7gG5fx7p5X
 82XL4+LYZjBSB/1zmu6rxMq4TPZZX2IWq8SbMJXRFeckWLm2mysCur7/Ir3wwq6ZDA
 EvDvEEgVAwhYCembIRiWTC21Bbm+IW/iTH/5tRvj//ZnYpyPLr8yowi8WHRB1M8vSC
 TI1embPt8mPrJ8AWBTY3HxWzOvlZOi2v8UQKvW2nYwh8VHXFzSPDAJUiVsQUmWumNQ
 yZgddfcPpkbpACxaQoeDTjGRxiOKdC4WmDuRJuhsIJ+6r00XhMig2kc/se3bXedAvT
 yOldsKo8hB69g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yd0jdRYH
Subject: Re: [Buildroot] [PATCH 1/2] package/ffmpeg: add optional dependency
 to harfbuzz
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

On 18/01/2025 22:10, Bernd Kuhls wrote:
> Fixes https://bugs.busybox.net/show_bug.cgi?id=16279
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
