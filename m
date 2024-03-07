Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBCCC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 07:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B64AA404D1;
	Thu,  7 Mar 2024 07:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtB9lS6TksRS; Thu,  7 Mar 2024 07:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF0C40990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEF0C40990;
	Thu,  7 Mar 2024 07:32:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4421BF5AD
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AD28408CA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lubtlPXHB6SG for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 07:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.95;
 helo=smtp57.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B59FF414BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59FF414BD
Received: from smtp57.i.mail.ru (smtp57.i.mail.ru [95.163.41.95])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B59FF414BD
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 07:32:21 +0000 (UTC)
Received: by smtp57.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1ri8Ej-00000008QXU-1Fsx; Thu, 07 Mar 2024 10:32:18 +0300
Message-ID: <ee9563be-f608-4847-bdb9-52463998e0a6@inbox.ru>
Date: Thu, 7 Mar 2024 10:32:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
 <20240306213606.2149683-4-giulio.benetti@benettiengineering.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20240306213606.2149683-4-giulio.benetti@benettiengineering.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597DD765CA75D7304196506956BABF1654B6182A05F538085040D3211FCD5949CD0DC7A4B249DE6549FD8BBE388E75FB0E7A16DCA8BF0F3D6A0F29FF1465CC0F6BAA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C2F32350C7BD909CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378BCFB34D7DDF138E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D870D7C830EB593AC88101E9C726292BBDA686FF1746E9341520879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735D1611F633B8B34AD8941B15DA834481FA18204E546F3947C5B63D382EEF4D896F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637028599BB38096F4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC8C7ADC89C2F0B2A5E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B9EB32FE0C26A3A4C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5CE36E2FB58EE93645002B1117B3ED696A7A0E1E21097D85B4A0A47EBA01A636A823CB91A9FED034534781492E4B8EEADDFC043C56F70D752BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF378C851A33B2E327F583D63C47C69CB7A60642FA909B20AF1B24AAB3970F26EF66401EE05C14F77DA3565A1AB38676900ED06A926F3F4475EE9E5C27F9299B0BDBD1DA3864130EAE034D55ECCE8C67C6913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9auBsoWJeY+Bes9VoS82HQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3312B3EE1AC2AB6CC17FEDC8E388B329AC35261A1702DC064190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=Pr3SI7cNWNUNFdiTOaxt3PFOzUJwuCJ/g0lHCnT2JDk=; t=1709796742; x=1709886742; 
 b=bK7cR5iBL7bzs5l9bxY6mSGowAuUV1zyrCh6h6kdUcsxcS7xnuSKLIoBw4AAtXJpxflnXh0QfwT
 K/aEShGEuB/q84/tFfpQTEojKg+JM71bkF2J5mWVdGSgsJmpspLOE6mXksuvK+kRRxhcimIouW82F
 vrxoqKPr9KyHiruF4sNRiuVkSl/D7CVDILMQuoAUjeN67ooh2X1ZKuc2wvsL+SO0620rvIU3Fz7Ip
 Ej3XEipWElwbXUka1hddJZivpdLuGn+O3WwRWg/6zTrtRz9RC5pICIiN12kJ2b2y5I2VUcmiP/Q8l
 R9JjMcyiHsrS063BZnxhqFXmWQU0PhYbAy0Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=bK7cR5iB
X-Mailman-Original-Authentication-Results: smtp57.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v3 3/9] package/gdal: drop nios2 binutils
 bug 27597 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

07.03.2024 00:36, Giulio Benetti wrote:
> Now that binutils patch has been backported to every Buildroot binutils
> version we can drop nios2 binutils bug 27597 dependency.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
