Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738A4C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9F060E49;
	Wed,  5 Jan 2022 22:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXG7VcceD7td; Wed,  5 Jan 2022 22:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B7160E37;
	Wed,  5 Jan 2022 22:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F36C01BF267
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1629828E3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-95PA6HSL0h for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80879825DC
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:43:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4C117200004;
 Wed,  5 Jan 2022 22:43:14 +0000 (UTC)
Date: Wed, 5 Jan 2022 23:43:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220105234303.28cabcc2@windsurf>
In-Reply-To: <20211210141209.1812043-4-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-4-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/7] package/alfred: new package
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

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA2ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gVGhpcyAgcGF0
Y2ggd2lsbCBwcm92aWRlIHRoZSBpbml0aWFsCj4gcGFja2FnZSBmb3IgYWxmcmVkIHByb2plY3Qu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVu
aWtpZS5jb20+CgpJIGhhdmUgYXBwbGllZCB5b3VyIHBhdGNoLCBidXQgYWZ0ZXIgZG9pbmcgYSBu
dW1iZXIgb2YgY2hhbmdlcy4gU2VlIGJlbG93LgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbGZy
ZWQvQ29uZmlnLmluIGIvcGFja2FnZS9hbGZyZWQvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41ZjljNmYyYTZlCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvYWxmcmVkL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMjAgQEAKPiArY29uZmln
IEJSMl9QQUNLQUdFX0FMRlJFRAo+ICsJYm9vbCAiYWxmcmVkIgo+ICsJZGVwZW5kcyBvbiAhQlIy
X1NUQVRJQ19MSUJTICMgZGxvcGVuKCkKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJOTAoKWW91
IGhhdmUgZm9yZ290dGVuIHRvIGFjY291bnQgZm9yIHRoZSB0aHJlYWRzIGRlcGVuZGVuY3kgb2Yg
bGlibmwsCndoaWNoIG11c3QgYmUgcmVwbGljYXRlZCBoZXJlOwoKPiArCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJDQVAKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9HUFNECgpOZWl0aGVyIGxpYmNhcCBh
bmQgZ3BzZCBhcmUgbWFuZGF0b3J5IGRlcGVuZGVuY2llcyAoc2VlIHRoZSBSRUFETUUgZmlsZQpm
cm9tIHRoZSBhbGZyZWQgY29kZSBiYXNlIGZvciBkZXRhaWxzKS4gU28gSSBkcm9wcGVkIHRoZXNl
IGVudGlyZWx5LiBJZgp5b3Ugd2FudCB0byBoYXZlIHN1cHBvcnQgZm9yIGxpYmNhcCBhbmQgZ3Bz
ZCwgeW91IG5lZWQgdG8gaGFuZGxlIHRoZW0KaW4gdGhlIC5tayBmaWxlIGxpa2UgdGhpczoKCmlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCQ0FQKSx5KQouLi4gZG8gc29tZXRoaW5nIC4uLgplbHNlCi4u
LiBkbyBzb21ldGhpbmcgZWxzZSAuLi4KZW5kaWYKCj4gK2NvbW1lbnQgImFsZnJlZCBuZWVkcyBh
IHRvb2xjaGFpbiB3aXRoIGR5bmFtaWMgbGlicmFyeSBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBC
UjJfU1RBVElDX0xJQlMKCk1vZGlmaWVkIHRvIGFjY291bnQgZm9yIHRoZSB0aHJlYWRzIGRlcGVu
ZGVuY3kuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaCBiL3BhY2th
Z2UvYWxmcmVkL2FsZnJlZC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi5hMmRkMDExNmQ3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvYWxmcmVk
L2FsZnJlZC5oYXNoCj4gQEAgLTAsMCArMSw0IEBACj4gKyMgRnJvbSBodHRwczovL2Rvd25sb2Fk
cy5vcGVuLW1lc2gub3JnL2JhdG1hbi9zdGFibGUvc291cmNlcy9hbGZyZWQKCkFzIHBvaW50ZWQg
b3V0IGJ5IEdpdWxpbywgdGhpcyBkaWRuJ3QgbWFrZSBzZW5zZSwgYXMgaXQgZG9lc24ndCBwb2lu
dAp0byBhIGZpbGUgdGhhdCBjb250YWlucyB0aGUgc2hhMjU2LCBhbmQgYWN0dWFsbHkgbm8gZmls
ZSB0aGVyZSBjb250YWlucwp0aGUgc2hhMjU2LiBTbyBpbnN0ZWFkIEkndmUgYWRkZWQgdGhlIHNo
YTEgZnJvbSB0aGUgZmlsZSBwcm92aWRlZCBieQp1cHN0cmVhbSwgYW5kIHB1dCB0aGUgc2hhMjU2
IGhhc2ggdW5kZXIgdGhlICJMb2NhbGx5IGNvbXB1dGVkIiBjb21tZW50LgoKPiArc2hhMjU2ICA0
Yzc5YjZjNDVkZTRiY2M4Y2JmZTY0Y2JhOWEwZjhiNGVmMzA0Y2E4NGMxOTQ2MjJmMmJmYTQxZTAx
ZTJjYjk1ICBhbGZyZWQtMjAyMS40LnRhci5nego+ICsjIExvY2FsbHkgY29tcHV0ZWQKPiArc2hh
MjU2ICBjZWNiZjUzZDExNDhlMTMyNTZhYzI5ZjhiOTAwNjU1YjdmYzhkYzEyZDU5OTM5YTk1YmMy
MzIzZWExNzQ3MDI1ICBMSUNFTlNFUy9wcmVmZXJyZWQvR1BMLTIuMAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2FsZnJlZC9hbGZyZWQubWsgYi9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRlMzhkZGFkOTIKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9hbGZyZWQvYWxmcmVkLm1rCj4gQEAgLTAsMCArMSwyNSBA
QAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgYWxmcmVkCj4gKyMKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0FMRlJFRF9WRVJTSU9OID0gMjAyMS40Cj4gK0FM
RlJFRF9TSVRFID0gaHR0cHM6Ly9kb3dubG9hZHMub3Blbi1tZXNoLm9yZy9iYXRtYW4vc3RhYmxl
L3NvdXJjZXMvYWxmcmVkCj4gK0FMRlJFRF9MSUNFTlNFID0gR1BMLTIKCnVzZWQgR1BMLTIuMCBo
ZXJlLCB3aGljaCBpcyB0aGUgY29ycmVjdCBTUERYIGNvZGUgZm9yIHRoZSBHUEx2Mi4KCj4gK0FM
RlJFRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRVMvcHJlZmVycmVkL0dQTC0yLjAKPiArQUxGUkVE
X0RFUEVOREVOQ0lFUyA9IGxpYm5sIGxpYmNhcCBncHNkCgpEcm9wcGVkIGxpYmNhcCBhbmQgZ3Bz
ZCBmcm9tIGhlcmUuCgo+ICsKPiArZGVmaW5lIEFMRlJFRF9CVUlMRF9DTURTCj4gKwkoY2QgJChA
RCk7IFwKPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpLyQoZCkgQ0M9IiQo
VEFSR0VUX0NDKSIpCgpTZXZlcmFsIHRoaW5ncyB3ZXJlIHdyb25nOgoKIC0gY2QgJChARCkgd2Fz
IG5vdCBuZWVkZWQsIHNpbmNlIHlvdSdyZSBkb2luZyAtQyAkKEBEKQoKIC0gdGhlICQoZCkgd2Fz
IHdyb25nLCBhcyAkKGQpIGlzIGFuIGVtcHR5IHZhcmlhYmxlCgogLSBkb2luZyB0aGF0IHdpdGhp
biBhIHN1YnNoZWxsIGlzIG5vdCBuZWNlc3NhcnkKCiAtIHBhc3NpbmcgJChUQVJHRVRfQ09ORklH
VVJFX09QVFMpIGlzIHByZWZlcnJlZCBvdmVyIHBhc3NpbmcganVzdCBDQy4KCkFwcGxpZWQgd2l0
aCB0aG9zZSBjaGFuZ2VzLCB0aGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
