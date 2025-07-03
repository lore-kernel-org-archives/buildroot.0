Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16C5C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3C1611B3;
	Thu,  3 Jul 2025 17:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FI_aikNthrZD; Thu,  3 Jul 2025 17:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85CE611B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85CE611B8;
	Thu,  3 Jul 2025 17:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4A4193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BFB940E7A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzysfuYp1ru8 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91E7C40E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E7C40E77
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91E7C40E77
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:40:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7F7482003D6;
 Thu,  3 Jul 2025 19:40:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 19:40:43 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 19:40:43 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
In-Reply-To: <20250703080704.1704843-1-titouan.christophe@mind.be>
References: <20250703080704.1704843-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <c29ae81c0aa2caf1f11942eea519dbdd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751564445;
 bh=uznGn/t/Snf5lwK5V91Z9rcWvB9Y+e3zqvHPghIpT00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b29MsZCIaJys3VxNdJLyB+07HOsVdGs4yIVLAYEDSGdXouCMo16X5qNYrj+5EXJ2a
 DzyV8KnHzRWpSy5/jfHx1c6mhdnSp18OjHOCV2U4rMkY2xOWtvUKaGBpWE67DPRGGb
 R1s6LoAdp+OWtloUKPtPn+SVj9yw7FZyA1USwekT5eLc1uw3iwfgRSnLlWj8ce1HMB
 x8lV5vpgO9mtbsvPCofDNPyp5KGj/xFG7FFydSheiaQbvVH2T7sxmqCBE9yWqrvOkA
 FvhrVtWjQ7eaExUfBfmZJFYCVUFdpyIrF0XHAjyb+mcf3/mxp1d3wL60NTJ1mxnsOK
 wmgaZb+6wYseQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b29MsZCI
Subject: Re: [Buildroot] [PATCH] package/tcpreplay: security bump to v4.5.1
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

On 03/07/2025 10:07, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> 
> - CVE-2023-4256:
>     Within tcpreplay's tcprewrite, a double free vulnerability has been
>     identified in the tcpedit_dlt_cleanup() function within
>     plugins/dlt_plugins.c. This vulnerability can be exploited by
>     supplying a specifically crafted file to the tcprewrite binary. 
> This
>     flaw enables a local attacker to initiate a Denial of Service (DoS)
>     attack.
>     https://www.cve.org/CVERecord?id=CVE-2023-4256
> 
> - CVE-2023-43279:
>     Null Pointer Dereference in mask_cidr6 component at cidr.c in
>     Tcpreplay 4.4.4 allows attackers to crash the application via 
> crafted
>     tcprewrite command.
>     https://www.cve.org/CVERecord?id=CVE-2023-43279
> 
> - CVE-2024-22654:
>     tcpreplay v4.4.4 was discovered to contain an infinite loop via the
>     tcprewrite function at get.c.
>     https://www.cve.org/CVERecord?id=CVE-2024-22654
> 
> See the release notes:
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.1
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
