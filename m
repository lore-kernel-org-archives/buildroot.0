Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400D6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:24:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530036125F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 530036125F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259C840249;
	Mon,  8 Nov 2021 15:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7Tt8Mh4ZG2M; Mon,  8 Nov 2021 15:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B5DA401F2;
	Mon,  8 Nov 2021 15:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B97F1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A18E4010E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hKgcSHDsEpP for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 15:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA11A400E9
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 15:24:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 85ECC240009;
 Mon,  8 Nov 2021 15:24:05 +0000 (UTC)
Date: Mon, 8 Nov 2021 16:24:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211108162404.58ebbd3c@windsurf>
In-Reply-To: <20211108150731.GD680793@scaer>
References: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
 <20211108150731.GD680793@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 000/102] Standardize/beautify genimage .cfg
 files for all boards
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIDggTm92IDIwMjEgMTY6MDc6MzEgKzAxMDAKIllhbm4gRS4gTU9SSU4i
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IEkga25vdyB0aGlzIGFzIGJlZW4g
ZGlzY3Vzc2VkIG9uIGFub3RoZXIgdGhyZWFkIHdpdGggUGV0ZXIsIGFib3V0IHVzaW5nCj4gSy9N
IGluc3RlYWQgb2YgYmFyZSBudW1iZXJzLCBhbmQgaXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhh
dCBpZiBhCj4gY2hhbmdlIHdlcmUgdG8gYmUgbWFkZSwgaXQgd291bGQgYmUgcmVzdHJpY3RlZCB0
byBqdXN0IHRoYXQuCj4gCj4gSG93ZXZlciwgSSBxdWVzdGlvbiB0aGUgcmVsZXZhbmNlIG9mIHRo
aXMgKmh1Z2UqIHBhdGNoc2V0IGp1c3QgZm9yIGEKPiBtYWtlb3Zlci4KPiAKPiBZZXMsIHVzdWFs
bHksIEkgbGlrZSBjb25zaXN0ZW5jeSwgYnV0IGhlcmUgd2UgaGF2ZSBhIHR3by1lZGdlIGlzc3Vl
Ogo+IAo+ICAgLSB0aGUgc2VyaWVzIGlzIGh1Z2UsIGFuZCBjYXVzZXMgYSBsb3Qgb2YgY2h1cm4g
bWFraW5nIHBlbmRpbmcgcGF0Y2hlcwo+ICAgICBtb3JlIGRpZmZpY3VsdCB0byBhcHBseSwKCkkg
d291bGQgYWdyZWUgaW4gZ2VuZXJhbCwgYnV0IGhlcmUgSSBkb3VidCBpdCBpcyByZWFsbHkgZ29p
bmcgdG8gY2F1c2UKbXVjaCBjb25mbGljdCB3aXRoIG90aGVyIHBlbmRpbmcgcGF0Y2hlcy4KCj4g
ICAtIHRoZSBnZW5pbWFnZSBmb3JtYXQgaXMgbm90IHdlbGwgZGVmaW5lZCwgYW5kIHRoZXJlIGlz
IG5vIGxpbnRlciwgc28KPiAgICAgdGhlIGV4aXN0aW5nIGZpbGVzICp3aWxsKiBkaXZlcmdlIGFn
YWluLCBhbmQgd2Ugd29uJ3Qgbm90aWNlIHRoYXQKPiAgICAgbmV3IGZpbGVzIHdvbid0IGJlIGNv
bXBsaWFudC4KClJpZ2h0LCBidXQgdGhhdCdzIG5vdCByZWFsbHkgYSByZWFzb24gdG8gbm90IHRh
a2UgdGhpcyBwYXRjaCBzZXJpZXMuCgpPbiBteSBzaWRlLCBJIHdvdWxkIHNpbXBseSBhcHBseSB0
aGUgd2hvbGUgdGhpbmcuIEl0IG1ha2VzIHRoaW5ncwpvdmVyYWxsIGJldHRlciAocGVyaGFwcyBu
b3QgcGVyZmVjdCwgYnV0IGJldHRlciBhbmQgbW9yZSBjb25zaXN0ZW50KS4KCj4gSSB1c3VhbGx5
IGzMtm/Mtsy2Ycy2dMy2aMy2IGTMtmXMtnPMtnDMtmnMtnPMtmXMtiBozLZhzLZ0zLZlzLYgZG8g
bm90IGxpa2UgVEFCcy4uLiBUaGUgd2lkdGggb2YgYSBUQUIKPiB2YXJpZXMgZGVwZW5kaW5nIG9u
IG9uZSdzIGVudmlyb25tZW50IGFuZCBjb2RpbmcgcHJhY3RpY2VzOyB0aGUgdXN1YWwKPiA4LXNw
YWNlIHdpZHRoIG1ha2VzIGZvciB2ZXJ5IGxvbmcsIHVnbHkgbGluZXM7IFRBQiBicmVhayBjYXJl
ZnVsbAo+IGluZGVudGF0aW9uLgoKQSBtYXR0ZXIgb2YgdGFzdGUgaW5kZWVkLCBidXQgaW4gIm1h
a2UiICh5b3Uga25vdyB0aGlzIGxhbmd1YWdlIHdlCmhlYXZpbHkgYWJ1c2UgaW4gQnVpbGRyb290
KSwgVEFCcyBhcmUga2luZyEgU28gaXQgd291bGQgYmUga2luZCBvZgppcm9uaWNhbCBub3QgdG8g
YWxsb3cgVEFCcyBpbiBhIG1ha2UtYmFzZWQgcHJvamVjdCA6LSkKCj4gQW5kIHRoZW4gdGhpcyBn
YXZlIGEgMTA3LXBhdGNoIHNlcmllcy4gQW5kIHRoZSBjb21taXRzIGFsbCBoYXZlIHRoZSBzYW1l
Cj4gdHlwbzogJ2JlYXRpZnknIGluc3RlYWQgb2YgJ2JlYXV0aWZ5Jy4gQWx0aG91Z2ggSSBjYW4g
Zm9yZ2l2ZSBhIHR5cG8KPiAod2hvIHdvdWxkIEkgYmUgbm90IHRvPyksIGFuZCB0aGlzIG9uZSB3
YXMgZnVubnkgb25lLCBmaXhpbmcgYWxsIHRob3NlCj4gbWFudWFsbHkgd2hlbiBhcHBseWluZyB3
aWxsIGJlIGEgdGVkaW91cyB0YXNrLCB0aG91Z2gsIHNvIHlvdSB3b3VsZCBoYXZlCj4gdG8gZG8g
dGhhdCBvbiB5b3VyIHNpZGUgYW5kIHJlc3Bpbi4KCkkgZG9uJ3Qga25vdyBpZiB0aGF0IHR5cG8g
aXMgd29ydGggYSBodWdlIHJlc3Bpbi4KCj4gQnV0IGJlZm9yZSB5b3UgZG8gc28sIHBsZWFzZSB3
YWl0IGEgYml0IGZvciBvdGhlcnMgdG8gc3BlYWsgdXAsIGlmIHRoaXMKPiBzZXJpZXMgaXMgcmVh
bGx5IG1lYW5pbmdmdWwuCgpJIGhhdmVuJ3QgcmV2aWV3ZWQgaXQgaW4gaXRzIGVudGlyZXR5LCBi
dXQgb3ZlcmFsbCwgSSB0aGluayB3ZSBzaG91bGQKanVzdCBhcHBseSwgYW5kIG1vdmUgb24uIEku
ZSwgYmUgcHJhZ21hdGljLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
