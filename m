Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9756FC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5D641767;
	Sun, 24 Jul 2022 12:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5D641767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4MqnNP2jzyQ; Sun, 24 Jul 2022 12:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2C6541739;
	Sun, 24 Jul 2022 12:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2C6541739
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D23FD1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AE68610B6
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AE68610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6k2ElV0WdVq for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:45:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B8E607AA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03B8E607AA
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:45:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 354F81BF205;
 Sun, 24 Jul 2022 12:45:43 +0000 (UTC)
Date: Sun, 24 Jul 2022 14:45:42 +0200
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220724144542.78639b5d@windsurf>
In-Reply-To: <20220114070852.481719-1-jose.pekkarinen@unikie.com>
References: <20220114070852.481719-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658666743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5J0qZVHZy9kj+IPNjuojMRWNTcQ1m2zB1ctZZ9lt8Q=;
 b=WYSTsDSiM+w0ZO7CR9bUkuAB60cR9uOzkhsQk55xT9OFAnX7MEUv6cGvkwjcDuvJvyHTMb
 7mGX+sA913fhHkH+UJyMgVhDWlACIOoO4AhncJiSCfTaLe6SUeqyYy4HgEVXx+enL3V0CI
 MYA7F+Usiiza3lW1nKySuBA3iqj140UOL9wrPHuWp9oaXtLkel/QvvKS0V7QqvuEu2nY7B
 00//25OjCEEbPhzMCItxJ9NiNEiqYmKJglA5QKS2PeST2uLWvvZE33brNCoNUdBBvXu0kq
 FKLRNcjmC7dJLmXfJAYoFpGsV9GpNpt3Cnp+lt8K9BnFBgn1+czvBkqhC0TQkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WYSTsDSi
Subject: Re: [Buildroot] [PATCH v4] package/opensc: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDE0IEphbiAyMDIyIDA5OjA4OjUyICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhlIHBhdGNo
IHdpbGwgYWRkIHBhY2thZ2Ugb3BlbnNjLiBzb3VyY2VyeS1hcm0KPiB0b29sY2hhaW4gdHJpZ2dl
cnMgc3RyaWN0IGFsaWFzaW5nIHJ1bGVzIHRoYXQgdXBzdHJlYW0KPiBmaW5kcyBubyBlYXN5IHdh
eSB0byBmaXguIEl0IGlzIGRpc2FibGVkIGZvciBub3cgdW50aWwKPiBhIHByb3BlciBzb2x1dGlv
biBpcyBmb3VuZCB1cHN0cmVhbS4KClRoaXMgc3RvcnkgYWJvdXQgc291cmNlcnktYXJtIGlzIG5v
IGxvbmdlciB0cnVlLCB0aGUgcHJvYmxlbSB3YXMgZml4ZWQKdXNpbmcgLS1kaXNhYmxlLXN0cmlj
dC4KCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zYy8wMDAxLUZpeC1tYXliZS11bmluaXRp
YWxpemVkLWVycm9ycy5wYXRjaCBiL3BhY2thZ2Uvb3BlbnNjLzAwMDEtRml4LW1heWJlLXVuaW5p
dGlhbGl6ZWQtZXJyb3JzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi4wMWI3YTM5ODE4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvb3BlbnNj
LzAwMDEtRml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3JzLnBhdGNoCj4gQEAgLTAsMCArMSw4
MyBAQAo+ICtGcm9tIGJjYjM5ZDZmNGQyZGVlNmJlYjAzNWNiMmYzNjE4MTc0ZWMxY2IyYjAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206ID0/VVRGLTg/cT9Kb3M9QzM9QTk9MjBQZWtr
YXJpbmVuPz0gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+ICtEYXRlOiBGcmksIDEwIERl
YyAyMDIxIDEzOjU0OjI2ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4IG1heWJlIHVuaW5p
dGlhbGl6ZWQgZXJyb3JzCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
Cj4gKwo+ICtQUjogaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQy9PcGVuU0MvcHVsbC8yNDY2CgpJ
IGhhdmUgdXBkYXRlZCB0aGF0IHRvIHRoZSBsaW5rIG9mIHRoZSBjb21taXQsIHNpbmNlIHlvdXIg
UFIgaGFzIGJlZW4gbWVyZ2VkLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2MvQ29uZmln
LmluIGIvcGFja2FnZS9vcGVuc2MvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi4xYjFiYTBkMzhlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2Uvb3BlbnNjL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTcgQEAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX09QRU5TQwo+ICsJYm9vbCAib3BlbnNjIgo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19M
SUJTCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiArCWRlcGVuZHMg
b24gQlIyX1VTRV9NTVUgIyBmb3JrKCkKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QQ1NDX0xJVEUK
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCj4gKwloZWxwCj4gKwkgIE9wZW5TQyBwcm92
aWRlcyBhIHNldCBvZiBsaWJyYXJpZXMgYW5kIHV0aWxpdGllcyB0byB3b3JrCj4gKwkgIHdpdGgg
c21hcnQgY2FyZHMuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDL09wZW5TQy93
aWtpCj4gKwo+ICtjb21tZW50ICJvcGVuc2MgbmVlZHMgYSB0b29sY2hhaW4gd2l0aCBkeW5hbWlj
IGxpYnJhcnkgc3VwcG9ydCBkaXN0aW5jdCBmcm9tIHNvdXJjZXJ5LWFybSIKPiArCWRlcGVuZHMg
b24gQlIyX1NUQVRJQ19MSUJTCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKClRoaXMgd2FzIG5vdCBjb3JyZWN0IGZvciBz
ZXZlcmFsIHJlYXNvbjoKCiAtIFRoZSBzb3VyY2VyeS1hcm0gaXNzdWUgbm8gbG9uZ2VyIGV4aXN0
cwoKIC0gVGhlIGNvbW1lbnQgZm9yZ290IGFib3V0IHRoZSB0aHJlYWRzIGRlcGVuZGVuY3kKCiAt
IFRoZSBjb21tZW50IHNob3VsZCBiZSBzaG93biB3aGVuIHRocmVhZCBzdXBwb3J0IGlzICpub3Qq
IGF2YWlsYWJsZSwKICAgc28gd2hlbiAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwoKIC0gVGhl
IGNvbW1lbnQgc2hvdWxkIGJlIHNlZW4gd2hlbiBlaXRoZXIgc3RhdGljLWxpYnMgaXMgc2V0ICpv
cioKICAgdGhyZWFkcyBhcmUgbm90IHRoZXJlLgoKQWxsIGluIGFsbCwgdGhlIGNvcnJlY3QgcmVz
dWx0IGlzOgoKY29tbWVudCAib3BlbnNjIG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHluYW1pYyBs
aWJyYXJ5LCB0aHJlYWRzIgogICAgICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKICAgICAgICBk
ZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8fCAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwoK
PiArT1BFTlNDX0NPTkZfT1BUUz0iLS1kaXNhYmxlLXN0cmljdCIKClNwYWNlcyBhcm91bmQgPSBh
cmUgbmVlZGVkIHRvIGZvbGxvdyB0aGUgQnVpbGRyb290IGNvZGluZy1zdHlsZSwgYW5kCmRvdWJs
ZSBxdW90ZXMgYXJvdW5kIC0tZGlzYWJsZS1zdHJpY3Qgc2hvdWxkIG5vdCBiZSB0aGVyZS4KCkkn
dmUgYXBwbGllZCB3aXRoIGFsbCB0aG9zZSBzbWFsbCBmaXhlcy4gVGhhbmtzIGEgbG90IGZvciB5
b3VyCmNvbnRyaWJ1dGlvbiEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFu
ZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
