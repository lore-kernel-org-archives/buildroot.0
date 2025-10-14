Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FBBCCD192
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 14:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9041380EC5;
	Tue, 14 Oct 2025 14:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbBx1h9w_m8f; Tue, 14 Oct 2025 14:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB1F80E65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB1F80E65;
	Tue, 14 Oct 2025 14:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E32BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 14:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7685E404A3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 14:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-whLTJ3RA1F for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 14:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A7754005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7754005A
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7754005A
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 14:19:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C8F81BB2;
 Tue, 14 Oct 2025 07:19:19 -0700 (PDT)
Received: from debian (MacBookPro.nice.arm.com [10.34.124.27])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60EFC3F6A8;
 Tue, 14 Oct 2025 07:19:26 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:19:23 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>,
 Alistair Francis <alistair@alistair23.me>
Message-ID: <aO5b60Q0ty8qUBHO@debian>
Mail-Followup-To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>,
 Alistair Francis <alistair@alistair23.me>
References: <20251010072918.1691501-1-vincent.stehle@arm.com>
 <3ab60abf2771e00062ee8baf20872b35@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ab60abf2771e00062ee8baf20872b35@free.fr>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] support/testing: test_xen: add networking
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgMTA6MzU6MDdQTSArMDIwMCwgSnVsaWVuIE9saXZhaW4g
d3JvdGU6Cj4gSGkgVmluY2VudCwKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiAx
MC8xMC8yMDI1IDA5OjI5LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gPiBFbmhhbmNlIHRoZSBY
ZW4gcHl0aG9uIHRlc3RzIHRvIGV4ZXJjaXNlIG5ldHdvcmtpbmc6Cj4gPiAKPiA+IC0gQWRkIHRo
ZSBuZXR3b3JraW5nIHN1cHBvcnQgd2UgbmVlZCB0byB0aGUgTGludXgga2VybmVsIGNvbmZpZ3Vy
YXRpb25zLgo+ID4gLSBBZGQgYSB2aXJ0dWFsIG5ldHdvcmsgaW50ZXJmYWNlIHRvIHRoZSBYZW4g
ZG9tMSBjb25maWd1cmF0aW9ucy4KPiA+IC0gVXBkYXRlIHRoZSB0ZXN0IGluIHRoZSBmb2xsb3dp
bmcgd2F5Ogo+ID4gICAqIFN0YXJ0IHRoZSBlbXVsYXRvciB3aXRoIHJlc3RyaWN0ZWQgbmV0d29y
a2luZy4KPiA+ICAgKiBDcmVhdGUgYSBuZXR3b3JrIGJyaWRnZSBpbiBkb20wLgo+ID4gICAqIENo
ZWNrIHRoYXQgbmV0d29ya2luZyBpcyBmdW5jdGlvbmFsIGluIGJvdGggZG9tYWlucyBieSBwaW5n
J2luZyB0aGUKPiA+ICAgICBnYXRld2F5Lgo+ID4gICAoUmVmZXIgYWxzbyB0byB0aGUgZGlhZ3Jh
bSBpbiB0aGUgcHl0aG9uIHNjcmlwdC4pCj4gPiAtIFdoaWxlIGF0IGl0LCBidW1wIExpbnV4IGtl
cm5lbCB0byA2LjE3LjEgYW5kIFUtQm9vdCB0byAyMDI1LjA3Lgo+ID4gICBXZSBhbHNvIG5lZWQg
dG8gYWRqdXN0IHRoZSBEVEIgYWRkcmVzcyBpbiB0aGUgQXJtIDMyYiBVLUJvb3Qgc2NyaXB0IHRv
Cj4gPiAgIGFjY29tbW9kYXRlIHRoZSBuZXcgVS1Cb290IHZlcnNpb24sIHdoaWNoIGRvZXMgbm90
IGhhdmUgZW5vdWdoIGZyZWUKPiA+IHNwYWNlCj4gPiAgIGFyb3VuZCB0aGUgY29udHJvbCBEVEIg
YW55bW9yZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBhcm0uY29tPgo+IAo+IEZvciBzb21lIHJlYXNvbiwgdGhlIFRlc3RYZW5Bcm12NyBy
dW50aW1lIHRlc3QgaXMgZmFpbGluZyBpbiB0aGUKPiByZWZlcmVuY2UgQnVpbGRyb290IERvY2tl
ciBpbWFnZS4gSSB0ZXN0ZWQgd2l0aCB0aGUgY29tbWFuZDoKPiAKPiAgICAgdXRpbHMvZG9ja2Vy
LXJ1biBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKPiAgICAgICAgIC1rIC1kIGRsIC1vIG91
dHB1dF9mb2xkZXIgXAo+ICAgICAgICAgdGVzdHMucGFja2FnZS50ZXN0X3hlbgo+IAo+IFRoZSBm
aWxlIG91dHB1dF9mb2xkZXIvVGVzdFhlbkFybXY3LXJ1bi5sb2cgZW5kcyB3aXRoOgo+IAo+IAlb
QlJURVNUIyB1ZGhjcGMgLWkgZXRoMAo+IAl1ZGhjcGM6IHN0YXJ0ZWQsIHYxLjM3LjAKPiAJdWRo
Y3BjOiBicm9hZGNhc3RpbmcgZGlzY292ZXIKPiAJdWRoY3BjOiBicm9hZGNhc3RpbmcgZGlzY292
ZXIKCkhpIEp1bGllbiwKCkdvb2QgY2F0Y2ghIEkgdGhvdWdodCBJIGRpZCB0ZXN0IHRoaXMsIGJ1
dCBtYXliZSBub3QgdGhlIGxhc3QgdmVyc2lvbiB3aXRoIGd1ZXN0CnBpbmcsIHNvcnJ5IDooCgo+
IAo+IFN0cmFuZ2VseSwgdGhlIFRlc3RYZW5BYXJjaDY0IGlzIHBhc3NpbmcgaW4gdGhlIEJ1aWxk
IERvY2tlciBpbWFnZS4KPiAKPiBJIGluaXRpYWxseSB0aG91Z2h0IGl0IHdhcyBhIHRpbWluZyBp
c3N1ZSwgYnV0IEkgdGVzdGVkIHNldmVyYWwgdGltZXMKPiBhbmQgSSBjb25zaXN0ZW50bHkgZ290
IHRoZSBzYW1lIHJlc3VsdC4KPiAKPiBCb3RoIHRlc3RzIGFyZSBwYXNzaW5nIG9uIGEgRmVkb3Jh
IDQyIGhvc3Qgd2l0aCBxZW11IDkuMi40Lgo+IAo+IFRoZSBCdWlsZHJvb3QgRG9ja2VyIGltYWdl
IGhhcyBhbiAib2xkIiBxZW11IDcuMi4xNS4gU2VlIHRoZSBjb21tYW5kOgo+IAo+ICAgICB1dGls
cy9kb2NrZXItcnVuIHFlbXUtc3lzdGVtLWFybSAtLXZlcnNpb24KPiAKPiB3aGljaCBvdXRwdXQ6
Cj4gCj4gICAgIFFFTVUgZW11bGF0b3IgdmVyc2lvbiA3LjIuMTUgKERlYmlhbiAxOjcuMitkZnNn
LTcrZGViMTJ1MTIpCgpJdCBzZWVtcyB0aGF0IFFlbXUgdmVyc2lvbnMgPD0gOS4wLjQgYnJlYWsg
dGhlIHRlc3QsIGFuZCA+PSA5LjEuMCByZXBhaXIgaXQuCldoYXRldmVyIHRoZSByZWFzb24sIEkg
d2lsbCB0cnkgdG8gbWFrZSB0aGUgdGVzdCBwYXNzIG9uIGdpdGxhYiBhbmQgc2VuZCBhIHYyLgoK
QmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAKPiBJIHRlc3RlZCBieSBhZGRpbmcgaW4gdGhlIHRl
c3QgY29uZmlnOgo+IAo+ICAgICBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQo+ICAgICBCUjJfUEFD
S0FHRV9IT1NUX1FFTVVfU1lTVEVNX01PREU9eQo+IAo+IGluIG9yZGVyIHRvIGNvbXBpbGUgYSBt
b3JlIHJlY2VudCBxZW11IDEwLjEuMC4gVGhpcyBzZWVtcyB0bwo+IHNvbHZlIG9yIHdvcmthcm91
bmQgdGhlIGlzc3VlLgo+IAo+IEZvciB0aGUgbW9tZW50LCBJIGNhbm5vdCB0ZWxsIGlmIGl0J3Mg
YSBuZXR3b3JrIGVtdWxhdGlvbiBidWcgaW4KPiB0aGUgb2xkIHFlbXUgKHdoaWNoIGluIHRoYXQg
Y2FzZSB0aGUgdGVzdCBuZWVkcyB0byBjb21waWxlIHRoZSBuZXdlcgo+IHFlbXUpLCBvciBpZiBp
dCdzIGEgdGltaW5nIGlzc3VlIGluIHRoZSB0ZXN0IChpLmUuIHRoZSB0ZXN0Cj4gbWlnaHQgbmVl
ZCB0byB3YWl0IGEgYml0IHNvbWV3aGVyZSB0byBsZXQgdGhlIGJyaWRnZSBzZXR0bGUpLgo+IAo+
IENvdWxkIHlvdSBoYXZlIGEgbG9vayBwbGVhc2UgYW5kIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBh
ZGRyZXNzaW5nCj4gdGhpcyBpc3N1ZSwgcGxlYXNlPwo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBK
dWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
