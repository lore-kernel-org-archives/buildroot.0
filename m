Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EECA0EDC
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 14:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12588378C;
	Wed, 20 Aug 2025 14:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hZWu3XBAkD2; Wed, 20 Aug 2025 14:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE7983716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE7983716;
	Wed, 20 Aug 2025 14:33:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16C8CDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 010AF411BE
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKcw00N-JJCJ for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 14:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1190541029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1190541029
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1190541029
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:33:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4021419F5C3;
 Wed, 20 Aug 2025 16:33:30 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 20 Aug 2025 16:33:30 +0200
MIME-Version: 1.0
Date: Wed, 20 Aug 2025 16:33:30 +0200
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250819150834.1651775-6-angelo.compagnucci@gmail.com>
References: <20250819150834.1651775-1-angelo.compagnucci@gmail.com>
 <20250819150834.1651775-6-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fc982bfaa07d96ba7c970f44a88397d4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755700411;
 bh=Y5EIt1XSUWvGA6t7QvwOhxewOfAWalhP+iSkpefwZ6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LAZMkDFyybCz+V1934Su8myhEvUDMUzhT7QwhEc9Nnm1asDfBMWotwuPJzJOmr67q
 4SlTb4WVve43ZYDqDJiIOHqJi1BtRGiy6gV3DAZCBIkJaXwADLZ+fQxze7/tO7WY1s
 PICzf+EI5JPAP6I7rpUD7sr4aKa/Mul7drCYroCU8HOeenpbT+67DTlrGfl1KTVtRN
 GaSRzGMMWVCfdPiofC4RTRiGvBnS4GKisPV6NS0HN6XLEDo0Gon40IGN5vUY0pX9/m
 2DGeOmpAmUUVCpLs/ouD4SgzKkyfyV4rj6F8aqV5uMjtmQPYcNK3cXQXIBjbVB0SqP
 /Ou3fa0WzVXwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LAZMkDFy
Subject: Re: [Buildroot] [PATCH 5/5] package/cups: bump to version 2.4.12
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

Hi Angelo,

On 19/08/2025 17:08, Angelo Compagnucci wrote:
> Changelog:
> https://github.com/OpenPrinting/cups/releases/tag/v2.4.12
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I already applied your first cups bump submission in next:
https://patchwork.ozlabs.org/project/buildroot/patch/20250818145555.1039619-1-angelo.compagnucci@gmail.com/
https://gitlab.com/buildroot.org/buildroot/-/commit/f6be007591f504516fef6434e29c2ca9246ac5a7

I checked it was building, but we don't have a runtime test (yet).

Do I need to revert it?

Alternatively, we can wait for this series to be merged.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
