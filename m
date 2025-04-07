Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD9C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 17:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D005B40534;
	Mon,  7 Apr 2025 17:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqmUQCXL2RSG; Mon,  7 Apr 2025 17:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15E5C40965
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E5C40965;
	Mon,  7 Apr 2025 17:52:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3D291F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA506410E9
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQcc4HLC4F8T for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 17:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FA8840421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FA8840421
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FA8840421
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:52:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 880EC6013D;
 Mon,  7 Apr 2025 19:52:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Apr 2025 19:52:47 +0200
MIME-Version: 1.0
Date: Mon, 07 Apr 2025 19:52:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250407154928.1511637-1-dario.binacchi@amarulasolutions.com>
References: <20250407154928.1511637-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2986891ec9f3d6570d14c02f32f84942@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744048370;
 bh=PldoWAS/Ge0Yux/NXhd0uWZenHXSX0pANsjZC8DiWbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nDRGHXsOesQ/31ZgaQLq4KQOuOJO1jFdHGAvz7d1swyUFgYU0a9H3D6TBmVC0YMwg
 WFMPA0yrq/5TXhJhr0JtwaEE7IzFTEB4LRYkfhOG+/F9N2P+b6ReSyZAVJfw3KKfN/
 uWoOHzKeq6s6EL9MM7ayyt5HhVhJi4znjLOD4Ox2gaz+kFWxGCLwB0+izxAIlQWXts
 6ZrwLaSln5sFGd5b68NQ3Pn8mWTsUV3ljxeTXsqF/quxDI53vtZN2Ybpg4+si7BO/Z
 qOLNcWmcY6qhKcgVDQL18YT1K0FJelNF2RhoNdll1WrW19332U7Is86Kbqf3hBtuL/
 6dl0XjsipGg3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nDRGHXsO
Subject: Re: [Buildroot] [PATCH v2] package/apr: bump to version 1.7.5
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

On 07/04/2025 17:49, Dario Binacchi wrote:
> Release notes:
> https://downloads.apache.org/apr/CHANGES-APR-1.7
> 
> Note: the upstream release note mention v1.7.5 is a security update.
> The package patch 0004-Merge-r1920082-from-1.8.x.patch in Buildroot
> was already fixing this security issue. This is why this commit is
> not marked as a security bump.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
