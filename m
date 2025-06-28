Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D576FC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C3A60E76;
	Sat, 28 Jun 2025 10:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-08rUV5cCY7; Sat, 28 Jun 2025 10:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC50160E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC50160E1A;
	Sat, 28 Jun 2025 10:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71FC1154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58B30400A2
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ta65LOQMGeUN for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B27DA40194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27DA40194
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B27DA40194
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 707CF13F88F;
 Sat, 28 Jun 2025 12:08:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 12:08:04 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 12:08:04 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250627153545.1461396-1-giulio.benetti@benettiengineering.com>
References: <20250627153545.1461396-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c76d241fca6033e5ba053926223a1ebd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751105285;
 bh=s1apt1qznR/Hcq3Zg/0pCOnEN9Zaz4WYGu2J00xB5As=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T/ED4p7/1sIpTvezl6kCyYZHU/oUcLHLycLbqL9XEXaMqru5iQkv3EMm9Rg3kSeYQ
 nW55c+065fhpjLDIxRx+A+zB7gMcORsuJ6scWMcoHhNStWSARFdRcf8GwDCYFXDqID
 KiGCciveeSUBowmgvKlwQEU8JH4EHhi0X1vGGbG4D8avIvIsGK1Yfet9qYZ1nwUScJ
 606bMUF9Kk77ZzWPy797wmaR6IplAsTEs0p+sT1MSkuP2HKAxMiSYOUQ84NezOSQUV
 kC0wtuQcJCKlx5L3LuRSk+FLTcroszxKiDP/mNcYor1l8BocCJB8uYbYgeVZyTXthZ
 p4cpIrbwav6iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T/ED4p7/
Subject: Re: [Buildroot] [PATCH] board/freescale/common/imx/post-image.sh:
 make it verbose on error
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

On 27/06/2025 17:35, Giulio Benetti wrote:
> Add set -e at the top of the script to make it verbose on error.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
