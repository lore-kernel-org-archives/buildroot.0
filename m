Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5395CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 17:08:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B247561059
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 17:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B247561059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76ACE80F10;
	Fri,  5 Nov 2021 17:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxUKrQmxImRZ; Fri,  5 Nov 2021 17:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE49E80ED6;
	Fri,  5 Nov 2021 17:08:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B691BF59C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 17:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6064D6075E
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 17:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lv7nnpcwUAo for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 17:08:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03D8460625
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 17:08:28 +0000 (UTC)
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id j2hTmkQO5DBs2j2hUmRZ6x; Fri, 05 Nov 2021 18:08:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636132105; bh=HS6QeSh0IaBSDBVXzdlnbjFDCbYiaDCN5Gu2NEtrh5U=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=cTGbdauVaurwT+ZSzdT1ydFtMTFnT7l9c6smLptdfTe/wHcuRea01aOUk8+EiHSkM
 5PwZ16VxAKDSnapDlAtL5b3rvnDRnxzLCGQ4y5tOuTaOrOHKIUch3JbhPts2v9vIn0
 XQYFm5qKbOaSOV2KYpvrEydK4wrUcBJ1UO4VD4aPXRKTcvtGaMtWgfzyqPknqijA2k
 x22m/ZTrYYv2Ew9oL5FeI97TtSjljBWcf2+EnwNgsa8eAkfT5zzvOlbt8ULeNk6yLv
 SfPEozCSRB+8++pNFau9Boggqzoir+6ZM3X+Y8ezorpe7+nd//QbUWyvTtnt1ngyYl
 ukYc4DtSZlvWw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 5 Nov 2021 18:08:23 +0100
Message-Id: <64499E53-A306-4C85-956F-2CDF8A9F3E61@benettiengineering.com>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
In-Reply-To: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
To: Luca Ceresoli <luca@lucaceresoli.net>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfIGHKAXMd3FP2sjQSq3B8+qjzSmzt/hD6lODnJxHg9ZQ4dQiC38ly1BkiURtHAEb7iyyz3fozlK0qH3UtsricZXrs9PGyEUvqSqoLWu5v5Ur9i3DQNjo
 GU9/Bg8RzWlgfGfrQWZsQrwI7Ho9niP64jUGlFoqyRRNMdXUEcqoTTLZYZRGlCy+XwEB/6eA/lshflNV8wNkFKulhCl2zjzGBXVJbwiIsxzDHwByKQanrGvC
 pir5qWtysSGyM4C1ywWFj7PaVq1mSI8gIrv784tQBcJDh7KKYIFY/1GPD4RAgpsKSm6by12y9K9bH/3cz82I2FbkoeuZVSVftKOuxrRYlji7vB7qGjkjMzlM
 5CR0MCM8vQg9o7/rfDnbKiWdOdIqk6VwZ7DiXil5vNQk4YQn//xK+ZvR+9shMz6kjjIXgmrC3wWQRVHp2ZKeHBZcGK6a4KF+nsZfa7ZJcUoWZGYxS9mvtH3+
 uHFtUvF/UvQ/C0ws
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDUgbm92IDIwMjEsIGFsbGUgb3JlIDE2OjQ2LCBMdWNhIENlcmVzb2xpIDxs
dWNhQGx1Y2FjZXJlc29saS5uZXQ+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlvLAo+IAo+
PiBPbiAwNS8xMS8yMSAxNDoyNCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEhpIEx1Y2EsCj4+
IAo+Pj4+IElsIGdpb3JubyA1IG5vdiAyMDIxLCBhbGxlIG9yZSAxMjowNSwgTHVjYSBDZXJlc29s
aSA8bHVjYUBsdWNhY2VyZXNvbGkubmV0PiBoYSBzY3JpdHRvOgo+Pj4gCj4+PiDvu79IaSBHaXVs
aW8sCj4+PiAKPj4+PiBPbiAwNC8xMS8yMSAxODoyMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+
Pj4gSGkgTHVjYSwKPj4+PiAKPj4+Pj4gT24gMTEvNC8yMSAxMDoyNiBBTSwgTHVjYSBDZXJlc29s
aSB3cm90ZToKPj4+Pj4gSGkgR2l1bGlvLAo+Pj4+PiAKPj4+Pj4gdGhhbmtzIGZvciB0aGVzZSBh
bmQgdGhlIG90aGVyIG9saW1leCBwYXRjaGVzIHlvdSBhcmUgc2VuZGluZy4gVGhvbWFzCj4+Pj4+
IGFwcGxpZWQgdGhlbSBmYXN0ZXIgdGhhbiBJIGNvdWxkIHJldmlldyBhbmQgdGVzdCB0aGVtLi4u
IGxldCBtZSB0cnkgdGhpcwo+Pj4+PiB0aW1lIDopCj4+Pj4gCj4+Pj4gSSd2ZSBqdXN0IHNlbnQg
dGhlIHYyIHNlcmllcywgZG8gd2Ugd2FpdCB1bnRpbCB5b3UgZ2l2ZSBhIFRlc3RlZC1ieTogPwo+
Pj4gCj4+PiBKdXN0IHNlbnQgbXkgVGVzdGVkLWJ5IHRvbywgYnV0IEkgb25seSBidWlsZCB0ZXN0
ZWQgc2luY2UgSSBoYXZlIG5vIGxpbWUKPj4+IGJvYXJkLgo+PiAKPj4gSGF2ZSB5b3XigJl2ZSBn
aXZlbiBhIHRyeSBvbiBsaW1lMiBhdCBsZWFzdD8KPiAKPiBObywgYXBvbG9naWVzLCBJIGRvbid0
IGhhdmUgYW55ICJsaW1lKiIgYm9hcmQuLi4gbm8gbGltZSwgbm8gbGltZTIuCj4gCj4gSSBoYXZl
IG9ubHkgYW4gQTIwIG1pY3JvIGJ1dCBpdCBoYXMgbm8gTUFMSSBkZWZjb25maWcgaW4gQnVpbGRy
b290IGFuZAo+IHNvIGl0IGRvZXNuJ3QgYXBwZWFyIGluIHRoaXMgc2VyaWVzLgoKT2ssIG5vIHBy
b2JsZW0sIEkgZ2l2ZSBhIHRyeSB0aGVuIDotKQoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiAKPiAt
LSAKPiBMdWNhCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
