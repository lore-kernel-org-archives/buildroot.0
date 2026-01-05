Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82476C79FBC
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59464407E7;
	Mon,  5 Jan 2026 19:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd61n_rQoF4N; Mon,  5 Jan 2026 19:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3357140548
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642799;
	bh=RkhYSKSO74oxIj4UTZ5jdsr3u+1hdUwabH9VriDbreI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUYBEnjYL8rz6hB8HKnYPgxG6OwTDa925WY/si6HLXTSZTG5zQ2fO5LmIA2qLvsLS
	 Ifz4/j/5uCwepVX9icwxIpC78xJ47NCAgIIHHaeFj0BxoDliWepF2mrgKBPktVAKyp
	 nndBSKCIIYegu855DdSw8QqIneyt5SWscEDUXE8i6TWP8mPWvzAlZB958w6eM9jmCE
	 qroc9Of/N8gCTtl86tzo+/na0TKA5qa3fFzHRnkzYeyQVb9TchS1HHpsHjbhSB7CJr
	 rureBUpr+QpQDO/JgNMXTBt37o1HBsOCnoMafRHn8fVEWiIAJWryAk94dveDUy9oGV
	 qHWGdb5nOGoTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3357140548;
	Mon,  5 Jan 2026 19:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A38096F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FA260AD1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSuAIZa5c20E for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEC8560743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC8560743
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEC8560743
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:53:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 16A4013F8B3;
 Mon,  5 Jan 2026 20:53:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Jan 2026 20:53:07 +0100
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 20:53:07 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Lothar Felten <lothar.felten@gmail.com>,
 Bajjuri Praneeth <praneeth@ti.com>, thomas.petazzoni@bootlin.com, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260105105558.1991-2-kory.maincent@bootlin.com>
References: <20260105105558.1991-1-kory.maincent@bootlin.com>
 <20260105105558.1991-2-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <2f767aad1398461ae04393c353ce971d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767642794;
 bh=KSlm4dc0371tKFzXDL2eBceY1ArEGX42y8eTF4t3OYY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e/q9AelXYWz3ly3hwgtdn7VI0YF4XRmmLV4kA8Y63jUcgT4mpLnyg5MS1IFtr6ZEP
 6yO/rzSFzPDtgCgvf6Ok3BbXK02ckBMbSShtjBOJFqVGzAx1nE7oO/zDTpSlhc34wi
 WOhszHeXWaogI4ARSGTmZA1ed/qEhYCDJzME792Ku3GcAocAKB0aCDL7Bu+cDn5/cr
 h95fDp2uJAUO0eUul9ywARZTTwnPamCzFTZpf7T7yvtO2JfrSqJqhluGKlsaz21Co8
 kFS4q+Q10l87Uj2P0VHS/mffDYBzGbxJBCw0QZMQLrwwm/3vweKZDkiBP2EpwOH+Bg
 sq/oF2NYYsahg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e/q9AelX
Subject: Re: [Buildroot] [PATCH v4 1/4] configs/beaglebone: Bump to Linux
 mainline 6.18.1
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

On 05/01/2026 11:55, Kory Maincent via buildroot wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> Bumps the Linux kernel to the latest 6.18.1 mainline version.
> 
> Tested on BeagleBone Black.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
