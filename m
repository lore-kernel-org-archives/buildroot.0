Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF71EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5EE402AF;
	Fri, 21 Jul 2023 20:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5EE402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUni3B3--u9w; Fri, 21 Jul 2023 20:07:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01DE640345;
	Fri, 21 Jul 2023 20:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DE640345
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD1131BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B38AB83AD1
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B38AB83AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpmAf3chiwpz for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:07:29 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 057C5832D8
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057C5832D8
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B41C2780344;
 Fri, 21 Jul 2023 22:07:23 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33976])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Jul 2023 22:07:23 +0200
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 22:07:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <b9712883-e531-8328-6849-af2ee16237ab@smile.fr>
References: <20230530200728.12239-1-ju.o@free.fr> <ZHicLZXBbEKasztN@debian>
 <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
 <b9712883-e531-8328-6849-af2ee16237ab@smile.fr>
User-Agent: Webmail Free/1.6.1
Message-ID: <5a7282b076cf63de2869b76af55be5ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689970045;
 bh=8xdUr4ETs42x1DRr6lEXEDYEvt3m32TlU80p8tXiXTQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IGRZie/opp1tlYKgjAFmc+b7JVRkPi3J/znhOn5GSdq9VATN1oXrP4SsBRFdVCoXW
 Ip3UEO18u925hb4wYt5aeHg+Bpp+fAhQ258+etgS+Vx/QrpDNhIGyeE/JLE2TVkOG9
 eBDuzNF2ci2om51hjlHYUBoO/wcBewxUjmXUDP3M2bUHSqLBShxJ2d0J03j6BLpMnP
 5wZSSiWfbieR+DB43Bc23/sw9/V5yTs+v+rlui/JIzB5MNfqDCINi+ps9v2FWRoN7l
 0pBT60A5JE8bMTtzZ67YpYEycjCzeygaQxGe9ewpXhcvT7IVhotqFBbZWAtpJiiRjU
 8wTGSiy0dD3WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IGRZie/o
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

SGkgUm9tYWluLAoKT24gMTkvMDcvMjAyMyAyMzo0NiwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwgVmluY2VudCwgQWxsLAo+IAo+IExlIDE4LzA3LzIwMjMgw6AgMjM6NTcsIFJv
bWFpbiBOYW91ciBhIMOpY3JpdMKgOgo+PiBIZWxsbyBKdWxpZW4sIFZpbmNlbnQsIEFsbCwKPj4g
Cj4+IExlIDAxLzA2LzIwMjMgw6AgMTU6MjUsIFZpbmNlbnQgU3RlaGzDqSBhIMOpY3JpdMKgOgo+
Pj4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6MDc6MjZQTSArMDIwMCwgSnVsaWVuIE9saXZh
aW4gd3JvdGU6Cj4+Pj4gRm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIw
MjIwOCwgc2VlOgo+Pj4+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVh
c2VzL3RhZy9lZGsyLXN0YWJsZTIwMjIxMQo+Pj4+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5v
Y29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwMgo+Pj4+IC0gaHR0cHM6Ly9n
aXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjMwNQo+
Pj4+IAo+Pj4+IFRoZSBtYWluIG1vdGl2YXRpb24gb2YgdGhpcyBidW1wIGlzIHRoZSBSSVNDLVYg
UUVNVSBWaXJ0IHN1cHBvcnQKPj4+PiBpbnRyb2R1Y2VkIGluIGVkazItc3RhYmxlMjAyMzAyIChu
b3QgeWV0IHN1cHBvcnRlZCBpbiBCdWlsZHJvb3QpLgo+Pj4+IAo+Pj4+IENjOiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+Cj4+Pj4gQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVo
bGVAYXJtLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVl
LmZyPgo+Pj4+IC0tLQo+Pj4+IFBhdGNoIHNlcmllcyB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBh
dCBjb21taXQgYzc2NWFjOSB3aXRoIAo+Pj4+IGNvbW1hbmRzOgo+Pj4+IAo+Pj4+ICAgICB1dGls
cy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQo+Pj4+ICAgICAuLi4KPj4+PiAgICAgMCB3
YXJuaW5ncyBnZW5lcmF0ZWQKPj4+PiAKPj4+PiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0
cyBcCj4+Pj4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9sZGVyIFwKPj4+PiAgICAgICAgIHRl
c3RzLmJvb3QudGVzdF9lZGsyCj4+Pj4gICAgIC4uLgo+Pj4+ICAgICBPSwo+Pj4+IAo+Pj4+ICAg
ICBtYWtlIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+Pj4+ICAgICBtYWtlCj4+Pj4gICAg
IC4uLgo+Pj4+ICAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKPj4+PiAgICAgLi4uCj4+
Pj4gICAgIGJ1aWxkcm9vdCBsb2dpbjoKPj4+IAo+Pj4gSGkgSnVsaWVuLAo+Pj4gCj4+PiBUaGFu
a3MgZm9yIHRob3NlIHBhdGNoZXMhCj4+PiAKPj4+IEkgZGlkIHRlc3QgdGhlIGZvbGxvd2luZyBv
biBteSBzaWRlIHdpdGhvdXQgaXNzdWU6Cj4+PiAKPj4+ICAgcWVtdV9hYXJjaDY0X3Nic2FfZGVm
Y29uZmlnCj4+PiAgIHRlc3RzLmJvb3QudGVzdF9lZGsyLlRlc3RFZGsyCj4+PiAgIHRlc3RzLmJv
b3QudGVzdF9ncnViLlRlc3RHcnViQUFyY2g2NEVGSQo+Pj4gICB0ZXN0cy5ib290LnRlc3RfZ3J1
Yi5UZXN0R3J1Ylg4NjY0RUZJCj4+PiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViaTM4
NkVGSQo+Pj4gICB0ZXN0cy5mcy50ZXN0X2lzbzk2NjAuVGVzdElzbzk2NjBHcnViMkVGSQo+Pj4g
ICB0ZXN0cy5mcy50ZXN0X2lzbzk2NjAuVGVzdElzbzk2NjBHcnViMkh5YnJpZAo+PiAKPj4gVGhh
bmtzIGZvciB0ZXN0aW5nIGJ1dCBzb21lIHRlc3QgaW4gZ2l0bGFiLWNpIGRvZXNuJ3QgYm9vdCBz
aW5jZSB0aGlzIAo+PiBwYXRjaCBoYXMKPj4gYmVlbiBhcHBsaWVkOgo+PiAKPj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NjY0ODQ1ODY1Cj4+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTg2
MQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzQ2
NjQ4NDU3NzcKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy80NjY0ODQ1NzczCj4+IAo+PiAiU3lzdGVtRXJyb3I6IFN5c3RlbSBkb2VzIG5vdCBib290
Igo+PiAKPj4gSSByZXByb2R1Y2VkIGxvY2FsbHkgd2l0aCAidGVzdHMuYm9vdC50ZXN0X2dydWIu
VGVzdEdydWJYODY2NEVGSSIgdGhlbiAKPj4gSQo+PiByZXZlcnRlZCB0aGlzIGNvbW1pdCB0byBi
b290IGNvcnJlY3RseS4KPj4gCj4+IFRoZXJlIGlzIG5vIHVzZWZ1bCBsb2csIHRoZSBpbWFnZSBq
dXN0IGhhbmcuCj4+IAo+PiBDYW4geW91IGhhdmUgYSBsb29rPwo+IAo+IFRoZSBpc3N1ZSBjb21l
IGZyb20gdGhlIHFlbXUgdmVyc2lvbiAoNS4yLngpIHVzZWQgYnkgb3VyIGdpdGxhYi1jaSAKPiBk
b2NrZXIgaW1hZ2UuCj4gCj4gSWYgd2UgdXNlIHRoZSAiZXhwZXJpbWVudGFsIFFFTVUgY29tbWFu
ZCBsaW5lIG9wdGlvbiIgKFNlZSBbMV0pLCB0aGUgCj4gc3lzdGVtIGJvb3Q6Cj4gCj4gICAtZndf
Y2ZnIG5hbWU9b3B0L29yZy50aWFub2NvcmUvWC1DcHVocC1CdWdjaGVjay1PdmVycmlkZSxzdHJp
bmc9eWVzCj4gCj4gSWYgZWRrMiBkZXRlY3QgdGhlIGlzc3VlIGluIFBsYXRmb3JtQ3B1Q291bnRC
dWdDaGVjaygpLCBpdCBwcmludCBhbiAKPiBlcnJvcgo+IG1lc3NhZ2UgKHdlIGRpZG4ndCBzZWUg
aXQgaW4gb3VyIGxvZykgYW5kICpoYW5nKiBpZiB0aGUgcWVtdSBpc3N1ZSBpcyAKPiBwcmVzZW50
Lgo+IAo+IFdlIGhhdmUgdG8gYWRkIHRoaXMgd29ya2Fyb3VuZCB0byBlYWNoIHJ1bnRpbWUgdGVz
dCB1c2luZyBlZGsyIHBhY2thZ2UuCgpJIGNvbmZpcm0gdGhlIHdvcmthcm91bmQgd29ya3MgZm9y
IG1lLCB3aGVuIGFkZGluZyAiLWZ3X2NmZwpuYW1lPW9wdC9vcmcudGlhbm9jb3JlL1gtQ3B1aHAt
QnVnY2hlY2stT3ZlcnJpZGUsc3RyaW5nPXllcyIKaW4gcWVtdSBvcHRzLgoKV2UgY291bGQgaW5k
ZWVkIHVzZSBpdCBhcyBpcyBmb3Igbm93LgoKPiBUaG91Z2h0cz8KCkhhdmluZyB0aG9zZSBxdWly
a3MgaGVyZSBhbmQgdGhlcmUgaW4gdGVzdHMgd2lsbCBtYWtlIGZ1dHVyZSB1cGRhdGVzCm9mIHRo
ZSBkb2NrZXIgaW1hZ2UgZXZlbiBtb3JlIGRpZmZpY3VsdC4gSWRlYWxseSwgd2UgbmVlZCBzb21l
IHdheSB0bwp0cmFjayB0aGVtIGZvciBsYXRlciBjbGVhbnVwcy4gRm9yIHNtb290aChlcikgdXBk
YXRlcywgaXQgd291bGQgYmUKYWxzbyBnb29kIHRvIGhhdmUgdGhlIHRlc3Qgbm90IGZhaWxpbmcg
YmVmb3JlIGFuZCBhZnRlciB0aGUgdXBkYXRlLiBCeQoibm90IGZhaWxpbmciLCBJIGFsc28gbWVh
biBpdCBjb3VsZCBhbHNvIGJlIHNraXBwZWQuCgpUaGlzIGNvdWxkIGJlIGRvbmUgYnkgZXhwb3Np
bmcgdGhlIGVtdWxhdG9yIHZlcnNpb24sIGFuZCByZXBvcnRpbmcgc29tZQp0ZXN0IG1lc3NhZ2Ug
KGZvciBleCwgaW4gc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5KS4KCldlIGNvdWxk
IGhhdmUgc29tZXdoZXJlIGluIHRoZSB0ZXN0IGluIHF1ZXN0aW9uLCBvciBpbiBhIGJhc2UgY2xh
c3M6Cih1bnRlc3RlZCBwc2V1ZG8gcHl0aG9uY29kZSkKCiAgICAgZGVmIHFlbXVfaGFzX2NwdWhw
X2J1ZyhzZWxmKToKICAgICAgICAgdiA9IHNlbGYuZW11bGF0b3IuZ2V0X3ZlcnNpb24oKQogICAg
ICAgICByZXR1cm4gdlswXSA8IDcgb3IgKHZbMF0gPSA3IGFuZCB2IDwgKDcsIDIsIDEpKQoKICAg
ICBpZiBzZWxmLnFlbXVfaGFzX2NwdWhwX2J1ZygpOgogICAgICAgICBzZWxmLnNob3dfbXNnKCJX
YXJuaW5nOiBhcHBseWluZyBRRW11IENQVUhQIHdvcmthcm91bmQiKQogICAgICAgICBlbXVsYXRv
cl9hcmdzICs9ICItZndfY2ZnIC4uLiIKICAgICBlbGlmIHNlbGYucnVubmluZ19pbl9icl9kb2Nr
ZXJfaW1hZ2UoKToKICAgICAgICAgc2VsZi5zaG93X21zZygiSW5mbzogdGVzdCB3b3JrYXJvdW5k
IGNvZGUgbm8gbG9uZ2VyIG5lZWRlZCIpCgoKSW4gc29tZSBvdGhlciBjb3JuZXIgY2FzZXMsIHdl
IGNvdWxkIGp1c3Qgc2tpcCB0aGUgdGVzdDoKCiAgICAgaWYgcWVtdV9oYXNfY3B1aHBfYnVnKCk6
CiAgICAgICAgIG1zZyA9ICJVbnN1cHBvcnRlZCBlbXVsYXRvciB2ZXJzaW9uIgogICAgICAgICBz
ZWxmLnNob3dfbXNnKCJTa2lwcGluZyB0ZXN0OiAiICsgbXNnKQogICAgICAgICBzZWxmLnNraXBU
ZXN0KG1zZykKCkkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBrZWVwIHRoZSB0ZXN0IHN1aXRl
IHdvcmtpbmcgd2l0aCB0aGUgcWVtdQp2ZXJzaW9uIGluIHRoZSBkb2NrZXIgaW1hZ2UgQU5EIHRo
ZSBob3N0LXFlbXUgaW4gQnVpbGRyb290ICh3aGljaCB0aGUKb25lIHVzZWQgaW4gX2RlZmNvbmZp
Z3MsIGFuZCBpcyBzdXBwb3NlZCB0byBiZSBuZWFyIHRoZSBsYXRlc3QKcmVsZWFzZWQgdmVyc2lv
bikuCgpXaGF0IGRvIHlvdSB0aGluaz8KCgo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0aHViLmNvbS90
aWFub2NvcmUvZWRrMi9jb21taXQvYmY1Njc4YjU4MDI2ODVlMDc1ODNlM2M3ZWM1NmQ4ODNjYmRk
NWRhMwo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPj4gCj4+IEJlc3QgcmVnYXJk
cywKPj4gUm9tYWluCj4+IAo+PiAKPj4+IAo+Pj4gRmVlbCBmcmVlIHRvIGFkZCAob3Igbm90KToK
Pj4+IAo+Pj4gICBUZXN0ZWQtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJt
LmNvbT4KPj4gCj4+IAo+PiAKPj4+IAo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gVmluY2VudC4KPj4+
IAo+Pj4+IC0tLQo+Pj4+ICBib290L2VkazIvZWRrMi5oYXNoIHwgMiArLQo+Pj4+ICBib290L2Vk
azIvZWRrMi5tayAgIHwgMiArLQo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIu
aGFzaCBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+PiBpbmRleCA5NGVlMjJkZGM0Li4zNGQ0YjEw
ZTI5IDEwMDY0NAo+Pj4+IC0tLSBhL2Jvb3QvZWRrMi9lZGsyLmhhc2gKPj4+PiArKysgYi9ib290
L2VkazIvZWRrMi5oYXNoCj4+Pj4gQEAgLTEsMyArMSwzIEBACj4+Pj4gICMgTG9jYWxseSBjYWxj
dWxhdGVkCj4+Pj4gLXNoYTI1NiAgCj4+Pj4gYzEwNTIwZjI2OTU1N2Q1NjZlMzVmZTgxMDQxNDFh
YTI4NjVmOTA4NWFkMmIzYTMwYWFlOGE3ZTc4YTNjYTVhYSAgCj4+Pj4gZWRrMi1lZGsyLXN0YWJs
ZTIwMjIwOC1icjEudGFyLmd6Cj4+Pj4gK3NoYTI1NiAgCj4+Pj4gY2E1NTM1MTkxM2U2MjU4ZWJk
OGMwODEwNmYzNjlhYzcxMDczZDljZmFhODA0MjdmYzVmMTMxYjA2ZDgwODk0MCAgCj4+Pj4gZWRr
Mi1lZGsyLXN0YWJsZTIwMjMwNS1icjEudGFyLmd6Cj4+Pj4gIHNoYTI1NiAgCj4+Pj4gNTBjZTIw
YzljZmRiMGUxOWVlMzRmZTBhNTFmYzBhZmU5NjFmNzQzNjk3YjA2ODM1OWFiMmY4NjJiNDk0ZGY4
MCAgCj4+Pj4gTGljZW5zZS50eHQKPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsg
Yi9ib290L2VkazIvZWRrMi5tawo+Pj4+IGluZGV4IGZiNmI5YTMyODAuLjM5OWJkMzQ2ZWYgMTAw
NjQ0Cj4+Pj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKPj4+PiArKysgYi9ib290L2VkazIvZWRr
Mi5tawo+Pj4+IEBAIC00LDcgKzQsNyBAQAo+Pj4+ICAjCj4+Pj4gIAo+Pj4+ICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+Pj4gCj4+Pj4gLUVESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMjA4
Cj4+Pj4gK0VESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMzA1Cj4+Pj4gIEVESzJfU0lURSA9
IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMgo+Pj4+ICBFREsyX1NJVEVfTUVUSE9E
ID0gZ2l0Cj4+Pj4gIEVESzJfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKPj4+PiAtLQo+
Pj4+IDIuNDAuMQo+Pj4+IAo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPj4gCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
