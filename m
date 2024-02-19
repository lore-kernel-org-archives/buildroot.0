Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E48C48260
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 05:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A93A60A98;
	Mon, 19 Feb 2024 05:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNiwKG0LEnLi; Mon, 19 Feb 2024 05:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCE260A9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCE260A9D;
	Mon, 19 Feb 2024 05:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D8E2E1BF82D
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 05:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D278540446
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 05:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Li9NnUFvF4B for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 05:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.94;
 helo=smtp56.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C34AE4042B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C34AE4042B
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C34AE4042B
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 05:48:19 +0000 (UTC)
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rbwVk-0000000BuoJ-0B1T; Mon, 19 Feb 2024 08:48:16 +0300
Message-ID: <93af9a25-e8d6-46d8-b68c-86cc20b81608@inbox.ru>
Date: Mon, 19 Feb 2024 08:48:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
 <20240218184536.1922309-6-giulio.benetti@benettiengineering.com>
In-Reply-To: <20240218184536.1922309-6-giulio.benetti@benettiengineering.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9001F8F2F6BAD2021F4B2298ADA324AF81BB1825BF5AE0A1600894C459B0CD1B9E0FC1458AD1A4985FFB36B11FB8673C2DAE27851852220F13E88C8D4F1998E200C43EDF95CA0F6DD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70FEF15FEF2CD350AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637160171C9EBC7AFE48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88DA610E4B93E7EF7CE66D7CF0D7BDABB7493CAF977BAC58E20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C09DFF8554865147A68941B15DA834481FA18204E546F3947C8ED1AC82D843A2BBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC2EE5AD8F952D28FBE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B851EDB9C5A93305EEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A55014534ADFA19F0F5002B1117B3ED696A178EEFADFE7354D484B8D70797403F6823CB91A9FED034534781492E4B8EEADB73CFAAED92B6E13BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3EFCAA25ABB3A94FBD4FA02AB56677079D843FEC7E04BA48CD1BE4F205DC8F298853F4E7B596232834E84B500378195FB1A9B643CD3A1D1A5AB57D5A8E669EEB4C8B5802BAE6CA55034D55ECCE8C67C6913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpg4ZDo8heSyfpCV547apfw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE33E941B4179C0C7E991285264D58F0EB3A16A458F28A40EB3C90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=85IJk51P+ba3Hytc5vtOFr0wuTckOsVqdIsZaVNMxpc=; t=1708321700; x=1708411700; 
 b=KIQr7YxVmSgtRCQeQlAkERZJcfWYdcjxAcft0ueINfxz4riNGh6zm1dF8evC1EIJr+xifBX9sLN
 noTCM/iJnyP0b0Kvp5HeIJsJRrL4PpDS870CF06yGNHCqDQQyJDbQozRle+XX83W9qyxnS9uDTCoC
 +wqVPQ0keVBiKD3B6lu+4Q891a3zJqzPREwZmJ2qzu7rdbyBZqRJBsS1GVGMkKWoWz/CbNi6CZtBf
 q4wMZRBMoLElhT0F0NSDa3FLcmUNzaRAlAHCMsSkoEaQGMWF9Y4mv0JRswZ02WlY5VTNhd+wPkLgc
 MkdHI+C37Ku7+ljK1rnfsb1mFE2XJq9pUBZg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=KIQr7YxV
X-Mailman-Original-Authentication-Results: smtp56.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 5/8] package/libgeos: drop nios2 binutils
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
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



On 18.02.2024 21:45, Giulio Benetti wrote:
> Now that binutils patch has been backported to every Buildroot binutils
> version we can drop nios2 binutils bug 27597 dependency.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
