Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F00C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6C160AF6;
	Sun, 14 Jan 2024 09:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6C160AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdCi_C_ZC9C4; Sun, 14 Jan 2024 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4802360ADD;
	Sun, 14 Jan 2024 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4802360ADD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9C81BF584
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 557AB83466
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 09:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 557AB83466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuF2LO2IHU3W for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 09:06:47 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407D18341E
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 09:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407D18341E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31C0313F846;
 Sun, 14 Jan 2024 10:06:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 10:06:41 +0100
Date: Sun, 14 Jan 2024 10:06:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZaOkIQZ9czn7zQpU@landeda>
References: <20240109183354.361126-1-sairon@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109183354.361126-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705223205;
 bh=VymudiyiwePPCgb3Vau7LyAHmDP/7jXaEbkrW8AyeXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGbrAC9f99f5tC55D93GQJmjDonfTXKqXwkfY70JVZZTBTAs5VdLprR41qQUCdvpA
 D7XGeEtkD3qZUsO2djiFrICqUpSl2aUV1O86uLdQT12Rk4J80pAlbImK79e/Ijd9mC
 3JctAdTEo0KCHnGeCJ4A4D/MaE6XhQzpLJD8unY1LlsIkf1vLK2b+5TpdxBvxZhZu7
 aIkTDKpqhQB7kamS5jAJzpmdWgRB7edjaMz1doIqSC3Eil+QPNvB1mO8rpE7UM319N
 eNOWLG7Uq41hqNeT7HXb6n7FxeevAG4gt3x+PJOWq1P/8dPMo8spRG41T634P31Y85
 9LL8URubfE1mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mGbrAC9f
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231211
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTAxLTA5IDE5OjMzICswMTAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+IFVwZGF0ZWQgV0hFTkNFIGhhc2ggZHVlIHRvIHZhcmlvdXMgY29tbWl0czoKPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9s
aW51eC1maXJtd2FyZS5naXQvbG9nL1dIRU5DRQoKSWYgdGhlIGZpbGUgY2hhbmdlZCwgdGhhdCBp
cyBiZWNhdXNlIHRoZXJlIHdlcmUgY2hhbmdlcyB1cHN0cmVhbSwgc28Kc3RhdGluZyB0aGVyZSBh
cmUgInZhcmlvdXMgY29tbWl0cyIgdGhhdCBjaGFuZ2VkIHRoZSBmaWxlIGlzIG5vdCB2ZXJ5Cmhl
bHBmdWwuCgpXaGF0IHRoZSBoYXNoZXMgZm9yIGxpY2Vuc2UgZmlsZXMgYXJlIGZvciwgaXMgdG8g
YmUgYWJsZSB0byBkZXRlY3QKY2hhbmdlcyBpbiBsaWNlbnNpbmcgdGVybXMsIGkuZS4gd2hldGhl
ciB3ZSBuZWVkIHRvIHVwZGF0ZSBvdXIgX0xJQ0VOU0UKZW50cmllcy4gU28gYW50eSBjaGFuZ2Ug
aW4gdGhlIGxpY2Vuc2UgZmlsZSBuZWVkcyB0byBiZSBhbmFseXNlZCBpbiB0aGF0CnJlZ2FyZC4K
CkZvciBsaW51eC1maXJtd2FyZSwgV0hFTkNFIGlzIGp1c3QgYSBodWdlIGxpc3Qgb2YgYWxsIGZp
bGVzIGFuZCB0aGVpcgphc3NvY2lhdGVkIGxpY2Vuc2UgZmlsZXM7IHRodXMgaXQgbW9zdGx5IGdy
b3dzIG5ldyBlbnRyaWVzci4gVGhlCmV4aXN0aW5nIGVudHJpZXMgbmV2ZXIgY2hhbmdlOyB3aGVu
IHRoZXkgZG8sIGl0J3MgbW9zdGx5IHR5cG9lcy4KClNvLCBhIGJldHRlciBwaHJhc2luZyB3b3Vs
ZCBoYXZlIGJlZW46CgogICAgVXBkYXRlZCBXSEVOQ0UgaGFzaCBkdWUgdG8gdmFyaW91cyBuZXcg
ZW50cmllcyBmb3IgbmV3IGJsb2JzLgoKKHdoaWNoIEkgZm9yZ290IHRvIGRvIHdoZW4gYXBwbHlp
bmcsIHNvIEkgZ3Vlc3MgSSBuZWVkIHRvIGdvIGFuZCBncmFiCmFub3RoZXIgY29mZmVlLiA7LSkg
KQoKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+CgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4g
IHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUuaGFzaCB8IDQgKystLQo+ICBw
YWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rICAgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLmhhc2ggYi9wYWNrYWdl
L2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLmhhc2gKPiBpbmRleCA2NzIyYWExNGM2Li40
YjE4ODAzMmJmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUu
aGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEZyb20gaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2Vy
bmVsLm9yZy9wdWIvbGludXgva2VybmVsL2Zpcm13YXJlL3NoYTI1NnN1bXMuYXNjCj4gLXNoYTI1
NiAgYzk4ZDIwMGZjNGEzMTIwZGUxYTU5NDcxM2NlMzRlMTM1ODE5ZGZmMjNlODgzYTRlZDM4Nzg2
M2JhMjU2NzljNyAgbGludXgtZmlybXdhcmUtMjAyMzEwMzAudGFyLnh6Cj4gK3NoYTI1NiAgOTZh
ZjdlNGI1ZWFiZDM3ODY5Y2RiM2RjYmI3YWIzNjkxMTEwNmQzOWI3NmU3OTlmYTFjYWFiMTZhOWRi
ZThiYiAgbGludXgtZmlybXdhcmUtMjAyMzEyMTEudGFyLnh6Cj4gIAo+ICAjIEhhc2ggZm9yIGxp
Y2Vuc2UgZmlsZXMKPiAgc2hhMjU2ICA4MTE2NDMzZjQwMDRmYzBjMjRkNzJiM2Q5ZTQ5NzgwOGI3
MjRhYTBlNWUxY2Q2M2ZjMWJmNjZiNzE1YjFlMmU5ICBMSUNFTkNFLkFiaWxpcwo+IEBAIC0zNiw2
ICszNiw2IEBAIHNoYTI1NiAgODU0MmFlYWJmMjc2MTkzNTEyMmQ2OTM1NjFlMTY3NjZjZTFiY2My
YjBkMDAzMjA0ZjkwNDBiN2Q2ZDkyOWYyZSAgTElDRU5TCj4gIHNoYTI1NiAgYmU5MDRjZDI4Y2Iy
OTJiODBjZGI2Y2Y0MTJhYjBkOTE1OWQ0MzE2NzFlOTg3YWQ0MzNjMWY2MmUwOTg4YTliYyAgTElD
RU5TRS5xY29tCj4gIHNoYTI1NiAgZmM2MjIzZDRiZmU5ZjJmOWUyZWRkYzQ0YjlmZTU3MjFkMGNh
ZjQ5ZjAxY2IwOGQ2MDI5MDZhZGQ2ODZkOGM2ZiAgTElDRU5TRS5yYWRlb24KPiAgc2hhMjU2ICAy
YmRkMmU3MTZmMDVkOTczN2QzZjlhMjBmOWEzYTNjMGNhZWUwZTg2NjEwMGRkYjA2NzNmMTE3OGU0
MmY5MmI5ICBMSUNFTlNFLnNkbWFfZmlybXdhcmUKPiAtc2hhMjU2ICA2OTcxMzQ4NTliNjYzYmMx
MTBkNTcyNzVhN2E3ODYyYmJhMjFjNDQyNTI2NmFhYzhjNjJiZWUxODIwMmFhYzIwICBXSEVOQ0UK
PiArc2hhMjU2ICBkZDYzZTY3ZDNkOWU1MWY4NGZlZDlhM2VmYTdhNDY1MzEwYjViNTA1ODk2OWVi
NzI5NWE1ODMzOTIyN2FlZTE0ICBXSEVOQ0UKPiAgc2hhMjU2ICBmYTQzZTFiOWExM2IzNDFhMDdh
ZGNhOWRiZTczZDBmOTA3MmQ3OTY2ZmRmZTgxMWMwMWYwZGQyODcyZDczMDlhICBxY29tL05PVElD
RS50eHQKPiAgc2hhMjU2ICBiZWY5YzgyOGU4NGYyMWU3ODM1YjRkZTdkYWY5NTRhMzI3ZTFmZjc3
Nzg3MWI1OGUxMTYwMzliNjg0YzBkNjA0ICBMSUNFTkNFLmUxMDAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBiL3BhY2thZ2UvbGludXgtZmly
bXdhcmUvbGludXgtZmlybXdhcmUubWsKPiBpbmRleCA5NjkwNWRkOTA5Li5mZmI0ZmMyZTdiIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiAr
KysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4gQEAgLTQsNyAr
NCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJTlVYX0ZJUk1X
QVJFX1ZFUlNJT04gPSAyMDIzMTAzMAo+ICtMSU5VWF9GSVJNV0FSRV9WRVJTSU9OID0gMjAyMzEy
MTEKPiAgTElOVVhfRklSTVdBUkVfU09VUkNFID0gbGludXgtZmlybXdhcmUtJChMSU5VWF9GSVJN
V0FSRV9WRVJTSU9OKS50YXIueHoKPiAgTElOVVhfRklSTVdBUkVfU0lURSA9ICQoQlIyX0tFUk5F
TF9NSVJST1IpL2xpbnV4L2tlcm5lbC9maXJtd2FyZQo+ICBMSU5VWF9GSVJNV0FSRV9JTlNUQUxM
X0lNQUdFUyA9IFlFUwo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
