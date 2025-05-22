Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23791C54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 20:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E1660ACD;
	Thu, 22 May 2025 20:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSLE0D2uMiCz; Thu, 22 May 2025 20:00:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328AD60E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 328AD60E17;
	Thu, 22 May 2025 20:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65AD0BC
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 575F080AA6
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aym_GR4o40mY for <buildroot@buildroot.org>;
 Thu, 22 May 2025 20:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F76080A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F76080A53
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F76080A53
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 466FEB0054E;
 Thu, 22 May 2025 22:00:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 May 2025 22:00:37 +0200
MIME-Version: 1.0
Date: Thu, 22 May 2025 22:00:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250519121837.1317128-1-fiona.klute@gmx.de>
References: <20250519121837.1317128-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <4f622b9bca3ea8d3cd1a855505bb6ed8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747944039;
 bh=KoalBXv99ZVd3gzjw0f0jvMCLsuBPuYD2hcMDPfmKA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bescUGgTreRBD+6lIzxRqnKb5SzTCIgLgeU9AsT2q0K6Jd9+yuOdnUYscf1iIra+S
 XcU8l+dmWrdf5q48/LKOtOQ5ldAulhjX1HFpvEj7IM9QFiidaDlL4cuUqBI6DHBiH5
 5RPEkp87A7hVYy/oMCRZ9rOuQ4UMXEFw8A+pMS2yfm6Rgb0NosmcYTD9cI8EROZsLh
 bGJXETZ0dC81C/JgmCf2Njic0wLPdZ1k9S0mMEceB0rthmCog/sFuRigqhv9V1uKH+
 nTjL6tsCqDtzzxen2a4P1y6OBlnpUlvR2ypI1GgkiTthhPJMkdYoHUxZj1mZJqZQIB
 5p1blLD7Ja9iQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bescUGgT
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/python-referencing:
 select package/python-typing-extensions"
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

On 19/05/2025 14:18, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This reverts commit 0586ee6cba7411b2d1f6635cdfe36ab8fac791d7.
> 
> The dependency is not needed any more with package/python3 providing
> 3.13 (since commit d63e207eb869063f82c867658676c2903beb08cb).
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
