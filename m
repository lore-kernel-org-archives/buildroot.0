Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6F5C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 09:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C4440BC4;
	Tue,  6 Sep 2022 09:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83C4440BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7rwOULR67vv; Tue,  6 Sep 2022 09:40:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 707AE40B7F;
	Tue,  6 Sep 2022 09:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 707AE40B7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CE8B1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C0F60AE2
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C0F60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8xveRxaCDg2 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 09:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C60B60AAE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C60B60AAE
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 09:39:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C875FB005A4;
 Tue,  6 Sep 2022 11:39:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 11:39:46 +0200
Date: Tue, 6 Sep 2022 11:39:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220906093946.GU1490660@scaer>
References: <20220904092629.16495-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904092629.16495-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662457196;
 bh=MMpz/D4WYAVS35NKZoM2B39OQR2dhWWcS4H4aJtUbgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEnMP5gll7GRp/v8WPCBb4+J5EGsjq2hKAJucl7ZOwQCy8HNVDaCuA/NIM2vL6ViM
 nBCWLbDc6PahGHPLFfwnDzgOEmyRzkrviQsJO/vTGdO79kEmkd/WHNaBv0yH1cknvJ
 4HL+u4sJqXmA60EpM/0/1xnF6DAg4dCqJss0wXYPuQ/RihxuIQE9QduWHfP3DWV97N
 uwIQmmIZyPpR25ZdUGufu/zGbGFA1TE5d8+6SqJaCSKTdEkAgVPr9s77lTxmRvWo6I
 rMYlxsx5f2CJPCvbEty7rGLvPwnnmmB52jJK2Z0pLbTz1ftcFWA2BfxhqRPOwHgH8X
 kM36uyAlzL9xA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bEnMP5gl
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.5.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wOS0wNCAxMToyNiArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gRml4IHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgdnVsbmVyYWJpbGl0
aWVzOgo+ICAtIFtMb3ddIEZhdWx0IGluamVjdGlvbiBhdHRhY2sgb24gUkFNIHZpYSBSb3doYW1t
ZXIgbGVhZHMgdG8gRUNEU0Ega2V5Cj4gICAgZGlzY2xvc3VyZS4gVXNlcnMgZG9pbmcgb3BlcmF0
aW9ucyB3aXRoIHByaXZhdGUgRUNDIGtleXMgc3VjaCBhcwo+ICAgIHNlcnZlciBzaWRlIFRMUyBj
b25uZWN0aW9ucyBhbmQgY3JlYXRpbmcgRUNDIHNpZ25hdHVyZXMsIHdobyBhbHNvCj4gICAgaGF2
ZSBoYXJkd2FyZSB0aGF0IGNvdWxkIGJlIHRhcmdldGVkIHdpdGggYSBzb3BoaXN0aWNhdGVkIFJv
d2hhbW1lcgo+ICAgIGF0dGFjayBzaG91bGQgdXBkYXRlIHRoZSB2ZXJzaW9uIG9mIHdvbGZTU0wg
YW5kIGNvbXBpbGUgdXNpbmcgdGhlCj4gICAgbWFjcm8gV09MRlNTTF9DSEVDS19TSUdfRkFVTFRT
Lgo+ICAtIFtMb3ddIEluIHdvbGZTU0wgdmVyc2lvbiA1LjMuMCBpZiBjb21waWxlZCB3aXRoCj4g
ICAgLS1lbmFibGUtc2Vzc2lvbi10aWNrZXQgYW5kIHRoZSBjbGllbnQgaGFzIG5vbi1lbXB0eSBz
ZXNzaW9uIGNhY2hlLAo+ICAgIHdpdGggVExTIDEuMiB0aGVyZSBpcyB0aGUgcG9zc2liaWxpdHkg
b8OgZiBhIG1hbiBpbiB0aGUgbWlkZGxlIHBhc3NpbmcKPiAgICBhIGxhcmdlIHNlc3Npb24gdGlj
a2V0IHRvIHRoZSBjbGllbnQgYW5kIGNhdXNpbmcgYSBjcmFzaCBkdWUgdG8gYW4KPiAgICBpbnZh
bGlkIGZyZWUuIFRoZXJlIGlzIGFsc28gdGhlIHBvdGVudGlhbCBmb3IgYSBtYWxpY2lvdXMgVExT
IDEuMwo+ICAgIHNlcnZlciB0byBjcmFzaCBhIGNsaWVudCBpbiBhIHNpbWlsYXIgbWFubmVyIGV4
Y2VwdCBpbiBUTFMgMS4zIGl0IGlzCj4gICAgbm90IHN1c2NlcHRpYmxlIHRvIGEgbWFuIGluIHRo
ZSBtaWRkbGUgYXR0YWNrLiBVc2VycyBvbiB0aGUgY2xpZW50Cj4gICAgc2lkZSB3aXRoIOKAk2Vu
YWJsZS1zZXNzaW9uLXRpY2tldCBjb21waWxlZCBpbiBhbmQgdXNpbmcgd29sZlNTTAo+ICAgIHZl
cnNpb24gNS4zLjAgc2hvdWxkIHVwZGF0ZSB0aGVpciB2ZXJzaW9uIG9mIHdvbGZTU0wuCj4gIC0g
W0xvd10gSWYgdXNpbmcgd29sZlNTTF9jbGVhciB0byByZXNldCBhIFdPTEZTU0wgb2JqZWN0ICh2
cyB0aGUgbm9ybWFsCj4gICAgd29sZlNTTF9mcmVlL3dvbGZTU0xfbmV3KSBpdCBjYW4gcmVzdWx0
IGluIHJ1bnRpbWUgaXNzdWVzLiBUaGlzCj4gICAgZXhpc3RzIHdpdGggYnVpbGRzIHVzaW5nIHRo
ZSB3b2xmU1NMIGNvbXBhdGliaWxpdHkgbGF5ZXIKPiAgICAoLS1lbmFibGUtb3BuZXNzbGV4dHJh
KSBhbmQgb25seSB3aGVuIHRoZSBhcHBsaWNhdGlvbiBpcyBtYWtpbmcgdXNlCj4gICAgb2Ygd29s
ZlNTTF9jbGVhciBpbnN0ZWFkIG9mIFNTTF9mcmVlL1NTTF9uZXcuIEluIHRoZSBjYXNlIG9mIGEg
VExTCj4gICAgMS4zIHJlc3VtcHRpb24sIGFmdGVyIGNvbnRpbnVpbmcgdG8gdXNlIHRoZSBXT0xG
U1NIIG9iamVjdCBhZnRlcgo+ICAgIGhhdmluZyBjYWxsZWQgd29sZlNTTF9jbGVhciwgYW4gYXBw
bGljYXRpb24gY291bGQgY3Jhc2guIEl0IGlzCj4gICAgc3VnZ2VzdGVkIHRoYXQgdXNlcnMgY2Fs
bGluZyB3b2xmU1NMX2NsZWFyIHVwZGF0ZSB0aGUgdmVyc2lvbiBvZgo+ICAgIHdvbGZTU0wgdXNl
ZC4KPiAgLSBQb3RlbnRpYWwgRG9TIGF0dGFjayBvbiBEVExTIDEuMi4gSW4gdGhlIGNhc2Ugb2Yg
cmVjZWl2aW5nIGEKPiAgICBtYWxpY2lvdXMgcGxhaW50ZXh0IGhhbmRzaGFrZSBtZXNzYWdlIGF0
IGVwb2NoIDAgdGhlIGNvbm5lY3Rpb24gd2lsbAo+ICAgIGVudGVyIGFuIGVycm9yIHN0YXRlIHJl
cG9ydGluZyBhIGR1cGxpY2F0ZSBtZXNzYWdlLiBUaGlzIGFmZmVjdHMgYm90aAo+ICAgIHNlcnZl
ciBhbmQgY2xpZW50IHNpZGUuIFVzZXJzIHRoYXQgaGF2ZSBEVExTIGVuYWJsZWQgYW5kIGluIHVz
ZQo+ICAgIHNob3VsZCB1cGRhdGUgdGhlaXIgdmVyc2lvbiBvZiB3b2xmU1NMIHRvIG1pdGlnYXRl
IHRoZSBwb3RlbnRpYWwgZm9yCj4gICAgYSBEb1MgYXR0YWNrLgo+IAo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS93b2xmU1NML3dvbGZzc2wvcmVsZWFzZXMvdGFnL3Y1LjUuMC1zdGFibGUKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
CkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAt
LS0KPiAgcGFja2FnZS93b2xmc3NsL3dvbGZzc2wuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS93b2xm
c3NsL3dvbGZzc2wubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd29sZnNzbC93b2xm
c3NsLmhhc2ggYi9wYWNrYWdlL3dvbGZzc2wvd29sZnNzbC5oYXNoCj4gaW5kZXggMDFiMjE1OTZl
Ny4uZjE0MDFlNGNkYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dvbGZzc2wvd29sZnNzbC5oYXNo
Cj4gKysrIGIvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+
ICAjIExvY2FsbHkgY29tcHV0ZWQ6Cj4gLXNoYTI1NiAgZGMzNmNjMTlkYWQxOTcyNTNlNWMyZWNh
YTQ5MGM3ZWVmNTc5YWQ0NDg3MDZlNTVkNzNkNzkzOTZlODE0MDk4YiAgd29sZnNzbC01LjQuMC50
YXIuZ3oKPiArc2hhMjU2ICBjMzRiNzRiNWY2ODlmYWM3YmVjYjA1NTgzYjA0NGU4NGQzYjEwZDM5
ZjM4NzA5ZjAwOTVkZDVkNDIzZGVkNjdmICB3b2xmc3NsLTUuNS4wLnRhci5nego+ICAKPiAgIyBI
YXNoIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYx
ODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wubWsgYi9wYWNrYWdlL3dvbGZzc2wvd29s
ZnNzbC5tawo+IGluZGV4IDUzNmZkODYzZmUuLmNhMzYwMzEyYzkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS93b2xmc3NsL3dvbGZzc2wubWsKPiArKysgYi9wYWNrYWdlL3dvbGZzc2wvd29sZnNzbC5t
awo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+
IC1XT0xGU1NMX1ZFUlNJT04gPSA1LjQuMAo+ICtXT0xGU1NMX1ZFUlNJT04gPSA1LjUuMAo+ICBX
T0xGU1NMX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHdvbGZTU0wsd29sZnNzbCx2JChXT0xGU1NMX1ZF
UlNJT04pLXN0YWJsZSkKPiAgV09MRlNTTF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgCj4gLS0g
Cj4gMi4zNS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
