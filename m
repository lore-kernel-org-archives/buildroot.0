Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716AAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:08:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2B96109E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C2B96109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAF6606A6;
	Sun, 14 Nov 2021 15:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aM5bcfELY7LZ; Sun, 14 Nov 2021 15:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0FCE605F2;
	Sun, 14 Nov 2021 15:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 274991BF5EA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B93605F2
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qh_PncHn6y5c for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:08:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6E6D605BB
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:08:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C7DFF20007;
 Sun, 14 Nov 2021 15:08:04 +0000 (UTC)
Date: Sun, 14 Nov 2021 16:08:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20211114160803.5ce09ba5@windsurf>
In-Reply-To: <20211025094453.245364-1-br015@umbiko.net>
References: <20211025094453.245364-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.2
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
Cc: =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4gSSBoYXZlIHNvbWUgY29tbWVu
dHMgYmVsb3csIGJ1dCBtb3JlCmltcG9ydGFudGx5LCBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGdl
dCB0aGUgcmV2aWV3L2FwcHJvdmFsIGZyb20gSsO2cmcKS3JhdXNlIG9uIHRoaXMgcGF0Y2gsIGFz
IGhlIGhhcyB1c3VhbGx5IGJlZW4gbWFpbnRhaW5pbmcgdGhpcyBwYWNrYWdlLgoKT24gTW9uLCAy
NSBPY3QgMjAyMSAxMTo0NDo1MyArMDIwMApBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVtYmlrby5u
ZXQ+IHdyb3RlOgoKPiBJbiBhZGRpdGlvbiB0byB2YXJpb3VzIGJ1ZyBmaXhlcywgbXBkIHZlcnNp
b24gMC4yMyBpbnRyb2R1Y2VzIGEgbmV3IAo+IGRlcGVuZGVuY3kgKG1mdCkgYW5kIGEgY2hhbmdl
IGluIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZSBVUG5QIGNsaWVudCAKPiBmdW5jdGlvbmFsaXR5
LiAKPiAKPiBPcHRpb25hbCBuZXcgZmVhdHVyZXMgKG9wZW5tcHQgZGVjb2RlciwgcGlwZXdpcmUg
YW5kIHNuYXBjYXN0IG91dHB1dHMpIGFyZSAKPiBjdXJyZW50bHkgbm90IGF2YWlsYWJsZSBhcyBC
dWlsZHJvb3QgcGFja2FnZXMgYW5kIHdlcmUgbm90IGNvbnNpZGVyZWQuIAoKV2UgZG8gaGF2ZSBw
aXBld2lyZSBhcyBhIHBhY2thZ2UgaW4gQnVpbGRyb290LCBzbyB0aGF0IGFzcGVjdCBkb2Vzbid0
CnNlZW0gY29tcGxldGVseSB0cnVlLiBJZiB5b3UgZG9uJ3QgaGFuZGxlIHRob3NlIGRlcGVuZGVu
Y2llcyBpbiBtcGQubWsKKHdoaWNoIGlzIGZpbmUpLCBjb3VsZCB5b3UgZGlzYWJsZSB0aGVtIGV4
cGxpY2l0bHkgYnkgcGFzc2luZyB0aGUKYXBwcm9wcmlhdGUgLURmb289ZGlzYWJsZWQsIGlmIGF2
YWlsYWJsZT8KCj4gVGhlIGNoYW5nZSBsb2cgY2FuIGJlIGZvdW5kIGluIFsxXQo+IAo+IEludHJv
ZHVjZSBuZXcgZGVwZW5kZW5jeSBmb3IgZm10IGxpYnJhcnkuIENoYW5nZSBjb25maWd1cmF0aW9u
IG9mIFVQblAgcGx1Z2luIAo+IHRvIHN1Ym1lbnUsIGFsbG93aW5nIHRvIG9wdGlvbmFsbHkgc2Vs
ZWN0IGxpYnVwbnAsIGxpYm5wdXBucCBvciBkaXNhYmxlZC4gVGhlIAo+IGRlZmF1bHQgc2V0dGlu
ZyBpcyAnbm8gVVBuUCBjbGllbnQgZnVuY3Rpb25hbGl0eScuIENvcnJlY3QgYSB0eXBvIGluIHRv
b2xjaGFpbiAKPiBkZXBlbmRlbmN5IGNvbW1lbnQuIEFkYXB0IHNwYXJjIHBhdGNoIHRvIGNoYW5n
ZXMgaW4gc291cmNlIGxheW91dC4gCgpUaGUgdHlwbyBpbiB0aGUgdG9vbGNoYWluIGRlcGVuZGVu
Y3kgY29tbWVudCBzaG91bGQgYmUgYWRkcmVzc2VkIGluIGEKc2VwYXJhdGUgcGF0Y2gsIGFzIGl0
IGlzIHJlYWxseSBhbiB1bnJlbGF0ZWQgYnVnIGZpeC4KCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L21wZC9Db25maWcuaW4gYi9wYWNrYWdlL21wZC9Db25maWcuaW4KPiBpbmRleCA3YTI1OTc1NThi
Li43YjVhZWI0YmY2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbXBkL0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvbXBkL0NvbmZpZy5pbgo+IEBAIC04LDYgKzgsNyBAQCBtZW51Y29uZmlnIEJSMl9Q
QUNLQUdFX01QRAo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84ICMg
QysrMTcKPiAgCWRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzggIyBDKysxNwo+ICAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0JPT1NUCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfRk1UCgpZb3Un
cmUgYWRkaW5nIHRoaXMgaGVyZSwgYnV0IGl0J3Mgbm90IGFkZGVkIGluIE1QRF9ERVBFTkRFTkNJ
RVMuIElzIGZtdAphIGJ1aWxkLXRpbWUgb3IgYSBydW4tdGltZSBkZXBlbmRlbmN5PwoKWW91IGNh
biBjaGVjayB0aGlzIGJ5IGRvaW5nICJtYWtlIGNsZWFuICYmIG1ha2UgbXBkIiBhbmQgdmVyaWZ5
IHRoYXQgaXQKZG9lcyBidWlsZC4KCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUNPTlYgaWYg
IUJSMl9FTkFCTEVfTE9DQUxFCj4gIAloZWxwCj4gIAkgIE1QRCBpcyBhIGZsZXhpYmxlLCBwb3dl
cmZ1bCwgc2VydmVyLXNpZGUgYXBwbGljYXRpb24KPiBAQCAtMzYxLDcgKzM2Miw3IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9NUERfTElCTVBEQ0xJRU5UCj4gIAo+ICBjb25maWcgQlIyX1BBQ0tBR0Vf
TVBEX05FSUdIQk9SX0RJU0NPVkVSWV9TVVBQT1JUCj4gIAlib29sICJuZWlnaGJvciBkaXNjb3Zl
cnkgc3VwcG9ydCIKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTVBEX0xJQlNNQkNMSUVOVCB8
fCBCUjJfUEFDS0FHRV9NUERfVVBOUAo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NUERfTElC
U01CQ0xJRU5UIHx8ICFCUjJfUEFDS0FHRV9NUERfVVBOUF9ESVNBQkxFRAo+ICAJaGVscAo+ICAJ
ICBFbmFibGUgc3VwcG9ydCBmb3IgbmVpZ2hib3IgZGlzY292ZXJ5Lgo+ICAJICBUaGlzIG9wdGlv
biBjYW4gYmUgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSBzbWJjbGllbnQKPiBAQCAtMzgw
LDEzICszODEsMzkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01QRF9UQ1AKPiAgCSAgWW91IHdhbnQg
dGhpcyBvbiBpZiBNUEQgYW5kIHRoZSBjbGllbnQocykgd29yawo+ICAJICBvbiBkaWZmZXJlbnQg
bWFjaGluZXMgKHRoZSB1c3VhbCBzY2VuYXJpbykuCj4gIAo+IC1jb25maWcgQlIyX1BBQ0tBR0Vf
TVBEX1VQTlAKPiAtCWJvb2wgIlVQblAiCj4gK2Nob2ljZQoKS2luZCBvZiBhbm5veWluZyB0byBo
YXZlIGEgImNob2ljZSIgaGVyZS4gSXMgdGhlcmUgYSBnb29kIHJlYXNvbiB0bwpzdXBwb3J0IGJv
dGggdVBOUCBpbXBsZW1lbnRhdGlvbnM/Cgo+ICsJcHJvbXB0ICJVUG5QIgo+ICsJZGVmYXVsdCBC
UjJfUEFDS0FHRV9NUERfVVBOUF9ESVNBQkxFRAo+ICsJaGVscAo+ICsJICBFbmFibGUgTVBEIFVQ
blAgY2xpZW50IHN1cHBvcnQuCj4gKwo+ICtjb25maWcgQlIyX1BBQ0tBR0VfTVBEX1VQTlBfUFVQ
TlAKPiArCWJvb2wgInB1cG5wIgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0VYUEFUCj4gIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTElCVVBOUAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01QRF9DVVJMCj4g
IAloZWxwCj4gLQkgIEVuYWJsZSBNUEQgVVBuUCBjbGllbnQgc3VwcG9ydC4KPiArCSAgUHJvdmlk
ZXMgVVBuUCBmdW5jdGlvbmFsaXR5IHRocm91Z2ggbGlidXBucAo+ICsJICAodGhlIGxlZ2FjeSBQ
b3J0YWJsZSBTREsgZm9yIFVQblAgZGV2aWNlcykuCj4gKwkgIAo+ICsJICBJbnRyb2R1Y2VzIGxl
YXN0IGFkZGl0aW9uYWwgZGVwZW5kZW5jaWVzLgo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX01Q
RF9VUE5QX05QVVBOUAo+ICsJYm9vbCAibnB1cG5wIgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
Qk5QVVBOUAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX01QRF9DVVJMCj4gKwloZWxwCj4gKwkgIFBy
b3ZpZGVzIFVQblAgZnVuY3Rpb25hbGl0eSB0aHJvdWdoIGxpYm5wdXBucAo+ICsJICAoYSBDKysg
cmVpbXBsZW1lbnRhdGlvbiBvZiB0aGUgUG9ydGFibGUgVVBuUCBsaWJyYXJ5KS4KPiArCSAgCj4g
KwkgIFByZWZlciB0aGlzIG9wdGlvbiBpZiB5b3UgcGxhbiB0byB1c2UgdXBtcGRjbGkuCj4gKwo+
ICtjb25maWcgQlIyX1BBQ0tBR0VfTVBEX1VQTlBfRElTQUJMRUQKCkkgdGhpbmsgSSB3b3VsZCBw
cmVmZXIgQlIyX1BBQ0tBR0VfTVBEX1VQTlBfTk9ORS4KClRoYW5rcyBhIGxvdCEKClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
