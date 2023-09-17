Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C9CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 08:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C2C60B2C;
	Sun, 17 Sep 2023 08:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C2C60B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gazm_Hog_Fw5; Sun, 17 Sep 2023 08:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897B56102D;
	Sun, 17 Sep 2023 08:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897B56102D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 815DE1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AB358128D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AB358128D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrBu_fZcfJir for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 08:35:17 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42FC381260
 for <buildroot@busybox.net>; Sun, 17 Sep 2023 08:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42FC381260
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3E5E5B0059B;
 Sun, 17 Sep 2023 10:35:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 10:35:13 +0200
Date: Sun, 17 Sep 2023 10:35:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230917083513.GM415981@scaer>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
 <20230917081856.GI415981@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917081856.GI415981@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694939715;
 bh=0ubcb42UYLECKPvfoKrbpe/vxcDtvwosSsuKJ5+/UV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hnLru+TAGf+cCCzg7naQR34zvjjBrJK6Y5Iywa5pczjxst6pduwg0XrLSYioua0SL
 Ai6D9oMLovli8Nv/4BykkwfTUeNABD/4eGTckU8gjMEW6yprsBFOjJae5dfS6GJYEm
 wVEVCMNF48lvu3Q6GoJcxeTjaClw+oLF+hauX6b+FmTG49LPuAhXSDhn5+MHYYJtkT
 znMBOmKFq8U8zLkUEaCboWg0gGNc0lJa8Z/vISmhmqHlZzhMHgxgh6uhCHghGEA/aL
 5MHeN6l0D6qjJIVln2scoQkWQ7TByWH110UIfReuvkSVV6F3fiSvQA3OymZtitnNId
 CxFANFsZ++8yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hnLru+TA
Subject: Re: [Buildroot] [PATCH 01/16] package/perl-class-method-modifiers:
 bump to version 2.15
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA5LTE3IDEwOjE4ICswMjAwLCBZYW5uIEUuIE1PUklO
IHNwYWtlIHRodXNseToKPiBPbiAyMDIzLTA5LTE2IDE3OjQzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+ID4gTElDRU5TRTogcmVtb3ZlIHRyYWlsaW5nIHNwYWNlcwo+ID4g
c2VlIGh0dHBzOi8vbWV0YWNwYW4ub3JnL3JlbGVhc2UvRVRIRVIvQ2xhc3MtTWV0aG9kLU1vZGlm
aWVycy0yLjEzL2RpZmYvRVRIRVIvQ2xhc3MtTWV0aG9kLU1vZGlmaWVycy0yLjE1I0xJQ0VOU0UK
PiBTbyBJIGZpeGVkIHRob3NlIHR3byB3aGVuIGFwcGx5aW5nLgo+IEFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpGVFI6IEkgZGlkIG5vdCBhcHBseSB0aGlzIHBhdGNoLCBkdWUgdG8gbW9yZSBp
c3N1ZXMgaW4gdGhlIHJlc3Qgb2YgdGhlCnNlcmllcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
Cgo+ID4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fk
ei5vcmc+Cj4gPiAtLS0KPiA+ICAuLi4vcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLmhhc2gg
ICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCj4gPiAgLi4uL3BlcmwtY2xhc3MtbWV0
aG9kLW1vZGlmaWVycy5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1t
ZXRob2QtbW9kaWZpZXJzLmhhc2ggYi9wYWNrYWdlL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlmaWVy
cy9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMuaGFzaAo+ID4gaW5kZXggZWUwZjVlYzMyLi5l
M2U4ODE0MGIgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlm
aWVycy9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9w
ZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLmhh
c2gKPiA+IEBAIC0xLDYgKzEsNiBAQAo+ID4gLSMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20g
aHR0cDovL2NwYW4ubWV0YWNwYW4ub3JnLwo+ID4gLW1kNSAgYjEzOThlMzY4MmFhMmUwNzViOTEz
YjlmOTAwMGI1OTYgIENsYXNzLU1ldGhvZC1Nb2RpZmllcnMtMi4xMy50YXIuZ3oKPiA+IC1zaGEy
NTYgIGFiNTgwN2Y3MTAxOGE4NDJkZTZiN2E0ODI2ZDZjMWYyNGI4ZDViMDlmY2NlNTAwNWEzMzA5
Y2Y2ZWE0MGZkNjMgIENsYXNzLU1ldGhvZC1Nb2RpZmllcnMtMi4xMy50YXIuZ3oKPiA+ICsjIHJl
dHJpZXZlZCBieSBzY2FuY3BhbiBmcm9tIGh0dHBzOi8vY3Bhbi5tZXRhY3Bhbi5vcmcvCj4gPiAr
bWQ1ICAxYWVhODlkMGYyM2MzNTM3NTgwY2FlNTQ5YjVjNTg2NCAgQ2xhc3MtTWV0aG9kLU1vZGlm
aWVycy0yLjE1LnRhci5nego+ID4gK3NoYTI1NiAgNjVjZDg1YmZlNDc1ZDA2NmU5MTg2ZjdhOGNj
NjM2MDcwOTg1YjMwYjBlYmIxY2RlODY4MWNmMDYyYzJlMTVmYyAgQ2xhc3MtTWV0aG9kLU1vZGlm
aWVycy0yLjE1LnRhci5nego+ID4gIAo+ID4gICMgY29tcHV0ZWQgYnkgc2NhbmNwYW4KPiA+IC1z
aGEyNTYgIGQxN2U1Y2JhOGQ0MDM5ZjY5NzNkNTg3M2Y3M2IwYzg5NDljMWNmZmIzMzhmYWZlN2E1
N2U5NzI3Njc1NDY1NjEgIExJQ0VOU0UKPiA+ICtzaGEyNTYgIDNhNGQxNWQ3OGRhYTdmYmI4Yjlm
OTBkYTFiOGNiNjBhNmNkNTI3NWM2YTVmZGIwZmNhNWRiMmU3NGI1MjJkZWUgIExJQ0VOU0UKPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlmaWVycy9wZXJsLWNs
YXNzLW1ldGhvZC1tb2RpZmllcnMubWsgYi9wYWNrYWdlL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlm
aWVycy9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMubWsKPiA+IGluZGV4IGVmNjg4YWNmNy4u
ZDRhN2YxMWI4IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9wZXJsLWNsYXNzLW1ldGhvZC1tb2Rp
ZmllcnMvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLm1rCj4gPiArKysgYi9wYWNrYWdlL3Bl
cmwtY2xhc3MtbWV0aG9kLW1vZGlmaWVycy9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMubWsK
PiA+IEBAIC00LDcgKzQsNyBAQAo+ID4gICMKPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ID4gIAo+ID4gLVBFUkxfQ0xBU1NfTUVUSE9EX01PRElGSUVSU19WRVJTSU9OID0gMi4xMwo+ID4g
K1BFUkxfQ0xBU1NfTUVUSE9EX01PRElGSUVSU19WRVJTSU9OID0gMi4xNQo+ID4gIFBFUkxfQ0xB
U1NfTUVUSE9EX01PRElGSUVSU19TT1VSQ0UgPSBDbGFzcy1NZXRob2QtTW9kaWZpZXJzLSQoUEVS
TF9DTEFTU19NRVRIT0RfTU9ESUZJRVJTX1ZFUlNJT04pLnRhci5nego+ID4gIFBFUkxfQ0xBU1Nf
TUVUSE9EX01PRElGSUVSU19TSVRFID0gJChCUjJfQ1BBTl9NSVJST1IpL2F1dGhvcnMvaWQvRS9F
VC9FVEhFUgo+ID4gIFBFUkxfQ0xBU1NfTUVUSE9EX01PRElGSUVSU19MSUNFTlNFID0gQXJ0aXN0
aWMgb3IgR1BMLTEuMCsKPiA+IC0tIAo+ID4gMi4zOS4yCj4gPiAKPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdB
SU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBD
QU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwg
ICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
