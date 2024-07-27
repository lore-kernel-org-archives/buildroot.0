Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72009C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 09:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EC3813F9;
	Sat, 27 Jul 2024 09:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4YmopI2S3iy; Sat, 27 Jul 2024 09:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F52E8142A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F52E8142A;
	Sat, 27 Jul 2024 09:51:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 476871BF2C9
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 09:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344A640B36
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 09:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Na6u2FyPWd1u for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 09:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5758C40967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5758C40967
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5758C40967
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 09:51:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.58.183]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1sAOhd2JVs-00xEyd; Sat, 27
 Jul 2024 11:51:17 +0200
Date: Sat, 27 Jul 2024 11:51:16 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZqTDFGpFzwQk7G4x@probook>
References: <20240724115554.2270864-1-fontaine.fabrice@gmail.com>
 <ZqQLEUiTljvhKaWM@probook>
 <CAPi7W80oHhQmabKg64pUVffo3sRStOfF0w0teQHmGeB1NgGhfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W80oHhQmabKg64pUVffo3sRStOfF0w0teQHmGeB1NgGhfg@mail.gmail.com>
X-Provags-ID: V03:K1:kbmFSyti2c+g9wJz1erASaZP4aBAH41TN3I66aVA6HOt0v9//pN
 2Zb+t3TunTqNe5TCzanoh4b5oTENgI6XSgbIbL+O1DocBemlg9Nzg/0V/ICeLU0cqvYJLEm
 01D/y8/1lCS0faSgt8o1Ot7eUf1MAM32gcxIBtu6y26NH76aL0ASjenHO1nx2+YtuLlJP2a
 jyhCFOtjHca56N47cpUUA==
UI-OutboundReport: notjunk:1;M01:P0:F6HanCDu8Yk=;WMs8WhzcGYHIfV51/SM3vwIEPsD
 a+fRLdOIDi3sb6LjIh1TSiIWBz9HCIXd25/mNI6uAxx/IJNhUFD3Z45TxEzc9BCp8KgDW+GRx
 1EjTJXIo1JOacEM0PjCIomNbvCMd/qxVlGBe/ubWIDRst2FMjk2aJF8/V0qs83lqqCtOYMWpQ
 32+xubSgVCJcXTH8IPMJYoJuYoLJslN5Kahf7RZWJG/ETDUzySTuY+4GBZo8Ko59TGvGUD+3e
 CehS6m42yny8c9vEdox+phVdEFWWP+f73kzR9o5IkL9CHdOAHwskkKNZNbo3qkhyp+TA8+ZIV
 Oc6Cs1xaUa6WJLE1lS5NtQiqVqm5HVFSIyW9lD/vF3+MUzvDbIUX0PY9xvfozy9Ria5+JOhw1
 Zzzvl0R42aBcXt5C3wpE2UOXu+WFsyryU8cxrixS5at1Lm36QSZ9RFOQZelGhODrSeQdyqKUO
 BSCcFjBJtB8vygbKgLVJbNCDG6LAUXSl6rTnTlXq4xr2PhJNSSyvXj3ieEMKkuYRHHxxBMvxi
 fLGX0i2avxJxKmFiSQBZ91b9EL7VUwqGivgQA94yA9m+LxgfvgTErmUjKlojj+QuIdHrUJ/jP
 iXpBqadspe2Hzai//KL9X8eKWf0HMIHBWCXBSto+PInGY6sBcPJpp/kW/AwfLLaM3tthC3ir7
 eWfme7p7zRYxDGmI/NYV1a+NLCoCOFLyYY7/TtwgfKBlpYt/4tUWSEYCdwLOkoneO4WTkHcTh
 tdTOrdiRAxB3XkpmW5WzL+8E1hgF9r8vlFD9EZ3QM7i6Wd+oHIqFPnGAm1xtNenJ3JCAT1bet
 R8GFYSdWvSu4JEIuWh0IgRIQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722073877; x=1722678677; i=j.neuschaefer@gmx.net;
 bh=BwtvlL+fJPGz9F38h2OgqwnlBReR1zNwGimDTWRDezw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Njmjc03PIK6Houxj2+iySJ6//DVu4iDJA7Erbci3CmqyjVBl1pszkJjBR+V9WAHK
 DF+HTAps0OMEdqt2NhcE8M5xF8S4iT2s1ibwzrqA293S/POuoBIUog4UEd4AbQz8L
 uD3VCZd5FEq7vhvxrDjpXQfSsvGBukMFzbSMuSYZNenPQmWEoyB54bEzDdV3mqxIx
 Scq+leNAYRVuZ0R8JVbMmNJekOajZ3cBUvy8CSR7Ou408r/XZOhAgsIABfN58aVLk
 gD2GsOXx8gC/eVPB72GLECaN9YUdpdTDtLpBPLdpgdaC33gJ8AIEud9xm4OSM2JJr
 C9KR1hdK6phEtdT6fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Njmjc03P
Subject: Re: [Buildroot] [PATCH 1/1] package/tipidee: fix uclibc build
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMTA6NTk6NTNQTSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToKPiBMZSB2ZW4uIDI2IGp1aWwuIDIwMjQgw6AgMjI6NDYsIEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+IGEgw6ljcml0IDoKPiA+Cj4gPiBPbiBXZWQsIEp1bCAy
NCwgMjAyNCBhdCAwMTo1NTo1NFBNICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4g
PiBTZXQgX0dOVV9TT1VSQ0UgaW4gQ0ZMQUdTIHRvIGZpeCB0aGUgZm9sbG93aW5nIHVjbGliYyBi
dWlsZCBmYWlsdXJlCj4gPiA+IHJhaXNlZCBzaW5jZSB0aGUgYWRkaXRpb24gb2YgdGhlIHBhY2th
Z2UgaW4gY29tbWl0Cj4gPiA+IDE3ZGVhZjYwZjY2ZmMwOGE3OTYyMzM5MjBhMTA0ZTUyMzNiNTAx
ZTA6Cj4gPiA+Cj4gPiA+IHNyYy9saWJ0aXBpZGVlL3RpcGlkZWVfcmVzcG9uc2VfaGVhZGVyX2xh
c3Rtb2RpZmllZC5jOiBJbiBmdW5jdGlvbiAndGlwaWRlZV9yZXNwb25zZV9oZWFkZXJfbGFzdG1v
ZGlmaWVkJzoKPiA+ID4gc3JjL2xpYnRpcGlkZWUvdGlwaWRlZV9yZXNwb25zZV9oZWFkZXJfbGFz
dG1vZGlmaWVkLmM6MTc6MzY6IGVycm9yOiAnY29uc3Qgc3RydWN0IHN0YXQnIGhhcyBubyBtZW1i
ZXIgbmFtZWQgJ3N0X210aW0nOyBkaWQgeW91IG1lYW4gJ3N0X210aW1lJz8KPiA+ID4gICAgMTcg
fCAgIGlmICghdGFpbl9mcm9tX3RpbWVzcGVjKCZ0LCAmc3QtPnN0X210aW0pKSByZXR1cm4gMCA7
Cj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
Cj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdF9tdGlt
ZQo+ID4gPgo+ID4gPiBGaXhlczogMTdkZWFmNjBmNjZmYzA4YTc5NjIzMzkyMGExMDRlNTIzM2I1
MDFlMAo+ID4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mMDdk
NmQ2YWUyMzMxZjk5NzI5NzQwOTNjMDUwM2I5ZDNjNmI5MTRhCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4g
PiAtLS0KPiA+ID4gIHBhY2thZ2UvdGlwaWRlZS90aXBpZGVlLm1rIHwgMSArCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvdGlwaWRlZS90aXBpZGVlLm1rIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsKPiA+ID4g
aW5kZXggOTE1YjRmODRiZC4uY2IzM2IxNTNlNiAxMDA2NDQKPiA+ID4gLS0tIGEvcGFja2FnZS90
aXBpZGVlL3RpcGlkZWUubWsKPiA+ID4gKysrIGIvcGFja2FnZS90aXBpZGVlL3RpcGlkZWUubWsK
PiA+ID4gQEAgLTExLDYgKzExLDcgQEAgVElQSURFRV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+
ID4gPiAgVElQSURFRV9ERVBFTkRFTkNJRVMgPSBza2FsaWJzCj4gPiA+Cj4gPiA+ICBUSVBJREVF
X0NPTkZfT1BUUyA9IFwKPiA+ID4gKyAgICAgQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1EX0dO
VV9TT1VSQ0UiIFwKPiA+Cj4gPiBUaGlzIHNlZW1zIGZpbmUgYXMgYSBzdG9wLWdhcCBzb2x1dGlv
biwgYnV0IHNpbmNlIHVwc3RyZWFtIGRvY3VtZW50cwo+ID4gdGhhdCBpdCBvbmx5IG5lZWRzICJB
IFBPU0lYLWNvbXBsaWFudCBzeXN0ZW0gd2l0aCBhIHN0YW5kYXJkIEMKPiA+IGRldmVsb3BtZW50
IGVudmlyb25tZW50IiwgaGF2ZSB5b3UgZGlzY3Vzc2VkIHRoaXMgaXNzdWUgd2l0aCB0aGUKPiA+
IHVwc3RyZWFtIGF1dGhvcj8KPgo+IE5vcGUsIEkgZGlkbid0IGRpc2N1c3MgaXQgd2l0aCB0aGUg
dXBzdHJlYW0gYXV0aG9yLgo+IFRob21hcyBkb2Vzbid0IGxpa2UgdGhpcyBwYXRjaCBhbHNvOgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NDA3MjUxMzI2NDEuMzMzMjE5LTEtZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20v
Cj4KPiBBcyB5b3UncmUgdGhlIG9mZmljaWFsIG1haW50YWluZXIgb2YgdGlwaWRlZSBpbiBidWls
ZHJvb3QsIEknbGwgbGV0Cj4geW91IGRlZmluZSB0aGUgYmVzdCBzb2x1dGlvbiBhbmQgc2VuZCB0
aGUgYXBwcm9wcmlhdGUgcGF0Y2ggdG8gdGhlCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdC4KCkkn
dmUgZGV0ZXJtaW5lZCB0aGF0IHRoaXMgaXMgcHJvYmFibHkgYSB1Y2xpYmMgYnVnLCBhbmQgSSdt
IGNvb2tpbmcgdXAgYQpwYXRjaCB0aGF0IEknbGwgc2VuZCB0byB0aGUgdWNsaWJjIG1haWxpbmcg
bGlzdCBzb29uLCB0byBnZXQgc29tZSByZXZpZXcKZmVlZGJhY2suCgpCYXNpY2FsbHksIHRpcGlk
ZWUgYWxyZWFkeSBzZXRzIF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMLCB3aGljaCBzaG91bGQgYmUK
ZW5vdWdoIHRvIGdldCBzdF9tdGltLCBidXQgdWNsaWJjIGRvZXNuJ3QgZW5hYmxlIHN0X210aW0g
YmFzZWQgb24KUE9TSVggMjAwOCAob3IgcmF0aGVyLCBpdCBvbmx5IGRvZXMgZm9yIGEgZmV3IGFy
Y2hpdGVjdHVyZXMuLi4pLgoKCi0tIGpuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
