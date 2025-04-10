Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA20C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D5C340B76;
	Thu, 10 Apr 2025 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkabwWBjs0-h; Thu, 10 Apr 2025 19:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB2A40864
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB2A40864;
	Thu, 10 Apr 2025 19:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F36108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54BB6605D4
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GodXCRS1AO30 for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8956560903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8956560903
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8956560903
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:54:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 418D178032A;
 Thu, 10 Apr 2025 21:54:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Apr 2025 21:54:41 +0200
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 21:54:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Sergey
 Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250410121450.1371559-1-vincent.stehle@arm.com>
References: <20250410121450.1371559-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a90dacbb25abd27002f06abf4d0784d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744314884;
 bh=svNQiZLITj+HKUoTntBBrBRuMKg7kwt1uNsXZw5MQL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RolfpXTcbcyLrDc3XmyfRB9XqJxYhhNewSQClQQlA7HNMPCO5Mp7LtqGTkuQDdjra
 +T8bxwT8IynNKDkQ8+b6+W6bOeUoRcuF56DIbG7NtPqxVKHDmfiXBVjEMCQ5eVYfZN
 8OXKS9cdK83d2E1rkS1tr10QRBJhxT3B9+uNF4N6O8vZOxvh4v0zYmQXNaYzLEHDPP
 3gkLHXMeavWAhL5DFjJQkBX29YnFR6tsIcHgzHzX+leINwZ5k0qp7ktYIciU+7y3ej
 ODOR2OzqqWUQrH6CWdnaLprILyKcblGLBauJTPyNbGAunguQ7HcJVg2u1k1yoVwZUI
 M3Bfat5uQI5Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RolfpXTc
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the build
 for macchiatobin
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoIQoKSSBoYXZlIGEgbWlub3IgY2hh
bmdlIHJlcXVlc3QuIFNlZSBiZWxvdy4KCk9uIDEwLzA0LzIwMjUgMTQ6MTQsIFZpbmNlbnQgU3Rl
aGzDqSB3cm90ZToKPiBXaGVuIEJ1aWxkaW5nIGFybS10cnVzdGVkLWZpcm13YXJlIGZvciB0aGUg
TWFjY2hpYXRvYmluIHBsYXRmb3JtCj4gKGE4MHgwX21jYmluKSwgd2hpY2ggZGVwZW5kcyBvbiB0
aGUgbXYtZGRyLW1hcnZlbGwgcGFja2FnZSwgdGhlIGJ1aWxkIAo+IGZhaWxzCj4gY29tcGxhaW5p
bmcgdGhhdCB0aGlzIHBhY2thZ2UncyBmb2xkZXIgImRvZXMgbm90IGNvbnRhaW4gdmFsaWQKPiBt
di1kZHItbWFydmVsbCBnaXQgcmVwb3NpdG9yeSIuCj4gVGhpcyBpcyBleHBlY3RlZCB1bmRlciBC
dWlsZHJvb3QsIHdoZXJlIHdlIHVzZSBpbnRlcm1lZGlhdGUgYXJjaGl2ZXMuCj4gCj4gQWRkIHBh
dGNoZXMgdG8gZml4IHRoZSBidWlsZCBmb3IgdGhpcyBwbGF0Zm9ybSwgZm9yIGEgZmV3IHZlcnNp
b25zIG9mIAo+IFRGLUEKPiAodjIuNiwgdjIuNywgdjIuOCwgbHRzLXYyLjguMjAsIHYyLjksIHYy
LjEwLCBsdHMtdjIuMTAuNSwgdjIuMTEsIHYyLjEyIAo+IGFuZAo+IGx0cy12Mi4xMi4xKS4KPiBB
ZGQgdGhlIGNvcnJlc3BvbmRpbmcgZW50cmllcyB0byAuY2hlY2twYWNrYWdlaWdub3JlLCBhcyB0
aG9zZSBwYXRjaGVzIAo+IGhhdmUKPiBubyB1cHN0cmVhbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IERpY2sgT2xzc29u
IDxoaUBzZW56aWxsYS5pbz4KPiBDYzogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRzaUBnbWFp
bC5jb20+Cj4gLS0tCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBi
Ly5jaGVja3BhY2thZ2VpZ25vcmUKPiBpbmRleCAxYTYxYWExYWMwLi44YTU5ZjEyZjVlIDEwMDY0
NAo+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPiArKysgYi8uY2hlY2twYWNrYWdlaWdub3Jl
Cj4gQEAgLTg1LDYgKzg1LDE2IEBAIGJvYXJkL3RlY2hub2xvZ2ljL3RzNDkwMC9wb3N0LWltYWdl
LnNoIFNoZWxsY2hlY2sKPiAgYm9hcmQvdG9yYWRleC9hcGFsaXMtaW14Ni9wb3N0LWltYWdlLnNo
IFNoZWxsY2hlY2sKPiAgYm9hcmQvdWRvby9jb21tb24vcG9zdC1idWlsZC5zaCBTaGVsbGNoZWNr
Cj4gIGJvb3QvYWZib290LXN0bTMyLzAwMDMtTWFrZWZpbGUtZGlzYWJsZS1zdGFjay1wcm90ZWN0
b3IucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gK2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdh
cmUvbHRzLXYyLjEwLjUvMDAwMS1idWlsZC1wbGF0LW1hcnZlbGwtYWxsb3ctYnVpbGRpbmctd2l0
aC1ub24tZ2l0LW12LWRkLnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICtib290L2FybS10
cnVzdGVkLWZpcm13YXJlL2x0cy12Mi4xMi4xLzAwMDEtYnVpbGQtcGxhdC1tYXJ2ZWxsLWFsbG93
LWJ1aWxkaW5nLXdpdGgtbm9uLWdpdC1tdi1kZC5wYXRjaCAKPiBsaWJfcGF0Y2guVXBzdHJlYW0K
PiArYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9sdHMtdjIuOC4yMC8wMDAyLWJ1aWxkLXBsYXQt
bWFydmVsbC1hbGxvdy1idWlsZGluZy13aXRoLW5vbi1naXQtbXYtZGQucGF0Y2ggCj4gbGliX3Bh
dGNoLlVwc3RyZWFtCj4gK2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvdjIuMTAvMDAwMS1idWls
ZC1wbGF0LW1hcnZlbGwtYWxsb3ctYnVpbGRpbmctd2l0aC1ub24tZ2l0LW12LWRkLnBhdGNoIAo+
IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICtib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjExLzAw
MDEtYnVpbGQtcGxhdC1tYXJ2ZWxsLWFsbG93LWJ1aWxkaW5nLXdpdGgtbm9uLWdpdC1tdi1kZC5w
YXRjaCAKPiBsaWJfcGF0Y2guVXBzdHJlYW0KPiArYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS92
Mi4xMi8wMDAxLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxvdy1idWlsZGluZy13aXRoLW5vbi1naXQt
bXYtZGQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gK2Jvb3QvYXJtLXRydXN0ZWQtZmly
bXdhcmUvdjIuNi8wMDAyLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxvdy1idWlsZGluZy13aXRoLW5v
bi1naXQtbXYtZGQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gK2Jvb3QvYXJtLXRydXN0
ZWQtZmlybXdhcmUvdjIuNy8wMDAyLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxvdy1idWlsZGluZy13
aXRoLW5vbi1naXQtbXYtZGQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gK2Jvb3QvYXJt
LXRydXN0ZWQtZmlybXdhcmUvdjIuOC8wMDAzLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxvdy1idWls
ZGluZy13aXRoLW5vbi1naXQtbXYtZGQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gK2Jv
b3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvdjIuOS8wMDAyLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxv
dy1idWlsZGluZy13aXRoLW5vbi1naXQtbXYtZGQucGF0Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFt
CgpDb3VsZCB5b3UgcmVtb3ZlIHRob3NlIGV4Y2x1c2lvbiBsaW5lcyBpbiAuY2hlY2twYWNrYWdl
aWdub3JlLiBUaGUgCmludGVudCBvZiB0aGlzCmZpbGUgaXMgdG8gZXhjbHVkZSB0aGUgY2hlY2sg
b2xkIHBhdGNoZXMgd2l0aG91dCB0aGlzICJVcHN0cmVhbToiIHRhZy4gClRoaXMgdGFnIGNhbgph
bHNvIGJlIHVzZWQgdG8gY2FwdHVyZSB0aGUgcmVhc29uIHdoeSBhIHBhdGNoIHdhcyBub3QgcHJv
cG9zZWQgCnVwc3RyZWFtLiBIZXJlCnRoZSByZWFzb24gaXMgc2ltcGx5IGJlY2F1c2UgaXQgaXMg
c3BlY2lmaWMgdG8gQnVpbGRyb290LgoKPiAgCj4gYm9vdC9vcHRlZS1vcy8zLjEzLjAvMDAwMS1j
b3JlLXpsaWItZml4LWJ1aWxkLXdhcm5pbmctd2hlbi1fTEZTNjRfTEFSR0VGSUxFLWlzLnBhdGNo
IAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBib290L3N5c2xpbnV4LzAwMDEtYmlvcy1GaXgtYWxp
Z25tZW50LWNoYW5nZS13aXRoLWdjYy01LnBhdGNoIAo+IGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBi
b290L3N5c2xpbnV4LzAwMDItRGlzYWJsZS1QSUUtdG8tYXZvaWQtRlRCRlMtb24tYW1kNjQucGF0
Y2ggCj4gbGliX3BhdGNoLlVwc3RyZWFtCj4gZGlmZiAtLWdpdCAKPiBhL2Jvb3QvYXJtLXRydXN0
ZWQtZmlybXdhcmUvbHRzLXYyLjEwLjUvMDAwMS1idWlsZC1wbGF0LW1hcnZlbGwtYWxsb3ctYnVp
bGRpbmctd2l0aC1ub24tZ2l0LW12LWRkLnBhdGNoIAo+IGIvYm9vdC9hcm0tdHJ1c3RlZC1maXJt
d2FyZS9sdHMtdjIuMTAuNS8wMDAxLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxvdy1idWlsZGluZy13
aXRoLW5vbi1naXQtbXYtZGQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjhiYjFlZDU5ZTEKPiAtLS0gL2Rldi9udWxsCj4gKysrIAo+IGIvYm9vdC9hcm0t
dHJ1c3RlZC1maXJtd2FyZS9sdHMtdjIuMTAuNS8wMDAxLWJ1aWxkLXBsYXQtbWFydmVsbC1hbGxv
dy1idWlsZGluZy13aXRoLW5vbi1naXQtbXYtZGQucGF0Y2gKPiBAQCAtMCwwICsxLDMzIEBACj4g
K0Zyb20gNzBiZTkyNzJkOGQ4YjhlMjA1ZmM2MGI0MTcwNGQ0NzBhNjc5OGUzNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9VVEYtOD9xP1ZpbmNlbnQ9MjBTdGVobD1DMz1BOT89
IDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+ICtEYXRlOiBUdWUsIDggQXByIDIwMjUgMTM6Mjc6
NTMgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBidWlsZChwbGF0L21hcnZlbGwpOiBhbGxvdyBi
dWlsZGluZyB3aXRoIG5vbi1naXQKPiArIG12LWRkci1tYXJ2ZWxsCj4gK01JTUUtVmVyc2lvbjog
MS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50
LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtXaGVuIHRoZSBtdi1kZHItbWFydmVsbCBm
b2xkZXIgaXMgbm90IGEgZ2l0IHRyZWUgdGhlIGJ1aWxkIGZhaWxzCj4gK2NvbXBsYWluaW5nIHRo
YXQgaXQgImRvZXMgbm90IGNvbnRhaW4gdmFsaWQgbXYtZGRyLW1hcnZlbGwgZ2l0Cj4gK3JlcG9z
aXRvcnkiLgo+ICsKPiArUmVtb3ZlIHRoaXMgY2hlY2sgdG8gYWxsb3cgYnVpbGRpbmcgaW4gQnVp
bGRyb290Lgo+ICsKCkhlcmUsIGNvdWxkIHlvdSBhZGQgZm9yIGV4YW1wbGU6CgpVcHN0cmVhbTog
Tm90IGFwcGxpY2FibGUuIEJ1aWxkcm9vdCBzcGVjaWZpYy4KCj4gK1NpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KCkNvdWxkIHlvdSBhZGQgdGhp
cyB0YWcgb24gYWxsIHBhdGNoZXMsIGFuZCBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbiAKcGxlYXNl
PwoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
