Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC200C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E57820EB;
	Fri,  4 Jul 2025 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ca73grqrpwh8; Fri,  4 Jul 2025 13:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7D4820D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7D4820D1;
	Fri,  4 Jul 2025 13:08:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4675015F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE6F40823
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0nY9O23f0G7 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 13:08:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB52240832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB52240832
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB52240832
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 13:08:24 +0000 (UTC)
X-CSE-ConnectionGUID: wqbD50nfScmLyjj3FFooSg==
X-CSE-MsgGUID: uc+B5CnDT86bLAOfB9/s4A==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 15:08:22 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2025 15:08:21 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Fri, 4 Jul 2025 15:08:19 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 04 Jul 2025 15:08:18 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: NEc7q16kSGmjGM4zlcz09g==
X-CSE-MsgGUID: oUY15yIsQfaz2TJc5CcwEA==
X-IronPort-AV: E=Sophos;i="6.16,287,1744063200"; d="scan'208";a="308013305"
Date: Fri, 4 Jul 2025 15:08:18 +0200
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
CC: <buildroot@buildroot.org>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <aGfSQkZlgBE5iKtR@yd-6wlzhs3>
References: <20250613162524.105976-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613162524.105976-1-flavio.tapajos@newtesc.com.br>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1751634505; x=1783170505;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=LxHu80WlqRo8BDVqHGhFny9vWc7GtD6x8COD/ER2Dfo=;
 b=sj1f8cvTVELvZeBhOIaRWsd4mJZeJGQWr2uKaM5KgGJpGnbZ5TXHFDoQ
 str49R4jD22+K677U0QSHIoXcQnKjdzlap+DOddca3ZgVY9jMIRZeH939
 tGgFnnJOspuPN2LnDcCW475ydgn8/jg11q8Stg4ODZOTzQeepD1Y/NStG
 zBaQ11jLtdmQGkHZUup0pK9euv1twMzNAL1VkOKkF9POEHGOiYGe/vHmu
 HIfMXlpF6u/CF0dpjVVW/FoYJYTv6al1plXz6Ct4gahju4HFvYC+hjqBz
 +u/HQEiJqm5P84A/VkD62YaPKtyY4e6FOrbjZfUbsqm+Sxroyafmczmux
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=sj1f8cvT
Subject: Re: [Buildroot] [PATCH v3 1/1] package/nanomq: new package
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

RmzDoXZpbywgQWxsLAoKT24gMjAyNS0wNi0xMyAxMzoyNSAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gTmFub01RIE1RVFQgQnJva2VyIChOYW5vTVEpIGlzIGFuIGFsbC1h
cm91bmQgRWRnZSBNZXNzYWdpbmcKPiBQbGF0Zm9ybSB0aGF0IGluY2x1ZGVzIGEgYmxhemluZy1m
YXN0IE1RVFQgQnJva2VyIGZvcgo+IHRoZSBJb1QvSUlvVCBhbmQgYSBsaWdodHdlaWdodCBNZXNz
YWdpbmcgQnVzIGZvciBTRFYuClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uYW5v
bXEvQ29uZmlnLmluIGIvcGFja2FnZS9uYW5vbXEvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45MzNkZWE3ZGEwCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvbmFub21xL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMjUgQEAKPiArY29uZmln
IEJSMl9QQUNLQUdFX05BTk9NUQo+ICsJYm9vbCAibmFub21xIgoKVGhlcmUgYXJlIGlzbnRhbmNl
cyBvZiBmb3JrKCkgaW4gdGhlIGNvZGUsIHNvIG1heWJlIGl0IHNob3VsZCBhbHNvCmRlcGVuZCBv
biBNTVU/Cgo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUKCllv
dSBuZWVkIHRvIGFkZCBhIGNvbW1lbnQgYWJvdXQgdGhlIG1pc3NpbmcgZGVwZW5kZW5jaWVzOgoK
ICAgIGNvbW1lbnQgIm5hbm9tcSBuZWVkcyBhIHRvbGNoYWluIHcvIGdjYyA+PSA0LjUiCiAgICAg
ICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogICAgICAgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hB
SU5fR0NDX0FUX0xFQVNUXzRfNQoKPiArCWhlbHAKPiArCSAgQW4gVWx0cmEtbGlnaHR3ZWlnaHQg
YW5kIEJsYXppbmctZmFzdCBNUVRUIEJyb2tlciBmb3IgSW9UIEVkZ2UKPiArCj4gKwkgIGh0dHBz
Oi8vbmFub21xLmlvLwo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX05BTk9NUV9OQU5PX0NMSQo+
ICsJYm9vbCAibmFub21xX2NsaSIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTkFOT01RCgpX
ZSB1c3VhbGx5IGF2b2lkIHBlci1vcHRpb24gZGVwZW5kZW5jeSwgYnV0IGp1c3QgZW5jbG9zZSBh
bGwgaW4gYSBiaWcKaWYtY2xhdXNlLCB3aXRoIHRoZSBtaXNzaW5nIGRlcGVuZGVuY2llcyBjb21t
ZW50IGJlbG93OgoKICAgIGlmIEJSMl9QQUNLQUdFX05BTk9NUQoKICAgIGNvbmZpZyBCUjJfUEFD
S0FHRV9OQU5PTVFfTkFOT19DTEkKICAgICAgICBibGFibGEKCiAgICBjb25maWcgQlIyX1BBQ0tB
R0VfTkFOT01RX1NRTElURQogICAgICAgIGJsYWJsYQoKICAgIC4uLgoKICAgIGVuZGlmICMgQlIy
X1BBQ0tBR0VfTkFOT01RCgogICAgY29tbWVudCAibmFub21xIG5lZWRzIGEgdG9vbGNoYWluIHcv
IGdjYyA+PSA0LjUiCiAgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogICAgICAgIGRlcGVu
ZHMgb24gIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfNQoKQWxzbywgdGhlIGNsaWVudCBj
YWxscyBwdGhyZWFkIGZ1bmN0aW9ucywgc28gaXQgc2hvdWxkIHByb2JhYmx5IGRlcGVuZApvbiB0
aGF0OgoKICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9OQU5PTVFfTkFOT19DTEkKICAgICAgICBib29s
ICJuYW5vbXFfY2xpIgogICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFE
UwoKICAgIGNvbW1lbnQgIm5hbm9ubXFfY2xpIG5lZWRzIGEgdG9vbGNoYWluIHcvIHRoZWFkcyIK
ICAgICAgICBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCgpbLS1TTklQLS1d
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmFub21xL25hbm9tcS5tayBiL3BhY2thZ2UvbmFub21x
L25hbm9tcS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYTlh
OWEzNjllOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL25hbm9tcS9uYW5vbXEubWsK
PiBAQCAtMCwwICsxLDYxIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBu
YW5vbXEKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArTkFOT01RX1ZFUlNJ
T04gPSAwLjIzLjgKPiArIyB0YXIgZmlsZSBpcyBwcm92aWRlZCwgYnV0IGl0IGxhY2tzIHN1Ym1v
ZHVsZXMKPiArTkFOT01RX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbmFub21xL25hbm9tcS5n
aXQKPiArTkFOT01RX1NJVEVfTUVUSE9EID0gZ2l0Cj4gK05BTk9NUV9HSVRfU1VCTU9EVUxFUyA9
IFlFUwo+ICtOQU5PTVFfQ01BS0VfQkFLRU5EID0gbmluamEKPiArTkFOT01RX0xJQ0VOU0UgPSBN
SVQKPiArTkFOT01RX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAo+ICsKPiArIyBJZiBlaXRo
ZXIgQlVJTERfU0hBUkVEX0xJQlMgb3IgQlVJTERfU1RBVElDX0xJQiBpcyBzZXQsIG9ubHkgYQo+
ICsjIGxpYnJhcnkgaXMgYnVpbHQsIGFuZCBubyBleGVjdXRhYmxlIGlzLgo+ICtOQU5PTVFfQ09O
Rl9PUFRTICs9IC1EQlVJTERfU0hBUkVEX0xJQlM9T0ZGIC1EQlVJTERfU1RBVElDX0xJQj1PRkYK
PiArCj4gK2RlZmluZSBOQU5PTVFfSU5TVEFMTF9DT05GX0ZJTEUKPiArCSQoSU5TVEFMTCkgLUQg
LW0gMDY0NCAkKEBEKS9ldGMvbmFub21xLmNvbmYgXAo+ICsJCSQoVEFSR0VUX0RJUikvZXRjCj4g
K2VuZGVmCj4gKwo+ICtOQU5PTVFfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09LUyArPSBOQU5PTVFf
SU5TVEFMTF9DT05GX0ZJTEUKPiArCj4gK2RlZmluZSBOQU5PTVFfSU5TVEFMTF9JTklUX1NZU1YK
PiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSBwYWNrYWdlL25hbm9tcS9TNTBuYW5vbXEgXAo+ICsJ
CSQoVEFSR0VUX0RJUikvZXRjL2luaXQuZC9TNTBuYW5vbXEKPiArZW5kZWYKPiArCj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTkFOT01RX05BTk9fQ0xJKSx5KQo+ICsgIE5BTk9NUV9DT05GX09QVFMg
Kz0gLURCVUlMRF9DTElFTlQ9T04KCkRvIG5vdCBpbmRlbnQgaW4gaWYtYmxvY3M6CgogICAgaWZl
cSAoJChCUjJfUEFDS0FHRV9OQU5PTVFfTkFOT19DTEkpLHkpCiAgICBOQU5PTVFfQ09ORl9PUFRT
ICs9IC1EQlVJTERfQ0xJRU5UPU9OCiAgICBlbHNlCiAgICBibGFibGEKICAgIGVuZGlmCgo+ICtl
bHNlCj4gKyAgIyBOTkcgcHJveHkgYmx1aWRzIGNsaQoKWW91IGRpZCBub3QgYWRkcmVzcyB0aGUg
cXVlc3Rpb24gaW4gbXkgcHJldmlvdXMgcmV2aWV3OgoKU29ycnksIEknbSBub3Qgc3VyZSBJIHVu
ZGVyc3Rvb2QgdGhpcyBjb21tZW50LiBEaWQgeW91IG1lYW4gdGhhdCwgd2l0aApCVUlMRF9DTElF
TlQ9T0ZGLCB0aGVuIE5ORyAoZnJvbSB0aGUgTk5HIHN1Yi1tb2R1bGUpIHdvdWxkIGJ1aWxkIGl0
cyBvd24KY2xpZW50LCB1bmxlc3MgdG9sZCBvdGhlcndpc2U/Cgo+ICsgIE5BTk9NUV9DT05GX09Q
VFMgKz0gLURCVUlMRF9DTElFTlQ9T0ZGIC1EQlVJTERfTk5HX1BST1hZPU9GRgo+ICtlbmRpZgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyApICAgfCAvIlwgQVNDSUkgUklCQk9OIHwK
fCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCAgXy8gLSAvJyAgIHwgXCAv
IENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEuMjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0tLTog
KF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAgfAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2Uu
Y29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAvIFwgSFRNTCBNQUlMICAgIHwKJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tOl9fX19fXy9fX19fXzotLS0tLS0tLS0tLS0t
LS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVz
IGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZl
bnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRv
cmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxs
ZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVyIGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBs
ZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdlcyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2Nl
cHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0
ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2ku
DQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVu
dGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBs
YXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJpYnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhv
dXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQg
aXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1heSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90
IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZlIGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3Ig
ZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
