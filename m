Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9CCE77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 04:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E0A81E2C;
	Wed, 11 Dec 2024 04:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MV_RM6AOzh0I; Wed, 11 Dec 2024 04:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CC0B81E1B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC0B81E1B;
	Wed, 11 Dec 2024 04:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40FD5ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 128A1401D8
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spk1a2Uz2gZR for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 04:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.221;
 helo=send126.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67E94400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67E94400F2
Received: from send126.i.mail.ru (send126.i.mail.ru [89.221.237.221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67E94400F2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 04:27:08 +0000 (UTC)
Received: by exim-smtp-598667c6b5-zmcwr with esmtpa (envelope-from
 <fido_max@inbox.ru>) id 1tLEJU-00000000KZT-3SC8
 for buildroot@buildroot.org; Wed, 11 Dec 2024 07:27:05 +0300
Message-ID: <522cde42-81d2-4898-99b9-2b24b42f8af1@inbox.ru>
Date: Wed, 11 Dec 2024 07:27:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241210154240.1380886-1-fido_max@inbox.ru>
 <6cf7bbe8cdab290b3e8581d40357ecc3@free.fr>
Content-Language: en-US
In-Reply-To: <6cf7bbe8cdab290b3e8581d40357ecc3@free.fr>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9B739379E53DE709585AD0E3AD12D25CA82CC0802D22C5F20182A05F5380850405CC893BE3E2B23B33DE06ABAFEAF6705B4598197F6495399655467A038491BF783CBAA0A329D8B6B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FF48036FC9305502EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375FE8AD9F0D2764EB8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81B180235D76DFA16C6F58E83F33D5EC7763D002A6206031920879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735B687D752F9FE62218941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637028599BB38096F4F389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5FCDBC64D0A07A2505002B1117B3ED696C5E3445FC4C40479957033528158102E823CB91A9FED034534781492E4B8EEAD17AEC49845D0B908
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF301D95BE0434D49B2BC46D848AB3BA663FC11FE14216596EBB0BE894800C7CC87649A938D59E33EDA0626FDB23E8EA701CC13FB7B7FF969F369342471D5822AA3F4B4B163DBB79E7383C93C5AD2DA449913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojwdtfQel0s3k05l9DkhIefQ==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219F1C7F5280365B56A69930489518218CC54B2F96B224B216590DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=8pHiv/wt3zFQTEzV/CVUcIy/hwwLkWAi7MMAcchtzks=; t=1733891229; x=1733981229; 
 b=YtFlA14VKHfBwAJJprPE7Iqzn6tHVIn0aRo8fMB8K1BthPi6IPLF24vSHOqRn8SS6DTW7kE6EGF
 cLvkE0WQKKpWTVpVGPD0SH0Z5jORszvC+7dHGX9lnXgtRQZTFRKwFE7D5X2PzoWEVJElNx1kupLg+
 bLfOXrV2FuZ/zrHe1DsMwQTGphDStzxRMXLTGEGM40QdgyDIE2X+ObRatbFxNa8l+SfDkROvWKd4P
 71KrYVey0fSbZI76WjSmROr/BypY7f9rSnDNsGrDaIK4nL2SLRWsii9kix86RdPrh8Q6uZVtqfs1m
 kBcQb2j3rlxzoMhc/ffrOJ5KzZrvwtIQRTrA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=YtFlA14V
X-Mailman-Original-Authentication-Results: exim-smtp-598667c6b5-zmcwr;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: add patch to
 disable docs build
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

MTEuMTIuMjAyNCAwMjowMCwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkgTWF4aW0sCj4gCj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2ghCj4gCj4gT24gMTAvMTIvMjAyNCAxNjo0MiwgTWF4aW0gS29j
aGV0a292IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IGRvY2Jvb2sgcGFja2FnZSBpcyBuZWVkZWQg
Zm9yIGJ1aWxkaW5nIGRvY3MuIEJ1aWxkIGZhaWxzIHdpdGhvdXQgaXQKPj4gaWYgeG1sbGludCBp
cyBmb3VuZCBvbiBob3N0Ogo+Pgo+PiBJL08gZXJyb3IgOiBBdHRlbXB0IHRvIGxvYWQgbmV0d29y
ayBlbnRpdHk6IGh0dHA6Ly93d3cub2FzaXMtb3Blbi5vcmcvIAo+PiBkb2Nib29rL3htbC80LjUv
ZG9jYm9va3guZHRkCj4+IC4uL2RvYy9zcmMvc2dtbC9wb3N0Z3Jlcy5zZ21sOjIyOiB3YXJuaW5n
OiBmYWlsZWQgdG8gbG9hZCBleHRlcm5hbCAKPj4gZW50aXR5ICJodHRwOi8vd3d3Lm9hc2lzLW9w
ZW4ub3JnL2RvY2Jvb2sveG1sLzQuNS9kb2Nib29reC5kdGQiCj4+IF0+Cj4+IMKgIF4KPj4gLi4v
ZG9jL3NyYy9zZ21sL3Bvc3RncmVzLnNnbWw6MjQ6IGVsZW1lbnQgYm9vazogdmFsaWRpdHkgZXJy
b3IgOiBObyAKPj4gZGVjbGFyYXRpb24gZm9yIGF0dHJpYnV0ZSBpZCBvZiBlbGVtZW50IGJvb2sK
Pj4gPGJvb2sgaWQ9InBvc3RncmVzIj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF4KPj4KPj4gU28gZGlzYWJsZSBkb2NzIGJ1aWxkLgo+IAo+IEl0IHNlZW1zIHBvc3Rn
cmVzcWwgaXMgbm90IGFsd2F5cyBmYWlsaW5nLiBJbiBzb21lIHNpdHVhdGlvbnMsCj4gaXQgY2Fu
IGJ1aWxkLiBTZWUgZm9yIGV4YW1wbGU6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy84NTgwMTgyMDI3CgpZZXAuIEl0IGZhaWxzIGlmIHhtbGxpbnQg
d2FzIGZvdW5kLgoKeG1sbGludF9iaW4gPSBmaW5kX3Byb2dyYW0oZ2V0X29wdGlvbignWE1MTElO
VCcpLCBuYXRpdmU6IHRydWUsIApyZXF1aXJlZDogZmFsc2UpCgo+IAo+IEkgYWxzbyBzZWUgdGhh
dCB0aGUgUG9zdGdyZVNRTCBtZXNvbiBidWlsZCBzeXN0ZW0gcHJvdmlkZXMgb3B0aW9uCj4gdG8g
YnVpbGQgdGhlIGRvY3MuIFNlZToKPiBodHRwczovL2dpdC5wb3N0Z3Jlc3FsLm9yZy9naXR3ZWIv
PyAKPiBwPXBvc3RncmVzcWwuZ2l0O2E9YmxvYjtmPW1lc29uX29wdGlvbnMudHh0O2g9MjQ2Y2Vj
ZjM4MjcxMmQ5NDE1Nzg1NmQ2ZDU0MDNmNmQwZmMxMzE0ODtoYj02MzA0NjMyZWFhMjEwN2JiMTc2
M2QyOWUyMTNmZjE2NmZmNjEwNGMwI2w4OAo+IAo+IERpZCB5b3UgdHJ5IHRvIGFsd2F5cyBkaXNh
YmxlIGRvY3MgYnkgc2V0dGluZyB0aG9zZSBvcHRpb25zIHRvIGZhbHNlCj4gaW4gX0NPTkZfT1BU
Uz8KPiAKPiBGb3IgZXhhbXBsZSwgc2V0dGluZzoKPiAKPiAgwqDCoMKgIFBPU1RHUkVTUUxfQ09O
Rl9PUFRTID0gXAo+ICDCoMKgwqDCoMKgwqDCoCAtRGRvY3M9ZmFsc2UgXAo+ICDCoMKgwqDCoMKg
wqDCoCAtRGRvY3NfcGRmPWZhbHNlIFwKPiAgwqDCoMKgwqDCoMKgwqAgLURycGF0aD1mYWxzZQoK
WWVzIEkgZGlkLiBUaGF0IHdhcyBteSB2ZXJ5IGZpcnN0IHRyeS4gSXQgZG9lcyBub3QgaGVscC4g
QmVjYXVzZSAid29ybGQiIAp0YXJnZXQgd2FudHMgdG8gYnVpbGQgZG9jcyB1bmNvbmRpdGlvbmFs
bHkuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
