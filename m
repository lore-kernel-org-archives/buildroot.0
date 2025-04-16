Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC7CC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010406065D;
	Wed, 16 Apr 2025 21:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oumby63SCdrQ; Wed, 16 Apr 2025 21:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A68D607AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A68D607AB;
	Wed, 16 Apr 2025 21:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B056159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7092E6065D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcCs9Qgm4uNX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D0DF607AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0DF607AB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D0DF607AB
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 727951C0083; Wed, 16 Apr 2025 23:12:08 +0200 (CEST)
Message-ID: <9ed0bb29-0f3f-44df-85bf-94d428a99be2@rnout.be>
Date: Wed, 16 Apr 2025 23:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
References: <20250314210313.775885-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20250314210313.775885-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8ZJOxSu/W4pnQFM182cKd7gtpDmJ6yGsjZtBSKf8fQs=;
 b=Ju2DrFprlT5w+aUM23XZIEh5wfEcqXvszd/ZrakXm6/3MdWYUkdK3SE1fgPaWMghsOcnD1
 q306HNinzN4m4pmRVIY1GyoI8+ZJpLA/n7PvaZoxo7/AnZfn+MHi9luG0n2h4H+pLFYyeJ
 fHT35jCtChLxzWzavd4Zuxa5mHx9HXZUI0fN956ixIzHi48i0x+zeJJqgkz23z3rUApdV3
 umX/5HMrBswY35aoJAXQjFAX8+I2pNArAkz4t+fSaBPJWxkHWYAb+gXLnKaMJLaRmCkTpI
 wrCPCluse3fRbPe/klVFIGzYoPuiIl3/ihzwWMRlSyg1k/IH3ImUMjdMmqVogQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/2] package/tesseract-ocr: needs gcc >= 8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE0LzAzLzIwMjUgMjI6MDMsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IFNpbmNlIEJ1aWxk
cm9vdCBjb21taXQgWzFdIHRlc3NlcmFjdC1vY3IgZmFpbHMgdG8gYnVpbGQgd2l0aCBnY2MgNywK
PiB3aXRoIGVycm9yOgo+Cj4gICAgICBzcmMvYXBpL2Jhc2VhcGkuY3BwOjY3OjEwOiBmYXRhbCBl
cnJvcjogZmlsZXN5c3RlbTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgICAgICNpbmNs
dWRlIDxmaWxlc3lzdGVtPiAvLyBmb3Igc3RkOjpmaWxlc3lzdGVtCj4gICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+Cj4KPiBJbiBCdWlsZHJvb3QsIHRlc3NlcmFjdC1vY3IgaGFzIGEgQysrMTcg
cmVxdWlyZW1lbnQgY2FwdHVyZWQgYXMKPiBnY2MgPj0gNy4gR2NjIDcgaGFzIG9ubHkgYSBwYXJ0
aWFsIGFuZCBleHBlcmltZW50YWwgQysrMTcgc3VwcG9ydCwKPiB3aGljaCB3YXMgc3VmZmljaWVu
dCwgcHJpb3IgWzFdLgo+Cj4gVGhlIHRlc3NlcmFjdC1vY3IgdXBzdHJlYW0gY29tbWl0IFsyXSBp
bnRyb2R1Y2VkIGEgdXNhZ2Ugb2YKPiBzdGQ6OmZpbGVzeXN0ZW0uIFRoaXMgY29tbWl0IGlzIGlu
Y2x1ZGVkIGluIHZlcnNpb24gNS41LjAsCj4gYnVtcGVkIGluIFsxXS4KPgo+IFRoZSBDKysxNyB3
aXRoIHN0ZDo6ZmlsZXN5c3RlbSBzdXBwb3J0IHdhcyBpbnRyb2R1Y2VkIGluIGdjYyA4LjEuCj4g
U2VlIFszXS4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSByYWlzaW5nIHRoZSBn
Y2MgdmVyc2lvbiByZXF1aXJlbWVudCB0bwo+IDgueC4KPgo+IFsxXSBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZjMyZGE4Yjk4NDRhZTVmMWI5ZGM2
YjdhODlkN2Q5YmQ5ZDE5NGY1NQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vdGVzc2VyYWN0LW9j
ci90ZXNzZXJhY3QvY29tbWl0LzRlNDJmOWRlNTQxZjIxYWNiMDEwODg2OTI1YWZlNDIwOTRhMTVk
ZmUKPiBbM10gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtOC9jaGFuZ2VzLmh0bWwjbGlic3RkY3h4
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKIMKgQXBw
bGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0K
PiAgIHBhY2thZ2UvdGVzc2VyYWN0LW9jci9Db25maWcuaW4gfCA2ICsrKy0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3Rlc3NlcmFjdC1vY3IvQ29uZmlnLmluIGIvcGFja2FnZS90ZXNzZXJhY3Qtb2Ny
L0NvbmZpZy5pbgo+IGluZGV4IDRkOWI3ODczM2UuLjc5YTI3NzgwYjIgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS90ZXNzZXJhY3Qtb2NyL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvdGVzc2VyYWN0
LW9jci9Db25maWcuaW4KPiBAQCAtMSwxMyArMSwxMyBAQAo+IC1jb21tZW50ICJ0ZXNzZXJhY3Qt
b2NyIG5lZWRzIGEgdG9vbGNoYWluIHcvIHRocmVhZHMsIEMrKywgZ2NjID49IDcsIGR5bmFtaWMg
bGlicmFyeSwgd2NoYXIiCj4gK2NvbW1lbnQgInRlc3NlcmFjdC1vY3IgbmVlZHMgYSB0b29sY2hh
aW4gdy8gdGhyZWFkcywgQysrLCBnY2MgPj0gOCwgZHluYW1pYyBsaWJyYXJ5LCB3Y2hhciIKPiAg
IAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCj4gICAJZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElC
U1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IFwKPiAtCQkhQlIyX1RPT0xD
SEFJTl9HQ0NfQVRfTEVBU1RfNyB8fCBCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9VU0VfV0NIQVIK
PiArCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCB8fCBCUjJfU1RBVElDX0xJQlMgfHwg
IUJSMl9VU0VfV0NIQVIKPiAgIAo+ICAgbWVudWNvbmZpZyBCUjJfUEFDS0FHRV9URVNTRVJBQ1Rf
T0NSCj4gICAJYm9vbCAidGVzc2VyYWN0LW9jciIKPiAgIAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxM
X0xJQlNURENQUAo+ICAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwo+IC0J
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83ICMgQysrMTcKPiArCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCAjIEMrKzE3IGZpbGVzeXN0ZW0KPiAg
IAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yaygpCj4gICAJZGVwZW5kcyBvbiAhQlIyX1NU
QVRJQ19MSUJTCj4gICAJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
