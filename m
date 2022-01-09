Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5ABC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB64D400E9;
	Sun,  9 Jan 2022 12:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPjXQTGs_m4v; Sun,  9 Jan 2022 12:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46E840448;
	Sun,  9 Jan 2022 12:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407031BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3750D80061
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5jvuxMVEnKa for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:16:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E100481429
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:16:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 673EBD0DCA
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:11:24 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BC20F20003;
 Sun,  9 Jan 2022 12:11:16 +0000 (UTC)
Date: Sun, 9 Jan 2022 13:11:15 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220109131115.57c37cbd@bootlin.com>
In-Reply-To: <13e59bc22d9299b2f829d541c1ecdd995f583f95.1641663315.git.yann.morin.1998@free.fr>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
 <13e59bc22d9299b2f829d541c1ecdd995f583f95.1641663315.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] core/pkg-generic: apply post-prepare
 hooks before monitoring directories
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAgOCBKYW4gMjAyMiAxODozNTo0MiArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gTW9uaXRvcmluZyB0aGUgdGFyZ2V0LyBhbmQg
aG9zdC8gZGlyZWN0b3JpZXMgYW5kIHNvIG9uLCB3aWxsIHNlcnZlIHRvCj4gZ2VuZXJhdGUgbGlz
dHMgb2YgZmlsZXMgaW5zdGFsbGVkIGJ5IHRoZSBwYWNrYWdlcy4gVGhvc2UgbGlzdHMgYXJlIHRo
ZW4KPiB1c2VkIHRvIGdlbmVyYXRlIGdyYXBocyBvZiB0aGUgc2l6ZSB0aG9zZSBwYWNrYWdlIHRh
a2Ugb24gdGhlIHRhcmdldAo+IGZvciBleGFtcGxlLgo+IAo+IFdpdGggUFBELCB3ZSB3aWxsIGFs
c28gd2FudCB0byB1c2UgdGhvc2UgbGlzdHMgdG8gb25seSBjb3B5IHRob3NlIGZpbGVzCj4gYWN0
dWFsbHkgaW5zdGFsbGVkIGJ5IGVhY2ggZGVwZW5kZW5jaWVzIG9mIGEgcGFja2FnZSwgcmVjdXJz
aXZlbHkuCj4gCj4gQ3VycmVudGx5LCB0aG9zZSBsaXN0cyBhcmUgbm90IGVudGlyZWx5IHJlbGlh
YmxlLCBhcyB0aGUgc3RhcnRpbmcgcG9pbnRzCj4gYXJlIGVzdGFibGlzaGVkIGJlZm9yZSB3ZSBh
cHBseSBQUEQgZml4dXAgaG9va3MuIEFzIHN1Y2gsIGF0IHRoZSBlbmQgb2YKPiBhIHBhY2thZ2Ug
aW5zdGFsbGF0aW9uLCBmaXhlZCB1cCBmaWxlcyB3aWxsIGJlIGZvdW5kIHRvIGJlbG9uZyB0byB0
aGUKPiBjdXJyZW50IHBhY2thZ2UsIHdoaWxlIHRoZXkgd2VyZSBpbiBmYWN0IHByb3ZpZGVkIGJ5
IG9uZSBvZiBpdHMKPiBkZXBlbmRlbmN5Lgo+IAo+IFdoaWxlIHRoaXMgZG9lcyBubyBiaWcgaGFy
bSwgaWYgYXQgYWxsLCBmb3IgdGhlIHNpemUgZ3JhcGhzLCBpdCB3aWxsCj4gdHJpZ2dlciBvdmVy
d3JpdGUgZGV0ZWN0aW9uIHdoZW4gd2UgZXZlbnR1YWxseSBnYXRoZXIgcGFja2FnZXMgdG9nZXRo
ZXIKPiB0byBhZ2dyZWdhdGUgYSBQUEQgb3IgdGUgZmluYWwgaG9zdCBhbmQgdGFyZ2V0LiBTbywg
d2UgYmV0dGVyIGhhdmUgdGhlCj4gbGlzdHMgb2YgZmlsZXMgYmUgcmVsaWFibGUuCj4gCj4gU28s
IHdlIG9ubHkgc3RhcnQgbW9uaXRvcmluZyB0aGUgZGlyZWN0b3JpZXMgYWZ0ZXIgd2UgYXBwbHkg
dGhlIFBQRAo+IGZpeHVwcyAob3Igc2VlbiB0aGUgb3RoZXIgd2F5IGFyb3VuZCBmb3IgYSBzbWFs
bGVyIGRpZmY6IHdlIGFwcGx5IHRoZQo+IFBQRCBmaXh1cHMgYmVmb3JlIHdlIHN0YXJ0IG1vbml0
b3JpbmcgdGhlIGRpcmVjdG9yaWVzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4KPiBDYzogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcGtnLWdlbmVyaWMubWsgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+IGlu
ZGV4IDEwMjIwNjJiY2YuLmIxZjRkMjE5YmIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wa2ctZ2Vu
ZXJpYy5tawo+ICsrKyBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPiBAQCAtMjczLDExICsyNzMs
MTEgQEAgJChCVUlMRF9ESVIpLyUvLnN0YW1wX2NvbmZpZ3VyZWQ6Cj4gIAlAJChjYWxsIE1FU1NB
R0UsIkNvbmZpZ3VyaW5nIikKPiAgCSQoUSlta2RpciAtcCAkKEhPU1RfRElSKSAkKFRBUkdFVF9E
SVIpICQoU1RBR0lOR19ESVIpICQoQklOQVJJRVNfRElSKQo+ICAJJChjYWxsIHByZXBhcmUtcGVy
LXBhY2thZ2UtZGlyZWN0b3J5LCQoJChQS0cpX0ZJTkFMX0RFUEVOREVOQ0lFUykpCj4gKwkkKGZv
cmVhY2ggaG9vaywkKCQoUEtHKV9QT1NUX1BSRVBBUkVfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQo
c2VwKSkKPiAgCUAkKGNhbGwgcGtnX3NpemVfYmVmb3JlLCQoVEFSR0VUX0RJUikpCj4gIAlAJChj
YWxsIHBrZ19zaXplX2JlZm9yZSwkKFNUQUdJTkdfRElSKSwtc3RhZ2luZykKPiAgCUAkKGNhbGwg
cGtnX3NpemVfYmVmb3JlLCQoQklOQVJJRVNfRElSKSwtaW1hZ2VzKQo+ICAJQCQoY2FsbCBwa2df
c2l6ZV9iZWZvcmUsJChIT1NUX0RJUiksLWhvc3QpCj4gLQkkKGZvcmVhY2ggaG9vaywkKCQoUEtH
KV9QT1NUX1BSRVBBUkVfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKPiAgCSQoZm9yZWFj
aCBob29rLCQoJChQS0cpX1BSRV9DT05GSUdVUkVfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2Vw
KSkKPiAgCSQoJChQS0cpX0NPTkZJR1VSRV9DTURTKQo+ICAJJChmb3JlYWNoIGhvb2ssJCgkKFBL
RylfUE9TVF9DT05GSUdVUkVfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKCkFja2VkLWJ5
OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCkJlc3QgcmVnYXJkcywK
SGVydsOpCgotLSAKSGVydsOpIENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
