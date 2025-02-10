Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D273DC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 05:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893796068D;
	Mon, 10 Feb 2025 05:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-8PQBF1Dclh; Mon, 10 Feb 2025 05:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EBA760A5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBA760A5D;
	Mon, 10 Feb 2025 05:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 99EEA199
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 05:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C74F6068D
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 05:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CA6EITYUOaKN for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 05:54:24 +0000 (UTC)
X-Greylist: delayed 460 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Feb 2025 05:54:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F082760A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F082760A6B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.137.243.72;
 helo=fallback17.i.mail.ru; envelope-from=fido_max@inbox.ru;
 receiver=<UNKNOWN> 
Received: from fallback17.i.mail.ru (fallback17.i.mail.ru [79.137.243.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F082760A6B
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 05:54:23 +0000 (UTC)
Received: from [10.113.209.57] (port=37700 helo=send147.i.mail.ru)
 by fallback17.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1thMcy-00ElaR-V1
 for buildroot@buildroot.org; Mon, 10 Feb 2025 08:46:41 +0300
Received: from [10.113.97.139] (port=32786 helo=send175.i.mail.ru)
 by exim-fallback-7cc98c76cb-t6lc4 with esmtp (envelope-from
 <fido_max@inbox.ru>) id 1thMcn-00000000Am0-0W8h
 for buildroot@buildroot.org; Mon, 10 Feb 2025 08:46:29 +0300
Received: by exim-smtp-5c664d6544-bzj2w with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1thMcZ-00000000AGS-2oMN; Mon, 10 Feb 2025 08:46:16 +0300
Message-ID: <fa623b15-bdc4-4f94-ab46-af9e13ed47cc@inbox.ru>
Date: Mon, 10 Feb 2025 08:46:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250210024245.1954529-1-fancp2007@gmail.com>
Content-Language: en-US
In-Reply-To: <20250210024245.1954529-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD980EDB4062763125EC8D2230947DB317A0CBD602793C8D51E00894C459B0CD1B979EC30AC96248566C591814E25D11F9FB7B8D27273F1743BF0FE944AFB498C76E1C7414A75FA687D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE722003BD978DAE1FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637204D59D994DFFAD78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D841296E72BFB924A6FD155CED4EB0E81F0DFE5C5F613F76AA20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A29E2F051442AF778941B15DA834481FA18204E546F3947C78444BBB7636F62AF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063710E79982F6CB68F9389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D2D576BCF940C736C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A58B7F6136F92341A55002B1117B3ED69630C1C27A4B4F825B69995D676B7B4CBE823CB91A9FED034534781492E4B8EEADC0A73878EBD0941BBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF0429DA3569D09744CA831B9BB188071B8CC5DAAE9378D33E7D371EACE34C6E6CA53151558601347DAE28C187D4EE01765C908E47F844AE26C3E32CA4837657C8808E3BD75034B0BD111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojy7TIew8PonFrwKJn+Hh3hA==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2194DF5DBEBE913CDF45EA9064F7ECD122AFA3A76AC142D8A8090DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B44B0434F1F998EE1236190B7B86E0927E05C974DE1568D8C268F3CF0E9FE49B69AC77C438E4F4F3F1AD8B12C90C6B2AB7BC1B43B5F891E2C03708EEAC0E7584178BAD1A1B1545567C
X-7FA49CB5: 0D63561A33F958A5C70F07FA3EAB89425002B1117B3ED696687792E74DCC4860F998A5D35DE99F7602ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqu66T7L6mrcTqYQ0PEDyTA
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B44B0434F1F998EE12B85463073E4677A57164936802630CD568F3CF0E9FE49B69AC77C438E4F4F3F13AB636EA2339379CE0236519A0D3475CDB1FC79A2208CF3F
X-7FA49CB5: 0D63561A33F958A5DD0E4C50BCABFDD7B9F54812E7DCD838380049CB0955566ECACD7DF95DA8FC8BD5E8D9A59859A8B61296FF745319A287
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u6NqYXWMR0/V85CnFjCYTu9APdQH0PvpnP5qz8aO2mjTJzjHGC4ogvVuzB3zfVUBtENeZ6b5av1fnCBE34JUDkWdM6QxE+Ga5d8voMtmXfSqliNu+BMkNK3vnsmttD4RG
X-Mailru-MI: 20000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=PoiIkJtXH/2A0QgJ/KtNd88Wbgm8aU+txUeEV+Mf454=; 
 t=1739166864;x=1739256864; 
 b=R/tkkTNjpO3BgaE9VUMrtHcjKzJBSqKdDHRGVfks7s90H+M0VIaOCkPM2PiQEBBkNrCLUIFzwIrzMtsicyR/K0LI3vWKWr3sFv8hHQl98f1nUAj3t47i9Cxk5I08ltMVjgHOtptZx7MbljHGdG4oMCS9tSeNcrhc9fH7yBB2KsWEwbd9WsB1SgzhApmvWQ5ZscZlX6LRRDFlhfs7fdjL759X88i7Jf9cTQUzR9Tw59qvRTVnVAFyN9Mej80SgYxUTugSzXwBW+6T35mqIjtLgH6LXXvwK0V5XU9H2Frt271Gaw1JxSU9RP8idC70dbI/fun05FNrXf4GmzVaWNnnCA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=PoiIkJtXH/2A0QgJ/KtNd88Wbgm8aU+txUeEV+Mf454=; t=1739166400; x=1739256400; 
 b=UCcVjV7FhOPCTRmJsH2kohvBljB5TMSv4UnKZniweSoCOnQqfBKRQemo2LFsIP7qhctTozAkyak
 dx6a0ArodPyOcPgqkhM6sWcF1JabGzcG8Bgdj5QwwTT+DC7v9gJgBW+NfghMWRdPolL9Ai/2/xgTN
 GSUc48pxiX5vBWRUpVKoJoJISvSPoxL2M8S/3z1ZmGUE+Tz2DH1Ckz5f8DaIyjMxA8LwjgmkOtLso
 bq7Z1NcqF3VCJdiNISUm6KrTSZ6iuZDckmgHm48oNZuldU4c39RHhs3rkuvsAO1eagBTTRfj0wKSO
 QUvbtIwVfUrOrWRNIqNADNGWRaQb97V/0WYA==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=PoiIkJtXH/2A0QgJ/KtNd88Wbgm8aU+txUeEV+Mf454=; t=1739166389; x=1739256389; 
 b=DRVNLdAydoHHsDAPagCRonvdNe6I/ZuU688gIY6jafc0IQIdYhTkuqnf6lyeTf8yFjI4eBOuyjO
 uScve3fLfCgtXuF7uV/JIpBTksGcqtM1P/d772b/r1UM8u7Fje98M/Qxsce0OFrFfgUOGqNP/LC4L
 9RjLl4sCY5RaTNySp6rtcOR6gG3Z8TzkTmRRgbnmlCn2QAjfciEUfz7SW328njj5kobP22Av23oBE
 A54YZ7yOW1SuYy+gZRysD1A8txVqm+XilDSSUHqWmZ6/trnUq6VU3xNmDow9rEsJ7ICCUAsfMKBNL
 RQigeuyguGexHn75tNWtis7p1yXy6X7TqJGg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=R/tkkTNj; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=UCcVjV7F; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=DRVNLdAy
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.0
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

MTAuMDIuMjAyNSAwNTo0MiwgU2NvdHQgRmFuINC/0LjRiNC10YI6Cj4gUmVsZWFzZSBub3Rlczog
aHR0cHM6Ly9naXRodWIuY29tL3RpbWVzY2FsZS90aW1lc2NhbGVkYi9ibG9iLzIuMTguMC9DSEFO
R0VMT0cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5j
b20+Cj4gLS0tCj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2ggfCAyICst
Cj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rICAgfCAyICstCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoIGIvcGFja2FnZS90aW1l
c2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoCj4gaW5kZXggMDhkOTgxNjYxZS4uZjc5OWIwYzdmOCAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiArKysg
Yi9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAK
PiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgYjJmY2MyOWU5OTc1Yjg4YzUzMjNh
ZWZiMDYyMzQ2MzI2Njk0YzM5MWQ1MmFmNDYxODZmNWE1YWQwOTEzNmQ0NyAgdGltZXNjYWxlZGIt
Mi4xNy4yLnRhci5nego+ICtzaGEyNTYgIDg2MjQ4OTcwOTcxYWQwNzVlMGI1ZWQ2NGRiYmE1YjE5
MGViODc5NGQ2ZTM2YjUwODQyN2E1Y2M0MmIyMGE0MjAgIHRpbWVzY2FsZWRiLTIuMTguMC50YXIu
Z3oKPiAgIHNoYTI1NiAgMDM3OGUwOTQ4ZmVlZmQ4NWY1NzkzMTljNzRkNmUyYjY3MTE5NDAzN2Y1
NTBjNzE3NmVmMjY2NDlkOTRjODk1YiAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Rp
bWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rIGIvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVk
Yi5tawo+IGluZGV4IGM5ZGRhNjcyODIuLjk5NzU2Y2IwYjggMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5tawo+ICsrKyBiL3BhY2thZ2UvdGltZXNjYWxlZGIv
dGltZXNjYWxlZGIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gICAKPiAtVElNRVNDQUxFREJfVkVSU0lPTiA9IDIuMTcuMgo+ICtUSU1FU0NB
TEVEQl9WRVJTSU9OID0gMi4xOC4wCj4gICBUSU1FU0NBTEVEQl9TSVRFID0gJChjYWxsIGdpdGh1
Yix0aW1lc2NhbGUsdGltZXNjYWxlZGIsJChUSU1FU0NBTEVEQl9WRVJTSU9OKSkKPiAgIFRJTUVT
Q0FMRURCX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gICBUSU1FU0NBTEVEQl9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQoKUmV2aWV3ZWQtYnk6IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gu
cnU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
