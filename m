Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD0C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B306F608EA;
	Fri, 25 Apr 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPjqbEu9yAjt; Fri, 25 Apr 2025 16:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E888261210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E888261210;
	Fri, 25 Apr 2025 16:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD32CC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEED461210
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BT6_H8LnGPp for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4539E608EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4539E608EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4539E608EA
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:13:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EC5D25FFB4;
 Fri, 25 Apr 2025 18:13:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:13:42 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:13:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julian Scheel <julian@jusst.de>
In-Reply-To: <20250424205751.4111803-1-thomas.petazzoni@bootlin.com>
References: <20250424205751.4111803-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b884f9b63307448f9f88defc0ccb16cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597625;
 bh=8KAiobQAKuLNsWEBWZ9QHB9we0+GU5tr6RQtFmIQZOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TmODQ6dVTstTMcbfAmN+9HNoZCmVM2qARfoXsNKNxGr9XbzuUfeWw8tg47EYVyUfC
 9PhvZ+o9q9fZbCUh5uK/L1hsVc7J7hVPporZ3vTsAeyvhZ4EKK32skptt+5RTkYHKY
 HLmGVMCvUOwhqHEp9WRFTWv1qSRKXtm7iTRxPBD4wtrluvneiiGpRDWFpiR8URhZI0
 zdJZvZ2kX9UkdpHUTs5NuY5QD498BX3+XXxuVfJWkAZhmPr4AnmqlZK6YSgqtykJBE
 Q9R+ckE7Q+pbjfPEfPU9Nexzr7I0hx3iAgKSRuuqTi8yQ90UK1JVvMw+XJ0uOxrTp4
 h98l9MWWxdBtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TmODQ6dV
Subject: Re: [Buildroot] [PATCH] package/cryptopp: add upstream URL in help
 text
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

On 24/04/2025 22:57, Thomas Petazzoni via buildroot wrote:
> The upstream URL was missing in the help text, so add it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
