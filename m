Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF408C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 17:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCB880C85;
	Thu, 22 Aug 2024 17:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaqTjjtUYyoK; Thu, 22 Aug 2024 17:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D294F80C7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D294F80C7A;
	Thu, 22 Aug 2024 17:25:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 431F41BF35C
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 17:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C86380C7A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 17:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUNxjmKoIQXY for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 17:25:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A204280C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A204280C60
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A204280C60
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 17:25:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4562813F88D;
 Thu, 22 Aug 2024 19:24:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 22 Aug 2024 19:24:55 +0200
Date: Thu, 22 Aug 2024 19:24:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Message-ID: <Zsd0Z2v3PVmsqeJI@landeda>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee@linaro.org>
 <Zsdfx5CUXg8ARG75@landeda> <871q2gmr3t.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871q2gmr3t.fsf@draig.linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724347499;
 bh=k1BtdAVfeS5gkY7N+tLHCZlKvoOL1RHBWPs4/cMx9Wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZfYF3he9AYj5qxBes3kCfdmg0X/6cZafH4wId2dlrpGwfgRf5BI7oci1syOWB3qy
 Uubd8wB9hTie2KKoLcle6iOMn078QfqgyonDBtvt1klVsHVAHhHzat71iFfevncKA8
 5dK/ji4JMJGlyzWcNfqDVdVvqfq+wYlmE6AQNVTkH1NXI6KbsLWkwOaMpiyLgOw/8o
 NbYbtV63ugD5zHJPNLIqZcj5wVQu6p5CN4McYMNfajHv35ZESCMxLeJLrEYRcVIxze
 3RpFmzUIKyufFsgIr0zzmTiaQrKjX4/R0AVETP38IQESezx01/m4LUVdd8lVT6/TPS
 jC8+m71rDyohg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RZfYF3he
Subject: Re: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleCwgQWxsLAoKT24gMjAyNC0wOC0yMiAxNzo1OCArMDEwMCwgQWxleCBCZW5uw6llIHNwYWtl
IHRodXNseToKPiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cml0
ZXM6Cj4gPiBPbiAyMDI0LTA4LTIyIDE0OjAyICswMTAwLCBBbGV4IEJlbm7DqWUgc3Bha2UgdGh1
c2x5Ogo+ID4+IFdoaWxlIFZpcnRJTyBWZW51cyBzdXBwb3J0IHdlbnQgaW4gZWFybGllciB0aGlz
IGlzIHRoZSBmaXJzdCB2ZXJzaW9uCj4gPj4gdGhhdCBpcyBrbm93biB0byB3b3JrIHdlbGwuCj4g
PiBUaGlzIGNvbW1pdCBsb2cgaXMgY29uZnVzaW5nOiBpdCB0YWxrcyBhYm91dCBWaXJ0SU8gVmVu
dXMsIGJ1dCB0aGVyZSBpcwo+ID4gbm8gc3VjaCBhZGRpdGlvbiBpbiB0aGUgcGF0Y2guCj4gU3Vw
cG9ydCBmb3IgVmlydElPIHZlbnVzIHdhcyBhZGRlZCBpbiBwYXRjaCAxLzQgYnV0IHRlc3Rpbmcg
aGFzIHNob3duIGl0Cj4gbmVlZHMgYXQgbGVhc3QgMjQuMi4wIHRvIHdvcmsgcHJvcGVybHkuCgpP
SywgdGhhbmtzLCBJIHNlZS4KClNvLCBpZiBpdCBuZWVkcyAyNC4yLjAsIG9ubHkgYWRkIGl0IGFm
dGVyIHRoZSBidW1wIHRvIDI0LjIuMDsgdGhlcmUgaXMKbm8gcG9pbnQgaW4gYWRkaW5nIGFuIG9w
dGlvbiBmb3IgYSBmZWF0dXJlIHRoYXQgaXMga25vd24gYnJva2VuIGluCjI0LjAuOS4KCkFsc28s
IHBhdGNoIDEgZG9lcyBub3QgbWVudGlvbiBWZW51cyBhdCBhbGw7IGl0IG1lbnRpb25zIFZpcnRJ
TyBWdWxrYW4sCmFuZCBleGNlcHQgZm9yIGhhdmluZyB0aGUgc2FtZSBmaXJzdCBsZXR0ZXIsIHRo
ZSBjb25uZWN0aW9uIGlzIG5vdApvYnZpb3VzLgoKU28sIGNvdWxkIHlvdSByZXdvcmsgdGhlIHNl
cmllcyBpbiBhIG1vcmUgbG9naWNhbCBvcmRlciwgcG9zc2libHkKc29tZXRoaW5nIGxpa2U6Cgog
ICogMS8zIHBhY2thZ2UvdmttYXJrOiBhZGQgdm1rYXJrIGJlbmNobWFya2luZyB0b29sCiAgKiAy
LzMgcGFja2FnZS9tZXNhM2Q6IGJ1bXAgdG8gMjQuMi4wCiAgKiAzLzMgcGFja2FnZS9tZXNhM2Q6
IGFkZCBvcHRpb24gdG8gZW5hYmxlIFZJUlRJTyB2dWxrYW4gZHJpdmVyCgpBbHNvLCBJIHN1c3Bl
Y3QgdGhlIGZvbGxvd2luZyBwYXRjaCBkb2VzIG5vdCBiZWxvbmcgdG8gdGhlIHNlcmllczsgSQpk
b24ndCBzZWUgaG93IGl0IGlzIHJlbGF0ZWQgdG8gbWVzYTNkIG9yIHRoZSBidW1wIHRoZXJlb2Y6
CgogICogYm9hcmQvcWVtdTogYWRkIHBvc3QtYnVpbGQgc2NyaXB0IHRvIGFhcmNoNjRfdmlydF9k
ZWZjb25maWcKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ID4gSXQgaG93ZXZlciBhZGRzIGEg
ZGVwZW5kZW5jeSBvbgo+ID4gaG9zdC1weXRob24tcHl5YW1sLCBidXQgdGhhdCBpcyBub3QgZXhw
bGFpbmVkLCBhbmQgZG9lcyBub3Qgc2VlbQo+ID4gcmVsYXRlZAo+IAo+IEl0IHdhcyBhIGRlcGVu
ZGVuY3kgSSBuZWVkZWQgdG8gYWRkIHRvIHN1cHBvcnQgdGhlIGJ1aWxkLgo+IAo+ID4gdG8gVmly
dElPIFZlbnVzIGVpdGhlci4uLgo+ID4KPiA+IENvdWxkIHlvdSBjbGFyaWZ5LCBwbGVhc2U/Cj4g
Pgo+ID4gQWxzbywgc2VlIGJlbG93Li4uCj4gPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiA+PiAtLS0KPiA+PiAgcGFja2FnZS9tZXNh
M2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayB8IDIgKy0KPiA+PiAgcGFja2FnZS9tZXNhM2Qv
bWVzYTNkLmhhc2ggICAgICAgICAgICAgICB8IDUgKystLS0KPiA+PiAgcGFja2FnZS9tZXNhM2Qv
bWVzYTNkLm1rICAgICAgICAgICAgICAgICB8IDMgKystCj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rIGIvcGFja2FnZS9tZXNhM2Qt
aGVhZGVycy9tZXNhM2QtaGVhZGVycy5tawo+ID4+IGluZGV4IDMzYzYwYjI4NWYuLjk4YWZiNzdh
OWMgMTAwNjQ0Cj4gPj4gLS0tIGEvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVy
cy5tawo+ID4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNkLWhlYWRlcnMubWsK
PiA+PiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+ID4+ICAKPiA+PiAgIyBOb3QgcG9zc2libGUg
dG8gZGlyZWN0bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVjYXVzZSBvZgo+ID4+ICAj
IGZpcnN0L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KPiA+PiAtTUVTQTNEX0hFQURFUlNf
VkVSU0lPTiA9IDI0LjAuOQo+ID4+ICtNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjQuMi4wCj4g
Pj4gIE1FU0EzRF9IRUFERVJTX1NPVVJDRSA9IG1lc2EtJChNRVNBM0RfSEVBREVSU19WRVJTSU9O
KS50YXIueHoKPiA+PiAgTUVTQTNEX0hFQURFUlNfU0lURSA9IGh0dHBzOi8vYXJjaGl2ZS5tZXNh
M2Qub3JnCj4gPj4gIE1FU0EzRF9IRUFERVJTX0RMX1NVQkRJUiA9IG1lc2EzZAo+ID4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBiL3BhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5oYXNoCj4gPj4gaW5kZXggZDUwNmQzOThiOC4uMWZmMTFmOWJkOCAxMDA2NDQKPiA+PiAtLS0g
YS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaAo+ID4+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5oYXNoCj4gPj4gQEAgLTEsNSArMSw0IEBACj4gPj4gLSMgRnJvbSBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjQtSnVuZS8wMDA3NjQu
aHRtbAo+ID4+IC1zaGEyNTYgIDUxYWE2ODZjYTQwNjBlMzg3MTFhOWU4ZjYwYzhmMWVmYWE1MTZi
YWY0MTE5NDZlZDdmMmMyNjVjZDU4MmNhNGMgIG1lc2EtMjQuMC45LnRhci54ego+ID4+IC1zaGE1
MTIgIGRlMmVlNmM5ZGYxZmMxMDZlZTEwYmVmZTBhNzZiZTFlOWNmZTgzZDY1ZGJkYjgzYmFkNmQ4
ZDdjZmFhMDg1MjMyZmIxMTUyOTNhMWE3OTBiMzdiNTBiMWZlMTRiZDU4YWFmYmNmZTVhMTVlOTUz
YjU5MDFhNzEwNWQ1NzU2OWE1ICBtZXNhLTI0LjAuOS50YXIueHoKPiA+PiArIyBGcm9tIGh0dHBz
Oi8vZG9jcy5tZXNhM2Qub3JnL3JlbG5vdGVzLzI0LjIuMC5odG1sCj4gPj4gK3NoYTI1NiAgYzAy
YmI3MmNlYTI5MGY3OGIxMTg5NWEwYzk1YzdjOTIzOTRmMTgwZDdmZjY2ZDRhNzYyZWM2OTUwYTU4
YWRkZiAgbWVzYS0yNC4yLjAudGFyLnh6Cj4gPgo+ID4gVGhlcmUgcHJldmlvdXNseSB3YXMgc2hh
MjU2IF9hbmRfIHNoYTUxMiBoYXNoZXMsIGJ1dCBub3cgeW91IG9ubHkgYWRkIGEKPiA+IHNoYTI1
NiBvbmUuIENhbiB5b3UgZXh0ZW5kIGEgbGl0dGxlIGJsdXJiIGFib3V0IHRoYXQsIHBsZWFzZT8K
PiAKPiBTdXJlIC0gb25seSB0aGUgc2hhMjU2IHdhcyBpbiB0aGUgcmVsYXNlIGFubm91bmNlbWVu
dC4gSSBjb3VsZCBjYWxjdWxhdGUKPiBvbmUgaWYgeW91IHdhbnQ/Cj4gCj4gPgo+ID4gUmVnYXJk
cywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPgo+ID4+ICAjIExpY2Vuc2UKPiA+PiAgc2hhMjU2ICBh
MDAyNzVhNTMxNzhlMjY0NWZiNjViZTk5YTc4NWMxMTA1MTM0NDZhNTA3MWZmMmM2OThlZDI2MGFk
OTE3ZDc1ICBkb2NzL2xpY2Vuc2UucnN0Cj4gPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNk
L21lc2EzZC5tayBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+ID4+IGluZGV4IGQzYjUwMTA2
NDguLjI5ZjI2YzU2NjMgMTAwNjQ0Cj4gPj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1r
Cj4gPj4gKysrIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4gPj4gQEAgLTUsNyArNSw3IEBA
Cj4gPj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPj4gIAo+ID4+ICAjIFdoZW4gdXBkYXRp
bmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwo+ID4+IC1N
RVNBM0RfVkVSU0lPTiA9IDI0LjAuOQo+ID4+ICtNRVNBM0RfVkVSU0lPTiA9IDI0LjIuMAo+ID4+
ICBNRVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9WRVJTSU9OKS50YXIueHoKPiA+PiAgTUVT
QTNEX1NJVEUgPSBodHRwczovL2FyY2hpdmUubWVzYTNkLm9yZwo+ID4+ICBNRVNBM0RfTElDRU5T
RSA9IE1JVCwgU0dJLCBLaHJvbm9zCj4gPj4gQEAgLTIxLDYgKzIxLDcgQEAgTUVTQTNEX0RFUEVO
REVOQ0lFUyA9IFwKPiA+PiAgCWhvc3QtYmlzb24gXAo+ID4+ICAJaG9zdC1mbGV4IFwKPiA+PiAg
CWhvc3QtcHl0aG9uLW1ha28gXAo+ID4+ICsJaG9zdC1weXRob24tcHl5YW1sIFwKPiA+PiAgCWV4
cGF0IFwKPiA+PiAgCWxpYmRybSBcCj4gPj4gIAl6bGliCj4gPj4gLS0gCj4gPj4gMi4zOS4yCj4g
Pj4gCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiA+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKPiAKPiAtLSAKPiBBbGV4IEJlbm7DqWUKPiBWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBM
aW5hcm8KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
