Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB0C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5F0640C3F;
	Tue,  9 Jul 2024 09:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z78UiRF-ocDf; Tue,  9 Jul 2024 09:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E0BA4029E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E0BA4029E;
	Tue,  9 Jul 2024 09:49:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8823E1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 813AF80D27
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPGlb5pp2zn4 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DE8F80BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE8F80BC8
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DE8F80BC8
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:49:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 82E5DC1335
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 09:49:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A2E840009;
 Tue,  9 Jul 2024 09:49:10 +0000 (UTC)
Date: Tue, 9 Jul 2024 11:49:09 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240709114909.29d15107@windsurf>
In-Reply-To: <20240630135128.2222416-1-francois.perrad@gadz.org>
References: <20240630135128.2222416-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720518550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5i9RovbMvFTFxUkv84l7Sp6w+8boRhk1tDLzZcxEZ8=;
 b=a2E2M9pLomNxIwkM8JoPzqJc49IrGPU+6ok7BZ8CnSx9INGhzWlh4iK8mqiUNTpJ7dd+m4
 s0iTImb1dLG4sdYPcANbSnw5ShbUCLvvqzK0pdK6Y8tVvN7phhEvmf9ccXAgLmmxpg/eAM
 bifw2VczjFrRAv9SOTe+U4tj6q77qaajD7EpjypoTpXfeowZ36PN7UVl9Sf3mLZmd+NTR9
 NjGmbfeTeL8W+7A6onphFmBwtOl2tcsbIadcVY71bVxd9xSp3rtSiXVMBnGNraD1H6KRSc
 IUDGZs89h5MMxpsXVqTw0EICzOM73GFhqVzoOvVvKIYr/WgdEJ4XMPbuDgQBGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a2E2M9pL
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.7
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

SGVsbG8gRnJhbsOnb2lzLAoKT24gU3VuLCAzMCBKdW4gMjAyNCAxNTo1MToyOCArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+
ICBwYWNrYWdlL2x1YS81LjQuNi9sdWEuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDUgLS0tLS0KPiAgcGFja2FnZS9sdWEvezUuNC42ID0+IDUuNC43fS8wMDAxLXJvb3Qt
cGF0aC5wYXRjaCAgICAgICAgICAgfCAwCj4gIHBhY2thZ2UvbHVhL3s1LjQuNiA9PiA1LjQuN30v
MDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoIHwgMAo+ICBwYWNrYWdlL2x1YS97NS40LjYg
PT4gNS40Ljd9LzAwMTEtbGluZW5vaXNlLnBhdGNoICAgICAgICAgICB8IDIgKy0KPiAgcGFja2Fn
ZS9sdWEvNS40LjcvbHVhLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1
ICsrKysrCj4gIHBhY2thZ2UvbHVhL2x1YS5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHVhLzUuNC42L2x1
YS5oYXNoCj4gIHJlbmFtZSBwYWNrYWdlL2x1YS97NS40LjYgPT4gNS40Ljd9LzAwMDEtcm9vdC1w
YXRoLnBhdGNoICgxMDAlKQo+ICByZW5hbWUgcGFja2FnZS9sdWEvezUuNC42ID0+IDUuNC43fS8w
MDAyLXNoYXJlZC1saWJzLWZvci1sdWEucGF0Y2ggKDEwMCUpCj4gIHJlbmFtZSBwYWNrYWdlL2x1
YS97NS40LjYgPT4gNS40Ljd9LzAwMTEtbGluZW5vaXNlLnBhdGNoICg5NyUpCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2x1YS81LjQuNy9sdWEuaGFzaAoKVGhpcyBwYXRjaCBjYXVzZXMg
dGhlIGZvbGxvd2luZyBjaGVjay1wYWNrYWdlIHdhcm5pbmdzOgoKV0FSTklORzogcGFja2FnZS9s
dWEvNS40LjcvMDAwMS1yb290LXBhdGgucGF0Y2g6MDogbWlzc2luZyBVcHN0cmVhbSBpbiB0aGUg
aGVhZGVyIChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2FkZGl0aW9uYWxfcGF0Y2hf
ZG9jdW1lbnRhdGlvbikKV0FSTklORzogcGFja2FnZS9sdWEvNS40LjcvMDAwMi1zaGFyZWQtbGli
cy1mb3ItbHVhLnBhdGNoOjA6IG1pc3NpbmcgVXBzdHJlYW0gaW4gdGhlIGhlYWRlciAoaHR0cHM6
Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19hZGRpdGlvbmFsX3BhdGNoX2RvY3VtZW50YXRpb24p
CldBUk5JTkc6IHBhY2thZ2UvbHVhLzUuNC43LzAwMTEtbGluZW5vaXNlLnBhdGNoOjA6IG1pc3Np
bmcgVXBzdHJlYW0gaW4gdGhlIGhlYWRlciAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcv
I19hZGRpdGlvbmFsX3BhdGNoX2RvY3VtZW50YXRpb24pCldBUk5JTkc6IC5jaGVja3BhY2thZ2Vp
Z25vcmU6OTMxOiBpZ25vcmVkIGZpbGUgcGFja2FnZS9sdWEvNS40LjYvMDAwMS1yb290LXBhdGgu
cGF0Y2ggaXMgbWlzc2luZwpXQVJOSU5HOiAuY2hlY2twYWNrYWdlaWdub3JlOjkzMjogaWdub3Jl
ZCBmaWxlIHBhY2thZ2UvbHVhLzUuNC42LzAwMDItc2hhcmVkLWxpYnMtZm9yLWx1YS5wYXRjaCBp
cyBtaXNzaW5nCldBUk5JTkc6IC5jaGVja3BhY2thZ2VpZ25vcmU6OTMzOiBpZ25vcmVkIGZpbGUg
cGFja2FnZS9sdWEvNS40LjYvMDAxMS1saW5lbm9pc2UucGF0Y2ggaXMgbWlzc2luZwoKUmF0aGVy
IHRoYW4gY29udGludWluZyB0byBpZ25vcmUgdGhvc2UgbWlzc2luZyBVcHN0cmVhbTogdGFncyBp
biB0aGUKcGF0Y2hlcywgY291bGQgd2UgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgb2YgdGhpcyB2ZXJz
aW9uIGJ1bXAgdG8gYWRkIHRoZQpyZWxldmFudCBVcHN0cmVhbTogdGFncz8KClRoYW5rcyBhIGxv
dCEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
