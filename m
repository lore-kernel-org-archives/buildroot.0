Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E9ED10F2B
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D577042DB7;
	Sun, 17 Nov 2024 20:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUCKachz3XNM; Sun, 17 Nov 2024 20:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D740942DB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D740942DB9;
	Sun, 17 Nov 2024 20:22:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91C89DB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72BEB84D2B
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lccmt6nAYK0g for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 20:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA76E84D1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA76E84D1F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA76E84D1F
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 20:22:39 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:4a2:8c06:3742:179a])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EA0BB20039E;
 Sun, 17 Nov 2024 21:22:34 +0100 (CET)
Date: Sun, 17 Nov 2024 21:22:34 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: robin@jarry.cc, zer0@droids-corp.org, buildroot@buildroot.org
Message-ID: <dier24mcgf6ouns6fnyi5voknzblyxal4cg5hoxpj647udltqv@ci5jsdaab7fe>
References: <20241115173510.31009-1-vjardin@free.fr>
 <31efd2663d1b8e193e49c0cc76113384@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31efd2663d1b8e193e49c0cc76113384@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731874958;
 bh=o2Muf5arU1W7cU3NxoMPeR3PIMaUrclzfKQYiR/gJ68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+ZI7qc06Yo9xtVN2lJadHXkJqGsMKpESrLeQp1zD1deXG8fns/neEvXf/WcbjBGM
 f55Wf3t96SkJgWJBsA1u7ge6mG1kA0pxhh7GSN2xQXFO9SxvXiol7uoE39yA82Rm+O
 Ot03wzmNtTEPMyoz3WGWe3uyk+GtoW8Er2yJYKPhcNjkurJfUPujN9OY+V9rYm8dco
 7uZRmEKDsfata8YabFLUCQCNUxxNqMUKiVYcaeBqVasfjK/hltNJU32BYCdPxZj1Ez
 iXJgW90Tdr4nj5BgpzNLEnlzaUGsa2BW7tRxpRenc6+zceyqnfIaqDbE1+JIe6l1z7
 TSA5SJewDLTtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X+ZI7qc0
Subject: Re: [Buildroot] [PATCH 1/1] package/libecoli: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 16, 2024 at 12:19:20PM UTC, Julien Olivain wrote:
> The .hash file is missing in this new package proposal. See:
> https://buildroot.org/downloads/manual/manual.html#adding-packages-hash
> Could you add it, please?

It was a bit late and I did miss all the hash files... here there are:
  https://lists.buildroot.org/pipermail/buildroot/2024-November/767746.html

> Also, out of curiosity: I believe you propose this library to be used
> as a dependency by another package you'll propose? Which one it is?
> (is it "grout", since you introduced dpdk?)

Yes, that it is correct. Are you interested in grout too ?

I have a package which I am still refining. I could share it as a RFC if you
are interested.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
