Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F80CEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 14:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6C384157;
	Sat, 15 Nov 2025 14:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBfgqM4QKu9C; Sat, 15 Nov 2025 14:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022CC840E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 022CC840E4;
	Sat, 15 Nov 2025 14:17:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8161158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5A2E4029F
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM7cYNUKx7_o for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 14:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FB87400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB87400C4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FB87400C4
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:17:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EEC0EB0053E;
 Sat, 15 Nov 2025 15:16:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 15:16:57 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 15:16:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20251115102052.3459680-1-bernd@kuhls.net>
References: <20251115102052.3459680-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c30643b8af3691a83c34e77f898da359@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763216220;
 bh=WV6jCHBPxxyeF2W8k+v2qJGqVv5jY9/fEvveo3SQ9QU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tnmw5jhqa7KjiyOMacU7q21MdHK40lhvu3eNP+DeJEKqXVq3kC0F3+COxgAEhnZEj
 5HhwU4YvBzVjpqWi+Fu5pqE44gRfijZVM4nKIJNUUoxAmOmKvNe9Q+0UcCLg9Zw8Of
 8gn1Ytq/8WBf8Eic8K+TPOf0ACJz6PsbtCpHrHDi4auVFiH8dWrEZaHil1nr6H/bex
 YL1+XIiffPjbqyd6H89suqC0RLsJVn3YQLFaSQleuzG7g3noqvDeHdLlQWam3YoNms
 x+UNT/KPeGL06N1vvZz6z/8+qV2zEXZemYv24tVBO4ei8jwE1ymikJHHDG1VCjpdsC
 UskiNUIKosFFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tnmw5jhq
Subject: Re: [Buildroot] [PATCH 1/2] package/postgresql: security bump to
 version 17.7
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

On 15/11/2025 11:20, Bernd Kuhls wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-181-177-1611-1515-1420-and-1323-released-3171/
> 
> Fixes CVE-2025-12817 & CVE-2025-12818.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
