Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE27C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99F018436E;
	Sat, 17 Sep 2022 13:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F018436E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jaGzF6Jsamc; Sat, 17 Sep 2022 13:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A200F84328;
	Sat, 17 Sep 2022 13:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A200F84328
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5F41BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470C0401C9
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 470C0401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvpsbYhT0d0q for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:18:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745A640131
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 745A640131
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:17:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EBE5200007;
 Sat, 17 Sep 2022 13:17:57 +0000 (UTC)
Date: Sat, 17 Sep 2022 15:17:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220917151755.6dfaeb1b@windsurf>
In-Reply-To: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
References: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663420677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHeHcK6bCAAMrwuhoTejnJqfmm8l4/eDLNJM61THjyg=;
 b=WHuJ3JjZ52cK/NPBWVIrYm9bzYUrnKFylHjGx7hAPfmDAPdQoupMjJ2d5B1OYV8u3n37UY
 txqGBRPd2fQkOtJn3V7i/8/OZJwpiIgxiwg4towzi4ClfG8ZcIJhSdnIAq/SIz0e6JxDsW
 NHvjRQ6RVPSgMtQSed7dYs9C9iC08gDyvMDr5aLGhduCKWVlNL5egTbgamyXspyjFCyV/S
 TVT08mmIdiqfCq19BqAZ1jRktagL9g1bESzojoXDb01tyFu+lynH15lo+o6r/6ycIzprh6
 Hr6kVEI+TupewilbsZ82AWqFwnuf8eakprwuwUanFPWR167Jfn+K6I5to+X8Lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WHuJ3JjZ
Subject: Re: [Buildroot] [PATCH v3] package/chartjs: bump to version 3.9.1
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

SGVsbG8gSWduYWN5LAoKT24gVHVlLCAxMyBTZXAgMjAyMiAxMTozMjozNSArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiBJbnN0YWxsIG9ubHkgbWluaWZpZWQgSmF2YXNjcmlwdCBzb3VyY2UuICBObyBtb3JlIENT
UyByZXF1aXJlZC4KPiAKPiBodHRwczovL2dpdGh1Yi5jb20vY2hhcnRqcy9DaGFydC5qcy9yZWxl
YXNlcy90YWcvdjMuOS4xCj4gCj4gTGljZW5zZSBmaWxlIGhhcyB1cGRhdGVkIGNvcHlyaWdodCB5
ZWFycyB0byAyMDE0LTIwMjIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWduYWN5IEdhd8SZZHpraSA8
aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgo+IC0tLQo+ICBwYWNrYWdl
L2NoYXJ0anMvQ29uZmlnLmluICAgIHwgIDMgKysrCj4gIHBhY2thZ2UvY2hhcnRqcy9jaGFydGpz
Lmhhc2ggfCAgNCArKy0tCj4gIHBhY2thZ2UvY2hhcnRqcy9jaGFydGpzLm1rICAgfCAxNCArKysr
KysrKy0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2hhcnRqcy9Db25maWcuaW4gYi9wYWNr
YWdlL2NoYXJ0anMvQ29uZmlnLmluCj4gaW5kZXggNzNjYzliNzc1MC4uYzFjYzcxNzQxMCAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2NoYXJ0anMvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9jaGFy
dGpzL0NvbmZpZy5pbgo+IEBAIC0xLDQgKzEsNyBAQAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfQ0hB
UlRKUwo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9BUkNIX1NVUFBP
UlRTICMgaG9zdC1ub2RlanMKPiArCWRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzgg
IyBob3N0LW5vZGVqcwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfTk9ERUpTCj4gIAlib29s
ICJjaGFydGpzIgo+ICAJaGVscAo+ICAJICBDaGFydC5qcywgYSBzaW1wbGUgeWV0IGZsZXhpYmxl
IEphdmFTY3JpcHQgY2hhcnRpbmcgbGlicmFyeQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NoYXJ0
anMvY2hhcnRqcy5oYXNoIGIvcGFja2FnZS9jaGFydGpzL2NoYXJ0anMuaGFzaAo+IGluZGV4IGY4
NjE0ZWMzODUuLjg1ZjEzMWRmNDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jaGFydGpzL2NoYXJ0
anMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvY2hhcnRqcy9jaGFydGpzLmhhc2gKPiBAQCAtMSwzICsx
LDMgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+IC1zaGEyNTYgIDllZjM2OTdlMjc5YTU4NWM3
OTczMGYzNWRiYTE2YWQ0ZTI0ZGRlZWQ0OWExNTBhZGIzNDFjMzFmMTkxZmI3OGUgIGNoYXJ0anMt
Mi45LjQudGFyLmd6Cj4gLXNoYTI1NiAgN2I0M2NhYWU5MWYzMWIxOGRjODFmYWU2ZTBmN2FhMWFj
YmVjYWE2ZDg0ZTMyNDk5MDVjYmUxNTMwODMwN2Q2NyAgTElDRU5TRS5tZAo+ICtzaGEyNTYgIGI5
NGZhZjI2OTlkMWQzYjQ0Zjg3MzNiMGQzODBjN2RiNzJjNDZkYmNjZWY3MDA4YWM4OGYyZmVjNWJj
NGViMjUgIGNoYXJ0anMtMy45LjEudGFyLmd6Cj4gK3NoYTI1NiAgNWEwODc3YWQ2ZDgxODUyOWJl
NGYzMzAwOWQwOTQyY2RmN2UyZWQ3NjU2MTU2ZjRhYmE3MzA4NDU5YTU0NjAzMCAgTElDRU5TRS5t
ZAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NoYXJ0anMvY2hhcnRqcy5tayBiL3BhY2thZ2UvY2hh
cnRqcy9jaGFydGpzLm1rCj4gaW5kZXggMjc0OGE5NGQzNi4uNzIwZmEyNTA5MSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2NoYXJ0anMvY2hhcnRqcy5tawo+ICsrKyBiL3BhY2thZ2UvY2hhcnRqcy9j
aGFydGpzLm1rCj4gQEAgLTQsMjAgKzQsMjIgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtQ0hBUlRKU19WRVJTSU9OID0gMi45LjQKPiArQ0hBUlRKU19WRVJTSU9OID0g
My45LjEKPiAgQ0hBUlRKU19TSVRFID0gJChjYWxsIGdpdGh1YixjaGFydGpzLENoYXJ0LmpzLHYk
KENIQVJUSlNfVkVSU0lPTikpCj4gIENIQVJUSlNfTElDRU5TRSA9IE1JVAo+ICBDSEFSVEpTX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCj4gIENIQVJUSlNfQ1BFX0lEX1ZFTkRPUiA9IGNoYXJ0
anMKPiAgQ0hBUlRKU19DUEVfSURfUFJPRFVDVCA9IGNoYXJ0LmpzCj4gIAo+ICtDSEFSVEpTX0RF
UEVOREVOQ0lFUyA9IGhvc3Qtbm9kZWpzCj4gKwo+ICtkZWZpbmUgQ0hBUlRKU19CVUlMRF9DTURT
Cj4gKwljZCAkKEBEKSAmJiAkKE5QTSkgaW5zdGFsbCAmJiAkKE5QTSkgcnVuIGJ1aWxkCgpUaGlz
IGlzIGEgYml0IHdvcnJ5aW5nLiBXaGF0IGRvZXMgaXQgZG8/IERvZXMgaXQgZG93bmxvYWQvaW5z
dGFsbAphZGRpdGlvbmFsIHN0dWZmPyBJZiBzbywgaXQgYnJlYWtzIHJlcHJvZHVjaWJpbGl0eSBv
ZiB0aGUgYnVpbGQsIHRoZQpkb3dubG9hZCBpbmZyYXN0cnVjdHVyZSBsb2dpYywgdGhlIGxlZ2Fs
LWluZm8gbG9naWMsIGV0Yy4KCkNvdWxkIHlvdSBwcm92aWRlIG1vcmUgYmFja2dyb3VuZCBvbiB0
aGlzPwoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
