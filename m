Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D381EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 16:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56D1240359;
	Sun, 20 Nov 2022 16:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56D1240359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkNzBi2UcyTg; Sun, 20 Nov 2022 16:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF04F404AA;
	Sun, 20 Nov 2022 16:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF04F404AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7C31BF404
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A33404AA
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A33404AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OCgqhz-McHd for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 16:44:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F15040359
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F15040359
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 16:44:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:78ad:17ab:4254:8d91])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 880632003FF;
 Sun, 20 Nov 2022 17:44:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 17:44:11 +0100
Date: Sun, 20 Nov 2022 17:44:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221120164411.GE2516@scaer>
References: <20221120141721.1068907-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120141721.1068907-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668962653;
 bh=s6Wt2vg2fZEINhZELMJ0bhKbftCnQM+XvRBXVFrGeMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2T5C70xwW12FAsntjV06+cvztowZg54ivaAN+fOx4VWlU3aGj0bl7qdRTmgDCYZt
 h/f9PUqTkZuYpqiQLokVtZrNf7RrH9CWet2BjiZqRnvaMilS+6/mbigzFOMAIg8Teg
 rO0PYVD57kzBgEn3yh2vTsnrkMAFveZSYqT7YYhUcru8PG6DKCMmFDqtalKOqjufXr
 Lci6L6cb0o9CIvGJoUlOFszSWw3LuhPemzPTvrxooIba3980UzCxNmz8dZoXXNB8Gg
 55vd2rgk1sLC67tQTfgvVOg8I9kkA7rZzYtfiAH80w/AlAXuC11wf7zvuP+cZOX40N
 Byt7R+7uBSzrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q2T5C70x
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.28.0
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

UGV0ZXIsIEFsbCwKCk9uIDIwMjItMTEtMjAgMTU6MTcgKzAxMDAsIFBldGVyIEtvcnNnYWFyZCBz
cGFrZSB0aHVzbHk6Cj4gQXN0ZXJpc2sgMTYuMjYuMCBmaXhlZCB0aGUgZm9sbG93aW5nIHNlY3Vy
aXR5IGlzc3VlczoKPiAKPiAtIFtBU1RFUklTSy0yOTQ3Nl0g4oCTIHJlc19zdGlyX3NoYWtlbjog
QmxpbmQgU1NSRiB2dWxuZXJhYmlsaXRpZXMKPiAgIGh0dHBzOi8vaXNzdWVzLmFzdGVyaXNrLm9y
Zy9qaXJhL2Jyb3dzZS9BU1RFUklTSy0yOTQ3Ngo+IAo+IC0gW0FTVEVSSVNLLTI5ODM4XSDigJMg
JHtTUUxfRVNDKCl9IG5vdCBjb3JyZWN0bHkgZXNjYXBpbmcgYSB0ZXJtaW5hdGluZyBcCj4gICBo
dHRwczovL2lzc3Vlcy5hc3Rlcmlzay5vcmcvamlyYS9icm93c2UvQVNURVJJU0stMjk4MzgKPiAK
PiAtIFtBU1RFUklTSy0yOTg3Ml0g4oCTIHJlc19zdGlyX3NoYWtlbjogUmVzb3VyY2UgZXhoYXVz
dGlvbiB3aXRoIGxhcmdlIGZpbGVzCj4gICBodHRwczovL2lzc3Vlcy5hc3Rlcmlzay5vcmcvamly
YS9icm93c2UvQVNURVJJU0stMjk4NzIKPiAKPiBodHRwczovL3d3dy5hc3Rlcmlzay5vcmcvYXN0
ZXJpc2stbmV3cy9hc3Rlcmlzay0xNi0yNi0wLW5vdy1hdmFpbGFibGUvCj4gCj4gSXQgdW5mb3J0
dW5hdGVseSBhbHNvIGludHJvZHVjZWQgYSBjaGFuZ2UgdG8gY2hhbl9pYXgyLCBicmVha2luZyBi
dWlsZHMKPiB3aXRob3V0IE9wZW5TU0w6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2FzdGVyaXNrL2Fz
dGVyaXNrL2NvbW1pdC81OWE4Y2RhY2EyZGJiNWVlYjczODJkZmJlNzhjMGMxY2JlZDhjZTZkCj4g
Cj4gV2hpY2ggd2FzIGFnYWluIGZpeGVkIGluIDE2LjI4LjA6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L2FzdGVyaXNrL2FzdGVyaXNrL2NvbW1pdC9mODEyZGZiNjhjNmVkN2FlNTViNGMxNjM3MTZmZDFk
ZGMwNjNmZjU0Cj4gCj4gU28gYnVtcCB0byAxNi4yOC4wOgo+IGh0dHBzOi8vd3d3LmFzdGVyaXNr
Lm9yZy9hc3Rlcmlzay1uZXdzL2FzdGVyaXNrLTE2LTI4LTAtbm93LWF2YWlsYWJsZS8KPiAKPiBU
aGUgbGlieG1sMiBzdXBwb3J0IG5vdyB1c2VzIHBrZy1jb25maWcsIHNvIGRyb3AgdGhlIGxpYnht
bDItY29uZmlnIGhhbmRsaW5nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hc3Rlcmlzay9hc3Rlcmlz
ay9jb21taXQvYmY5ZGFmYTdjMjIzMDJiMmYxYTEyYjgyMTZkYTYzMTAyMTE2ZDljOQoKQXMgc2Vl
biBvbiBJUkMsIEkndmUgYWRkZWQgYW4gZXhwbGljaXQgZGVwZW5kZW5jeSB0byBob3N0LXBrZ2Nv
bmYsCnJhdGhlciB0aGFuIGltcGxpY2l0bHkgaW5oZXJpdCB0aGUgZGVwZW5kZW5jeSBmcm9tIHRo
ZSBob3N0IHZhcmlhbnQuCgo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5oYXNoIHwgMiAr
LQo+ICBwYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1rICAgfCA3ICsrLS0tLS0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvYXN0ZXJpc2svYXN0ZXJpc2suaGFzaCBiL3BhY2thZ2UvYXN0ZXJpc2svYXN0
ZXJpc2suaGFzaAo+IGluZGV4IDg4MGQ2NzU2MmQuLjk3OTJkODJhYzUgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5oYXNoCj4gKysrIGIvcGFja2FnZS9hc3Rlcmlzay9h
c3Rlcmlzay5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+IC1z
aGEyNTYgIDBmYjgxNzk0M2EyNzZmNWU1NDBjMmE5NDMyZTg4NDFjZDMzOTNlN2MxYmQxMjUwMDU1
YzYyMDkwMmY2ZWFmYzggIGFzdGVyaXNrLTE2LjI1LjIudGFyLmd6Cj4gK3NoYTI1NiAgNmU5YzJm
MzUwZGIwMThkZjg1NGIxMzAxNjg3Y2VkODk5M2ZhY2IyNzg3Njk4MzM2ZTU1Y2QxOWUwYWUzZWJm
ZSAgYXN0ZXJpc2stMTYuMjguMC50YXIuZ3oKPiAgCj4gICMgc2hhMSBmcm9tOiBodHRwOi8vZG93
bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvdGVsZXBob255L3NvdW5kcy9yZWxlYXNlcwo+ICAjIHNo
YTI1NiBsb2NhbGx5IGNvbXB1dGVkCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXN0ZXJpc2svYXN0
ZXJpc2subWsgYi9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1rCj4gaW5kZXggOWI1OTk5N2I4
MC4uMTg0ZjQwMDMxZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1r
Cj4gKysrIGIvcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5tawo+IEBAIC00LDcgKzQsNyBAQAo+
ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1BU1RFUklTS19WRVJTSU9OID0g
MTYuMjUuMgo+ICtBU1RFUklTS19WRVJTSU9OID0gMTYuMjguMAo+ICAjIFVzZSB0aGUgZ2l0aHVi
IG1pcnJvcjogaXQncyBhbiBvZmZpY2lhbCBtaXJyb3IgbWFpbnRhaW5lZCBieSBEaWdpdW0sIGFu
ZAo+ICAjIHByb3ZpZGVzIHRhcmJhbGxzLCB3aGljaCB0aGUgbWFpbiBBc3RlcmlzayBnaXQgdHJl
ZSAoYmVoaW5kIEdlcnJpdCkgZG9lcyBub3QuCj4gIEFTVEVSSVNLX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLGFzdGVyaXNrLGFzdGVyaXNrLCQoQVNURVJJU0tfVkVSU0lPTikpCj4gQEAgLTExNSw4ICsx
MTUsNyBAQCBBU1RFUklTS19DT05GX09QVFMgKz0gLS13aXRob3V0LWF2Y29kZWMKPiAgQVNURVJJ
U0tfQ09ORl9PUFRTICs9IC0td2l0aG91dC1zcGFuZHNwCj4gIAo+ICBBU1RFUklTS19DT05GX0VO
ViA9IFwKPiAtCWFjX2N2X2ZpbGVfYnJpZGdlc19icmlkZ2Vfc29mdG1peF9pbmNsdWRlX2hyaXJz
X2g9dHJ1ZSBcCj4gLQlhY19jdl9wYXRoX0NPTkZJR19MSUJYTUwyPSQoU1RBR0lOR19ESVIpL3Vz
ci9iaW4veG1sMi1jb25maWcKPiArCWFjX2N2X2ZpbGVfYnJpZGdlc19icmlkZ2Vfc29mdG1peF9p
bmNsdWRlX2hyaXJzX2g9dHJ1ZQo+ICAKPiAgIyBVc2VzIF9fYXRvbWljX2ZldGNoX2FkZF80Cj4g
IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDKSx5KQo+IEBAIC0zMTQsOCArMzEz
LDYgQEAgSE9TVF9BU1RFUklTS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICAjIHNvIGRvIG5v
dCBpbmhlcml0IHRoZSB0YXJnZXQgc2V0dXAuCj4gIEhPU1RfQVNURVJJU0tfQVVUT1JFQ09ORiA9
IE5PCj4gIAo+IC1IT1NUX0FTVEVSSVNLX0NPTkZfRU5WID0gQ09ORklHX0xJQlhNTDI9JChIT1NU
X0RJUikvYmluL3htbDItY29uZmlnCj4gLQo+ICBIT1NUX0FTVEVSSVNLX0NPTkZfT1BUUyA9IFwK
PiAgCS0td2l0aG91dC1uZXd0IFwKPiAgCS0td2l0aG91dC1jdXJzZXMgXAo+IC0tIAo+IDIuMzAu
Mgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
