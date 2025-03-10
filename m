Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FDC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 23:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB39C60A4B;
	Mon, 10 Mar 2025 23:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E56NFXfaJjmb; Mon, 10 Mar 2025 23:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E8060A54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E8060A54;
	Mon, 10 Mar 2025 23:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A518AF7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 23:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E26A40378
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 23:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeGa8Oy-mTOy for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 23:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4081C40549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4081C40549
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4081C40549
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 23:01:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1B657780375;
 Tue, 11 Mar 2025 00:01:03 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 00:01:03 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 00:01:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20250310221838.176632-1-giulio.benetti@benettiengineering.com>
References: <20250310221838.176632-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <760aa700a0f24e9e2186dad9fc9af1e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741647666;
 bh=40NLGDuEYfyHLsBTAYXlxyIjIktaSxl4iHOOFo9SwSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BXI3fEF6/DtzxZLfj73iRPxlXeya9pakUw5PwPDezpZdFkJH7R9gRcr1Bbe5qHXe/
 9SWVhRI/akoVeYAxLaghwraviZNMmWgNvDOZqsNJs//rp4Xry618uBe/KyEMg11ItJ
 roM6+5XdE0kXhvx0/Oa6ZS1aJVNXbAO/ppgp2ajW66HpRJXz+Uw16G/AKFgMaa/LmW
 P/uAhMk+NrMBXxBd7wYtFHLPE1Y4UxGMOtGlS62gdR6igM9oKluSF32aq3vLrom68D
 tWTFnbTau5wVsmcx/ScFx6BRqqYTYgLqrtT+AA8ybIidObMc9kEo7XnAlbHG+wRXle
 Qu8cqDyFHMdhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BXI3fEF6
Subject: Re: [Buildroot] [PATCH] package/minicom: bump to version 2.10
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

On 10/03/2025 23:18, Giulio Benetti wrote:
> Release Notes:
> https://salsa.debian.org/minicom-team/minicom/-/releases/2.10
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
