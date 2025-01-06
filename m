Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA7E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615E180E59;
	Mon,  6 Jan 2025 22:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i7p2ibjGdgR1; Mon,  6 Jan 2025 22:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B1B80E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B1B80E5A;
	Mon,  6 Jan 2025 22:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 865756B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7461D40456
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROM_-vtc_Zez for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36591404C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36591404C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36591404C9
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:21:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A2CF7B005AB;
 Mon,  6 Jan 2025 23:21:10 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58892])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jan 2025 23:21:10 +0100
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 23:21:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Bryce Johnson <bryce@redpinelabs.com>, Suniel
 Mahesh <sunil@amarulasolutions.com>
In-Reply-To: <20250106201720.3134534-1-yann.morin.1998@free.fr>
References: <20250106201720.3134534-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <cefbc9f80a76b802cd5a13571d50aef9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736202074;
 bh=FdkRqxe0Eeue+wQzc5BTgzrGCnfluTHsngbimpIVCxQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=asDcpfK2kMmrZ0RBObMpKaQ+YE/gfUlBn9SBKIL8rE3skOEKIRju8AWOBOkIDpnKB
 efSf+Vv74VbheHkVwVIsnO8NVbwzvE0VUN4TeRsqR2YTtRCavCYtJUGEt7QNdAvzYp
 7ThKN3auZZJbI57xLU7N9ftXbmqeNkLv9ms1BvTjlREYy67yRHRfKSt4ZbvjKsucXa
 E7x3wZrTEA2eNAvtZpz7qDd1Iyn1jvbF9VMk+L1gF+MRQ8sCYHXr/K84TM9t6tVNTL
 12yaWl0JU0rxM+8DfZecObduVKIKn66QPcYgk5887qv3APOIpK3/VRniApC1rjGDzC
 0mYNO+YQMSCsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=asDcpfK2
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: drop prompt for
 _SUPPORTS option
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

On 06/01/2025 21:17, Yann E. MORIN wrote:
> The _SUPPORTS option should be blind: it represents a restriction that
> we certainly do not want to allow the user to lift by manually enabling
> that option...
> 
> Fixes: 65f268e21cbe (package/arm-gnu-toolchain: add
>        BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bryce Johnson <bryce@redpinelabs.com>
> Cc: Suniel Mahesh <sunil@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
