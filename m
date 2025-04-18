Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9BC369CA
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B64B4072C;
	Fri, 18 Apr 2025 14:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH2k7GLYqsHK; Fri, 18 Apr 2025 14:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D19E4091D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D19E4091D;
	Fri, 18 Apr 2025 14:19:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42A9969
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34487417B0
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4Rn9peNikug for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:19:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 000CA407FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 000CA407FC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 000CA407FC
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:19:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.34.111] ([213.208.157.35]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1v6ZqT3xbQ-014XJo; Fri, 18
 Apr 2025 16:19:18 +0200
Message-ID: <f538d2d6-933b-4d18-8d2e-8690f32af746@gmx.at>
Date: Fri, 18 Apr 2025 16:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20250407103959.2361659-1-raphael.melotte@mind.be>
 <20250407103959.2361659-2-raphael.melotte@mind.be>
Content-Language: en-US
In-Reply-To: <20250407103959.2361659-2-raphael.melotte@mind.be>
X-Provags-ID: V03:K1:eLF3yTkODbnfKXQEpNPN3wOjEksRkfXcb7Bw5gRslvRFoQeNLex
 trrikScqInjextagkd2DaxRZicjQIHxy0r10lV6DJQnRs8HIGKggTbHQT6C98h0wjB7OCgY
 M2Pqd5pLHkby6YcsCh2fNQxWEzZge3pSPsP4H/fWjYrFu3crUXZ+6cCArg3n+2BUxUvFhTD
 1WG4FI9nZ+Rura5UsvQmg==
UI-OutboundReport: notjunk:1;M01:P0:KvZzYNhq8YI=;M3waALFGEHxBFY2QCVP/GPlNm/a
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744985958; x=1745590758; i=dalang@gmx.at;
 bh=p3lbw+FPdPNYYBCErORJGBXZ3zomTzvdbSyuge6+Rv8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=j5qBUWybwJZg++nB5Xr1fUDmIoto1Xa5c20zKWU8QSLOgY9lbK1aUwZrI9K2YATw
 C3EdT0R9QHTsaLLZkfmjjE2EVeZQavlPrYURlkQ71Serkrrc4DcolLo5qEMp8rv3X
 zqAijl6EUY/+HKijTZuLEoSgObZfONlYVltiejmIHL3hUgNQg2nLbZwY7Rk/vd9+u
 Drei2ar1KSP3O3qbim97s9h/LD+nH/MhBJvQ+UR9NQlA6lWGpNNHQFTJnMWLFGylo
 QYxjtSM4tYMmBCcfiPqm3oQsl/rxKjZSMelhW/jV6wcujo0Z6YtyB9RxDf2Du4bfZ
 Xwv8d8F79+8SMkuP+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=j5qBUWyb
Subject: Re: [Buildroot] [PATCH 1/3] package/llvm-project: add support for
 clang python bindings
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpPbiA0LzcvMjUgMTI6MzksIFJhcGhhw6tsIE3DqWxvdHRlIHdyb3Rl
Ogo+IEFkZCB0d28gdXBzdHJlYW0gcGF0Y2hlcyB0aGF0IHdlcmUgcmVxdWlyZWQgZm9yIGJ1aWxk
aW5nIGFuZCBlbmFibGUKPiB0aGUgYmluZGluZ3MgZm9yIG91ciBweXRob24gdmVyc2lvbi4KPiAK
PiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBiZWNhdXNlIHRoZSBweXRob24gYmluZGluZ3MgaGF2
ZSB3cm9uZyBkZWZhdWx0Cj4gaW5jbHVkZSBkaXJzLCB0aGV5IGFyZSB1c2VsZXNzIGlmIHRoZSBp
bmNsdWRlcyBhcmUgbm90IHByb3ZpZGVkCj4gZXh0ZXJuYWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIC4u
LnNpYy1hZ2FpbnN0LWxpYmF0b21pYy13aGVuLW5lY2Vzc2FyeS5wYXRjaCB8IDQ4ICsrKysrKysr
KysKPiAgcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvQ29uZmlnLmluICAgICAgICAgIHwgIDgg
KysKPiAgcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsgICAgICAgICAgIHwgIDUg
Kwo+ICAuLi5MSUItdmFyaWFibGUtZm9yLWNvbnZlbmllbnQtbGlua2luZy0ucGF0Y2ggfCA5MSAr
KysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nLzAwMDEtTGlu
ay1saWJjbGFuZ0Jhc2ljLWFnYWluc3QtbGliYXRvbWljLXdoZW4tbmVjZXNzYXJ5LnBhdGNoCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLzAwMDEtU2V0LUxM
Vk1fQVRPTUlDX0xJQi12YXJpYWJsZS1mb3ItY29udmVuaWVudC1saW5raW5nLS5wYXRjaAo+IApb
LS0tXT4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL0NvbmZpZy5pbiBi
L3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL0NvbmZpZy5pbgo+IGluZGV4IDJlMjM4ODg3MjAu
LjEzNGI4ZjVkOWEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvQ29u
ZmlnLmluCj4gKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvQ29uZmlnLmluCj4gQEAg
LTI1LDMgKzI1LDExIEBAIGNvbW1lbnQgImNsYW5nIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFy
LCB0aHJlYWRzLCBDKyssIGdjYyA+PSA3LCBkeW5hbWljIGxpYnJhCj4gIGNvbW1lbnQgImNsYW5n
IG5lZWRzIGEgdG9vbGNoYWluIG5vdCBhZmZlY3RlZCBieSBHQ0MgYnVnIDY0NzM1Igo+ICAJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9MTFZNX0FSQ0hfU1VQUE9SVFMKPiAgCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfR0NDX0JVR182NDczNQo+ICsKPiAraWYgQlIyX1BBQ0tBR0VfQ0xBTkcK
PiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0NMQU5HX1BZVEhPTl9CSU5ESU5HUwo+ICsJ
Ym9vbCAiUHl0aG9uIGJpbmRpbmdzIGZvciBob3N0LWNsYW5nIgo+ICsJc2VsZWN0IEJSMl9QQUNL
QUdFX0hPU1RfUFlUSE9OMwoKQXMgZmFyIGFzIEkga25vdywgdGhlc2UgYmluZGluZ3MgYXJlIHR5
cGljYWxseSBzZWxlY3RlZCBpbXBsaWNpdGx5LgpTbyBubyBleHRyYSBjb25maWcgb3B0aW9uIGJ1
dCBpbnN0ZWFkIGNoZWNrIGZvciBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTjMgaW4gdGhlIG1rIGZp
bGUuCgo+ICsKPiArZW5kaWYgIyBCUjJfUEFDS0FHRV9DTEFORwo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xsdm0tcHJvamVjdC9jbGFuZy9jbGFuZy5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2Ns
YW5nL2NsYW5nLm1rCj4gaW5kZXggMGJhZmQ2NDYxYi4uNTEwZDViMDgwNSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFuZy9jbGFuZy5tawo+ICsrKyBiL3BhY2thZ2UvbGx2
bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rCj4gQEAgLTEwNSw2ICsxMDUsMTEgQEAgaWZlcSAoJChC
UjJfVE9PTENIQUlOX0VYVEVSTkFMKSx5KQo+ICBIT1NUX0NMQU5HX0NPTkZfT1BUUyArPSAtREdD
Q19JTlNUQUxMX1BSRUZJWDpQQVRIPWByZWFscGF0aCAtLXJlbGF0aXZlLXRvPSQoSE9TVF9ESVIp
L2Jpbi8gJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpYAo+ICBlbmRpZgo+ICAKPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9IT1NUX0NMQU5HX1BZVEhPTl9CSU5ESU5HUykseSkKCnRoaXMg
dHVybnMgaW5mbyBpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OMykseSkKCj4gK0hPU1Rf
Q0xBTkdfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uMwo+ICtIT1NUX0NMQU5HX0NPTkZfT1BU
UyArPSAtRENMQU5HX1BZVEhPTl9CSU5ESU5HU19WRVJTSU9OUz0kKFBZVEhPTjNfVkVSU0lPTl9N
QUpPUikKPiArZW5kaWYKPiArCj4gIGRlZmluZSBIT1NUX0NMQU5HX0lOU1RBTExfV1JBUFBFUl9B
TkRfU0lNUExFX1NZTUxJTktTCj4gIAkkKFEpY2QgJChIT1NUX0RJUikvYmluOyBcCj4gIAlybSAt
ZiBjbGFuZy0kKENMQU5HX1ZFUlNJT05fTUFKT1IpLmJyX3JlYWw7IFwKClstLS1dCgpSZWdhcmRz
LApEYW5pZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
