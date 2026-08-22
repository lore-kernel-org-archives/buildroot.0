Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EB1C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 10:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 396CD81175;
	Sat, 22 Aug 2026 10:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLgfaUhZ0dvA; Sat, 22 Aug 2026 10:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787395411;
	bh=8rhm8niHXmCqFIUbQyH8gHH3DiqX1x/GZVtQu8wY6oE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CPQ2VsJOe+Sp3RnAzIBwynn7SQ8l5lYeDI8awv0zS5PvnyQop1ybhLXvA4gHdPSaz
	 f0yLCpCs6qZSw/Y8RoYoMVQz30/PTQyhkYJQTOeZQSYqzw+9nWd0mhfCYQW1F1LZbt
	 6AwMy4U8cpde5CJqDqsg3wGYIuUryrs3BspHju6aW7ZdrfxGSKAJ0DuHRvMt9whPqe
	 0ApZ0cqyRsYT2u4OJF3GKXRlJfV00XccPSQDuU6J6ryod+3qDP/empQGlsc6B3OaQo
	 2nw+SdJH2P0V2QWdidaAGMum2qddJpEUczqonvppR2exHAf3Dw5468ohwtJcZVFPNs
	 P+TNX1V+BCs6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43E6810F2;
	Sat, 22 Aug 2026 10:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B0D476
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ABBB409C8
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ml_fywgwF1CG for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 10:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D73409C2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 10:43:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8982B13F86E;
 Sat, 22 Aug 2026 12:43:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 12:43:26 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 12:43:26 +0200
To: Philippe MONTCHO <philippemontcho@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260819143215.905349-1-philippemontcho@gmail.com>
References: <20260819143215.905349-1-philippemontcho@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <0e18c06e0323ff6f2c5116fa5494be35@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.49
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

On 19/08/2026 16:32, Philippe MONTCHO wrote:
> Release note:
> https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html
> 
> Signed-off-by: Philippe MONTCHO <philippemontcho@gmail.com>

Applied to master (since it's a bugfix only release), thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
