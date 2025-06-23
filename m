Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27CC77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 20:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D254160AC6;
	Mon, 23 Jun 2025 20:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4OLa9U4yqka; Mon, 23 Jun 2025 20:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE5660AD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE5660AD3;
	Mon, 23 Jun 2025 20:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 748D012C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AB5140AE5
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpPqMumnAl_B for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 20:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB75C40AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB75C40AE0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB75C40AE0
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:46:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9B254780389;
 Mon, 23 Jun 2025 22:46:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Jun 2025 22:46:36 +0200
MIME-Version: 1.0
Date: Mon, 23 Jun 2025 22:46:36 +0200
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Andreas Ziegler <br015@umbiko.net>,
 "Yann E . MORIN" <yann.morin@orange.com>
In-Reply-To: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
References: <20250623115102.2284223-1-maxime.chevallier@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c47e4141703fd51551ee9cbfc954e44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750711602;
 bh=k9XH4vGeKiJSFycm1XktmGeR80ka1OAe+FXSFOMLkHg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eq+qW8WDDTLNCZIRILCPwLqIQjDmhVmo8P9gCFK8F/nBuBGqhrfXXuuXJQkUueDf9
 8hPTRYrpa60V4WVrU5QY76VTnE7p87P+gP0l7cjl0zKnwlZN2p0gkKQQES4B4dkYAE
 HJcWU9TjuAlX7sp9YgWUMPT+VR5OfkuzqZWYMCa37N9CJV0U9U0UUdBS1LIw8aGx+F
 +V9wGaNQao6ziearHvJNCBRRBqDDr1U7iYssnIUio3O8+hPUhgi05Kv6oOIs0aLQgt
 xu29bzah2jDtc4Z9ca2l9b/2SjufdD/07828Ey328mqCl73/IUanAOy/Zohbag9t8e
 WTuY8fFYnYrEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eq+qW8WD
Subject: Re: [Buildroot] [PATCH] package/linux-tools: rtla: Pass TARGET_LD
 to the make arguments
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

On 23/06/2025 13:51, Maxime Chevallier via buildroot wrote:
> In Linux v6.8,  the rtla Makefile was rewritten :
> 
>   01474dc706ca ("tools/rtla: Use tools/build makefiles to build rtla")
> 
> The new Makefile uses default linker values, so the host linker being 
> used to
> produce the final rtla binary.
> 
> This results in the following error :
> 
> ld: [...] trace.o: error adding symbols: file in wrong format
> 
> Add LD=$(TARGET_LD) to the RTLA_MAKE_OPTS to fix rtla 
> cross-compilation.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
