Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D130BE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8A9611CE;
	Sat, 11 Jan 2025 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImQlOLaLBn_G; Sat, 11 Jan 2025 16:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BF6611E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BF6611E8;
	Sat, 11 Jan 2025 16:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9033940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C938141423
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm4h7nCDi9mL for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 080FA41415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080FA41415
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 080FA41415
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:07:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 48DC3B00548;
 Sat, 11 Jan 2025 17:07:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37794])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:07:11 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:07:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109190820.2353626-1-james.hilliard1@gmail.com>
References: <20250109190820.2353626-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ac123e5f07fcd5d3d378ab4911866127@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736611632;
 bh=qPBzMpboVtDsmNKOw0KYIcZmUBcfK5ModUKrT8JqOKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R6ZX790oMB3tfWYja+xOA8JT3M9pHPCxdqnfavawIFQsnpqmIidIgS0TEFx6085cM
 HvlbnAHu3FkPfxwqHxpUDHNAV5zcDzljHz9qtR4BetFipZW56oQBs9XH4Nz7pDyvQw
 eBudZ2HhBuK3mYMhMmymnTTmqZXHT9m82FW/P0C9HPjgao+TnN3T4nEYSXxRaHy6zB
 kSZJLbgNkC/Dg767bhLM4En+GNnukdshLgDVMfHM7vVF3H3WjZUwSyzkgHryyWcQz3
 /9RT/w2OXugpGNyK8Xh0OMAgVbk8tnoXojzFD+lippLKP18csp8EeqHM+gymCqUkJv
 IRaVhAWYulqUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R6ZX790o
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.8.0
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

On 09/01/2025 20:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
