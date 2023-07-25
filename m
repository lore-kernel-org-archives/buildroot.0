Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0860C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB0D6110A;
	Tue, 25 Jul 2023 19:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB0D6110A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnLE0YNAznuE; Tue, 25 Jul 2023 19:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 593FC60FA6;
	Tue, 25 Jul 2023 19:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 593FC60FA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E14F1BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749B0418B7
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749B0418B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwmA0fE90zrM for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:10:56 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABBBE418B4
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBBE418B4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 75B5E780316;
 Tue, 25 Jul 2023 21:10:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:10:50 +0200
Date: Tue, 25 Jul 2023 21:10:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230725191050.GG3544423@scaer>
References: <20230725163842.1B077828EF@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725163842.1B077828EF@busybox.osuosl.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690312252;
 bh=MvJBLRzRSOTbGc89Yye7OzrtyIfo1lXrtVw7s9lqFIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKxW60OsvDhinMduqfqvSY7bWtPO4hI/saIwqWhMQCraKvhXNxhNeyZFcuCevJgHq
 KPGRxNulcV80m+f6NFXBK0kaV6FvldRawkLCtRhXrxki3BDpc51qogoir73FugCToo
 ZoTmr79Gndom18h7efuCWXknt7ZDXor4t+a9dOQk3Rw0VevMTDcuIqCqz3ePHjsM2i
 PoNEswN9Jd7H3avq1NHAgEmOA6YDdP0haHsH9OjxbJnFJ9y7sse50njrv/6VG3p1LU
 YdPDkbkq1dkfu02Gbj4O0phPLqH/hb2KSgHpwf+JwfdJYN+XB7u69u9rrDf1M1yQ+i
 nGxKhSHiRfi2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dKxW60Os
Subject: Re: [Buildroot] [git commit] package/fluent-bit: rework wasm
 handling
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzwrIsIEFsbCwKCk9uIDIwMjMtMDctMjUgMTg6MzggKzAyMDAsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gRmx1ZW50LWJpdCBpc24ndCB2ZXJ5IGdy
ZWF0IGF0IHN1cHBvcnRpbmcgdGhlIHZhcmlvdXMgYXJjaGl0ZWN0dXJlcywKPiBzbyBoZWxwIGEg
bGl0dGxlIGJpdCBieSBkZWZpbmluZyB0aGUgV0FNUl9CVUlMRF9UQVJHRVQgb3Vyc2VsdmVzLgpb
LS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmx1ZW50LWJpdC9Db25maWcuaW4gYi9w
YWNrYWdlL2ZsdWVudC1iaXQvQ29uZmlnLmluCj4gaW5kZXggYmZkZWE4OTViMC4uOWZmZGU1YjMx
NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2ZsdWVudC1iaXQvQ29uZmlnLmluCj4gKysrIGIvcGFj
a2FnZS9mbHVlbnQtYml0L0NvbmZpZy5pbgo+IEBAIC0xMywxNSArMTMsMjEgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0ZMVUVOVF9CSVQKPiAgCj4gIGlmIEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVQKPiAg
Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GTFVFTlRfQklUX1dBU01fQVJDSAo+ICsJc3RyaW5nCj4g
KwlkZWZhdWx0ICJBQVJDSDY0IiAgICBpZiBCUjJfYWFyY2g2NCB8fCBCUjJfYWFyY2g2NGJlCgog
ICAgJCAuL3V0aWxzL2NoZWNrLXN5bWJvbHMKICAgIHBhY2thZ2UvZmx1ZW50LWJpdC9Db25maWcu
aW46MTg6IEJSMl9hYXJjaDY0YmUgcmVmZXJlbmNlZCBidXQgbm90IGRlZmluZWQKCldlaXJkLCB3
aHkgaXMgdGhhdCBub3QgcGFydCBvZiBjaGVjay1wYWNrYWdlPwoKSSd2ZSBwdXNoZWQgYSBmaXh1
cCBjb21taXQuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiArCWRlZmF1bHQgIkFSQyIgICAg
ICAgIGlmIEJSMl9hcmNsZSB8fCBCUjJfYXJjZWIKPiArCWRlZmF1bHQgIkFSTSIgICAgICAgIGlm
IEJSMl9hcm0gfHwgQlIyX2FybWViCj4gKwlkZWZhdWx0ICJNSVBTIiAgICAgICBpZiBCUjJfbWlw
cyB8fCBCUjJfbWlwc2VsIHx8IEJSMl9taXBzNjQgfHwgQlIyX21pcHM2NGVsCj4gKwlkZWZhdWx0
ICJSSVNDVjMyIiAgICBpZiBCUjJfcmlzY3YgJiYgQlIyX1JJU0NWXzMyCj4gKwlkZWZhdWx0ICJS
SVNDVjY0IiAgICBpZiBCUjJfcmlzY3YgJiYgQlIyX1JJU0NWXzY0Cj4gKwlkZWZhdWx0ICJYODZf
MzIiICAgICBpZiBCUjJfaTM4Ngo+ICsJZGVmYXVsdCAiWDg2XzY0IiAgICAgaWYgQlIyX3g4Nl82
NAo+ICsJZGVmYXVsdCAiWFRFTlNBIiAgICAgaWYgQlIyX3h0ZW5zYQo+ICsKPiAgY29uZmlnIEJS
Ml9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9BUkNIX1NVUFBPUlRTCj4gIAlib29sCj4gLQkjIHNl
ZSBsaWIvd2FzbS1taWNyby1ydW50aW1lLVdBTVItMS4xLjEvUkVBRE1FLm1kI3N1cHBvcnRlZC1h
cmNoaXRlY3R1cmVzLWFuZC1wbGF0Zm9ybXMKPiAtCWRlZmF1bHQgeSBpZiBCUjJfYXJjCj4gLQlk
ZWZhdWx0IHkgaWYgQlIyX2FybSB8fCBCUjJfYXJtZWIKPiAtCWRlZmF1bHQgeSBpZiBCUjJfYWFy
Y2g2NCB8fCBCUjJfYWFyY2g2NF9iZQo+IC0JZGVmYXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJSMl94
ODZfNjQKPiAtCWRlZmF1bHQgeSBpZiBCUjJfUklTQ1ZfNjQKPiAtCWRlZmF1bHQgeSBpZiBCUjJf
eHRlbnNhCj4gKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfRkxVRU5UX0JJVF9XQVNNX0FSQ0gg
IT0gIiIKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9GTFVFTlRfQklUX1dBU00KPiAgCWJvb2wg
Indhc20gcnVudGltZSBzdXBwb3J0Igo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZsdWVudC1iaXQv
Zmx1ZW50LWJpdC5tayBiL3BhY2thZ2UvZmx1ZW50LWJpdC9mbHVlbnQtYml0Lm1rCj4gaW5kZXgg
Y2Q4ZjM0Nzc2OC4uMTE4NTg2MDY2MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2ZsdWVudC1iaXQv
Zmx1ZW50LWJpdC5tawo+ICsrKyBiL3BhY2thZ2UvZmx1ZW50LWJpdC9mbHVlbnQtYml0Lm1rCj4g
QEAgLTIzLDcgKzIzLDE3IEBAIEZMVUVOVF9CSVRfQ09ORl9PUFRTICs9IFwKPiAgCS1ERkxCX0JB
Q0tUUkFDRT1Obwo+ICAKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9GTFVFTlRfQklUX1dBU00pLHkp
Cj4gLUZMVUVOVF9CSVRfQ09ORl9PUFRTICs9IC1ERkxCX1dBU009WWVzCj4gK0ZMVUVOVF9CSVRf
V0FNUl9BUkNIID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9B
UkNIKSkKPiArCj4gKyMgaHR0cHM6Ly9naXRodWIuY29tL2J5dGVjb2RlYWxsaWFuY2Uvd2FzbS1t
aWNyby1ydW50aW1lL2lzc3Vlcy82MjUKPiArIyBGaXggdW5rbm93biBvcGNvZGUgJ2xkYzEnLCBz
ZWVuIG9uIG1pcHMzMnIyIGFuZCBtaXBzNjRyMi4KPiAraWZlcSAoJChGTFVFTlRfQklUX1dBTVJf
QVJDSCksTUlQUykKPiArRkxVRU5UX0JJVF9DT05GX09QVFMgKz0gXAo+ICsJLURXQU1SX0JVSUxE
X0lOVk9LRV9OQVRJVkVfR0VORVJBTD0xCj4gK2VuZGlmCj4gKwo+ICtGTFVFTlRfQklUX0NPTkZf
T1BUUyArPSAtREZMQl9XQVNNPVllcyBcCj4gKwktRFdBTVJfQlVJTERfVEFSR0VUPSQoRkxVRU5U
X0JJVF9XQU1SX0FSQ0gpCj4gIGVsc2UKPiAgRkxVRU5UX0JJVF9DT05GX09QVFMgKz0gLURGTEJf
V0FTTT1Obwo+ICBlbmRpZgoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
