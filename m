Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29947CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6184681110;
	Wed, 13 May 2026 19:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0q80XhoIa2aT; Wed, 13 May 2026 19:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B84481102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778700080;
	bh=x1ApgNdNcQyhcTHriM03OXvrxsuQwIs0n1A/JXFiFI8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MF7rSgCtZvUZwz3n8clTwwfRdtvk4STEoH0edDlITmMNwNxjflEjNJtElG2y+7DM/
	 qYXbq2DVLMwzGhQ+Ok6ngsU1cveXmi675WIDo9gb4zHb98tn9/yeDxnkazSZzN+vJ0
	 tloZpEJAAdMSl2qkKJjO23ZTkx/t4K0fhDTYlZEsEVFtNc4MJb9jr5CcnA+XaC7+5O
	 5hHLnRa8hhvZsA/mqdTCatQk4tjibgmCbygUNMx+BBlBN4msE0CVAgkfvww9e4bUR/
	 Pz5QNteoKK4YCrf3tiP7UvY3uy4NfZY9xnxTS6tlTsMmudpFyNDrUbCnvPDP0Rs+qG
	 T8A0Hyp+khw5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B84481102;
	Wed, 13 May 2026 19:21:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 358E4270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2562440921
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGEnjHp28kKg for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93DD84091C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93DD84091C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93DD84091C
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:21:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B8F6E13F8A7;
 Wed, 13 May 2026 21:21:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 May 2026 21:21:13 +0200
MIME-Version: 1.0
Date: Wed, 13 May 2026 21:21:13 +0200
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260513114918.3927249-1-lazzer@gmail.com>
References: <20260513114918.3927249-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <33ad63347f900e5526dedd0bcc64c511@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778700076;
 bh=HhOv9mpctd3vOyTAtvefiMOCJ43KErgKufBeDdtswIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LgnL9URA4bzEj5emaGLayoNpLOc5S+FcoDoTRbF/YmpXNCzJuGP9QPrkJpJmd2ZN1
 ippEXs9hkVabBhwbHrXhqjuTzVxo2eIf/fM3sa6JFDpQKL/WHOIW2mnHWbSkxibvbF
 ygkZ4N0xAdOKBIpJ+OYK1Cf+w8jqe81cUL7i/Tf68IftksTBIkbwLpZOIEOOu1PZ7G
 +zgRuPxBCuh/M4PESMJg5wuCZ+Ac7NFfbQnDI8KDVDeWDlh+cC4HcmJg8Pksi8dRFu
 I+eF2/KMjTaByQNMdx5Pyqn/Gz57PmUgsqDm7m/lQrMAv5t0ZP6uIx2Kso+KANnAsE
 RRwfPnCidUOfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LgnL9URA
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: Add MediaTek
 MT7916 WiFi 6E firmware files
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWF0dGlhcywKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKT24gMTMvMDUvMjAyNiAxMzo0OSwg
TWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLD
tm0gPGxhenplckBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29u
ZmlnLmluICAgICAgICAgfCA1ICsrKysrCj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmUubWsgfCA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4g
Cj4gYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgo+IGluZGV4IDU4YmE2MGU5YzMu
LmQ5MWQ5MGU1NjIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgo+IEBAIC00NzYsNiAr
NDc2LDExIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc2
WDJFCj4gIAloZWxwCj4gIAkgIE1lZGlhVGVrIE1UNzZ4MmUKPiAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVLX01UNzkxNgo+ICsJYm9vbCAiTWVkaWFUZWsgTVQ3
OTE2Igo+ICsJaGVscAo+ICsJICBNZWRpYVRlayBNVDc5MTYKPiArCj4gIGNvbmZpZyBCUjJfUEFD
S0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjEKPiAgCWJvb2wgIk1lZGlhVGVrIE1U
NzkyMSIKPiAgCWhlbHAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS5tayAKPiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUu
bWsKPiBpbmRleCA4MTg3ZDFmZWFmLi4wZWQ5NDI2MGZmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
bGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiArKysgYi9wYWNrYWdlL2xpbnV4LWZp
cm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4gQEAgLTM5OCw2ICszOTgsMTUgQEAgTElOVVhfRklS
TVdBUkVfRklMRVMgKz0gbWVkaWF0ZWsvbXQ3NjYyLmJpbiAKPiBtZWRpYXRlay9tdDc2NjJfcm9t
X3BhdGNoLmJpbgo+ICBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSAKPiBMSUNF
TkNFLnJhbGlua19hX21lZGlhdGVrX2NvbXBhbnlfZmlybXdhcmUKPiAgZW5kaWYKPiAKPiArIyBN
VDc5MTYKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5
MTYpLHkpCj4gK0xJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IG1lZGlhdGVrL210NzkxNl9lZXByb20u
YmluIFwKPiArCQkJbWVkaWF0ZWsvbXQ3OTE2X3JvbV9wYXRjaC5iaW4gXAo+ICsJCQltZWRpYXRl
ay9tdDc5MTZfd2EuYmluIFwKPiArCQkJbWVkaWF0ZWsvbXQ3OTE2X3dtLmJpbgo+ICtMSU5VWF9G
SVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSAKPiBMSUNFTkNFLnJhbGlua19hX21lZGlhdGVr
X2NvbXBhbnlfZmlybXdhcmUKCkFjY29yZGluZyB0byB0aGUgV0hFTkNFIGZpbGU6Cmh0dHBzOi8v
Z2l0bGFiLmNvbS9rZXJuZWwtZmlybXdhcmUvbGludXgtZmlybXdhcmUvLS9ibG9iLzIwMjYwNDEw
L1dIRU5DRT9yZWZfdHlwZT10YWdzI0w2MjU3Cgp0aGUgTVQ3OTE2IGZpbGVzIHNlZW1zIHRvIGJl
IGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZjoKTElDRU5DRS5tZWRpYXRlawoKQ291bGQg
eW91IGNvbmZpcm0gYW5kIHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uIGlmIGl0J3MgdGhlCmNhc2Ug
cGxlYXNlPwoKPiArZW5kaWYKPiArCj4gICMgTVQ3OTIxCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
TElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIxKSx5KQo+ICBMSU5VWF9GSVJNV0FSRV9GSUxF
UyArPSBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4gXAo+IC0tCj4g
Mi40My4wCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
