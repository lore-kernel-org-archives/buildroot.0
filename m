Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC7C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 06:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319D6409DF;
	Mon,  7 Aug 2023 06:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 319D6409DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beL8ckupMalU; Mon,  7 Aug 2023 06:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D607B40984;
	Mon,  7 Aug 2023 06:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D607B40984
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B54851BF20D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD2040121
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD2040121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0s4y0wYpyLk for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 06:15:42 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DC2040232
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 06:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC2040232
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1DB4935206AA; Mon,  7 Aug 2023 08:15:38 +0200 (CEST)
Date: Mon, 7 Aug 2023 08:15:38 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZNCMCpph+op/jEC/@waldemar-brodkorb.de>
References: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
 <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
 <e33edaae-e04b-c9fd-29f1-8bd6954d2d74@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e33edaae-e04b-c9fd-29f1-8bd6954d2d74@benettiengineering.com>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691388939; bh=eEaUWA9chUXkujC9JpQxXgsGt8ATnjYFiS1H09ox8sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ipIItrsmTgfd6A2Iz1qqCOMXJ60t45+fJMbbn/7qlW7FjePpUCts4NHUCCpirrRwl
 eAOXs+CIXuO/V45+fheyXbbhgTn1Ei1TfgOvZ4LT2wuKMxU4LIYpdnqEWxxK957ljz
 sCB9l90Rm3KGLb0gGJEmZX4HK1KgJ8T9upfjviH0WcB7b/arW9uP0sbtPFJZHuFRjs
 7JZLBkgSnoxru0ppeUkWeVHrCwS63gQmliesJez5MVAjM+lWCzBfwvi2nfXzwW/NPJ
 wSxze3GrZ1QAr+NPN0vbDRub+M69P4GR2c7SS2NLY0XYwzSY+dv16fz7KSxYXi4kjH
 bsJrbRUYDGB/w==
Subject: Re: [Buildroot] [PATCH] package/openssh: fix compile issue for m68k
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

SGkgR2l1bGlvLApHaXVsaW8gQmVuZXR0aSB3cm90ZSwKCj4gT24gMDYvMDgvMjMgMjA6MzksIEdp
dWxpbyBCZW5ldHRpIHdyb3RlOgo+ID4gSGkgV2FsZGVtYXIsCj4gPiAKPiA+IE9uIDA2LzA4LzIz
IDE5OjM3LCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPiA+ID4gRm9sbG93aW5nIElDRSBvY2N1
cnM6Cj4gPiA+IChjZCBvcGVuYnNkLWNvbXBhdCAmJiAvaG9tZS9hdXRvYnVpbGQvbWFrZS9tYWtl
KQo+ID4gPiBtYWtlWzJdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2F1dG9idWlsZC9hdXRv
YnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvYnVpbGQvb3BlbnNzaC05LjNwMS9vcGVuYnNkLWNv
bXBhdCcKPiA+ID4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRwdXQt
MS9ob3N0L2Jpbi9tNjhrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtZ2NjIC1EX0xBUkdFRklMRV9T
T1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjTCoCAtTzMg
LWcwwqAgLXBpcGUgLVduby1lcnJvcj1mb3JtYXQtdHJ1bmNhdGlvbiAtV2FsbCAtV3BvaW50ZXIt
YXJpdGggLVd1bmluaXRpYWxpemVkIC1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5IC1X
c2l6ZW9mLXBvaW50ZXItbWVtYWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduIC1Xbm8tdW51c2VkLXJl
c3VsdCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIC1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbiAtZm5v
LXN0cmljdC1hbGlhc2luZyAtRF9GT1JUSUZZX1NPVVJDRT0yIC1mdHJhcHYgLWZ6ZXJvLWNhbGwt
dXNlZC1yZWdzPWFsbCAtZm5vLWJ1aWx0aW4tbWVtc2V0wqDCoCAtZlBJQyAtSS4gLUkuLiAtSS4g
LUkuLy4uIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLURfWE9QRU5fU09VUkNFPTYwMCAtRF9CU0RfU09VUkNFIC1EX0RFRkFV
TFRfU09VUkNFIC1EX0dOVV9TT1VSQ0UgLURIQVZFX0NPTkZJR19IIC1jIGJzZC1hc3ByaW50Zi5j
Cj4gPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvaG9z
dC9iaW4vbTY4ay1idWlsZHJvb3QtbGludXgtdWNsaWJjLWdjYyAtRF9MQVJHRUZJTEVfU09VUkNF
IC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0wqAgLU8zIC1nMMKg
IC1waXBlIC1Xbm8tZXJyb3I9Zm9ybWF0LXRydW5jYXRpb24gLVdhbGwgLVdwb2ludGVyLWFyaXRo
IC1XdW5pbml0aWFsaXplZCAtV3NpZ24tY29tcGFyZSAtV2Zvcm1hdC1zZWN1cml0eSAtV3NpemVv
Zi1wb2ludGVyLW1lbWFjY2VzcyAtV25vLXBvaW50ZXItc2lnbiAtV25vLXVudXNlZC1yZXN1bHQg
LVdpbXBsaWNpdC1mYWxsdGhyb3VnaCAtV21pc2xlYWRpbmctaW5kZW50YXRpb24gLWZuby1zdHJp
Y3QtYWxpYXNpbmcgLURfRk9SVElGWV9TT1VSQ0U9MiAtZnRyYXB2IC1memVyby1jYWxsLXVzZWQt
cmVncz1hbGwgLWZuby1idWlsdGluLW1lbXNldMKgwqAgLWZQSUMgLUkuIC1JLi4gLUkuIC1JLi8u
LiAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNF
VF9CSVRTPTY0IC1EX1hPUEVOX1NPVVJDRT02MDAgLURfQlNEX1NPVVJDRSAtRF9ERUZBVUxUX1NP
VVJDRSAtRF9HTlVfU09VUkNFIC1ESEFWRV9DT05GSUdfSCAtYyBic2QtY2xvc2Vmcm9tLmMKPiA+
ID4gZHVyaW5nIFJUTCBwYXNzOiB6ZXJvX2NhbGxfdXNlZF9yZWdzCj4gPiA+IGJzZC1jbG9zZWZy
b20uYzogSW4gZnVuY3Rpb24gJ2Nsb3NlZnJvbSc6Cj4gPiA+IGJzZC1jbG9zZWZyb20uYzoxNTE6
MTogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IGluIGNoYW5nZV9hZGRyZXNzXzEsCj4gPiA+IGF0
IGVtaXQtcnRsLmM6MjI3NQo+ID4gPiDCoMKgIDE1MSB8IH0KPiA+ID4gwqDCoMKgwqDCoMKgIHwg
Xgo+ID4gPiAweDdmYTc2ZjRiYWQwOSBfX2xpYmNfc3RhcnRfbWFpbgo+ID4gPiDCoMKgwqDCoC4u
L2NzdS9saWJjLXN0YXJ0LmM6MzA4Cj4gPiA+IFBsZWFzZSBzdWJtaXQgYSBmdWxsIGJ1ZyByZXBv
cnQsCj4gPiA+IHdpdGggcHJlcHJvY2Vzc2VkIHNvdXJjZSBpZiBhcHByb3ByaWF0ZS4KPiA+ID4g
UGxlYXNlIGluY2x1ZGUgdGhlIGNvbXBsZXRlIGJhY2t0cmFjZSB3aXRoIGFueSBidWcgcmVwb3J0
Lgo+ID4gPiBTZWUgPGh0dHA6Ly9idWdzLmJ1aWxkcm9vdC5uZXQvPiBmb3IgaW5zdHJ1Y3Rpb25z
Lgo+ID4gPiBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjEwNjogYnNkLWNsb3NlZnJvbS5vXSBFcnJv
ciAxCj4gPiA+IAo+ID4gPiBGaXhlcyBmb2xsb3dpbmcgYXV0b2J1aWxkIGZhaWx1cmU6Cj4gPiA+
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2QyOS9kMjljNjYyZTQxZDg5
NjllNmE4YWEyNDg3MGU3MjhiY2M3MDUwNTYzLwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
V2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPiA+ID4gLS0tCj4gPiA+IMKgIHBh
Y2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rIHwgNSArKysrKwo+ID4gPiDCoCAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVu
c3NoL29wZW5zc2gubWsgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+ID4gPiBpbmRleCBl
MTRkNzUyMjkwLi42NWYwMjA4OGEwIDEwMDY0NAo+ID4gPiAtLS0gYS9wYWNrYWdlL29wZW5zc2gv
b3BlbnNzaC5tawo+ID4gPiArKysgYi9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+ID4gPiBA
QCAtMzUsNiArMzUsMTEgQEAgZGVmaW5lIE9QRU5TU0hfUEVSTUlTU0lPTlMKPiA+ID4gwqDCoMKg
wqDCoCAvdmFyL2VtcHR5IGQgNzU1IHJvb3Qgcm9vdCAtIC0gLSAtIC0KPiA+ID4gwqAgZW5kZWYK
PiA+ID4gKyMgd29ya2Fyb3VuZCBnY2MgSUNFIHdpdGggMTEueC8xMi54IGFuZCAxMy54Cj4gPiA+
ICtpZmVxICgkKEJSMl9tNjhrKSx5KQo+ID4gPiArT1BFTlNTSF9DT05GX09QVFMgKz0gLS13aXRo
b3V0LWhhcmRlbmluZwo+ID4gPiArZW5kaWYKPiA+ID4gKwo+ID4gCj4gPiBUaGlzIGRlc2VydmVz
IGEgZ2NjIGJ1ZyB0aGF0IEkndmUgYWRkZWQgd2l0aCB0aGlzIHBhdGNoOgo+ID4gaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDgwNjE4Mzcz
OC4yNTcwMDYtMS1naXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwo+ID4gCj4g
PiB0aGlzIGlzIHRoZSBidWc6Cj4gPiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3df
YnVnLmNnaT9pZD04MDc4Ngo+ID4gCj4gPiBhbmQgZm9yIGNvbnNpc3RlbmN5IGluIEJ1aWxkcm9v
dCB3ZSB0ZW5kIHRvIHdvcmstYXJvdW5kIGdjYy9iaW51dGlscwo+ID4gYnVncywgd2hlbmV2ZXIg
cG9zc2libGUsIGJ5IGxvd2VyaW5nIHRoZSBvcHRpbWl6YXRpb24gdG8gLU8wLCBzbyBJIGFzawo+
ID4geW91IHRvIHNlbmQgYSBwYXRjaCBkb2luZyB0aGlzLgo+ID4gWW91IGNhbiB0YWtlIGFzIGEg
bW9kZWwgdGhpcyBjb21taXQgZm9yIHRoZSBjb21taXQgbG9nIHRvbzoKPiA+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC84MDMyNDczMzdkMzU2NDNh
ZmRjYTk3MThjNDYxNjUwMGI5OTMwZjJkCj4gCj4gQnkgdGhlIHdheSBJJ3ZlIGdpdmVuIGEgdHJ5
IHdpdGggLU8wIHdvcmthcm91bmQgYnV0IGl0IHN0aWxsIHNob3dzIGdjYwo+IElDRSB3aXRoIGdj
YyAxMy4yLjAuIFNvIGF0IHRoaXMgcG9pbnQgSSB3b3VsZCBkaXNhYmxlIGhhcmRlbmluZyBsaWtl
Cj4geW91J3ZlIHByb3Bvc2VkIGJ1dCBieSBjaGVja2luZyBmb3IgQlIyX1RPT0xDSEFJTl9IQVNf
R0NDX0JVR184MDc4Ngo+IGluc3RlYWQgb2YgQlIyX202OGsuIENhbiB5b3UgcHJvdmlkZSBzdWNo
IHBhdGNoIHBvaW50aW5nIHRoYXQgaXQKPiBkZXBlbmRzIG9uIG1pbmUgb24gYSBjb3ZlciBsZXR0
ZXIgb3IgYWZ0ZXIgdGhlIDMgZGFzaGVzPwoKQXJlIHlvdSBzdXJlIGl0IGlzIHRoZSBzYW1lIGdj
YyBidWcgd2Ugc2VlaW5nIGhlcmUuIEkgd291bGQgc2F5IGl0CmhhcyBzb21ldGhpbmcgdG8gZG8g
d2l0aCAtZnplcm8tY2FsbC11c2VkLXJlZ3M9YWxsIGluc3RlYWQuCgpiZXN0IHJlZ2FyZHMKIFdh
bGRlbWFyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
