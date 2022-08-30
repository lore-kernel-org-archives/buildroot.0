Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E83AECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CD540BCC;
	Tue, 30 Aug 2022 19:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0CD540BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkMzmnqP6FFC; Tue, 30 Aug 2022 19:20:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 826BA40BC7;
	Tue, 30 Aug 2022 19:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 826BA40BC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFAD01BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE3561004
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE3561004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvsTCWzbQ2WR for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFBD661003
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFBD661003
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:20:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0C64B0071B;
 Tue, 30 Aug 2022 21:20:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:20:27 +0200
Date: Tue, 30 Aug 2022 21:20:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas TRAN <nicolas.tran@smile.fr>
Message-ID: <20220830192027.GC68979@scaer>
References: <20220727083753.935654-1-romain.naour@smile.fr>
 <CAJdGGv5DAHVRjDdLhwvQDCh1mX4ZWo7zs8BQLqSEHXw2EWz4ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJdGGv5DAHVRjDdLhwvQDCh1mX4ZWo7zs8BQLqSEHXw2EWz4ZQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661887231;
 bh=/k/nwSLURuzVopw1riOFogiaQ+Rv5G+HaqoMIYCC+d8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxyfXpEpqVUyBBd1neP8IvrySqSkO8emT4CVx5xOO5bunjYuJ/Ou97IT7RGF2UHd0
 LV4b2fMsrOaVcrQA3nlB56LlgBzyUJ9SYOJSi3z2/qtsfoTQVghC+x17htNn9+igYy
 t65rO+1Cr6hyBqJqLsPzF8zi8jb2MTUvbzgOwbJBtpM3rW+/Y7TDe/aqesqJAU0yFk
 ztOkedGJiCmR9KtEQJN2uTgCql0f9ycCy/SxEkQYRBY2IH3C5ZYD7gjgdIpEcPqThm
 /m2JCx1gGDEtOow+VnodwSs9f4GIUAdFKWuQ4yskXh2lTI4pjHGt9/kkFkdjJskz+7
 XpCZK9a14eJaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QxyfXpEp
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tmljb2xhcywgQWxsLAoKT24gMjAyMi0wNy0yOCAxNjo1MSArMDIwMCwgTmljb2xhcyBUUkFOIHNw
YWtlIHRodXNseToKPiBSZXZpZXdlZC0gYnk6IE5pY29sYXMgVHJhbiA8IFsxXW5pY29sYXMudHJh
bkBzbWlsZS5mcj4KCllvdSBzZW50IGFuIEhUTUwgbWFpbCwgaXQgZ290IGNvbXBsZXRlbHkgYm9y
a2VkLCBhbmQgeW91ciByZXZpZWVkLWJ5IHRhZwp3YXMgcGlja2VkIHdlaXJkbHkgYnkgcGF0Y2h3
b3JrOgogICAgUmV2aWV3ZWQtYnk6IE5pY29sYXMgVHJhbiA8bmljb2xhcy50cmFuQHNtaWxlLmZy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+PgoKSSd2ZSBmaXhlZCB0aGF0IHdoZW4gYXBwbHlpbmcu
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBPbiBXZWQsIEp1bCAyNywgMjAyMiBhdCAxMDoz
OCBBTSBSb21haW4gTmFvdXIgPCBbMl1yb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+IAo+
ICAgV2hpbGUgYnVpbGRpbmcgaG9zdC1ydXN0IHdpdGggYSBtdXNsIGJhc2VkIHRvb2xjaGFpbiB3
aXRob3V0IEMrKyBjb21waWxlciwKPiAgIHRoZSBidWlsZCBmYWlsIHNpbmNlIGxpYnVud2luZCBi
dW5kbGVkIGluIHJ1c3Qgc291cmNlcyBuZWVkcyBhIEMrKyBjb21waWxlci4KPiAKPiAgIGNhcmdv
Ondhcm5pbmc9aTY4Ni1idWlsZHJvb3QtbGludXgtbXVzbC1nY2MuYnJfcmVhbDogZXJyb3I6Cj4g
ICBbLi4uXS9ob3N0LXJ1c3QtMS42Mi4wL3NyYy9sbHZtLXByb2plY3QvbGlidW53aW5kL3NyYy9V
bndpbmQtRUhBQkkuY3BwOiBDKysgY29tcGlsZXIgbm90IGluc3RhbGxlZCBvbiB0aGlzIHN5c3Rl
bQo+IAo+ICAgTm90ZTogdGhlIGlzc3VlcyBjYW4ndCBiZSByZXByb2R1Y2VkIHdpdGggYSBnbGli
YyBiYXNlZCB0b29sY2hhaW4KPiAgIHdpdGhvdXQgQysrIHByb2JhbHkgZHVlIHRvIGV4dHJhIHN0
ZXBzIHJlcXVpcmVkIHRvIHN1cHBvcnQgbXVzbCBsaWJjLgo+IAo+ICAgV2UgY291bGQgYWRkIHRo
ZSBDKysgZGVwZW5kZW5jeSBkaXJlY2x0eSB0byBob3N0LXJ1c3RjIGJ1dCBpdCB3b3VsZAo+ICAg
cmVxdWlyZXMgYWRkaW5nIHRoZSBDKysgcmV2ZXJzZSBkZXBlbmRlbmNpZXMgdG8gYWxsIHJ1c3Qg
cGFja2FnZXMuCj4gCj4gICBJbnN0cmVhZCwgd2UgYWRkIHRoZSBDKysgZGVwZW5kZW5jeSB0byBC
UjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gICBvbmx5IHdoZW4g
YSBtdXNsIHRvb2xjaGFpbiBpcyB1c2VkLiBTbyB3ZSBjYW4gc3RpbGwgaW5zdGFsbCBhIHByZWJ1
aWx0Cj4gICBydXN0IGNvbXBpbGVyIGJ1dCB3aXRob3V0IHRoZSBydXN0IHN0YW5kYXJkIGxpYnJh
cnkgKHJ1c3Qtc3RkKS4KPiAKPiAgIFVzdWFsbHkgd2Ugc2hvdWxkIG5vdCBhZGQgdG9vbGNoYWlu
IGRlcGVuZGVuY2llcyBpbiBhIF9BUkNIX1NVUFBPUlRTIG9wdGlvbiBidXQKPiAgIEJSMl9QQUNL
QUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIuLi4gb3B0aW9ucyBjb250YWlucyBhbHJlYWR5IHNv
bWUKPiAgIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyBvciBCUjJfVE9PTENIQUlOX1VTRVNfTVVT
TC4KPiAKPiAgIEZpeGVzOgo+ICAgWzNdaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvNjM2LzYzNmZiMzljOGYxYjhjMDVlNGNhNDUxYWM1MDZjZDYzYzcxNjZkODIKPiAKPiAg
IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8IFs0XXJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
PiAgIC0tLQo+ICAgdjM6IGFkZCBhIGdsb2JhbCBDKysgZGVwZW5kZW5jeSB0byBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTIChZYW5uKQo+ICAgwqAgwqAgdXBkYXRl
IGNvbW1lbnQgdG8gdXNlICJDKysgY3Jvc3MgY29tcGlsZXIiCj4gICB2MjogbW92ZSB0aGUgQysr
IGRlcGVuZGVuY3kgdG8gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JU
Uwo+ICAgwqAgwqAgYWZ0ZXIgSmFtZXMncyByZXZpZXcgYW5kIGRpc2N1c3Npb24gd2l0aCBUaG9t
YXMgYW5kIEFybm91dAo+ICAgLS0tCj4gICDCoHBhY2thZ2UvcnVzdGMvQ29uZmlnLmluLmhvc3Qg
fCA0ICsrKysKPiAgIMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+ICAgZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcnVzdGMvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3J1c3RjL0Nv
bmZpZy5pbi5ob3N0Cj4gICBpbmRleCBmZWM4NzI2YWVlLi44MjJkZTY4ZGJiIDEwMDY0NAo+ICAg
LS0tIGEvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9zdAo+ICAgKysrIGIvcGFja2FnZS9ydXN0
Yy9Db25maWcuaW4uaG9zdAo+ICAgQEAgLTExMCwxMSArMTEwLDE1IEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9USUVSMl9QTEFURk9STVMKPiAgIMKgIMKgIMKgIMKgIGRl
ZmF1bHQgeSBpZiBCUjJfc3BhcmM2NCAmJiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPiAKPiAg
IMKgIyBBbGwgdGFyZ2V0IHJ1c3QgcGFja2FnZXMgc2hvdWxkIGRlcGVuZCBvbiB0aGlzIG9wdGlv
bgo+ICAgKyMgTm90ZTogV2l0aCBtdXNsIGJhc2VkIHRvb2xjaGFpbiwgd2UgbmVlZCBhIEMrKyBj
cm9zcyBjb21waWxlciB0bwo+ICAgKyMgYnVpbGQgaG9zdC1ydXN0IHNvbWUgdGFyZ2V0IGxpYnJh
cmllcyAobGlidW53aW5kKSBmcm9tIGxsdm0gc291cmNlCj4gICArIyBjb2RlIGJ1bmRsZWQgaW4g
cnVzdCBzb3VyY2VzLgo+ICAgwqBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRf
QVJDSF9TVVBQT1JUUwo+ICAgwqAgwqAgwqAgwqAgYm9vbAo+ICAgwqAgwqAgwqAgwqAgZGVmYXVs
dCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIxX1BMQVRGT1JNUwo+ICAg
wqAgwqAgwqAgwqAgZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJ
RVIyX0hPU1RfVE9PTFNfUExBVEZPUk1TCj4gICDCoCDCoCDCoCDCoCBkZWZhdWx0IHkgaWYgQlIy
X1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfVElFUjJfUExBVEZPUk1TCj4gICArwqAgwqAgwqAg
wqBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9VU0VT
X01VU0wKPiAgIMKgIMKgIMKgIMKgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19B
UkNIX1NVUFBPUlRTCj4gCj4gICDCoGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0gK
PiAgIC0tCj4gICAyLjM0LjMKPiAKPiAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gICBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gICBbNV1idWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+ICAgWzZdaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gTGlua3M6Cj4gMS4gbWFpbHRvOnJvbWFpbi5uYW91
ckBzbWlsZS5mcgo+IDIuIG1haWx0bzpyb21haW4ubmFvdXJAc21pbGUuZnIKPiAzLiBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82MzYvNjM2ZmIzOWM4ZjFiOGMwNWU0Y2E0
NTFhYzUwNmNkNjNjNzE2NmQ4Mgo+IDQuIG1haWx0bzpyb21haW4ubmFvdXJAc21pbGUuZnIKPiA1
LiBtYWlsdG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA2LiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
