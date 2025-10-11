Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB46FCCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B077F811E4;
	Sat, 11 Oct 2025 21:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMv2HqR_O6do; Sat, 11 Oct 2025 21:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B141D811CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B141D811CE;
	Sat, 11 Oct 2025 21:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75762BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66DFF60BE4
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMauiR_EOM3X for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0CFF60BE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0CFF60BE1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0CFF60BE1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:51:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 31C4313F880;
 Sat, 11 Oct 2025 23:51:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 23:51:18 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 23:51:18 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20251011201803.2005973-1-yann.morin.1998@free.fr>
References: <20251011201803.2005973-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <89bb99fb5adf0bcfb2d94d96521113e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760219480;
 bh=PRplPtCKy0pzdr/ZBlhh42/XeOI2eE6FL2dc49PQMc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Le3C22ypTmM/4IDo7LRkLinH4Z+cQI8bsFMLteXVGAC7smsHTlFAPWbRtyZoiTaUv
 Gbi92NqjiSpEa0nPKbap5QiqzuOHmYAKu3eCaUo8eFbh7dZWPPjQ6fFyAX8oVyXhx6
 QFzGS4+l+gjsDEao+6qL+5cPpLOXCoMVPpGKQny+bloVZyn28/B4XGNh4ZPamDcDL9
 SyL/RVuFleGtKBNx3dJ5hJ2RmmoujI7dJOPSefp1xR57w4HuyUZNI+6ENF5OFQN2A9
 CQ55//5413Jz/A0m8JYqw2fOgHRkIUcsvpvTex1Qp3tikT3RWuNPQadLfm/VKxTYIj
 p1sUyGt8GTFlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Le3C22yp
Subject: Re: [Buildroot] [PATCH] package/micropython: use append-assignment
 in conditional code
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

On 11/10/2025 22:18, Yann E. MORIN via buildroot wrote:
> Since its inception in 9646e80fca28 (micropython: new package), the
> ppc-specific CFLAGS are simply assigned, and since 9fd9f4e6752f
> (package/micropython: define MICROPY_NLR_SETJMP for xtensa), the same
> goes for the xtensa CFLAGS.
> 
> Although they are mutually exclusive (different archs) and that there 
> is
> no prior assignment, the customs are to use append assignment in
> conditional blocks, to avoid accidentally overwriting a valure set
> previously.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Chris Packham <judge.packham@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
