Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E142DC54E58
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 05:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DC48130A;
	Tue, 12 Mar 2024 05:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8qdUS7mdWKy; Tue, 12 Mar 2024 05:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B6A781319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6A781319;
	Tue, 12 Mar 2024 05:40:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90C431BF298
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 05:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DBBB60645
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 05:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMfT7XECXB2p for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 05:40:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.41.80;
 helo=smtp39.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92E1360624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E1360624
Received: from smtp39.i.mail.ru (smtp39.i.mail.ru [95.163.41.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E1360624
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 05:40:36 +0000 (UTC)
Received: by smtp39.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1rjusK-00000003bGq-1JfP; Tue, 12 Mar 2024 08:40:32 +0300
Message-ID: <0ddef86d-1b89-4bf3-9fe7-6c7edfcc2975@inbox.ru>
Date: Tue, 12 Mar 2024 08:40:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konstantin Aladyshev <aladyshev22@gmail.com>, buildroot@buildroot.org
References: <20240311193526.32797-1-aladyshev22@gmail.com>
Content-Language: en-US
In-Reply-To: <20240311193526.32797-1-aladyshev22@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD987C0EE6E7F0A597DF2E6F6001F0923FF54E1DF110EA51DBE182A05F53808504045365DF550CD9882A6D5EE0DB6E1EC8DBBDE8B4EF44D29683CF4232FB82802E1E2E35834FA4BCB46
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E8764B5BC580342EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F9CBC1404CDFA5A08638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86A26407F8E57CA537A16D20F7632B3604C584FDBB63C8D7F20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C084ED00A64A654CBE8941B15DA834481FA18204E546F3947CA5ED62E35AC703CCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370A32D918A17158F1389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FCF1175FABE1C0F9B6E2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B9F5955FECEF5819E75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A560AA4EFE41AFD7AE5002B1117B3ED6969067F4585CE958D122DFD5397F446790823CB91A9FED034534781492E4B8EEADC3194D76C41E9723BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34CC972AA0E2E780C4387F579F2A672DAAD867B7D806BB2D79A4D6E781A225A6DB5992E331DB5787691D7E09C32AA3244C8CA71110430BBD73921CC9A31F9C47814CE2DB3BE561806AEA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWDseZ7hBpnglIOUleBEU3Q==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE332F401E6315919C3C650A52BA8CF7C987EDFEF2F7548A7A1090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=QKPbcoXxK7zyRU6IG2i+Qdx0w1nPh6E6QjZFuvhz5jU=; t=1710222037; x=1710312037; 
 b=snFP/CioHuSXfKo353dncuF4898GeQdYPpk0X/6e36ZT3B6B/tnrLeUeiS+Av+pQUv9+TAPE3J7
 JCQFPAytvhKwhrglYRYXJdRMsUVhWPwnyOg2xcxaxDh4zFrK/8atBiPoaYHx3G4+Sp/5TrnmHykDR
 woahNMOGpqxrKKbP5B0WgGF5qnZg5OocmwFPs1y9AD70ar2VszoRJp9XtTXwKM3aEsyE2bFNN8mgx
 cbhOe3BQArBxt84WSNmZaACSBdK1oWN3JZgWWrCBNCzWE24YKmTS2PWCbfFwD+FNZdWAXbVB6y7jA
 Sc3CGfjG5aXEQoyf1Nj+4RI85tZH2fh9nF8A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=snFP/Cio
X-Mailman-Original-Authentication-Results: smtp39.i.mail.ru; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add CRDA package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MTEuMDMuMjAyNCAyMjozNSwgS29uc3RhbnRpbiBBbGFkeXNoZXYgd3JvdGU6Cj4gQ2VudHJhbCBS
ZWd1bGF0b3J5IERvbWFpbiBBZ2VudCBpcyB1c2VkIGJ5IHRoZSBMaW51eCBrZXJuZWwgY2Y4MDIx
MQo+IHdpcmVsZXNzIHN1YnN5c3RlbS4gQ3VycmVudGx5IHRoaXMgcGFja2FnZSBpcyBub3QgZW5h
YmxlZCBhbmQga2VybmVsCj4gY29tcGxhaW5zIHdpdGggdGhlIGZvbGxvd2luZyBtZXNzYWdlIG9u
IGV2ZXJ5IGJvb3Q6Cj4gIiIiCj4gcGxhdGZvcm0gcmVndWxhdG9yeS4wOiBEaXJlY3QgZmlybXdh
cmUgbG9hZCBmb3IgcmVndWxhdG9yeS5kYiBmYWlsZWQKPiB3aXRoIGVycm9yIC0yCj4gY2ZnODAy
MTE6IGZhaWxlZCB0byBsb2FkIHJlZ3VsYXRvcnkuZGIKCndpcmVsZXNzLXJlZ2RiIGlzIHJlZ3Vs
YXRvcnkgZGF0YWJhc2UgdXNlZCBieSBMaW51eC4KCj4gIiIiCj4gQWRkIENSREEgcGFja2FnZSB0
byBmaXggdGhlIGlzc3VlLgoKQ1JEQSBpcyBhIHVkZXYgaGVscGVyIGZvciBjb21tdW5pY2F0aW9u
IGJldHdlZW4gdGhlIGtlcm5lbCBhbmQgLSAKdXNlcnNwYWNlLiBDUkRBIGlzIG5vIGxvbmdlciBu
ZWVkZWQgYXMgb2Yga2VybmVsIHY0LjE1IHNpbmNlIGNvbW1pdCAKMDA3ZjZjNWU2ZWI0NSAowqtj
Zmc4MDIxMTogc3VwcG9ydCBsb2FkaW5nIHJlZ3VsYXRvcnkgZGF0YWJhc2UgYXMgCmZpcm13YXJl
IGZpbGXCuykgYWRkZWQgc3VwcG9ydCB0byB1c2UgdGhlIGtlcm5lbOKAmXMgZmlybXdhcmUgcmVx
dWVzdCBBUEkgCndoaWNoIGxvb2tzIGZvciB0aGUgZmlybXdhcmUgb24gL2xpYi9maXJtd2FyZS4g
QmVjYXVzZSBvZiB0aGlzIENSREEgaXMgCmxlZ2FjeSBzb2Z0d2FyZSBmb3Igb2xkZXIga2VybmVs
cy4KClNvIGl0IGxvb2tzIGxpa2UgeW91IG5lZWQgdG8gaW5zdGFsbCBwYWNrYWdlL3dpcmVsZXNz
LXJlZ2RiIGluc3RlYWQgb2YgQ1JEQS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
