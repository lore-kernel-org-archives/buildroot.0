Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A9E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359C0405F3;
	Wed,  4 Feb 2026 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwrlTi-cmttM; Wed,  4 Feb 2026 13:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E5440352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210976;
	bh=0un6hedpHuEhotTRtOsdNZ80kPNvBiHtHYCAwcR0vPM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=HHwtAP5ef/WwVIeCsK6ifp5qLqbnuYJy10rVJB397k+IuEieCvHPfZBxZj35VIGQ8
	 UuPVrYZvSuVpVHiLNmcbio2GY0KZR2KYy0hEFuo7nlE5FGrNLbHtQ3YsmcuitsH8Kh
	 5Gg8vzhGSYhHxJwXMBTWoKFBiGMnmhQLtvIN9wKPh7uU3SSDUWiYD37Mjh/4OInrTW
	 vb1cCFFrhZDnens85KpbV4a686hiD6x018v7lnHsMdNnBrjpsG7uVQyXH4n5tyueLI
	 2OpRKBfPmWO+gNbVaKDYJdlCGPlEM/btHdo3PvPNpqW1aqa98P9iZp5ZFLdw+c2Gvj
	 HeYvrCOEfY1vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E5440352;
	Wed,  4 Feb 2026 13:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 387C8F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B4B140303
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37TI4mffjnuR for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BA6C402C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BA6C402C0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BA6C402C0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:16:14 +0000 (UTC)
Received: from [100.72.251.121] (unknown [185.109.152.95])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 126012C82D39;
 Wed, 04 Feb 2026 14:16:12 +0100 (CET)
Message-ID: <98372f52-d54e-4ab6-be0e-360c58b22d52@bubu1.eu>
Date: Wed, 4 Feb 2026 14:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aXOEQoEOTM95Hpgy@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aXOEQoEOTM95Hpgy@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770210972; bh=KqtM5MPf8qc4n+Ez0mn67B4oe3/mlxru08DGCmIGkog=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=rNNnhrMDVRpnZmd76y3yfN6LsWLLJrr3uk7/bkqAeViVi5gwxmqM8wuB0s+Ce7Rpr
 hEvo3J0x9nhk7Goy3+XWFdiJNIu+U6h/6yqyzmw2qWBkBaZlHOzSOpiVPH32U+Gkrg
 R6dPKUm+WsPZv8RZNAG0mo+HGx1MnQgjBB9HBt/rxeDd98FDspOM3b6VLs4cZLMVgR
 ilEle1oXDCbIZAwFyhnqCbB/hvD/MpMGtPoXdeeEcXjE//qIoBnUovoAST4WSroRk1
 t3eDa/jTlX9Ny3hwxUVsyIG+V+pqc+qp8GI9caavjoUUW/+28h0ojP29qxLhjKnhUz
 TXHYv0KpXqxzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=rNNnhrMD
Subject: Re: [Buildroot] [PATCH 1/2 v3] package/strongswan: fix security
 related bug
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/23/26 15:22, Waldemar Brodkorb wrote:
> Add patch for CVE-2025-62291.
> https://nvd.nist.gov/vuln/detail/CVE-2025-62291
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---

Applied to master after adding a reference to the patch in a comment 
before _IGNORE_CVES, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
