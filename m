Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBFC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BAA182151;
	Mon,  9 Jun 2025 19:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMoFnf2mhzgp; Mon,  9 Jun 2025 19:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F10BC82148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F10BC82148;
	Mon,  9 Jun 2025 19:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77AFDCD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69683614F6
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aPo-iJK__Up for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 19:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7764614F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7764614F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7764614F4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 19:51:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A20A8B0055E;
 Mon,  9 Jun 2025 21:51:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Jun 2025 21:51:45 +0200
MIME-Version: 1.0
Date: Mon, 09 Jun 2025 21:51:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, fabio.caccamo@amd.com, romain.naour@smile.fr,
 michal.simek@amd.com, arnout@mind.be
In-Reply-To: <20250519083632.1930804-1-neal.frager@amd.com>
References: <20250519083632.1930804-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <64b941ef1902dc83e8658a2e78e77362@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749498715;
 bh=N6P6RCaW7+1RNgMlNg6wiFLg5wmuZ5ddTw6f3CJynmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YFuI+jFLCZ1MUDdgGHZJ+mRX/C54pbQWiR4Hz9MyMQ0SDuKskhcrt4PZ+AtfFzQ/f
 SNE6mXobnDX8420lK3yVFrmRhqY1E0Wy8LOEi9cozYUInlFAVPhiFBLOY4n0S1mckp
 FFU8Av8s2Amv5wEYTQBm3g5kA1psWhePCmEDz/HIwo9qsQ8bz73a4i2ZeMEJgHiqSi
 sTwsv9Q68p7QF5NYRypHdIxFoZmX0/vXxI6Cu+t/EQlbXN+h0sCkh5kTggIo8I1j3m
 8ToWcISV56y7rzYWr0i/SJNLJ2BmuW63rq3JghqIvbTret6SOTLXWFzyS9YbsHLCZM
 bMpLc379PNTrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YFuI+jFL
Subject: Re: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: change versal
 pdi file permissions
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

On 19/05/2025 10:36, Neal Frager via buildroot wrote:
> The versal vpl_gen_fixed.pdi file is not a target executable, so the 
> file
> permissions should be 644 instead of 755.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
