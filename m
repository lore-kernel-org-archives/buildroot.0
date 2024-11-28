Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43950D609CB
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 05:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF09140538;
	Thu, 28 Nov 2024 05:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVEw_FGiLiAg; Thu, 28 Nov 2024 05:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD7540150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD7540150;
	Thu, 28 Nov 2024 05:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 422751DA8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 227DD848A1
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIMv4UQejpYR for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 05:01:24 +0000 (UTC)
X-Greylist: delayed 1761 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Nov 2024 05:01:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C16A848A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C16A848A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.247;
 helo=send152.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
Received: from send152.i.mail.ru (send152.i.mail.ru [89.221.237.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C16A848A2
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 05:01:21 +0000 (UTC)
Received: by exim-smtp-78d78789c6-tv6cr with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tGWeU-00000000ETH-2xcG; Thu, 28 Nov 2024 08:01:19 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 28 Nov 2024 08:01:16 +0300
Message-ID: <20241128050116.879176-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD97DF634AB044F3A906031D9526404E613A7456936FD4472AA00894C459B0CD1B9A92D5D2B9AAA80E703ED270C30F246C57547F6C5816D436D4E8176093448139952B81C99D67B1670
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75909A206F8DB96D1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372B866E63D69A26578638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81E7ED14860DE16E2C467E41E5BEED8097104A0A9C6991C9C20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0F73DE2C02C717D058941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CFA80D66F452D417A43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A59D5D11CACC99A1015002B1117B3ED69664133D6F7774DEDE219207EC0A953D2C823CB91A9FED034534781492E4B8EEAD2F8D89FC5850081EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3C5E3F1247E737A5DFEA82B927694E7C9FCD021FC4F069547077FF5214860E40AE7801A017AB3E4ABDCC763D930D6EFA490B43B0D1736ED20BA8B2DDCE11218050FB5BC59F6DDC13111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojA97iaBGbkJ2HApTRv7Y7IA==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219A7C6B63E5052F9F62CE796C0C0AC1214EAC96B37C5E42F4790DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=8000Jc4EcpgBD3+O+zLd4SjqEGa0myYfCDXx9OG36/o=; t=1732770083; x=1732860083; 
 b=Z0NkUX6nNUTRNj3GfgNeIjnTlEtbEx3trU9JkFyruteeaRjLAqiCqL4NMnsfkiQGR4cUeiuyXT7
 q7vDn6ih52/reAQbVcoPRnsFtyw3DMUlfNMHXmoaMi9Zm7M2Lv57HiRIeehFTWeHRshlOMIesf0xv
 r8LDbszxVtOKFWJzVberZQoLJx5iAYCaqBcZoCTAgzVu+wFhiTHqqFzenVf3CEE4E3uwVxG+yW0uB
 tUqm/MXS1iJ/wbEY+ew6/OMNniH2c4S8Q8kwpyAwXDJPDMUDTzh/yGjUME93Cl3+kFHiWoHtgvGGY
 sjq07BiQDheoGomnEiJkRSm7NHfGCPaHN67Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=Z0NkUX6n
X-Mailman-Original-Authentication-Results: exim-smtp-78d78789c6-tv6cr;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] dmaengine: dw-axi-dmac: fix snps,
 axi-max-burst-len settings
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

axi_rw_burst_len allowed values range is 1..256. Then this value
goes to ARLEN/AWLEN 8-bit fields of lli->ctl_hi. So writing 256
leads to overflow and overwrites another fields in LLI. More over
ARLEN/AWLEN are zero based (0 - 1, 256 - 255).

Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..9aa79e9b49ca 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1437,7 +1437,7 @@ static int parse_device_properties(struct axi_dma_chip *chip)
 			return -EINVAL;
 
 		chip->dw->hdata->restrict_axi_burst_len = true;
-		chip->dw->hdata->axi_rw_burst_len = tmp;
+		chip->dw->hdata->axi_rw_burst_len = tmp - 1;
 	}
 
 	return 0;
@@ -1550,7 +1550,7 @@ static int dw_probe(struct platform_device *pdev)
 	dma_cap_set(DMA_CYCLIC, dw->dma.cap_mask);
 
 	/* DMA capabilities */
-	dw->dma.max_burst = hdata->axi_rw_burst_len;
+	dw->dma.max_burst = hdata->axi_rw_burst_len + 1;
 	dw->dma.src_addr_widths = AXI_DMA_BUSWIDTHS;
 	dw->dma.dst_addr_widths = AXI_DMA_BUSWIDTHS;
 	dw->dma.directions = BIT(DMA_MEM_TO_MEM);
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
