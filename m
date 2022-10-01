Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E60C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32D960F7D;
	Sat,  1 Oct 2022 20:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32D960F7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id na_DQhL3xQtS; Sat,  1 Oct 2022 20:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFDE60F68;
	Sat,  1 Oct 2022 20:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEFDE60F68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2DB1BF289
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34A0B4161F
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A0B4161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N56xIGug-TR6 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:59:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE8541591
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCE8541591
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:59:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C366B780344;
 Sat,  1 Oct 2022 22:59:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 22:59:20 +0200
Date: Sat, 1 Oct 2022 22:59:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221001205920.GY30794@scaer>
References: <20220927105817.760742-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927105817.760742-1-nunes.erico@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664657964;
 bh=a4YX0ed9Kn1j015CtcYIxBhK+7LfexMIR6dUDxR/wws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEVaAMtLLQy1Fr4/7fO1jmH4AKiSHTuSQq+QfeWoQlJ9CgCB5CxYUt6+jHyEEOr/9
 /o8QUmR2G8v8dGcm4FmPIQ6yJWAhBl1pkRE1sdEMaI3UqrndIRS60YcQnufgl/2D7J
 0xbrB8FG5WRP8znzTTLZSlF76aftxo3NDBJSxTC2blknfzTPz36uOnl22zD2zT+yxl
 zyZrx/ieHGhRUGoW3h1RNB2W4GTQsVg3nNH74U5sEv1GY89Q0VckQWbjiyLeGbALr5
 EEoqSnsD/OhU9rw8BdmVRxRFHLp80O2Tpe+VuBt2igeZp2IR1gQDXIpCkhCAWfy6NK
 qEBDW8C6AqZkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rEVaAMtL
Subject: Re: [Buildroot] [PATCH] package/fwts: bump to version 22.09.00
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RXJpY28sIEFsbCwKCitWaW5jZW50IGZvcnIgdGhlIGFybSBzdXBwb3J0CgpPbiAyMDIyLTA5LTI3
IDEyOjU4ICswMjAwLCBFcmljbyBOdW5lcyBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTog
RXJpY28gTnVuZXMgPG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpOb3RlIHRoYXQgd2UgcmVjZW50bHkgYWxsb3dlZCBmd3RzIHRvIGJlIHNlbGVjdGFi
bGUgb24gYXJtLCBzZWUgY29tbWl0CjYyMjlhMzFmOGQ3ZSAocGFja2FnZS9md3RzOiBlbmFibGUg
Zm9yIGFybSksIHNvIHdpdGggdGhpcyBidW1wIHdlIG1heQpnZXQgbmV3IGZhaWx1cmVzLiBQbGVh
c2Uga2VlcCBhbiBleWUgb24gdGhlIGF1dG9idWlsZGVyIHJlc3VsdHMuCgpSZWdhcmRzLApZYW5u
IEUuIE1PUklOLgoKPiAtLS0KPiAgLi4uL2Z3dHMvMDAwMS1idWlsZC1kby1ub3QtdXNlLVdlcnJv
ci5wYXRjaCAgIHwgMjYgKysrKysrKysrLS0tLS0tLS0tLQo+ICBwYWNrYWdlL2Z3dHMvZnd0cy5o
YXNoICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL2Z3dHMvZnd0cy5t
ayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2Z3dHMvMDAwMS1idWlsZC1kby1ub3QtdXNlLVdlcnJvci5wYXRjaCBiL3BhY2thZ2UvZnd0cy8w
MDAxLWJ1aWxkLWRvLW5vdC11c2UtV2Vycm9yLnBhdGNoCj4gaW5kZXggNzE1YzRmNjNhNS4uYzZh
ODQ1MzdlZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Z3dHMvMDAwMS1idWlsZC1kby1ub3QtdXNl
LVdlcnJvci5wYXRjaAo+ICsrKyBiL3BhY2thZ2UvZnd0cy8wMDAxLWJ1aWxkLWRvLW5vdC11c2Ut
V2Vycm9yLnBhdGNoCj4gQEAgLTEsNCArMSw0IEBACj4gLUZyb20gZTQ4MWMyZjk5MGZmYTcxZjIw
NWQ0YjlkYWYwODIzZTcxMjY5YTdmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbSBm
ZWIwNTI3MWI0ODRiMTU4YzE0NjExODM5Zjk2ODEwOWU5Y2YzMDgyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICBGcm9tOiBFcmljbyBOdW5lcyA8bnVuZXMuZXJpY29AZ21haWwuY29tPgo+ICBE
YXRlOiBGcmksIDEyIEF1ZyAyMDE2IDIzOjExOjU2ICswMjAwCj4gIFN1YmplY3Q6IFtQQVRDSF0g
Znd0czogZG8gbm90IHVzZSAtV2Vycm9yCj4gQEAgLTI1LDcgKzI1LDcgQEAgU2lnbmVkLW9mZi1i
eTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiAgIDQgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ICAKPiAgZGlmZiAt
LWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwo+IC1pbmRleCBmNDBjMzY3OC4uMGZm
NTAyNWIgMTAwNjQ0Cj4gK2luZGV4IGNhMmY1NGUyLi5lZDU4NGFiZiAxMDA2NDQKPiAgLS0tIGEv
Y29uZmlndXJlLmFjCj4gICsrKyBiL2NvbmZpZ3VyZS5hYwo+ICBAQCAtMSw1ICsxLDUgQEAKPiBA
QCAtMzYsMjUgKzM2LDI1IEBAIGluZGV4IGY0MGMzNjc4Li4wZmY1MDI1YiAxMDA2NDQKPiAgIAkg
IEFDX0NBTk9OSUNBTF9IT1NUCj4gICAJICBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCj4gIGRp
ZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KPiAtaW5kZXggY2Rh
YmIzODYuLjdjMmU1NzMwIDEwMDY0NAo+ICtpbmRleCAzYmIzNWU1Yy4uZTlmZTkyZmUgMTAwNjQ0
Cj4gIC0tLSBhL3NyYy9NYWtlZmlsZS5hbQo+ICArKysgYi9zcmMvTWFrZWZpbGUuYW0KPiAtQEAg
LTEyLDcgKzEyLDcgQEAgQU1fQ1BQRkxBR1MgPSBcCj4gLSAJLUkkKHRvcF9zcmNkaXIpL3NyYy9h
Y3BpY2Evc291cmNlL2NvbXBpbGVyCVwKPiArQEAgLTEzLDcgKzEzLDcgQEAgQU1fQ1BQRkxBR1Mg
PSBcCj4gICAJLUkkKHRvcF9zcmNkaXIpL2VmaV9ydW50aW1lCQkJXAo+IC0gCS1wdGhyZWFkIGBw
a2ctY29uZmlnIC0tY2ZsYWdzIGdsaWItMi4wIGdpby0yLjBgIFwKPiArIAktSSQodG9wX3NyY2Rp
cikvc21jY2NfdGVzdAkJCVwKPiArIAktcHRocmVhZAkJCQkJXAo+ICAtCS1XYWxsIC1XZXJyb3Ig
LVdleHRyYQkJCQlcCj4gLSsJLVdhbGwgLVdleHRyYQkJCQkJXAo+ICsrCS1XYWxsIC1XZXh0cmEJ
CQkJXAo+ICAgCS1Xbm8tYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyCQkJXAo+ICAgCS1XZmxvYXQt
ZXF1YWwgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucwkJXAo+ICAgCS1Xbm8tbG9uZy1sb25nIC1XcmVk
dW5kYW50LWRlY2xzIC1Xc2hhZG93CVwKPiAgZGlmZiAtLWdpdCBhL3NyYy9saWIvc3JjL01ha2Vm
aWxlLmFtIGIvc3JjL2xpYi9zcmMvTWFrZWZpbGUuYW0KPiAtaW5kZXggNTVjNTJiNDEuLjUwZWZh
OTdhIDEwMDY0NAo+ICtpbmRleCBkNWQ1M2RkNy4uNzZjNDhkNGQgMTAwNjQ0Cj4gIC0tLSBhL3Ny
Yy9saWIvc3JjL01ha2VmaWxlLmFtCj4gICsrKyBiL3NyYy9saWIvc3JjL01ha2VmaWxlLmFtCj4g
LUBAIC0yNSw3ICsyNSw3IEBAIEFNX0NQUEZMQUdTID0gXAo+IC0gCWBwa2ctY29uZmlnIC0tc2ls
ZW5jZS1lcnJvcnMgLS1jZmxhZ3MganNvbi1jYAlcCj4gLSAJYHBrZy1jb25maWcgLS1jZmxhZ3Mg
Z2xpYi0yLjAgZ2lvLTIuMGAgCQlcCj4gK0BAIC0yMiw3ICsyMiw3IEBAIEFNX0NQUEZMQUdTID0g
XAo+ICsgCS1JJCh0b3Bfc3JjZGlyKS9zcmMvYWNwaWNhL3NvdXJjZS9pbmNsdWRlCVwKPiArIAkt
SSQodG9wX3NyY2Rpcikvc3JjL2FjcGljYS9zb3VyY2UvY29tcGlsZXIJXAo+ICAgCS1EREFUQVJP
T1RESVI9XCIkKGRhdGFyb290ZGlyKVwiCQlcCj4gIC0JLVdhbGwgLVdlcnJvciAtV2V4dHJhCQkJ
CVwKPiAgKwktV2FsbCAtV2V4dHJhCQkJCQlcCj4gQEAgLTYyLDcgKzYyLDcgQEAgaW5kZXggNTVj
NTJiNDEuLjUwZWZhOTdhIDEwMDY0NAo+ICAgCj4gICBwa2dsaWJfTFRMSUJSQVJJRVMgPSBsaWJm
d3RzLmxhCj4gIGRpZmYgLS1naXQgYS9zcmMvdXRpbGl0aWVzL01ha2VmaWxlLmFtIGIvc3JjL3V0
aWxpdGllcy9NYWtlZmlsZS5hbQo+IC1pbmRleCAxZmMwZmMwMi4uNTM2MTRlMzMgMTAwNjQ0Cj4g
K2luZGV4IGRlMzhmMDcwLi43ODU5NzVmZiAxMDA2NDQKPiAgLS0tIGEvc3JjL3V0aWxpdGllcy9N
YWtlZmlsZS5hbQo+ICArKysgYi9zcmMvdXRpbGl0aWVzL01ha2VmaWxlLmFtCj4gIEBAIC0xNiw3
ICsxNiw3IEBACj4gQEAgLTc1LDUgKzc1LDUgQEAgaW5kZXggMWZjMGZjMDIuLjUzNjE0ZTMzIDEw
MDY0NAo+ICAgCj4gICBiaW5fUFJPR1JBTVMgPSBrZXJuZWxzY2FuCj4gIC0tIAo+IC0yLjMwLjIK
PiArMi4zNi4xCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Z3dHMvZnd0cy5oYXNoIGIvcGFj
a2FnZS9md3RzL2Z3dHMuaGFzaAo+IGluZGV4IDg2MzQ5ODBlMDMuLjYxMmJjNzY4ZGQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9md3RzL2Z3dHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZnd0cy9md3Rz
Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBIYXNoIGZyb206IGh0dHA6Ly9md3RzLnVidW50
dS5jb20vcmVsZWFzZS9TSEEyNTZTVU1TCj4gLXNoYTI1NiAgMTdkMWYwYjk2MzllMGY5YjA5MmVk
ODIzM2JlMmQ2M2Q2YzQ0ZWE4ZDJhNzZiZTBmYjU5MDJjYzg2Nzk2MTM3NCAgZnd0cy1WMjEuMTEu
MDAudGFyLmd6Cj4gK3NoYTI1NiAgZmVlMWMzMjNmYjk3MjVjMmI5OWMzNDhjNDM0ZDYzMTk2Mzkx
Y2FkNjY1NjZkMzRiNDI3MDdlNTVkMTRkN2YyNSAgZnd0cy1WMjIuMDkuMDAudGFyLmd6Cj4gIAo+
ICAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQo+ICBzaGEyNTYgIGZiYmVhNzQ4NTU1NjM1ZGQ4Yzdl
NmUyZjk5Y2RkZDc3OGY1ZWUzZjllMzUxMDc3NTE4M2JmOTc5OTA3NmU1ZTUgIGRlYmlhbi9jb3B5
cmlnaHQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9md3RzL2Z3dHMubWsgYi9wYWNrYWdlL2Z3dHMv
Znd0cy5tawo+IGluZGV4IDY2MzRjZGM0MGUuLmIyMDhhYTBjMTQgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9md3RzL2Z3dHMubWsKPiArKysgYi9wYWNrYWdlL2Z3dHMvZnd0cy5tawo+IEBAIC00LDcg
KzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1GV1RTX1ZFUlNJ
T04gPSAyMS4xMS4wMAo+ICtGV1RTX1ZFUlNJT04gPSAyMi4wOS4wMAo+ICBGV1RTX1NPVVJDRSA9
IGZ3dHMtViQoRldUU19WRVJTSU9OKS50YXIuZ3oKPiAgRldUU19TSVRFID0gaHR0cDovL2Z3dHMu
dWJ1bnR1LmNvbS9yZWxlYXNlCj4gIEZXVFNfU1RSSVBfQ09NUE9ORU5UUyA9IDAKPiAtLSAKPiAy
LjM3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0g
Ci4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVt
YmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18g
ICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
