Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18120D41C10
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B781A402FD;
	Wed, 13 Nov 2024 07:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jj4OiN3jpT5D; Wed, 13 Nov 2024 07:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A33D7404E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A33D7404E3;
	Wed, 13 Nov 2024 07:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9AEE11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA74404E8
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCvvGBWchr6L for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 07:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.79;
 helo=smtp38.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A0E7402FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0E7402FD
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [95.163.41.79])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A0E7402FD
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 07:43:33 +0000 (UTC)
Received: by exim-smtp-f57bd98df-rbffq with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tB82E-000000000C9-1wuu; Wed, 13 Nov 2024 10:43:30 +0300
Message-ID: <44dfc2ef-4c9d-464a-95af-2bea9c5ef558@inbox.ru>
Date: Wed, 13 Nov 2024 10:43:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20241113073850.3185120-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20241113073850.3185120-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95DB1AC9E176400EC30C9BC559F662BC32CAAD2E7E72CAEC800894C459B0CD1B9E84D3AF5E5BEC9E33DE06ABAFEAF670540E9CECE74B7A73CBA81D094CF9993264787F701E02FBF3D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D3E352D4AD7EBF54EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B12C6B1582157D838638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85A12CE9C2497093CD7754560BAD7F31E544371DC13FEE64A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C03103C3FD12A8101D8941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063707A1F3761B83B09E389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735F43AACC0BCEB2632C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5BA06AA8B02EB0E305002B1117B3ED696AAD1A47EA68C7DF8C81EEE05487B0209823CB91A9FED034534781492E4B8EEADF12279BA039A6965BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6E5CBE963E8B58E11A60A762EE07C12B6854D0E2A858E4157799EFE37C9E598696A3CD8EA40B8F97D91475F11186E200ABAF4FF5AE0B61A3BBF9AA99320B27AC0DF63A795CC87E3D111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojiL36rItsrIwDjdFI5Fy7eA==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219F697DDDF37ECA554C23CA552186D32657D9AE282F3A26A6390DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=d5SX/QAxt2mmrounAtfc66bPNB/IYiNdIVPfUVBtcFI=; t=1731483814; x=1731573814; 
 b=bccyrmL13EmOfFsVhh3lrh9owmTMwK0U+eg9DwXnttWKEsTRlcF5WW9d87potzVcBOPqoj3Y89I
 UnoPMGp3RMuKWLpceEIQ+d5KnqVv3dQKulnX8+nfSlM9/cWkiBV4aRxRbpHrRi4D2xyYz5Kbr0Azf
 VqqoXoGvDjt35grx7RCY2J0N+zcq3H3+qQzpmMFAe/3SJowbGs7BJPKRyfIMdI6mlP3I9Shc7p6mE
 02AdA8G+IhJrxN35bd6pUApxAf25Y5sRmEQpyyfw7Kjy0ItyOgrGPA3a/cATa0ZoXotqkQLouEy87
 oyZbAWJtCbOsPbIyVLfCWd8ZvUwY4oCDDA8g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=bccyrmL1
X-Mailman-Original-Authentication-Results: exim-smtp-f57bd98df-rbffq; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MTMuMTEuMjAyNCAxMDozOCwgU2NvdHQgRmFuINC/0LjRiNC10YI6Cj4gUmVsZWFzZSBub3Rlczog
aHR0cHM6Ly9naXRodWIuY29tL3RpbWVzY2FsZS90aW1lc2NhbGVkYi9ibG9iLzIuMTcuMi9DSEFO
R0VMT0cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5j
b20+CgpSZXZpZXdlZC1ieTogTWF4aW0gS29jaGV0a292IDxmaWRvX21heEBpbmJveC5ydT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
