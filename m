Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4321C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91EC6063E;
	Fri, 20 Jun 2025 16:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEGCYKRDAGiI; Fri, 20 Jun 2025 16:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C8D607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C8D607B8;
	Fri, 20 Jun 2025 16:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A646C8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 010EA410E4
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5lNs2YUt496 for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27FF640E5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27FF640E5A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27FF640E5A
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:42:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3AEFE78032A;
 Fri, 20 Jun 2025 18:42:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:42:29 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:42:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250620062551.20738-1-bernd@kuhls.net>
References: <20250620062551.20738-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <06d5d8bfb0a86646091409db6a4e5dcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437750;
 bh=iNcmMOH9vSB6W1hKcnYO4P+4G4s/rfm8LeKFQlTqjQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aqvifFY6Bei10JWp5WxFh0Hox8RRCnHbfvus43bz0BctMFjrW323U6fjWGPxU5tj5
 7cR0wxV7rO7y9th6pvZ8ej+njPVq97ik93SmyfJf+ufqwmNxlUHNLYvvujQLbnqruj
 HkxsYZqMbg/C4gKIov3lv/WOIA8GgNbwZifSHPZsCHCz8NbC3oic9GhRYlygH/UXdA
 3GbhLmBIWC+/568ZV9TG4mnO9Aj0+9gdecCFmmUJgW6a/XLPpLO3NoD2cQ+THxiDhu
 RQ/rf++cLMRqlxNl5mQndL6h+GgUhhEm0W6J98pll662ANXcpM0Xc91UQ7Oll7SqdS
 zSI1QjKqm1kig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aqvifFY6
Subject: Re: [Buildroot] [PATCH 1/1] package/libcec: bump version to 7.1.0
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

On 20/06/2025 08:25, Bernd Kuhls wrote:
> Changelog:
> https://github.com/Pulse-Eight/libcec/blob/master/debian/changelog.in
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
