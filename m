Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145C3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F1FC60C01;
	Thu, 30 Dec 2021 15:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Bjfe7ZJrPmK; Thu, 30 Dec 2021 15:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0284760B8F;
	Thu, 30 Dec 2021 15:11:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02B3A1BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E513281365
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVq7gfpkNyQA for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:11:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C28A78134B
 for <buildroot@busybox.net>; Thu, 30 Dec 2021 15:11:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 580F81C000B;
 Thu, 30 Dec 2021 15:11:51 +0000 (UTC)
Date: Thu, 30 Dec 2021 16:11:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211230161150.7b073fc6@windsurf>
In-Reply-To: <20200306201022.22382-1-ps.report@gmx.net>
References: <20200306201022.22382-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/3] package/liboping: add patch to fix
 gcc-8/gcc-9 snprintf truncation compile failure
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
Cc: buildroot@busybox.net, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maik Brenke <Maik.Brenke@continental-corporation.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpPbiBGcmksICA2IE1hciAyMDIwIDIxOjEwOjIwICswMTAwClBldGVyIFNl
aWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cgo+IEFkZCBwYXRjaCBmcm9tIHVwc3Ry
ZWFtIG1lcmdlIHJlcXVlc3QgKFsxXSkgdG8gZml4IGZpeCBnY2MtOC9nY2MtOSBzbnByaW50Zgo+
IHRydW5jYXRpb24gcmVsYXRlZCBjb21waWxlIGZhaWx1cmUgKC1XYWxsLy1XZXJyb3IpLCByZXBv
cnRlZCBvbiB0aGUKPiBtYWlsaW5nIGxpc3QgKFsyXSkuCj4gCj4gRml4ZXM6Cj4gCj4gICBsaWJv
cGluZy5jOiBJbiBmdW5jdGlvbiDigJhwaW5nX3NldF90dGzigJk6Cj4gICBsaWJvcGluZy5jOjIw
Nzo5OiBlcnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIHdy
aXRpbmcgdXAgdG8gMjU1IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSAyNDIgWy1XZXJyb3I9
Zm9ybWF0LXRydW5jYXRpb249XQo+ICAgICAyMDcgfCAgICAiJXM6ICVzIiwgZnVuY3Rpb24sIG1l
c3NhZ2UpOwo+ICAgICAgICAgfCAgICAgICAgIF5+Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9vY3RvL2xpYm9waW5nL3B1bGwvNTAKPiBbMl0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAyMC1NYXJjaC8yNzU4NjEuaHRtbAo+IAo+IFJlcG9ydGVkLWJ5
OiBNYWlrIEJyZW5rZSA8TWFpay5CcmVua2VAY29udGluZW50YWwtY29ycG9yYXRpb24uY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAtLS0K
PiAgLi4uZC1zbnByaW50Zi10cnVuY2F0aW9uLXdhcm5pbmctd0Vycm9yLnBhdGNoIHwgMzEgKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJvcGluZy8wMDAyLU1pdGlnYXRlZC1zbnByaW50
Zi10cnVuY2F0aW9uLXdhcm5pbmctd0Vycm9yLnBhdGNoCgpTbyBJJ20gc29ycnksIGJ1dCB0aGUg
cHJvYmxlbSBzdGlsbCBkaWRuJ3Qgb2NjdXIuIEkndmUgdHJpZWQgdXNpbmcgZ2NjCjgueCBhbmQg
OS54IHRvb2xjaGFpbnMsIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHNlZSwgYW5kIG5laXRoZXIgd2Vy
ZSB0aGUKYXV0b2J1aWxkZXJzLgoKU28gZm9yIG5vdywgSSdsbCBtYXJrIHRoaXMgcGF0Y2ggYXMg
UmVqZWN0ZWQsIGJ1dCBpZiB5b3UgaGF2ZSBhCnJlcHJvZHVjZXIsIHdlIGNhbiBjZXJ0YWlubHkg
cmVjb25zaWRlciB0aGlzLgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6
b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
