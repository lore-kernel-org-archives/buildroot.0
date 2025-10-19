Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B985CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 12:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3FF041269;
	Sun, 19 Oct 2025 12:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOZEpAQwIR7n; Sun, 19 Oct 2025 12:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB1A41280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB1A41280;
	Sun, 19 Oct 2025 12:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0786B1CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E282641280
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDFE-5aDJJGn for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 12:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA4D441269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA4D441269
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA4D441269
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:06:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BCF14B00539;
 Sun, 19 Oct 2025 14:06:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 14:06:47 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 14:06:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, Jesse Van
 Gavere <jesseevg@gmail.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251017175930.3369733-1-bernd@kuhls.net>
References: <20251017175930.3369733-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <95914082d831c9acd27180555dfcd1e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760875613;
 bh=nHXHpQDBV3nnh6ioN1tgIjrQEDBueUy3QsvmM0OTr80=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fdGYWLkjC/IilJH6r43XWiccjb0jq2SgTDK08mwrDy8iW089HOt1c8ZsaxF9nl9Wx
 aN8hT+IoP6Y3khNxr56cb57s9BQ52XPdFDd9n/Kyaap1n5B+SET+jwLkCFHQR4XHZs
 5ciLz05L5pNKgMJJxfkVOpc2sba9mxxPL2izRWcj5aTNh+yNXixWX+9HHznRAIeE2z
 Onebr7kOcbATAEl5qwknMApsxmxSPJXqLga6TRlKl1IytGIrDVzwypfxXEWTgkDI/N
 gYSpaUBYrbqREpDpLEL8STtZ/Rh4PdUSdXCOpZ4v7z3HlZC+mY0zhs8vDo74jnoC7y
 0s5ll4dinBfrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fdGYWLkj
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6multimedia: add
 dependency to qt6svg for examples
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

On 17/10/2025 19:59, Bernd Kuhls wrote:
> Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added the
> qt6multimedia package including an option to build examples which
> contains a dependency to qt6svg without selecting the package in
> Config.in.
> 
> Fixes:
> https://autobuild.buildroot.org/results/c94670cf255a1a6975e99d7b22a159f7fdc6f850/
> 
>     Makefile:578: *** qt6svg is in the dependency chain of 
> qt6multimedia
>     that has added it to its _DEPENDENCIES variable without selecting 
> it
>     or depending on it from Config.in.  Stop.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
