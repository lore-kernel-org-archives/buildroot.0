Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B8C48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 07:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B9DF41826;
	Thu,  7 Mar 2024 07:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xASSEszFwxia; Thu,  7 Mar 2024 07:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03AF3414BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03AF3414BD;
	Thu,  7 Mar 2024 07:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E521BF5AD
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9085182321
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 07:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsXSWPkjn9_k for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 07:32:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.95;
 helo=smtp57.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56A5A8231E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A5A8231E
Received: from smtp57.i.mail.ru (smtp57.i.mail.ru [95.163.41.95])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56A5A8231E
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 07:32:54 +0000 (UTC)
Received: by smtp57.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1ri8FG-00000008QXU-0Rkr; Thu, 07 Mar 2024 10:32:50 +0300
Message-ID: <f69a6494-8a11-4a81-be85-1b192f3a5089@inbox.ru>
Date: Thu, 7 Mar 2024 10:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
 <20240306213606.2149683-7-giulio.benetti@benettiengineering.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20240306213606.2149683-7-giulio.benetti@benettiengineering.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597D77DAD88DB19A0E871D0E83388B9166C4182A05F5380850405168325589C0DA24C7A4B249DE6549FDDA90721DAA9E0F1D16DCA8BF0F3D6A0F1E3A739F9B1F1DEB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE798E404AA3BF6E4FFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378B49D47CE295E66E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89AC78D82288460F48101E9C726292BBDEB9236FCF6A5960520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0FE6165853F4646218941B15DA834481FA18204E546F3947CA7DFDF579AB090EFF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006374F09588CB15B21E6389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC974A882099E279BDE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BB9CEE4F2B4A90F8475ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A56C9EF88EC0D226885002B1117B3ED6969338087407B51D716E5F408120975D33823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF866F9BFA23092C48FB15CCEF4C8F50460A47556CC5DE77E8C1611EBBB9DF091C46C06E59B4E81405A3565A1AB38676909527225A6547A62EEE9E5C27F9299B0B59316A81526FBEB3034D55ECCE8C67C6913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj9auBsoWJeY/pQH5HAg5ZKg==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE338A157DFBBCB465FD7FEDC8E388B329ACA169EAB862843D3290DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=Pr3SI7cNWNUNFdiTOaxt3PFOzUJwuCJ/g0lHCnT2JDk=; t=1709796774; x=1709886774; 
 b=qlwNaqtspfD0lhtyus2ipczmcfWpfzDcGOurDh54g6p6IKARFmEh+8O6iGDDd1OUghnymAgi9WS
 wAQp7KpxIFoeejpdgCOxec31lt0BlKNVrULun+WwEUeR2Dz1HyworiSzxcdeeIrqVqX1JhZTlnMj+
 fVMMVi2Z2o4WaHpmCI17a37eM90Dr0MiOEVYs5fL/g3D2WS+EZCOWrZGOT0QwaRVdp2csyLIHoRnL
 3V053vHvDtz3EaOOXApWRvBP/m+bCcpBTn9I1tWhSS3bwnQhduakg+CoQbOTMiSCYSFDlasCrHvia
 NDohLR0Uu4sQ58+t7nE09u2yOyOSSy9SGOBw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=qlwNaqts
X-Mailman-Original-Authentication-Results: smtp57.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v3 6/9] package/libgeos: drop nios2 binutils
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
