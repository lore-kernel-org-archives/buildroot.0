Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF04C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 07:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E2860B03;
	Mon, 31 Jan 2022 07:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLhpxjurBQhP; Mon, 31 Jan 2022 07:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F33A60AAB;
	Mon, 31 Jan 2022 07:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3527D1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 07:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23B44408C4
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 07:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_maZ7RlbBRz for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 07:32:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF138408BD
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 07:32:09 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id h12so13094180pjq.3
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 23:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIHQ0LQ4a8QGAiqmcBhja3n53PsbVOgyZ3B29K0Y4Wo=;
 b=PfhZB3k7267tnk7s7Tj9F/0yCm2Z6yTNZUh6WDSzYdxQxHsRbDfGIS/Amk3YQBifbj
 14ZYJBQHtPsjpOWZpP428s7B5+NaX18LxDNR/MkGsMHIuKnhvgUcWZEOu8N1g6oPPj4P
 MI62a0muHXSKHuXcbiG3qfQpdrX4YqPPfy0E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIHQ0LQ4a8QGAiqmcBhja3n53PsbVOgyZ3B29K0Y4Wo=;
 b=b8/CWWsXvgZNWdCk0V8RhaGYOjGddw4nrnjgoVbc7UAfnzkom/y6KU2RfYSeKVsgSO
 i+6/O+9kZA5YZZZSGDmNUE6AseGX8tv3MSi5/2JkYZtrSq7/kO6dKoYil/LoFR3fEVZI
 b+LepoIxvCc5kygrmnA1qCUN2qg3TnWCxshjVNVSi0ngoVDfK5wl8JEDQbcxDWPEbxkZ
 W4E8jH1UVjrkkgFlEmXv6Zgm6nXab6ih+TzpSEqOlTvbV5vknXZEoPivwoKEu2feUoZr
 BhpQF/PuP57L2EXHxFad5vX6k7WQQ75+LNZfmcr5HIjhJVfT9irPetSspXsUaq26IxxX
 5RaQ==
X-Gm-Message-State: AOAM53032aYFnVg+JfIK+6wsjope+1Vj64u8TfFDfxOlaF3+VLDxn17s
 K11GsOoXm05WJlR8O1tPkPnef0xAzzBrZkjeIWE4Yg==
X-Google-Smtp-Source: ABdhPJz8eubOjOjq46Wmyhc7jb7w4EaDqyGS3+id6AXjSYICWriqoJTIp+7PJCXfdLt08V14oIj3+l+9cXO/PB1OMqg=
X-Received: by 2002:a17:90b:4b05:: with SMTP id
 lx5mr23276444pjb.171.1643614329272; 
 Sun, 30 Jan 2022 23:32:09 -0800 (PST)
MIME-Version: 1.0
References: <D7F1931E-9222-48C8-A285-4C1F5D215078@benettiengineering.com>
In-Reply-To: <D7F1931E-9222-48C8-A285-4C1F5D215078@benettiengineering.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 31 Jan 2022 08:31:57 +0100
Message-ID: <CAOf5uwnKNxCW8UHZwcemz4Lspvpo9W3by48XY5CyB2+iv5vmFA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board: Add support for iMX8MN BSH SMM S2 PRO
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJpZWwKCk9uIE1vbiwgSmFuIDMxLCAyMDIyIGF0IDEyOjQ4IEFNIEdpdWxpbyBCZW5ldHRp
CjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPgo+IO+7v0hp
IE1pY2hhZWwsCj4KPiArQ2MKPgo+IElsIGdpb3JubyAzMSBnZW4gMjAyMiwgYWxsZSBvcmUgMDA6
MjcsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25z
LmNvbT4gaGEgc2NyaXR0bzoKPgo+IO+7v0hpIEdpdWxpbwo+Cj4gT24gU2F0LCBKYW4gMjksIDIw
MjIgYXQgODo0NiBQTSBHaXVsaW8gQmVuZXR0aQo+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPiB3cm90ZToKPgo+Cj4gSGkgTWljaGFlbCwKPgo+Cj4gT24gMjkvMDEvMjIg
MTQ6NTQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+Cj4gW1NOSVBdCj4KPgo+IEhhdmUgeW91IGdp
dmVuIGEgZ28gd2l0aCBsYXRlc3QgQnVpbGRyb290IGRvY2tlciB0byBjaGVjayBpZiB1Ym9vdAo+
Cj4gbmVlZHMgbGliZmR0cHksIHB5dGhvbjMgZXRjLj8KPgo+IEl04oCZcyBoaWdobHkgcHJvYmFi
bGUgaXQgbmVlZHMgdGhlbS4KPgo+Cj4gU3VnZ2VzdGlvbiwgc2hvdWxkIGJlIGdpdmVuIHRvIHRo
ZSBvdGhlciBuZXdlc3QgYm9hcmQgdGhhdCB3YXMgYWRkZWQuCj4KPgo+IENvcnJlY3QsIEnigJlt
IGdvaW5nIHRvIGNoZWNrIG15IGxhdGVzdCBib2FyZCByZXZpZXdzIGFib3V0IHRoaXMKPgo+Cj4g
SSd2ZSBwb2ludGVkIHRoZW0gdGJoCj4KPgo+IEkgdGhpbmsgdGhhdCB5b3UgYXJlIHRhbGtpbmcg
YWJvdXQKPgo+IGhvc3QtdG9vbHMgaGVyZS4KPgo+Cj4gWWVzCj4KPgo+IFBsZWFzZSBwb2ludCBt
ZSB0byB0aGlzIGJ1aWxkcm9vdCBkb2NrZXIKPgo+Cj4gaHR0cHM6Ly9odWIuZG9ja2VyLmNvbS9y
L2J1aWxkcm9vdC9iYXNlL3RhZ3MKPgo+IDxodHRwczovL2h1Yi5kb2NrZXIuY29tL3IvYnVpbGRy
b290L2Jhc2UvdGFncz4KPgo+ICMgZG9ja2VyIHB1bGwgYnVpbGRyb290L2Jhc2U6MjAyMTExMjAu
MTkyNQo+Cj4KPiBUaGlzIGlzIG5vdCBjb3JyZWN0LCBzb3JyeSwgSSd2ZSBqdXN0IGdpdmVuIGEg
dHJ5IGFuZCBpdCBidWlsZHMKPgo+IGNvcnJlY3RseSBldmVuIGlmIGl0IGZhaWxzIHdpdGggZ2l0
bGFiIENJLgo+Cj4gWW91IGhhdmUgdG8gdXNlIHRoaXMgZG9ja2VyOgo+Cj4gZG9ja2VyIHB1bGwg
YnVpbGRyb290L2Jhc2U6MjAyMTA5MjIuMjIwMAo+Cj4KPgo+IEkgd2lsbCByZXNlbmQuIEkgZm91
bmQgc29tZSB3cm9uZyBhcnRpZmFjdHMgYW5kIEkgbmVlZCB0byB0ZXN0IGl0IGFnYWluCj4KPgo+
IE9rLiBJIHdhcyB3cm9uZyBhbnl3YXkgYWdhaW4gd2l0aCB0aGUgZG9ja2VyLgo+IEluIElSQyBZ
YW5uIHBvaW50ZWQgbWUgdGhhdCB3ZSBoYXZlIHRvIHVzZSB0aGUgb25lIGluOgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvbWFzdGVyLy5naXRsYWItY2kueW1s
Cj4KPiBTbyBwbGVhc2UgdXNlOgo+ICMgZG9ja2VyIHB1bGwgcmVnaXN0cnkuZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9iYXNlOjIwMjIwMTA1LjIzMTQKPgoKQXBhcnQgZnJvbSB0
aGUgZG9ja2VyLiBJIGhhdmUgdXBkYXRlZCB0aGUgcGF0Y2ggYW5kIEkgd2lsbCByZXNlbmQgd2l0
aAp0aGUgZml4LiBDYW4gd2UgbW92ZSB0aGUgdS1ib290Cm9uIHNvbWUgb3RoZXIgcG9pbnQ/CgpN
aWNoYWVsCgoKPiBBbnl3YXkgdGhleeKAmXJlIHByZXR0eSBjb21wYXRpYmxlIGFzIEnigJl2ZSBz
ZWVuIGF0IHVib290IGFuZCBMaW51eCBob3N0IGxldmVsLAo+IHNvIHRoZSBwcm9ibGVtcyB5b3Xi
gJl2ZSBmb3VuZCB0aGVyZSB3aWxsIHN0aWxsIGJlIG9uIHRoaXMgb3RoZXIgZG9ja2VyLgo+Cj4g
SGXigJlzIGdvaW5nIHRvIHN5bmMgZG9ja2VyIGh1YiB3aXRoIHRoYXQgdmVyc2lvbi4KPgo+IFNv
cnJ5IGZvciBodG1sIGJ1dCBJ4oCZbSBvbiBtb2JpbGUgOi0vCj4KPiBCZXN0IHJlZ2FyZHMKPiDi
gJQtCj4gR2l1bGlvIEJlbmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+Cj4KPiBNaWNo
YWVsCj4KPiBCZXN0IHJlZ2FyZHMhCj4KPiAtLQo+Cj4gR2l1bGlvIEJlbmV0dGkKPgo+IEJlbmV0
dGkgRW5naW5lZXJpbmcgc2FzCj4KPgo+Cj4KPiAtLQo+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1h
cmNoaQo+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+IE0uICszOSAzNDcg
OTEzIDIxNzAKPiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Cj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiBKb29wIEdlZXNp
bmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4gVC4gKzMxICgwKTg1IDExMSA5MTcy
Cj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+IHd3dy5hbWFydWxhc29sdXRpb25zLmNvbQoK
CgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGllZiBFeGVj
dXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9u
cy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKQW1hcnVsYSBTb2x1dGlv
bnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApULiArMzEg
KDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0
aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
