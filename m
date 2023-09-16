Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520ECD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9E1819D5;
	Sat, 16 Sep 2023 12:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9E1819D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tUGATgxOqNP; Sat, 16 Sep 2023 12:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA4C81E04;
	Sat, 16 Sep 2023 12:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFA4C81E04
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEB11BF578
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 154586103A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154586103A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeP6qRyCuu_F for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:35:19 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E35A60EE3
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E35A60EE3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 493342003AE;
 Sat, 16 Sep 2023 14:35:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:35:12 +0200
Date: Sat, 16 Sep 2023 14:35:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916123512.GZ2571@scaer>
References: <20230916070153.2983243-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916070153.2983243-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694867716;
 bh=JwyS08KAkDjykWfhptBUY6h6wKB2iZLA69e+tDeWGMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J6d2ZkFp84z3BCqYUANbsYa0JD8mtYU9dpeDwkNgPXtamme0E5aSEjpExKiyCyrxC
 NOcIXFHsgYbOwlp3BYiC0C5rKrH8rgRYU6Zn7/mNwp2Af0KhumSiJa0UbfoHy77paU
 1Y4akgfGWF8uTGSmZ0KZc8W3CRrA4iClF0w8904wAOaEdrZy1FcwLrI/F8g3jix+G/
 7vrlp9LL0UAyxW2bPXCKYUOX74qJVWfPi1CtfR0Ok7o6oWAX8UQS4YqEninyJBkxJR
 2pvTEgLyDCxceOBjJ1qR7JutFWvnLF0sdbrVoBPREM6hSLpuu4Pv4h+87jhyyI0nWN
 5QDOYQeHqR1SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J6d2ZkFp
Subject: Re: [Buildroot] [PATCH 1/3] package/python-pytest: fix dependency
 on zlib
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyY2luLCBBbGwsCgpPbiAyMDIzLTA5LTE2IDA5OjAxICswMjAwLCBNYXJjaW4gTmllc3Ryb2og
c3Bha2UgdGh1c2x5Ogo+IHRlc3RzLnBhY2thZ2UudGVzdF9weXRob25fcHl0ZXN0LlRlc3RQeXRo
b25QeTNQeXRlc3QgcnVudGltZSB0ZXN0cyBmYWlscwo+IG5vdyB3aXRoIGZvbGxvd2luZyBlcnJv
cjoKPiAKPiAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPiAgIEZBSUw6IHRlc3RfcnVuICh0ZXN0cy5wYWNrYWdl
LnRlc3RfcHl0aG9uX3B5dGVzdC5UZXN0UHl0aG9uUHkzUHl0ZXN0LnRlc3RfcnVuKQo+ICAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+ICAgICBG
aWxlICIvYnVpbGRyb290L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9u
LnB5IiwgbGluZSAxMzcsIGluIHRlc3RfcnVuCj4gICAgICAgc2VsZi5ydW5fc2FtcGxlX3Njcmlw
dHMoKQo+ICAgICBGaWxlICIvYnVpbGRyb290L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX3B5dGVzdC5weSIsIGxpbmUgMTgsIGluIHJ1bl9zYW1wbGVfc2NyaXB0cwo+
ICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kLCB0aW1lb3V0PXNlbGYudGltZW91dCkKPiAgICAg
RmlsZSAiL2J1aWxkcm9vdC9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvYmFzZXRlc3QucHkiLCBsaW5l
IDg5LCBpbiBhc3NlcnRSdW5Pawo+ICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoCj4gICBBc3NlcnRp
b25FcnJvcjogMSAhPSAwIDoKPiAgIEZhaWxlZCB0byBydW46IHB5dGhvbiAtbSBweXRlc3Qgc2Ft
cGxlX3B5dGhvbl9weXRlc3QucHkKPiAgIG91dHB1dCB3YXM6Cj4gICAgIFRyYWNlYmFjayAobW9z
dCByZWNlbnQgY2FsbCBsYXN0KToKPiAgICAgICBGaWxlICI8ZnJvemVuIHJ1bnB5PiIsIGxpbmUg
MTg5LCBpbiBfcnVuX21vZHVsZV9hc19tYWluCj4gICAgICAgRmlsZSAiPGZyb3plbiBydW5weT4i
LCBsaW5lIDE0OCwgaW4gX2dldF9tb2R1bGVfZGV0YWlscwo+ICAgICAgIEZpbGUgIjxmcm96ZW4g
cnVucHk+IiwgbGluZSAxMTIsIGluIF9nZXRfbW9kdWxlX2RldGFpbHMKPiAgICAgICBGaWxlICIv
dXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvcHl0ZXN0L19faW5pdF9fLnB5IiwgbGlu
ZSA1LCBpbiA8bW9kdWxlPgo+ICAgICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1w
YWNrYWdlcy9fcHl0ZXN0L19jb2RlL19faW5pdF9fLnB5IiwgbGluZSAyLCBpbiA8bW9kdWxlPgo+
ICAgICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9fcHl0ZXN0L19j
b2RlL2NvZGUucHkiLCBsaW5lIDM2LCBpbiA8bW9kdWxlPgo+ICAgICAgIEZpbGUgIi91c3IvbGli
L3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9wbHVnZ3kvX19pbml0X18ucHkiLCBsaW5lIDE2LCBp
biA8bW9kdWxlPgo+ICAgICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdl
cy9wbHVnZ3kvX21hbmFnZXIucHkiLCBsaW5lIDEwLCBpbiA8bW9kdWxlPgo+ICAgICAgIEZpbGUg
Ii91c3IvbGliL3B5dGhvbjMuMTEvaW1wb3J0bGliL21ldGFkYXRhL19faW5pdF9fLnB5IiwgbGlu
ZSA4LCBpbiA8bW9kdWxlPgo+ICAgICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEvemlwZmls
ZS5weSIsIGxpbmUgNiwgaW4gPG1vZHVsZT4KPiAgICAgSW1wb3J0RXJyb3I6IGxpYnouc28uMTog
Y2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
Cj4gCj4gRml4IHRoYXQgYnkgYWRkaW5nIEJSMl9QQUNLQUdFX1BZVEhPTjNfWkxJQiBkZXBlbmRl
bmN5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlu
bi1nbG9iYWwuY29tPgoKV2hvbGUgc2VyaWVzIG9mIHRocmVlIHBhdGNoZXMgYXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdl
L3B5dGhvbi1weXRlc3QvQ29uZmlnLmluIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weXRlc3QvQ29uZmlnLmlu
IGIvcGFja2FnZS9weXRob24tcHl0ZXN0L0NvbmZpZy5pbgo+IGluZGV4IDliYmM5ZWEyZDIuLmM4
ZjlhNmViNWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tcHl0ZXN0L0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5dGVzdC9Db25maWcuaW4KPiBAQCAtNiw2ICs2LDcgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9QWVRFU1QKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fUExVR0dZICMgcnVudGltZQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QWSAj
IHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zX1BZRVhQQVQgIyBydW50aW1l
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OM19aTElCICMgcnVudGltZQo+ICAJaGVscAo+
ICAJICBweXRlc3QgaXMgYSBmcmFtZXdvcmsgdGhhdCBtYWtlcyBidWlsZGluZyBzaW1wbGUgYW5k
IHNjYWxhYmxlCj4gIAkgIHRlc3RzIGVhc3kuIFRlc3RzIGFyZSBleHByZXNzaXZlIGFuZCByZWFk
YWJsZeKAlG5vIGJvaWxlcnBsYXRlCj4gLS0gCj4gMi40Mi4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
