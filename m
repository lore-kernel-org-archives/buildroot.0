Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C50EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAE0260ABD;
	Sat,  1 Jul 2023 20:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE0260ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDiarJ7OJUol; Sat,  1 Jul 2023 20:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0952D60AE8;
	Sat,  1 Jul 2023 20:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0952D60AE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61BCA1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3941A41736
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3941A41736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCKgzu6HxNnX for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:00:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2C64003B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA2C64003B
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:00:24 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDB0240005;
 Sat,  1 Jul 2023 20:00:21 +0000 (UTC)
Date: Sat, 1 Jul 2023 22:00:20 +0200
To: "=?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= (Leonid Yuriev)"
 <leo@yuriev.ru>
Message-ID: <20230701220020.2fda6ccd@windsurf>
In-Reply-To: <20230618144425.105081-1-leo@yuriev.ru>
References: <20230618144425.105081-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688241622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=df1Sm6xcgBmAVhO/1Lu+sn1VBqoFYi50FiIUBSYe/7I=;
 b=Y0WxypIGnM+KBahQqQl8Z6lL0mxtGakFubU8T/mlAFTWofAfYDIYjbVzdL0XMjYN9zAtuJ
 Pqh7y2VsQB0a8psXmAOaKF4sx+HkIOpHDRj3wlYEuMPOWaSEWKJ6LM+ZPlFMd3V7XkHzyv
 v1on9Q9H6HoDvMQo9Vlx4hxtpBtMeScy7FETQaTvk4QLC0myxVsiR+mrlVEocUYPLEgSTC
 NfVcEEpaYgMp9UvcQdKzKPRyduxPTsB/osMKvPWmEI1zc6XeyyE9ErD9UA63M/jLUjKnKj
 RnS8e+VDkLhIOvVfUA3nxPWvt8t+jFV1ozYI9Vq/vreVCKq5c3IAK6QVnvnP1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y0WxypIG
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.7
 "Artek"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxOCBKdW4gMjAyMyAxNzo0NDoyNCArMDMwMArQm9C10L7QvdC40LQg0K7RgNGM0LXQ
siAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+IHdyb3RlOgoKPiBUaGlzIGlzIGJ1Z2Zp
eCByZWxlYXNlIG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaCwKPiBvbiB0aGUgZGF5IG9mIGludGVy
bmF0aW9uYWwgY2hpbGRyZW4ncyBjYW1wIMKrQXJ0ZWvCuy4KPiAKPiBJdCBpcyByZWFzb25hYmxl
IHRvIGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNo
ZXMgb2YgQnVpbGRyb290Lgo+IAo+IFRoZSBtb3N0IHNpZ25pZmljYW50IGZpeGVzIG9mIHYwLjEy
Ljc6Cj4gIC0gYWRkZWQgd29ya2Fyb3VuZCBmb3IgYnVpbGQgaXNzdWVzIHdpdGggbW9kZXJuIEdD
QyB1c2luZyBgLW0zMiAtYXJjaD1pNjg2IC1PZmFzdGAuCj4gIC0gZml4ZWQgdGhlIGNhdXNlIG9m
IHRoZSBmYWxzZS1wb3NpdGl2ZSB3YXJuaW5nIG9mIG1vZGVybiBHQ0MgaW4gdGhlIEMrKyBBUEku
Cj4gIC0gcmVmaW5lZCBEQiBvcGVuaW5nIGluICJyZWNvdmVyeSIgbW9kZSBhbmQgc3dpdGNoaW5n
IHRvIGEgZ2l2ZW4gbWV0YS1wYWdlLgo+IAo+IFRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBz
Oi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9n
Lm1kCj4gCj4gU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1Pgo+IC0tLQo+ICBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoIHwgMiArLQo+ICBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
