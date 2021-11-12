Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D0DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 12:52:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C4A760ED7
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 12:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C4A760ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B520060B9D;
	Fri, 12 Nov 2021 12:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQiK5ApLvb6B; Fri, 12 Nov 2021 12:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA1F6068A;
	Fri, 12 Nov 2021 12:52:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0D71BF29D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 12:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A303404E4
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 12:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ihyNQl-pvdr for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 12:52:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C45A040417
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 12:52:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 624FD19F58A;
 Fri, 12 Nov 2021 13:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636721517;
 bh=AggoKfUOyVorYdiLs1ksYODD2qL+DAaSG4OQfantgMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zk4fnYTfUAPFVk9Gi25fLbdrUpmTxy292Zot36ZBYF/2HmIu5IRVfhVUi5/rH7cIE
 OSvmNwlxABMLPh8U9CkDzjBD7frKryOmRQ3E8tejCLVYo20/leR9F2uLsFVD6Welk2
 wwhusbmTkPTfh6pCTFhPHZn0qGC9/l4us0ylkHcdIqTZeakEgIlUoRhhswzZxhj+ss
 RkeGsKatqlCYRyFfAZRXAFYqFPNmkIA/ok0XmextiBbKAFJL/7Zx3OOd9P5nd3gpkL
 EADUb7nOfsFmFMIWhljlQBj3WjJQMPqQUCeJsXIv/QUAZoyfZFJWuMxe0PyUIYnx5e
 pvpWzo7S6/Msw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 13:51:51 +0100
Date: Fri, 12 Nov 2021 13:51:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112125151.GI2609@scaer>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-7-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112110007.787836-7-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 6/6] support/testing: test_luvi: make luvi
 test reproducible
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIxLTExLTEyIDEyOjAwICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IEFzIGV4cGxhaW5lZCBieSBKw7ZyZyBbMV0sIGl0ZXJhdGlvbiB3aXRoIHBh
aXJzKCkgZG9lcyBub3QgcmVzdWx0IGluIHRoZQo+IHNhbWUgb3JkZXIgc2luY2UgbHVhaml0IDIu
MS4KPiAKPiBGcm9tIFsyXQo+ICJUYWJsZSBpdGVyYXRpb24gd2l0aCBwYWlycygpIGRvZXMgbm90
IHJlc3VsdCBpbiB0aGUgc2FtZSBvcmRlcj8KPiAKPiBUaGUgb3JkZXIgb2YgdGFibGUgaXRlcmF0
aW9uIGlzIGV4cGxpY2l0bHkgdW5kZWZpbmVkIGJ5IHRoZSBMdWEKPiBsYW5ndWFnZSBzdGFuZGFy
ZC4gRGlmZmVyZW50IEx1YSBpbXBsZW1lbnRhdGlvbnMgb3IgdmVyc2lvbnMgbWF5IHVzZQo+IGRp
ZmZlcmVudCBvcmRlcnMgZm9yIG90aGVyd2lzZSBpZGVudGljYWwgdGFibGVzLiBEaWZmZXJlbnQg
d2F5cyBvZgo+IGNvbnN0cnVjdGluZyBhIHRhYmxlIG1heSByZXN1bHQgaW4gZGlmZmVyZW50IG9y
ZGVycywgdG9vLiBEdWUgdG8KPiBpbXByb3ZlZCBWTSBzZWN1cml0eSwgTHVhSklUIDIuMSBtYXkg
ZXZlbiB1c2UgYSBkaWZmZXJlbnQgb3JkZXIgb24KPiBzZXBhcmF0ZSBWTSBpbnZvY2F0aW9ucyBv
ciB3aGVuIHN0cmluZyBrZXlzIGFyZSBuZXdseSBpbnRlcm5lZC4KPiAKPiBJZiB5b3VyIHByb2dy
YW0gcmVsaWVzIG9uIGEgZGV0ZXJtaW5pc3RpYyBvcmRlciwgaXQgaGFzIGEgYnVnLgo+IFJld3Jp
dGUgaXQsIHNvIGl0IGRvZXNuJ3QgcmVseSBvbiB0aGUga2V5IG9yZGVyLgo+IE9yIHNvcnQgdGhl
IHRhYmxlIGtleXMsIGlmIHlvdSBtdXN0LiIKPiAKPiBbMV0gaHR0cDovL2xpc3RzLmJ1c3lib3gu
bmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMS1Ob3ZlbWJlci82Mjc5MzguaHRtbAo+IFsyXSBo
dHRwczovL2x1YWppdC5vcmcvZmFxLmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gQ2M6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+IENjOiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJl
ZGRlZC5yb2Nrcz4KPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9s
dXZpLnB5IHwgMTAgKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X2x1dmkucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X2x1dmkucHkKPiBpbmRleCBlYjE1YWQzMWI1Li4yNzE1NWE3NWI2IDEwMDY0NAo+IC0tLSBhL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHV2aS5weQo+ICsrKyBiL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbHV2aS5weQo+IEBAIC0yMywxMyArMjMsMTMgQEAg
Y2xhc3MgVGVzdEx1dmkoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBzZWxmLmVt
dWxhdG9yLmxvZ2luKCkKPiAgCj4gICAgICBkZWYgdmVyc2lvbl90ZXN0KHNlbGYpOgo+IC0gICAg
ICAgIGNtZCA9ICJsdXZpIC12Igo+ICsgICAgICAgIGNtZCA9ICJsdXZpIC12IHwgc29ydCIKClRo
ZSBpc3N1ZSB3aXRoIHRoaXMgaXMgdGhhdCwgc2hvdWxkICdsdXZpIC12JyBmYWlsLCB0aGUgY29t
bWFuZCB3aWxsIG5vdApmYWlsLCBiZWNhdXNlIG9mIHRoZSBwaXBlLiBJbmRlZWQsIHRoZSByZXN1
bHQgb2YgYSBwaXBlIGlzIHRoZSByZXN1bHQgb2YKdGhlIHJpZ2h0LW1vc3QgY29tbWFuZCwgaW4g
dGhpcyBjYXNlICdzb3J0Jywgd2hpY2ggSSBkb24ndCB0aGluayB3b3VsZApldmVyIGZhaWwgaW4g
cHJhY3RpY2UgaW4gdGhpcyBjYXNlLgoKU28sIHRvIHByb3Blcmx5IGNhdGNoIHRoYXQgJ2x1dmkg
LXYnIGZhaWxzLCB5b3Ugd291bGQgc29ydCBpbiB0aGUgcHl0aG9uCmNvZGUsIHNvbWV0aGluZyBs
aWtlIChhc3N1bWluZyB0aGUgbHV2aSB2ZXJzaW9uIGFsd2FzIGNvbWVzIGZpcnN0Pyk6CgogICAg
Y21kID0gImx1dmkgLXYiCiAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVu
KGNtZCkKICAgIHNlbGYuYXNzZXJ0RXF1YWwoZXhpdF9jb2RlLCAwKQogICAgc2VsZi5hc3NlcnRJ
bignbHV2aScsIG91dHB1dFswXSkKICAgIG91dHB1dCA9IHNvcnRlZChvdXRwdXRbMTpdKQogICAg
c2VsZi5hc3NlcnRJbignbGlidXYnLCBvdXRwdXRbMF0pCiAgICBzZWxmLmFzc2VydEluKCdsdXZp
Jywgb3V0cHV0WzFdKQogICAgc2VsZi5hc3NlcnRJbigncmV4Jywgb3V0cHV0WzJdKQogICAgc2Vs
Zi5hc3NlcnRJbignc3NsJywgb3V0cHV0WzNdKQogICAgc2VsZi5hc3NlcnRJbignemxpYicsIG91
dHB1dFs0XSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICAgICAgICAgIG91dHB1dCwgZXhp
dF9jb2RlID0gc2VsZi5lbXVsYXRvci5ydW4oY21kKQo+IC0gICAgICAgIHNlbGYuYXNzZXJ0SW4o
J2x1dmknLCBvdXRwdXRbMF0pCj4gLSAgICAgICAgc2VsZi5hc3NlcnRJbignemxpYicsIG91dHB1
dFsxXSkKPiArICAgICAgICBzZWxmLmFzc2VydEluKCdsaWJ1dicsIG91dHB1dFswXSkKPiArICAg
ICAgICBzZWxmLmFzc2VydEluKCdsdXZpJywgb3V0cHV0WzFdKQo+ICAgICAgICAgIHNlbGYuYXNz
ZXJ0SW4oJ3JleCcsIG91dHB1dFsyXSkKPiAtICAgICAgICBzZWxmLmFzc2VydEluKCdsaWJ1dics
IG91dHB1dFszXSkKPiAtICAgICAgICBzZWxmLmFzc2VydEluKCdzc2wnLCBvdXRwdXRbNF0pCj4g
KyAgICAgICAgc2VsZi5hc3NlcnRJbignc3NsJywgb3V0cHV0WzNdKQo+ICsgICAgICAgIHNlbGYu
YXNzZXJ0SW4oJ3psaWInLCBvdXRwdXRbNF0pCj4gIAo+ICAgICAgZGVmIHRlc3RfcnVuKHNlbGYp
Ogo+ICAgICAgICAgIHNlbGYubG9naW4oKQo+IC0tIAo+IDIuMzEuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
