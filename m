Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629B4CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27763613B0;
	Thu, 25 Sep 2025 19:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLkofvkfuT-S; Thu, 25 Sep 2025 19:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 522D0614B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 522D0614B8;
	Thu, 25 Sep 2025 19:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94C3B177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8688D613B0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nm0i8Sw8SOY for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4717261311
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4717261311
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4717261311
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:06:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 14A0519F54D;
 Thu, 25 Sep 2025 21:06:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Sep 2025 21:06:22 +0200
MIME-Version: 1.0
Date: Thu, 25 Sep 2025 21:06:22 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Andrea Ricchi
 <andrea.ricchi@amarulasolutions.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250925155310.4084901-1-dario.binacchi@amarulasolutions.com>
References: <20250925155310.4084901-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d421cf344da6183953f8374fdc2a737@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758827187;
 bh=Ul8LwSMSJezbf1EwCHZvcS1b3AIhQP4XzpEix3g2Xj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUIySVtaXP1msAWQsVqKDuUdyfZM9yn+ZP166oPjBelpBwhsxxoBBBo3hiyisT70L
 B7ZdkRc4uj4XWWIeBgodxCyKsY896WEt+ZbwYKWKG7pxU5sJoWwZa6RmkkpMQvL+tQ
 VacMVJzpK50Fl6jgJrIxyRvKh9hhoePWuQm8OyKGdjHRrrtxEC/YV5XEZXfO/4qTs2
 qsJHLYMivNKbI0KQx9VHTb63JXYF7VxGQ2L8Z3i0IEOLf12AEqd3Dc28Fdj9a5/tye
 H8qbgUNgUrqQAhGcG0qa0SlUqVL/+GIroThlvFyrIauhCw6oEHE2YInicWZGz/jdLy
 a3r+QON2+hvuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iUIySVta
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/cutekeyboard: fix
 CUTEKEYBOARD_VERSION
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

On 25/09/2025 17:53, Dario Binacchi wrote:
> Make CUTEKEYBOARD_VERSION compliant with release-monitoring.org
> 
> Fixes: b28ec6f4313cc805dfb152e06408f1e7137c2ea6
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
