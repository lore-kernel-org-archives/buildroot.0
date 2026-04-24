Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B47FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E9C084027;
	Fri, 24 Apr 2026 16:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFnn-80GGdwT; Fri, 24 Apr 2026 16:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FFA283FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049443;
	bh=17ZOdhvEMajqv3WWBLjb1deNodXMK2jX7n5kVYUabAU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s3qZB5R5ysShwmhFkhiedwlXXv8w3OQaJyiefQDooI0pFPr+2QXXvWbRoxcf7wdt2
	 KE94gjP6D9ry+OkIlOe9LOT5lj8j9yTAnCZ7jK5QnNXwVeBfKjdyYoWfxwbMJfUa+O
	 mp3H+CzdLwvdqpgI6fOF9U5E/qwgb1voq3AYeLjsQ+uIzqCfTKvqjC3vJ8Z5Uz3HEZ
	 PePwB8pX/zo3J6jSTSHcV7acvXwXssYI6MRPXVbJNXOwP6eQJMB19LiWkpxdFlEgkn
	 i+av0pH4xFKEGVsR40+C1fx56oRBu7mZD/TksE8Jm9GvcUm7PuTv0WEOlNtAw5aaiw
	 9tUm6t8cU0HeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFA283FF3;
	Fri, 24 Apr 2026 16:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88ABD231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EA6C83F98
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fyd24CtUnu7X for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:50:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2718D83FE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2718D83FE6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2718D83FE6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:50:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E935CB005A2;
 Fri, 24 Apr 2026 18:50:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 18:50:35 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 18:50:35 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
In-Reply-To: <20260423210135.2859706-1-fiona.klute@gmx.de>
References: <20260423210135.2859706-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <2bbf5d90d68147cceaaa48baade27c3c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777049438;
 bh=oD4W09V8E3ujb2xHuk6j2HL5OX/stDoL70aK0XCGGYc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gn1EuoCO+xY3A4Od7jiaoqQ92Y3y1FgCaCZ5oBe9gdT7wOxU4JfTHNQ+iKSiHu0Rd
 nZP78eNjubo5jmprd6FcDKCXHAhR7k8XcY6ntA6ilIe6cfRTUez1l0diM+B8Y3Ixnq
 12G6pdpEtECyJVQa1X4Oy9KCFgenLlIMBf9AfW6Ch7MiO0aS0kWk7vPgfcuCN4J6gX
 +q2vg+xxU5YXM7Qv9BiAwnVrzkJWxfAcW0+6pgINYYLZ3myBqNs2A++VZz9Nbr2dNH
 YHy1Wlw/8fTqtDW5TIjf9ASSJPgCb80JUb4xXiR8qwmmVJGUon2ApLSHCyqX1C5EuH
 JWRX4GPhOvi7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gn1EuoCO
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: bump to
 20260223
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

On 23/04/2026 23:01, Fiona Klute via buildroot wrote:
> Changelog including list of added/removed CAs:
> https://salsa.debian.org/debian/ca-certificates/-/blob/b266ecf6afc2d6fda61391bbeda455572e7f5207/debian/changelog
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
