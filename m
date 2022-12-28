Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DF0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65954012F;
	Wed, 28 Dec 2022 19:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D65954012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lq5cn3gczfWC; Wed, 28 Dec 2022 19:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D234240106;
	Wed, 28 Dec 2022 19:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D234240106
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63FE51BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F400814B8
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F400814B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVL58HX7B3WV for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:56:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDBC8143F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CDBC8143F
 for <buildroot@busybox.net>; Wed, 28 Dec 2022 19:56:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69FC360002;
 Wed, 28 Dec 2022 19:56:27 +0000 (UTC)
Date: Wed, 28 Dec 2022 20:56:26 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221228205626.65dc0189@windsurf>
In-Reply-To: <20221228071734.737602-1-francois.perrad@gadz.org>
References: <20221228071734.737602-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JOJIVM32qa9NjKClNFxTbGMQf37wuxTQxX86Co/3dw=;
 b=iFAjwr75mkv9mbNtWdxAT9gFmvt9kmhs3R2J9rz9/TlcJ9JrbDFleNnVhD2MJkoEob55pB
 4zLdbeU0Sx9894NQuvtaWmwfw/bLVWTkG7nP9IHpit7b87ZGPer7wQyS3b5UuiMbKxTrpl
 EEzhLWHmZthisrwnrCwGp/UHZ3LlEDibHyg0laidp8k9pxVFZ0b1sDX7TtbzAkxhYh6jrA
 l0KWRvKypgsbtB7ObayeYUdD7twU5PWNkfwuvzwd7xp8/AqhpHGaOBWaHJTQUUVEKMm+ve
 NGVL+WrdAmOoizYXt7hABeE0RpbYQJSD+VEBJsVd+d6FK30nsajNGForWWG/kA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iFAjwr75
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.36
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyEKCk9uIFdlZCwg
MjggRGVjIDIwMjIgMDg6MTc6MzQgKzAxMDAKRnJhbmNvaXMgUGVycmFkIDxmcGVycmFkQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IHN3aXRjaCB0byBtZXNvbiBpbmZyYQo+IHJlbW92ZSBhdXRvdG9vbHMg
c3BlY2lmaWMgcGF0Y2hlcwoKSXMgdGhlIHZlcnNpb24gYnVtcCByZWxhdGVkL3RpZWQgdG8gdGhl
IHN3aXRjaCB0byBtZXNvbj8gSWYgdGhleSBhcmUKbm90LCB0aGV5IHNob3VsZCBiZSBpbiBzZXBh
cmF0ZSBwYXRjaGVzLgo+IAo+IGhvc3QtbGliZ3RrMyBpcyBhIGhhY2sgd2hpY2ggYnVpbGQgb25s
eSBndGstdXBkYXRlLWljb24tY2FjaGUKClllcywgYW5kPwoKCj4gLUxJQkdUSzNfQ09ORl9PUFRT
ID0gXAo+IC0JLS1kaXNhYmxlLWdsaWJ0ZXN0IFwKPiAtCS0tZW5hYmxlLWV4cGxpY2l0LWRlcHM9
bm8KPiAtSE9TVF9MSUJHVEszX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS1pbnRyb3NwZWN0aW9uCgpX
aGVyZSBpcyBpbnRyb3NwZWN0aW9uIG5vdyBiZWluZyBkaXNhYmxlZCBmb3IgdGhlIGhvc3QgcGFj
a2FnZT8KCkFsc28sIHRoZXJlIHdlcmUgcXVpdGUgYSBmZXcgdHdlYWtzIGZvciB0aGUgaG9zdCBi
dWlsZCwgd2hpY2ggeW91IGhhdmUKcmVtb3ZlZC4gSG93IGRvZXMgaXQgd29yayBub3c/IFdlIGJ1
aWxkIGEgZnVsbCBHdGsgZm9yIHRoZSBob3N0PyBJdApkb2Vzbid0IG5lZWQgYW55IGV4dHJhIGRl
cGVuZGVuY3k/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
