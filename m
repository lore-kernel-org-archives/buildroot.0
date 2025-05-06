Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C5CC3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 21:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE844055E;
	Tue,  6 May 2025 21:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbIEtvgel7BO; Tue,  6 May 2025 21:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D87E408A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D87E408A8;
	Tue,  6 May 2025 21:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 055B6EDF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2AB40490
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU7KjOiJfXaI for <buildroot@buildroot.org>;
 Tue,  6 May 2025 21:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44157403D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44157403D0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44157403D0
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:07:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C0F9119F87C;
 Tue,  6 May 2025 23:06:54 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:44586])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 23:06:54 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 23:06:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Sergey Matyukevich
 <geomatsi@gmail.com>
In-Reply-To: <20250425222647.2340402-3-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
 <20250425222647.2340402-3-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <27a3bfcff113c6526bb0a27b6c1cff75@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746565619;
 bh=LECo9MmlF9YX1QakqUYnsw4hcXeQSV4QKgQ16VzzV5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PzMQMdGhUutnQ809fFcAbgIWYmj2ciG9Otxx7+HNzrokLMyZkxYxg4d8xCoqPfYYy
 6pHmlkAe3uf6D2usKEOUfc5VMxV4M3CyPWHdLxLEHe4cEaKMC1oPyu5S+aBvpgMebJ
 oi40Ikd28xXZG3ar8T8FyPbxQ5cCiu0o8XWcSK9II4EM98FT1EyjRHsU2Tdvn1Aups
 N7ytL0plBVFcEr7RFt7Bopo8OkcXdsSCl/piQGe6ceD9XP4zTZW5Um3AzZJ6Cukytr
 LbO0SJsJceFbiNqbjg+i6d/c5rpaenOlYU6r4v4EXBwQ6dLggZexvusmDuAvUc9/LD
 6gES9JDZ7qR6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PzMQMdGh
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-04-10
 version
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

On 26/04/2025 00:26, Giulio Benetti wrote:
> This version allows to build with Linux 6.15. Makefile hase been 
> refactored
> and variable USER_EXTRA_CFLAGS has been renamed to USER_ccflags-y so 
> let's
> rename it accordingly.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
