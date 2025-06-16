Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9462C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B034F40C58;
	Mon, 16 Jun 2025 22:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFat9_QgCSd2; Mon, 16 Jun 2025 22:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F314340C92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F314340C92;
	Mon, 16 Jun 2025 22:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0CA4151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9200B80F44
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 22:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLSJKwGt6GWf for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 22:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D89E180E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D89E180E1A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D89E180E1A
 for <buildroot@busybox.net>; Mon, 16 Jun 2025 22:26:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7E8A0780333;
 Tue, 17 Jun 2025 00:26:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 00:26:39 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 00:26:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250612104822.1279887-1-francois.perrad@gadz.org>
References: <20250612104822.1279887-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <0bccf4dd0e302eb6d981476ee748e82f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750112801;
 bh=rNZwrwkA4Fbgr1ORT/RY3HGKr40jE+A9/BvxFouhaSM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vPFeMpCHjDSZU5dqOp+U6SXyDv6pVMKYpDQ7+HfHI6hclNG+QqBNr56K20VoZF+Gr
 +eHB7eQ6Z3tgcafhb02rTRZEN/Ku2fPZ3xr3CdlbhtZrtN+wuiqbzD/oHJChzXrJVd
 D2tXG2jEvJA/P4HchSCMaumVBVbnuiHCydGlXtWwx85ReSbJbnnhjnXxc+ClAqAryg
 xF87z3YOTnXFPghQ+pHBvgahN3Beh5PPtfBI9+obF/onraktReZL73G4gtQYfYcXyH
 glyEjNVIFkHk554edcQ0i7tZVbKWhsWRn+cbAB8hZsFZCkjBWPjp/Ayk03GD1Q+2Jo
 IMdWdJr4JBAAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vPFeMpCH
Subject: Re: [Buildroot] [PATCH] package/luarocks: bump to version 3.12.0
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

On 12/06/2025 12:48, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
