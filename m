Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0065BCAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 11:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55AEF41F2A;
	Sat, 13 Sep 2025 11:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REv3vh2aS1CC; Sat, 13 Sep 2025 11:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A5B41B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A5B41B92;
	Sat, 13 Sep 2025 11:14:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 901CF25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75ECC41B92
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Df4iPJ7t3Oys for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 11:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAAAC41B4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAAAC41B4D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAAAC41B4D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 11:14:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9292D13F8B3;
 Sat, 13 Sep 2025 13:14:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 13:14:22 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 13:14:22 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Christian Stewart <christian@aperture.us>,
 Kris Bahnsen <kris@embeddedts.com>, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250908192435.214306-2-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
 <20250908192435.214306-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <997fd9631bcb0dc7b88f52fd25e81f94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757762068;
 bh=lyDTRKeElD7mdISLtCdLwuQXAQa5GCyImBlobxfw5Ao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mX2bXGhxAc8iPYsULh0cwCyW5HKKYC/+gSqR8hRkqJ4FwVCkM5fPOJhT0h2y2HmuQ
 eeDwXzGZiBqprbDm2NfNrMu7BY3O0xAkSOXQWy6mCYdfpynUC0VkU0OFX6ZMSDd0le
 UotHY48+D2sAaR4+FZRJ6I5C64dEYcRDCsA6FD+u3/ZAk+WZknUngJItRibb76YuRF
 cajIuMky4cY6Gn28/Ghhb8wjqpgHEN3Pg2BwPZa0nqVEAiMNPcdxbrE5IjSciXaKe2
 rUAmJ3nxFkXp+IiiT3tC0YBxgoO+T88gDmEtKdbYMgf5FfbouU4UpiWLC9zvb1FL8I
 Z50wo7InAMqog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mX2bXGhx
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-09-08
 version
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

On 08/09/2025 21:24, Giulio Benetti wrote:
> This version allows to build with Linux 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
