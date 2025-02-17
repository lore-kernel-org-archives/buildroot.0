Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21855C0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 10:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB272404B8;
	Mon, 17 Feb 2025 10:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPKFnAEYHfmL; Mon, 17 Feb 2025 10:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBDE4051B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBDE4051B;
	Mon, 17 Feb 2025 10:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B6072
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 552B881D4F
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWJFlc9O8FQj for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 10:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.221.237.178;
 helo=send83.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF4C681EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4C681EF0
Received: from send83.i.mail.ru (send83.i.mail.ru [89.221.237.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF4C681EF0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 10:11:24 +0000 (UTC)
Received: by exim-smtp-844687bc8-xnd58 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tjy5w-00000000O4Y-2P0K; Mon, 17 Feb 2025 13:11:20 +0300
Message-ID: <edae8138-867b-4074-8963-14b64ab24b60@inbox.ru>
Date: Mon, 17 Feb 2025 13:11:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250217100836.13604-1-fancp2007@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250217100836.13604-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD93899CACFFF273C592410AF6BC9A94DB4F79A225EC2EDD32B182A05F538085040A6E3AF9CCC1CC5B93DE06ABAFEAF67055F5150C86C6F1E90F0DA72A845DE350E7AE8E57E538EEBEE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76631C0C760014215EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80E12BDC98A434B595EE831C7BC26AD70FD33AA51B69BF4C120879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B97735ECC8AC47CD0EDEFF8941B15DA834481FA18204E546F3947C0839144E5BB460BAF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706C07FE7DDBB4AB7389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735444A83B712AC0148C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5B800AB1D079583365002B1117B3ED696BE5FB4B3676AC6E1AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADF1165EFABA1780A6BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF591D77ECC4265C3B0A743856A9933BD0D18747AF10B1C7750767FA7936FD7089BA297A5F7262141FF7DAF9EE0634D236C31177A55A098FF05C77EF42D601EBFD744BBFFBCC6C2AB2111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrSI+idJAeErs=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA2190011923CE99B56739DFDA54AC809C0050D3F51830E8217E490DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=ARjgGZ+aH8JY14g7B3JvL3HljdWW1SYR7zVRakMR/HA=; t=1739787085; x=1739877085; 
 b=VlS5e7oNcFqsVPE6tneGFxSnnyaPkUwDAsuXOcrzHIgak2223W3242MsIabALSfPBY7JvvgbOEh
 0MlooxtcYy3e/qIjq1ozkfDMhhUJGPC5pZAwMTbve0iPRL0ZOExmZ04o7TBVcxVYql8Jz/MDvDDD6
 /UNV+G5EfD2xOqDE3E0dTfZHRBSmzfwND+lxl7is5NFTrX4tsVOhtZxCmLJrXrsZ3A0zjiOyE+Pv1
 /40n5TM8h7hPXivgwJPWJtxsSh62g87g79qAYX74ncS91S7QPzVLp7DdYxBTgVb27Cc2uiehWr/Sp
 RbjgO1NG6/aktKjMjhG2bPGx/a9Eoyh14pmw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=VlS5e7oN
X-Mailman-Original-Authentication-Results: exim-smtp-844687bc8-xnd58; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MTcuMDIuMjAyNSAxMzowOCwgU2NvdHQgRmFuINC/0LjRiNC10YI6Cj4gUmVsZWFzZSBub3Rlczog
aHR0cHM6Ly9naXRodWIuY29tL3RpbWVzY2FsZS90aW1lc2NhbGVkYi9ibG9iLzIuMTguMS9DSEFO
R0VMT0cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5j
b20+Cj4gLS0tCj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2ggfCAyICst
Cj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rICAgfCAyICstCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoIGIvcGFja2FnZS90aW1l
c2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoCj4gaW5kZXggZjc5OWIwYzdmOC4uN2M3NzA2MThiMiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiArKysg
Yi9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAK
PiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgODYyNDg5NzA5NzFhZDA3NWUwYjVl
ZDY0ZGJiYTViMTkwZWI4Nzk0ZDZlMzZiNTA4NDI3YTVjYzQyYjIwYTQyMCAgdGltZXNjYWxlZGIt
Mi4xOC4wLnRhci5nego+ICtzaGEyNTYgIGYyOTNmYzU0YmM3NmQwNmM1OTU1YWU2OGUyZTgxMjQz
MzFiZWU4MGFlZThiNDk5MDQ3YWZhZTAxYjEwNTEzY2UgIHRpbWVzY2FsZWRiLTIuMTguMS50YXIu
Z3oKPiAgIHNoYTI1NiAgMDM3OGUwOTQ4ZmVlZmQ4NWY1NzkzMTljNzRkNmUyYjY3MTE5NDAzN2Y1
NTBjNzE3NmVmMjY2NDlkOTRjODk1YiAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Rp
bWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rIGIvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVk
Yi5tawo+IGluZGV4IDk5NzU2Y2IwYjguLmMxZjY1ZDVmM2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5tawo+ICsrKyBiL3BhY2thZ2UvdGltZXNjYWxlZGIv
dGltZXNjYWxlZGIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gICAKPiAtVElNRVNDQUxFREJfVkVSU0lPTiA9IDIuMTguMAo+ICtUSU1FU0NB
TEVEQl9WRVJTSU9OID0gMi4xOC4xCj4gICBUSU1FU0NBTEVEQl9TSVRFID0gJChjYWxsIGdpdGh1
Yix0aW1lc2NhbGUsdGltZXNjYWxlZGIsJChUSU1FU0NBTEVEQl9WRVJTSU9OKSkKPiAgIFRJTUVT
Q0FMRURCX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gICBUSU1FU0NBTEVEQl9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQoKUmV2aWV3ZWQtYnk6IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gu
cnU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
