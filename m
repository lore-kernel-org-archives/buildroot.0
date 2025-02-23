Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942C2C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 06:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394E0407A8;
	Sun, 23 Feb 2025 06:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqOm-b-TYaWl; Sun, 23 Feb 2025 06:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EE1407B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03EE1407B3;
	Sun, 23 Feb 2025 06:52:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2FA9943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 06:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 923B0608C2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 06:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3S3mLyDnzKbi for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 06:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.105;
 helo=send266.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34D2960884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D2960884
Received: from send266.i.mail.ru (send266.i.mail.ru [95.163.59.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34D2960884
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 06:52:26 +0000 (UTC)
Received: by exim-smtp-5556bfdb98-kppv4 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1tm5qh-00000000Vdb-2vXL; Sun, 23 Feb 2025 09:52:24 +0300
Message-ID: <49083a7b-4d58-4c19-950a-a56e71427a74@inbox.ru>
Date: Sun, 23 Feb 2025 09:52:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20250222080249.2134474-1-fancp2007@gmail.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250222080249.2134474-1-fancp2007@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA049977D4E2D0767F7F3382B327AA33718E00894C459B0CD1B97DC42A1ED1DE6591B4227B83FC9362CB7F0D52042E9B02F9B9D557757665AA112208A4954BE01924
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75BC5C25D5957B3DFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637317AD06F2A8D0AEF8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88555F919F9048622479D7B6F68A84BC775185F5DBAA7D07B20879F7C8C5043D14489FFFB0AA5F4BF1661749BA6B9773581F0255C1FF0F6138941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370D9A29B7FD16D1239FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A572DBC2406BB7DA615002B1117B3ED69674419F2DFEC88022A9DAB4B68AE4D22F823CB91A9FED034534781492E4B8EEADEF0AF71940E62277BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE277D5D52887D71F1BBD4E9CE61CCAC0B4AC64352D5F6561E9048E7A61CE5DE8265F63FF884E79B3DD1EB5C6CC1B9E947B3A43860FF25B000E8DA4099F43DCBC516A0734DE7DABD1111DC66A97D0BFE2913E6812662D5F2A17D6C1CDD2003EB8E03787203701020945C72C348FB7EED3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVQQG/FugD0/C3R6aO87/0oY=
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219453CC30DF4D13776B0A1DD2F1EF504FAB7FA87D7E6BD693F90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=2/hQPHWJAQ1p1wdFodQMWGT0EpjeLz/MCoP1mfrJfm8=; t=1740293548; x=1740383548; 
 b=GE1Lj8gj8KJe8T2U97EuILAkF1hyEpC6hxg3O7/F3p6d/TlIP6sbIk1ylPYve0zwxMPqi4TDkpu
 ZAbfryNJtIUtiAuN7HRpHEAkRWXY3932T9BtzI6nyy6p0RSn7Iho0Amj/PMshcEI37FsgXF/sQ1P4
 ERNs3Rkk8hg+3xEHwPUiEF6t4eCaOHx1Re9CXe3OMYA+oRhq1SCnSEbxCjB1HtT7Kf14L2pnTjupm
 FG/CZSs26eMQseSd1KfspcXE0NoRv1v3n82DTnKCxYArZq0mDUw3aHw+j5TwsmrGX/EZvG63K8onn
 4j0znLAQsGC3pSlW1QBHHocxJGbF0X6+jTMw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=GE1Lj8gj
X-Mailman-Original-Authentication-Results: exim-smtp-5556bfdb98-kppv4;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.2
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

MjIuMDIuMjAyNSAxMTowMiwgU2NvdHQgRmFuINC/0LjRiNC10YI6Cj4gUmVsZWFzZSBub3Rlczog
aHR0cHM6Ly9naXRodWIuY29tL3RpbWVzY2FsZS90aW1lc2NhbGVkYi9ibG9iLzIuMTguMi9DSEFO
R0VMT0cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZhbmNwMjAwN0BnbWFpbC5j
b20+Cj4gLS0tCj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2ggfCAyICst
Cj4gICBwYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rICAgfCAyICstCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoIGIvcGFja2FnZS90aW1l
c2NhbGVkYi90aW1lc2NhbGVkYi5oYXNoCj4gaW5kZXggN2M3NzA2MThiMi4uOTVkZWRjMGQ5MiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiArKysg
Yi9wYWNrYWdlL3RpbWVzY2FsZWRiL3RpbWVzY2FsZWRiLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAK
PiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgZjI5M2ZjNTRiYzc2ZDA2YzU5NTVh
ZTY4ZTJlODEyNDMzMWJlZTgwYWVlOGI0OTkwNDdhZmFlMDFiMTA1MTNjZSAgdGltZXNjYWxlZGIt
Mi4xOC4xLnRhci5nego+ICtzaGEyNTYgIDMwZjRkZGY1YmQ3MWU0ZTMwNzA2ZjY3MTVhYTUyMTA5
YjQ2NzJjNjExZTU5NDhkODY1YTJiNDM0NzEwMzJhOTIgIHRpbWVzY2FsZWRiLTIuMTguMi50YXIu
Z3oKPiAgIHNoYTI1NiAgMDM3OGUwOTQ4ZmVlZmQ4NWY1NzkzMTljNzRkNmUyYjY3MTE5NDAzN2Y1
NTBjNzE3NmVmMjY2NDlkOTRjODk1YiAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Rp
bWVzY2FsZWRiL3RpbWVzY2FsZWRiLm1rIGIvcGFja2FnZS90aW1lc2NhbGVkYi90aW1lc2NhbGVk
Yi5tawo+IGluZGV4IGMxZjY1ZDVmM2EuLmZkZmU5YzA1MzkgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS90aW1lc2NhbGVkYi90aW1lc2NhbGVkYi5tawo+ICsrKyBiL3BhY2thZ2UvdGltZXNjYWxlZGIv
dGltZXNjYWxlZGIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gICAKPiAtVElNRVNDQUxFREJfVkVSU0lPTiA9IDIuMTguMQo+ICtUSU1FU0NB
TEVEQl9WRVJTSU9OID0gMi4xOC4yCj4gICBUSU1FU0NBTEVEQl9TSVRFID0gJChjYWxsIGdpdGh1
Yix0aW1lc2NhbGUsdGltZXNjYWxlZGIsJChUSU1FU0NBTEVEQl9WRVJTSU9OKSkKPiAgIFRJTUVT
Q0FMRURCX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4gICBUSU1FU0NBTEVEQl9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQoKUmV2aWV3ZWQtYnk6IE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gu
cnU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
