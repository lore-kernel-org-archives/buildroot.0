Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E918CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2B841BC9;
	Mon,  8 Sep 2025 11:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMOJfrH4d4bi; Mon,  8 Sep 2025 11:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4B242237
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4B242237;
	Mon,  8 Sep 2025 11:05:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42C30CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B5E61BF1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUmo61ITAjYC for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C431761560
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C431761560
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp3.osuosl.org (Postfix) with ESMTP id C431761560
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:04:59 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Mon, 8 Sep 2025 18:49:36 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 8 Sep 2025 18:49:36 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <8fc454eb865be4d2a7e1c06d59c9c341@free.fr>
References: <20250901083109.284281-1-andyshrk@163.com>
 <8fc454eb865be4d2a7e1c06d59c9c341@free.fr>
X-NTES-SC: AL_Qu2eBf+Zt00s4CiaZukfmUgWjuw/WsG1v/Ul1YBSP556jD/p4wsicF5iFlj0+e+SMSGcugm5TQVs1v5WWqJCf7gAUDlXnwDhyUW9I5M5ApwQSQ==
MIME-Version: 1.0
Message-ID: <49241621.a70a.19928f21145.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgD3p5rAtL5oSdQrAA--.4852W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwDCXmi+rNPrvgABsS
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=WjWp78aGTOKX9iRjXmGUIuiEnXMJ5uXFQOHTtiQCsXE=; b=h
 D+RUR+ekLT8Cxz+MNJkGxvyp8lqRxU14WAh6aApcK1VV2ErGUpVvtP3aPDoa90hh
 t6a18/UhU5E1TwRPvrIj3n6Y78uaKVy3U+E8STNPjSpY2VTNl7NQsZClbFh2dIhQ
 jOed89ZLFd8MEJAKlanAo/okk819NCBOj/YdWwKUj8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=hD+RUR+e
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add option to
 install cadence MHDP8546 DPI/DP bridge firmware
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkhlbGxvIEp1bGllbu+8jAoKQXQgMjAyNS0wOS0wNiAwNDozMDo1NywgIkp1bGllbiBPbGl2YWlu
IHZpYSBidWlsZHJvb3QiIDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj5IaSBBbmR5
LAo+Cj5UaGFua3MgZm9yIHRoZSBwYXRjaC4gIEkgaGF2ZSBvbmUgY29tbWVudC4gIFNlZSBiZWxv
dy4KPgo+T24gMDEvMDkvMjAyNSAxMDozMSwgQW5keSBZYW4gd3JvdGU6Cj4+IENhZGVuY2UgTUhE
UDg1NDYgRFBUWCBJUCB1c2VkIGluIFRJIEo3MjFFIFNvQyBuZWVkcyB0aGUgZmlybXdhcmUgdG8K
Pj4gd29yay4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29t
Pgo+PiAtLS0KPj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgfCA1
ICsrKysrCj4+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIHwgNSAr
KysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4gCj4+IGIvcGFja2FnZS9saW51
eC1maXJtd2FyZS9Db25maWcuaW4KPj4gaW5kZXggNzc4ZGZlZjhhMC4uMjFkZmY5NzY4ZSAxMDA2
NDQKPj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPj4gKysrIGIvcGFj
a2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPj4gQEAgLTIwNSw2ICsyMDUsMTEgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0JSQ01fQkNNNDM2NkMwCj4+ICAJaGVscAo+
PiAgCSAgRmlybXdhcmUgZmlsZSBmb3IgdGhlIEJyb2FkY29tIDQzNjZjMCBGdWxsTUFDIGNoaXAu
Cj4+IAo+PiArY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0NETlNfTUhEUDg1NDYK
Pj4gKwlib29sICJDYWRlbmNlIE1IRFA4NTQ2Igo+PiArCWhlbHAKPj4gKwkgIEZpcm13YXJlIGZp
bGUgZm9yIHRoZSBDYWRlbmNlIE1IRFA4NTQ2IERQSS9EUCBicmlkZ2UKPj4gKwo+PiAgY29uZmln
IEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0NZUFJFU1NfQ1lXNDNYWAo+PiAgCWJvb2wgIkN5
cHJlc3MgQ1kgY3l3NDN4eCIKPj4gIAloZWxwCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4
LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIAo+PiBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUv
bGludXgtZmlybXdhcmUubWsKPj4gaW5kZXggNDA3NTgwNTRlNS4uODY5ZTJkNjY4ZiAxMDA2NDQK
Pj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+PiArKysg
Yi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4+IEBAIC05MTMsNiAr
OTEzLDExIEBAIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IHRpXzM0MTAuZncgdGlfNTA1Mi5mdyBc
Cj4+ICBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLm1veGEKPj4g
IGVuZGlmCj4+IAo+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9DRE5TX01I
RFA4NTQ2KSx5KQo+PiArTElOVVhfRklSTVdBUkVfRklMRVMgKz0gY2FkZW5jZS9taGRwODU0Ni5i
aW4KPj4gK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UuY2FkZW5j
ZQo+Cj5BZGRpbmcgYSBuZXcgbGljZW5jZSBmaWxlIGhlcmUgYWxzbyByZXF1aXJlcyB0byBhZGQg
dGhlIG5ldwo+ZmlsZSBoYXNoIGluICJwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlLmhhc2giLgo+Cj5SdW5uaW5nIHRoZSBjb21tYW5kICJtYWtlIGxpbnV4LWZpcm13YXJlLWxl
Z2FsLWluZm8iCj53aXRoIHRoaXMgZmlybXdhcmUgc2VsZWN0ZWQgc2hvdyB0aGUgbWVzc2FnZToK
Pgo+ICAgICBFUlJPUjogTm8gaGFzaCBmb3VuZCBmb3IgTElDRU5DRS5jYWRlbmNlCj4KPj4gK2Vu
ZGlmCj4+ICsKPj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQ1gyMzFYWCks
eSkKPj4gIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IHY0bC1jeDIzMXh4LWF2Y29yZS0wMS5mdwo+
PiAgIyBObyBsaWNlbnNlIGZpbGU7IHRoZSBsaWNlbnNlIGlzIGluIHRoZSBmaWxlIFdIRU5DRQo+
PiAtLQo+PiAyLjQzLjAKPgo+Q291bGQgeW91IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBhZGRpbmcg
dGhlIGxpY2Vuc2UgaGFzaCwgcGxlYXNlPwoKWWVz77yMIGRvbmUgaW4gVjLjgIIKVGhhbmtz44CC
Cgo+Cj5CZXN0IHJlZ2FyZHMsCj4KPkp1bGllbi4KPl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj5idWlsZHJvb3QgbWFpbGluZyBsaXN0Cj5idWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
