Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723D9C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 07:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31234415A4;
	Thu,  7 Mar 2024 07:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDiC3rlTgovo; Thu,  7 Mar 2024 07:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CC194193C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CC194193C;
	Thu,  7 Mar 2024 07:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCC961BF5AD
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8C118231E
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2E9gATXUY2UO for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 07:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.95;
 helo=smtp57.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CF1582321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF1582321
Received: from smtp57.i.mail.ru (smtp57.i.mail.ru [95.163.41.95])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CF1582321
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 07:33:12 +0000 (UTC)
Received: by smtp57.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1ri8FY-00000008QXU-1kPM; Thu, 07 Mar 2024 10:33:09 +0300
Message-ID: <2e262f66-66a4-4b8e-9bff-8f4995406dfd@inbox.ru>
Date: Thu, 7 Mar 2024 10:33:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
 <20240306213606.2149683-9-giulio.benetti@benettiengineering.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20240306213606.2149683-9-giulio.benetti@benettiengineering.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597DD765CA75D7304196506956BABF1654B6182A05F53808504051F50C86220364A3C7A4B249DE6549FD77774005EC66A65616DCA8BF0F3D6A0FCBBB4FF5790A3399
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE745FA733BE9B630A0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A69A378178A91E348638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D879B1464C00D81B448101E9C726292BBD0EAD7DFA2312155920879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0C8FBEF6EAD8577B08941B15DA834481FA18204E546F3947C724336BCC0EE1BA8F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E603D20A273AEC4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC974A882099E279BDE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BDCE939D40DBB93CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A559D1A978642BA4885002B1117B3ED69674E1BACDCE53F71A1BDDAE3D1EA49BEA823CB91A9FED034534781492E4B8EEADC24E78AA85F86F6CBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF09F22ACD4B786C1CEF0DC045D5B2D166719759F9639A395D47DB3CF5647512AC45AE5861559675EDA3565A1AB3867690AFACA0FC3A34322DEE9E5C27F9299B0B941BFE6106929690034D55ECCE8C67C6913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9auBsoWJeY+G0NT4g2Q1YQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE332B8B704FE97DD9C17FEDC8E388B329AC09903E78046EF65990DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=Pr3SI7cNWNUNFdiTOaxt3PFOzUJwuCJ/g0lHCnT2JDk=; t=1709796792; x=1709886792; 
 b=lhhFR2be8NeZEXvburSWCNmB0dHZG+3tdbVLoEKPaZ9UCrQvkPjxxr+JE77+knDO+iaINyszTeE
 Ifs1nIsyQBgY09JGUTeALz4m+NfGL3og76v1WRk7gNOCvojdnbuCB0DSJaYfgkv7aZIxPDSDznqBL
 yw4wvJ5dzCSg2N8JSrwJ2SfTi0EkLVVR6B4i7U7BVF2ojf73hLOmPgEdz1+9/fseGXZ/ZYp1k1MKo
 DJatFWc40nyXbqyAZMPCZ5r6srehbNTiOlRsGJOVMu19joHaoNVa9mGkTCRwWVsZRD+g8joK982c0
 x2B+M10BN/mP4FWT6fUQwqtFSSy+MSyB6q8g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=lhhFR2be
X-Mailman-Original-Authentication-Results: smtp57.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v3 8/9] package/postgis: drop nios2 binutils
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
