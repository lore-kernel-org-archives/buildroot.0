Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69EC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 10:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6F681ECD;
	Mon, 20 Feb 2023 10:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6F681ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ql37ppJyrxNc; Mon, 20 Feb 2023 10:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2873A81FDB;
	Mon, 20 Feb 2023 10:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2873A81FDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2CBA1BF3E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B27D60F44
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 10:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B27D60F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCmaZOoIKMXW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 10:21:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4989260B13
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4989260B13
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 10:21:02 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id C5A8BBDEA8E7;
 Mon, 20 Feb 2023 11:11:15 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 20 Feb 2023 10:11:15 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20230206083931.759b3ee3@pc-7.home>
References: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
 <db5852a56a1ea7adb916e3831da75975@umbiko.net>
 <20230206083931.759b3ee3@pc-7.home>
Message-ID: <a5346e03afe03aa60614179b11224a3a@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1676887875; bh=17Zset61H2eEZ+d5tIyLK6RhOgyY+H5NImqDY5nXcSE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MLucStuo6ORlytVv+YvsvoJ0Y8GfMydqDfVfDwj0x33UlTpmDPUTqZbLhokZpIQOJ
 RpQIzXFjE91mEwsvWyVUehYW6RdBgFHUIB4Me7E5gKHmNSs8+rXsYsquAsooKXH0JC
 VWmR+vtsUg3LHGOx5M8QJR6V/94AgCt5Z8qOXOVA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=MLucStuo
Subject: Re: [Buildroot] [PATCH 3/4] package/linux-tools: add rtla
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWF4aW1lLCAqCgpPbiAyMDIzLTAyLTA2IDA3OjM5LCBNYXhpbWUgQ2hldmFsbGllciB3cm90
ZToKPiBIZWxsbyBBbmRyZWFzLAo+IAo+IE9uIFN1biwgMDUgRmViIDIwMjMgMDk6MjI6NTYgKzAx
MDAKPiBBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVtYmlrby5uZXQ+IHdyb3RlOgo+IAo+PiBIaSBN
YXhpbWUsCj4+IAo+PiBJIHdhcyBhYmxlIHRvIGJ1aWxkIFJUTEEgYWZ0ZXIgc29tZSBhZGFwdGlv
bnMsIHNlZSBiZWxvdy4KPiAKPiBUaGFua3MgZm9yIHRoZSBlZmZvcnQsIEkgYXBwcmVjaWF0ZSAh
CgpZb3UgYXJlIHdlbGNvbWUgOi0pCgpUaGVyZSBpcyBvbmUgbW9yZSB0aGluZyB0aGF0IG1pZ2h0
IGJlIGltcHJvdmVkOgoKT24gYW4gYWFyY2g2NCBidWlsZCwgdXNpbmcgYW4gaW50ZXJuYWwgbXVz
bCB0b29sY2hhaW4sIEkgZW5jb3VudGVyZWQgdGhlIApmb2xsb3dpbmcgYnVpbGQgaXNzdWU6CgpJ
biBmaWxlIGluY2x1ZGVkIGZyb20gc3JjL3RyYWNlLmg6MiwKICAgICAgICAgICAgICAgICAgZnJv
bSBzcmMvb3Nub2lzZS5oOjIsCiAgICAgICAgICAgICAgICAgIGZyb20gc3JjL3J0bGEuYzoxMToK
L2hvbWUvZGF0YS9idWlsZHJvb3QucnBpNjQvaG9zdC9iaW4vLi4vYWFyY2g2NC1idWlsZHJvb3Qt
bGludXgtbXVzbC9zeXNyb290L3Vzci9pbmNsdWRlL3RyYWNlZnMvdHJhY2Vmcy5oOjUwOjM1OiAK
ZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmGNwdV9zZXRfdOKAmQogICAgNTAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3NldF90ICpzZXQsIHNpemVfdCAKc2V0X3Np
emUpOwogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
CiguLi4pCnNyYy9vc25vaXNlX3RvcC5jOiBJbiBmdW5jdGlvbiDigJhvc25vaXNlX3RvcF9tYWlu
4oCZOgpzcmMvb3Nub2lzZV90b3AuYzo2MTg6MjY6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIArigJh0cmFjZWZzX2l0ZXJhdGVfcmF3X2V2ZW50c+KAmTsgZGlkIHlv
dSBtZWFuIOKAmHRyYWNlZnNfc3lzdGVtX2V2ZW50c+KAmT8gClstV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQogICA2MTggfCAgICAgICAgICAgICAgICAgcmV0dmFsID0gdHJhY2Vmc19p
dGVyYXRlX3Jhd19ldmVudHModHJhY2UtPnRlcCwKICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICB0cmFjZWZzX3N5c3RlbV9ldmVudHMKKC4uLikKCkl0IHNlZW1zIHRoYXQgYm90
aCBsaWJyYXJpZXMgYXJlIGNvbXBpbGVkIHdpdGggX0dOVV9TT1VSQ0UKCiQgZ3JlcCBfR05VX1NP
VVJDRSAuLi9saWJ0cmFjZWZzLTEuNi40L01ha2VmaWxlCm92ZXJyaWRlIENGTEFHUyArPSAtRF9H
TlVfU09VUkNFICQoTElCVFJBQ0VFVkVOVF9JTkNMVURFUykgJChJTkNMVURFUykKJCBncmVwIF9H
TlVfU09VUkNFIC4uL2xpYnRyYWNlZXZlbnQtMS43LjEvTWFrZWZpbGUKb3ZlcnJpZGUgQ0ZMQUdT
ICs9ICQodWRpczg2LWZsYWdzKSAtRF9HTlVfU09VUkNFCgpidXQgcnRsYSBkZWZpbmVzIGl0IGlu
Y29uc2lzdGVudGx5CiQgZ3JlcCBfR05VX1NPVVJDRSB0b29scy90cmFjaW5nL3J0bGEvTWFrZWZp
bGUKCiQgZ3JlcCBfR05VX1NPVVJDRSB0b29scy90cmFjaW5nL3J0bGEvc3JjLyouW2NoXQp0b29s
cy90cmFjaW5nL3J0bGEvc3JjL3RyYWNlLmM6I2RlZmluZSBfR05VX1NPVVJDRQoKdGhlcmVieSBt
aXNzaW5nIHNvbWUgZGVmaW5pdGlvbnMgZnJvbSA8c2NoZWQuaD4KClByb3Bvc2VkIGZpeCBiZWxv
dy4KCjxjdXQ+Cgo+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRv
b2wtcnRsYS5tay5pbgo+PiA+IGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXJ0bGEu
bWsuaW4KPj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiA+IGluZGV4IDAwMDAwMDAwMDAuLmE3
MzZlM2I3ODUKPj4gPiAtLS0gL2Rldi9udWxsCj4+ID4gKysrIGIvcGFja2FnZS9saW51eC10b29s
cy9saW51eC10b29sLXJ0bGEubWsuaW4KPj4gPiBAQCAtMCwwICsxLDMyIEBACj4+ID4gKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4+ID4gKyMKPj4gPiArIyBydGxhCj4+ID4gKyMKPj4gPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gPiArCj4+ID4gK0xJTlVYX1RPT0xTICs9IHJ0bGEKPj4g
PiArCj4+ID4gK1JUTEFfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGxpYnRyYWNlZnMKPj4g
Cj4+IFJUTEEgbmVlZHMgc29tZSBrZXJuZWwgZmVhdHVyZXM7IGJldHRlciB0byBpbmNsdWRlIHRo
ZW0gaGVyZSwgc2F2ZXMKPj4gdGltZSBleHBlcmltZW50aW5nOgo+PiAKPj4gIyBsaW51eCBrZXJu
ZWwgbmVlZHMgRlRSQUNFLCBUSU1FUkxBVF9UUkFDRVIsIEhJU1RfVFJJR0dFUlMgZm9yIFJUTEEK
Pj4gdG8gd29yawo+PiBpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX1RPT0xTX1JUTEEpLHkpCj4+
IGRlZmluZSBSVExBX0xJTlVYX0NPTkZJR19GSVhVUFMKPj4gCSQoY2FsbCBLQ09ORklHX0VOQUJM
RV9PUFQsQ09ORklHX0ZUUkFDRSkKPj4gCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklH
X1RJTUVSTEFUX1RSQUNFUikKPj4gCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0hJ
U1RfVFJJR0dFUlMpCj4+IGVuZGVmCj4+IGVuZGlmCj4gCj4gT2ggSSB3YXNuJ3QgYXdhcmUgdGhh
dCB3ZSBjb3VsZCBlbmFibGUga2VybmVsIG9wdGlvbnMgdGhhdCB3YXkuIEknbGwKPiBpbmNsdWRl
IHRoZW0gaW4gdGhlIHYyLCBhbG9uZyB3aXRoIENPTkZJR19PU05PSVNFX1RSQUNFUiB0aGF0IGlz
IGFsc28KPiByZXF1aXJlZC4KPiAKPj4gPiArUlRMQV9NQUtFX09QVFMgPSAkKExJTlVYX01BS0Vf
RkxBR1MpIFwKPj4gPiArCUNDPSQoVEFSR0VUX0NDKSBcCgpEZWZpbmUgX0dOVV9TT1VSQ0UgdG8g
cHJldmVudCB0aGUgbXVzbCBidWlsZCBlcnJvciBhYm92ZS4gVGhpcyBnZW5lcmF0ZXMgCmEgd2Fy
bmluZyBkdWUgdG8gcmVkZWZpbml0aW9uIG9mIHN5bWJvbCBpbiB0cmFjZS5jLCBidXQgaXQgaXMg
bGVzcyAKaW50cnVzaXZlIHRoYW4gcGF0Y2hpbmcgdGhlIHNvdXJjZSBjb2RlOgoKKyAJRVhUUkFf
Q0ZMQUdTPSItRF9HTlVfU09VUkNFIiBcCgo+PiA+ICsJTERGTEFHUz0iJChUQVJHRVRfTERGTEFH
UykiIFwKPj4gPiArCVBLR19DT05GSUdfUEFUSD0kKFNUQUdJTkdfRElSKS91c3IvbGliL3BrZ2Nv
bmZpZwo+PiA+ICsKPj4gCj4+IFRoZSBSVExBIE1ha2VmaWxlIHVuY29uZGl0aW9uYWxseSBjb21w
aWxlcyB3aXRoIHN0YWNrIHNtYXNoaW5nCj4+IHByb3RlY3Rpb247IGxpbmtpbmcgZmFpbHMgb24g
YnVpbGRzIGNvbmZpZ3VyZWQgd2l0aG91dCB0aGlzIGZlYXR1cmU6Cj4+IAo+PiAjIGFkYXB0ZWQg
ZnJvbSBsaW51eC10b29sLXRtb24ubWsuaW4KPj4gaWZlcSAoJChCUjJfVE9PTENIQUlOX0hBU19T
U1ApLCkKPj4gZGVmaW5lIFJUTEFfRElTQUJMRV9TVEFDS19QUk9URUNUT1IKPj4gCSQoU0VEKSAn
cy8tZnN0YWNrLXByb3RlY3Rvci4qIC8vJwo+PiAkKExJTlVYX0RJUikvdG9vbHMvdHJhY2luZy9y
dGxhL01ha2VmaWxlCj4+IGVuZGVmCj4+IGVuZGlmCj4gCj4gR29vZCBjYXRjaCB0b28sIEkgZGlk
bid0IHNlZSB0aGF0Lgo+IAo+PiA+ICtkZWZpbmUgUlRMQV9CVUlMRF9DTURTCj4+ID4gKwkkKFEp
aWYgISBncmVwIGluc3RhbGwKPj4gPiAkKExJTlVYX0RJUikvdG9vbHMvdHJhY2luZy9ydGxhL01h
a2VmaWxlCj4+ID4gPi9kZXYvbnVsbCAyPiYxIDsgdGhlbiBcCj4+ID4gKwkJZWNobyAiWW91ciBr
ZXJuZWwgdmVyc2lvbiBpcyB0b28gb2xkIGFuZCBkb2VzIG5vdAo+PiA+IGltcGxlbWVudCB0aGUg
cnRsYSB0b29sLiIgOyBcCj4+ID4gKwkJZWNobyAiQXQgbGVhc3Qga2VybmVsIDUuMTcgbXVzdCBi
ZSB1c2VkLiIgOyBcCj4+ID4gKwkJZXhpdCAxIDsgXAo+PiA+ICsJZmkKPj4gPiArCj4+IAo+PiAJ
JChSVExBX0RJU0FCTEVfU1RBQ0tfUFJPVEVDVE9SKQo+PiAKPj4gPiArCSQoVEFSR0VUX01BS0Vf
RU5WKSBcCj4+ID4gKwkkKE1BS0UpICQoUlRMQV9NQUtFX09QVFMpIFwKPj4gPiArCS1DICQoTElO
VVhfRElSKS90b29scy90cmFjaW5nIHJ0bGEKPj4gPiArZW5kZWYKPj4gPiArCj4+ID4gK2RlZmlu
ZSBSVExBX0lOU1RBTExfVEFSR0VUX0NNRFMKPj4gPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1B
S0UpIC1DICQoTElOVVhfRElSKS90b29scy90cmFjaW5nIFwKPj4gPiArCSQoUlRMQV9NQUtFX09Q
VFMpIFwKPj4gPiArCURFU1RESVI9JChUQVJHRVRfRElSKSBcCj4+ID4gKwlydGxhX2luc3RhbGwK
Pj4gPiArZW5kZWYKPj4gCj4+IHJ0bGFfaW5zdGFsbCBmYWlscyB3aXRoOgo+PiBNYWtlZmlsZToz
NDogKioqIE5PVElDRTogcnN0Mm1hbiByZXF1aXJlZCB0byBnZW5lcmF0ZSBtYW4gcGFnZXMuCj4+
IFN0b3AuIGJlY2F1c2UgaXQgdHJpZXMgdG8gYnVpbGQgYW5kIGluc3RhbGwgbWFuIHBhZ2VzIGFs
c28uIEJldHRlciB0bwo+PiB1c2UgYSBjdXN0b20gaW5zdGFsbCBjb21tYW5kOgo+PiAKPj4gIyBU
aGUgcnRsYV9pbnN0YWxsIHRhcmdldCB0cmllcyB0byBjcmVhdGUgYW5kIGluc3RhbGwgbWFucGFn
ZXMsCj4+ICMgd2hpY2ggdGVybWluYXRlcyB3aXRoIGFuIGVycm9yIGFuZCBjYW5ub3QgYmUgZGlz
YWJsZWQKPj4gZGVmaW5lIFJUTEFfSU5TVEFMTF9UQVJHRVRfQ01EUwo+PiAJJChJTlNUQUxMKSAt
bSAwNzU1IC1EICQoTElOVVhfRElSKS90b29scy90cmFjaW5nL3J0bGEvcnRsYSBcCj4+IAkJJChU
QVJHRVRfRElSKS91c3IvYmluL3J0bGEKPj4gZW5kZWYKPiAKPiBPayBtYWtlcyBzZW5zZSBhcyB3
ZWxsIDopCj4gCj4gVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3LCB0ZXN0cyBhbmQgZml4ZXMg
IQo+IAo+IE1heGltZQo+IAo+PiBLaW5kIHJlZ2FyZHMsCj4+IEFuZHJlYXMKPj4gCj4+ID4gLS0K
Pj4gPiAyLjM5LjEKCktpbmQgcmVnYXJkcywKQW5kcmVhcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
