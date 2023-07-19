Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4882C0015E
	for <buildroot@archiver.kernel.org>; Wed, 19 Jul 2023 22:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D17A404B4;
	Wed, 19 Jul 2023 22:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D17A404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mqi2c4lqp_-0; Wed, 19 Jul 2023 22:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DD624063C;
	Wed, 19 Jul 2023 22:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD624063C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B23D41BF34E
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AC1080B34
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 22:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AC1080B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYliPrfsNCYG for <buildroot@lists.busybox.net>;
 Wed, 19 Jul 2023 22:01:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC93680B22
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 22:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC93680B22
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A76BB13F8AA;
 Thu, 20 Jul 2023 00:01:32 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60844])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Jul 2023 00:01:32 +0200
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 00:01:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
References: <20230530200728.12239-1-ju.o@free.fr> <ZHicLZXBbEKasztN@debian>
 <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
User-Agent: Webmail Free/1.6.1
Message-ID: <fc5db520f19d5bcdca9faba0b9be88fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689804094;
 bh=PedJGG3a2cmkcsKlb2UNaiIc/Wqpy4p+v/AU4Wziavo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rlH5Uv+zlQW+2aoMekDHqLKLZGg6kKwUlDw1OZcFomEVPJtk/aL8NDPZX6srS1GtZ
 0GDS+OPbpP+QyPkjGUYpbFov0JQlw+bAo9zElaPBxzkB3bpB79cGcKUaz8oRvR1iJs
 iWcsnNqws1HR1zab2JKUqz90OpmUDPiSZbJKCUuldG/Hv238cG/k56dHl2HwqKrjHd
 6eMpowaK8wGZQ8x/Ke/xsuXLIMljA8Xgwv7eUQSoRFE8m6u/iAkz5/gfmVsQoVGLiB
 GKSgA8+AK6G4p/xiXvGRDfm7O46g43BhUmeTboOqeBj7ylZqpSyQsp1vftOVomobTc
 G991WcUnr84FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rlH5Uv+z
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwsCgpPbiAxOC8wNy8yMDIzIDIzOjU3LCBSb21haW4gTmFvdXIgd3JvdGU6
Cj4gSGVsbG8gSnVsaWVuLCBWaW5jZW50LCBBbGwsCj4gCj4gTGUgMDEvMDYvMjAyMyDDoCAxNToy
NSwgVmluY2VudCBTdGVobMOpIGEgw6ljcml0wqA6Cj4+IE9uIFR1ZSwgTWF5IDMwLCAyMDIzIGF0
IDEwOjA3OjI2UE0gKzAyMDAsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+Pj4gRm9yIGNoYW5nZSBs
b2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjIwOCwgc2VlOgo+Pj4gLSBodHRwczovL2dp
dGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvcmVsZWFzZXMvdGFnL2VkazItc3RhYmxlMjAyMjExCj4+
PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1z
dGFibGUyMDIzMDIKPj4+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVh
c2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwNQo+Pj4gCj4+PiBUaGUgbWFpbiBtb3RpdmF0aW9uIG9m
IHRoaXMgYnVtcCBpcyB0aGUgUklTQy1WIFFFTVUgVmlydCBzdXBwb3J0Cj4+PiBpbnRyb2R1Y2Vk
IGluIGVkazItc3RhYmxlMjAyMzAyIChub3QgeWV0IHN1cHBvcnRlZCBpbiBCdWlsZHJvb3QpLgo+
Pj4gCj4+PiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgo+Pj4gQ2M6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+PiAtLS0KPj4+IFBhdGNoIHNlcmllcyB0ZXN0ZWQg
b24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgYzc2NWFjOSB3aXRoIGNvbW1hbmRzOgo+Pj4gCj4+
PiAgICAgdXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKPj4+ICAgICAuLi4KPj4+
ICAgICAwIHdhcm5pbmdzIGdlbmVyYXRlZAo+Pj4gCj4+PiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1
bi10ZXN0cyBcCj4+PiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+Pj4gICAgICAg
ICB0ZXN0cy5ib290LnRlc3RfZWRrMgo+Pj4gICAgIC4uLgo+Pj4gICAgIE9LCj4+PiAKPj4+ICAg
ICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+Pj4gICAgIG1ha2UKPj4+ICAgICAu
Li4KPj4+ICAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKPj4+ICAgICAuLi4KPj4+ICAg
ICBidWlsZHJvb3QgbG9naW46Cj4+IAo+PiBIaSBKdWxpZW4sCj4+IAo+PiBUaGFua3MgZm9yIHRo
b3NlIHBhdGNoZXMhCj4+IAo+PiBJIGRpZCB0ZXN0IHRoZSBmb2xsb3dpbmcgb24gbXkgc2lkZSB3
aXRob3V0IGlzc3VlOgo+PiAKPj4gICBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPj4gICB0
ZXN0cy5ib290LnRlc3RfZWRrMi5UZXN0RWRrMgo+PiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRl
c3RHcnViQUFyY2g2NEVGSQo+PiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViWDg2NjRF
RkkKPj4gICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YmkzODZFRkkKPj4gICB0ZXN0cy5m
cy50ZXN0X2lzbzk2NjAuVGVzdElzbzk2NjBHcnViMkVGSQo+PiAgIHRlc3RzLmZzLnRlc3RfaXNv
OTY2MC5UZXN0SXNvOTY2MEdydWIySHlicmlkCj4gCj4gVGhhbmtzIGZvciB0ZXN0aW5nIGJ1dCBz
b21lIHRlc3QgaW4gZ2l0bGFiLWNpIGRvZXNuJ3QgYm9vdCBzaW5jZSB0aGlzIAo+IHBhdGNoIGhh
cwo+IGJlZW4gYXBwbGllZDoKPiAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzQ2NjQ4NDU4NjUKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ2NjQ4NDU4NjEKPiBodHRwczovL2dpdGxhYi5jb20vYnVp
bGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ2NjQ4NDU3NzcKPiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ2NjQ4NDU3NzMKPiAKPiAiU3lzdGVt
RXJyb3I6IFN5c3RlbSBkb2VzIG5vdCBib290Igo+IAo+IEkgcmVwcm9kdWNlZCBsb2NhbGx5IHdp
dGggInRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViWDg2NjRFRkkiIHRoZW4gCj4gSQo+IHJl
dmVydGVkIHRoaXMgY29tbWl0IHRvIGJvb3QgY29ycmVjdGx5Lgo+IAo+IFRoZXJlIGlzIG5vIHVz
ZWZ1bCBsb2csIHRoZSBpbWFnZSBqdXN0IGhhbmcuCj4gCj4gQ2FuIHlvdSBoYXZlIGEgbG9vaz8K
CkJlZm9yZSBzZW5kaW5nIHRoaXMgcGF0Y2gsIEkgaW5pdGlhbGx5IHN1Y2Nlc3NmdWxseSByYW4g
dGhvc2UgdGVzdHMKdXNpbmcgYSBxZW11IGF0IHY4LjAuMCAoMjAyMy0wNC0xOSksIHNhbWUgYXMg
QnVpbGRyb290IGhvc3QtcWVtdSBhdAp0aGF0IHRpbWUuCgpJIG5vdyByZXByb2R1Y2UgdGhvc2Ug
aXNzdWVzIHdpdGggdGhlIEJ1aWxkcm9vdCBkb2NrZXIgaW1hZ2UgdXNpbmcKdXRpbHMvZG9ja2Vy
LXJ1biwgd2hpY2ggaW5jbHVkZXMgcWVtdSB2NS4yLjAgKDIwMjAtMTItMDgpLgoKQWZ0ZXIgYmlz
ZWN0aW5nLCBJIGZvdW5kIHRoYXQgcWVtdSBjb21taXQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11
LXByb2plY3QvcWVtdS8tL2NvbW1pdC82YTNhYTAxNGM1NDUzNWQwYWM2NzUxNmIxMGVhMTc3Nzhi
YmFmZmZkCmZpeGVzIHRob3NlIGlzc3Vlcy4gSXQncyBpbmNsdWRlZCBpbiBRRW11IHY3LjIuMSAo
MjAyMy0wNC0wNSkuIFdoZW4KdXNpbmcgYSBRRW11IHZlcnNpb24gaW5jbHVkaW5nIHRoaXMgY29t
bWl0LCB0aGUgdGVzdCB3b3Jrcy4KClVwZGF0aW5nIHN1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUg
dG8gdXNlCiJGUk9NIGRlYmlhbjpib29rd29ybS0yMDIzMDcwMyIgYWxzbyBmaXhlcyB0aG9zZSB0
ZXN0cywgYXMgaXQgaW5jbHVkZXMKcWVtdS1zeXN0ZW0teDg2XzY0IHY3LjIuMiAoMjAyMy0wNC0y
MykuCgpJIGJlbGlldmUgZWRrMi1zdGFibGUyMDIzMDUgaXMgY29ycmVjdCBhbmQgdGhlIGlzc3Vl
IGlzIG1vcmUgb24gdGhlCnFlbXUgNS4yLjAgc2lkZSwgaW5jbHVkZWQgaW4gdGhlIEJ1aWxkcm9v
dCBEb2NrZXIgaW1hZ2UuCgpJJ20gbm90IHN1cmUgaWYgaXQncyB0aGUgcmlnaHQgdGltZSB0byB1
cGRhdGUgdGhlIEJ1aWxkcm9vdCBEb2NrZXIKaW1hZ2UgZnJvbSBEZWJpYW4gMTEgdG8gMTIuIEkg
YWxzbyBkaWQgbm90IHRlc3RlZCB3aGF0IG90aGVyIGlzc3VlcwpzdWNoIGFuIHVwZGF0ZSB3b3Vs
ZCBpbnRyb2R1Y2UuCgpTbyB0aGUgb3B0aW9ucyBJIHNlZSByaWdodCBub3cgYXJlOgoKMS4gZGlz
YWJsZSB0aGUgdGVzdCB1bnRpbCB0aGUgQnVpbGRyb290IERvY2tlciBpbWFnZSBpcwp1cGRhdGVk
LAoKMi4gb3IgZGlyZWN0bHkgdXBkYXRlIHRoZSBEb2NrZXIgaW1hZ2Ugc29vbiwKCjMuIG9yIHdl
IGNvdWxkIGV2ZW50dWFsbHkgaW52ZXN0aWdhdGUgdG8gcGF0Y2ggZWRrMiB0byBhdm9pZAp0cmln
Z2VyaW5nIHRoaXMgaXNzdWUuCgpBbnkgY29tbWVudHMgb3Igc3VnZ2VzdGlvbnM/CgpCZXN0IHJl
Z2FyZHMsCgpKdWxpZW4uCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+IAo+
PiBGZWVsIGZyZWUgdG8gYWRkIChvciBub3QpOgo+PiAKPj4gICBUZXN0ZWQtYnk6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiAKPiAKPiAKPj4gCj4+IEJlc3QgcmVn
YXJkcywKPj4gVmluY2VudC4KPj4gCj4+PiAtLS0KPj4+ICBib290L2VkazIvZWRrMi5oYXNoIHwg
MiArLQo+Pj4gIGJvb3QvZWRrMi9lZGsyLm1rICAgfCAyICstCj4+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9i
b290L2VkazIvZWRrMi5oYXNoIGIvYm9vdC9lZGsyL2VkazIuaGFzaAo+Pj4gaW5kZXggOTRlZTIy
ZGRjNC4uMzRkNGIxMGUyOSAxMDA2NDQKPj4+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+
ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+IEBAIC0xLDMgKzEsMyBAQAo+Pj4gICMgTG9j
YWxseSBjYWxjdWxhdGVkCj4+PiAtc2hhMjU2ICAKPj4+IGMxMDUyMGYyNjk1NTdkNTY2ZTM1ZmU4
MTA0MTQxYWEyODY1ZjkwODVhZDJiM2EzMGFhZThhN2U3OGEzY2E1YWEgIAo+Pj4gZWRrMi1lZGsy
LXN0YWJsZTIwMjIwOC1icjEudGFyLmd6Cj4+PiArc2hhMjU2ICAKPj4+IGNhNTUzNTE5MTNlNjI1
OGViZDhjMDgxMDZmMzY5YWM3MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5NDAgIAo+Pj4g
ZWRrMi1lZGsyLXN0YWJsZTIwMjMwNS1icjEudGFyLmd6Cj4+PiAgc2hhMjU2ICAKPj4+IDUwY2Uy
MGM5Y2ZkYjBlMTllZTM0ZmUwYTUxZmMwYWZlOTYxZjc0MzY5N2IwNjgzNTlhYjJmODYyYjQ5NGRm
ODAgIAo+Pj4gTGljZW5zZS50eHQKPj4+IGRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5tayBi
L2Jvb3QvZWRrMi9lZGsyLm1rCj4+PiBpbmRleCBmYjZiOWEzMjgwLi4zOTliZDM0NmVmIDEwMDY0
NAo+Pj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKPj4+ICsrKyBiL2Jvb3QvZWRrMi9lZGsyLm1r
Cj4+PiBAQCAtNCw3ICs0LDcgQEAKPj4+ICAjCj4+PiAgCj4+PiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+Pj4gCj4+PiAtRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDIyMDgKPj4+ICtFREsy
X1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjMwNQo+Pj4gIEVESzJfU0lURSA9IGh0dHBzOi8vZ2l0
aHViLmNvbS90aWFub2NvcmUvZWRrMgo+Pj4gIEVESzJfU0lURV9NRVRIT0QgPSBnaXQKPj4+ICBF
REsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4+PiAtLQo+Pj4gMi40MC4xCj4+PiAK
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
