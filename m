Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB4C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E77DE40485;
	Sat, 17 May 2025 15:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e47hEENNJWef; Sat, 17 May 2025 15:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B0240728
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B0240728;
	Sat, 17 May 2025 15:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23B511DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 096AF40728
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmOg02vRRboW for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3664D40485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3664D40485
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3664D40485
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:10:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7764319F5C3;
 Sat, 17 May 2025 17:10:05 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 17:10:05 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 17:10:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250514204118.690228-1-james.hilliard1@gmail.com>
References: <20250514204118.690228-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <94000760a55e77f7faf9856a45b97b73@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747494606;
 bh=JYdVUcz6B6g+dN4dFllW7BHOaDdV1IUxn1he3cjSB9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ix6J3a6XVbL2mnKobOd3gZDwkYAsPGDY17/5EN/kmFUnKEVIs1x5TNeGfRmoigC0x
 LDv5uD5PBk0JJh0W37yMPbarna3pbWQ5jwTuKwCeOrCtZ9iTKd15ahM0oB8w6tapey
 42NI5ml1KH7UsYvAGuPAiqkOuZggtGs+rknu10//1h/GNH1FV7ECSU0BKtZXuaJStB
 szgO3pZeB+EAV06YVAGiOY9rxWXhv0TF0aATLtuzF685wluLsAwtIwF/m19xiVRwcH
 XCT9yt0aqJXL92KTIZvYnyBRntyuyRbvXrwoEOd22QQ1etvMxJudws+O70pUNct69S
 c68tyc/EJEiOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ix6J3a6X
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: fix cmake 4
 compatibility
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

On 14/05/2025 22:41, James Hilliard wrote:
> Add a patch fixing cmake 4 compatibility.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
