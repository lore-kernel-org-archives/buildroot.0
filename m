Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857FECDB483
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 08:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECDE610BD;
	Wed, 18 Oct 2023 08:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EECDE610BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWctZE6otLcO; Wed, 18 Oct 2023 08:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 694D06105F;
	Wed, 18 Oct 2023 08:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 694D06105F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967A71BF285
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F0C0410E7
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0C0410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rq2LWtC5GhgS for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 08:45:56 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AAB9410B2
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 08:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AAB9410B2
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 94634D5A6A
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 08:38:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FCECC0006;
 Wed, 18 Oct 2023 08:38:09 +0000 (UTC)
Date: Wed, 18 Oct 2023 10:38:08 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231018103808.20c19dfe@bootlin.com>
In-Reply-To: <2b6e31b7385a7d104f7318010bdcdfbc1a2fbf25.1697576472.git.yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <2b6e31b7385a7d104f7318010bdcdfbc1a2fbf25.1697576472.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697618290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nqn7HD2JS4bVfg2b+k4FU7/VfiYAsSaEM0Of5g062Mw=;
 b=pUX4dGwU+aPxMxuWNIzqtEk9igVNRdZ1SwnLEc6fDoHVLnBJjQYVH+NMAzUhpggkOJX4Xb
 TrKyUXJpCEHnietDvSFCg9NsuMB2+VV+gDcc3fu5VQeVgdl45lr8qwDTTNCz1kscUiEkPu
 +sDMM4nFRsl0XSE2caosLVlviNZVuy2U2F3InJ1OdjDV2hTn8mcsKn9DNZRNZwlKiq5zOu
 eS97TliBtmBrtlFtWDVn1yaVt//rA17MEKx9D6UVO7kcgjxZ0XQG++OalIn5Ijnm2NjuZQ
 436qFZ+0zy6551Hb+tKHQ2fYKAlZMrsyamTQvgvWujoaebWKsmpdukvJvEXj2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pUX4dGwU
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/pkg-utils.mk: break
 hardlinks in global {TARGET, HOST}_DIR on per-package build"
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgMTcgT2N0IDIwMjMgMjM6MDE6MTkgKzAyMDAKIllhbm4gRS4gTU9S
SU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IENvbW1pdCAyMWQ1MmU1MmQ4
ZGUgKHBhY2thZ2UvcGtnLXV0aWxzLm1rOiBicmVhayBoYXJkbGlua3MgaW4gZ2xvYmFsCj4ge1RB
UkdFVCwgSE9TVH1fRElSIG9uIHBlci1wYWNrYWdlIGJ1aWxkKSBzdG9wcGVkIGhhcmRsaW5rIHRo
ZSBzb3VyY2UgYW5kCj4gZGVzdGluYXRpb24gd2hlbiByc3luY2luZyBwZXItcGFja2FnZSBkaXJl
Y3RvcnksIG9uIHRoZSByYXRpb25hbGUgdGhhdAo+IG1vZGlmeWluZyBmaWxlcyBpbi1wbGFjZSBh
ZnRlciB0aGUgcnN5bmMgd291bGQgYWxzbyBtb2RpZnkgdGhlIG9yaWdpbmFsCj4gZmlsZSwgYW5k
IHRoYXQgYnJlYWsgZm9vLXJlYnVpbGQgYW5kIGNhbiBjYXVzZSBpc3N1ZXMgd2l0aCBwb3N0LWJ1
aWxkCj4gc2NyaXB0cy4KPiAKPiBIb3dldmVyLCB3aGF0IDIxZDUyZTUyZDhkZSBkaWQgbm90IGVu
dmlzaW9uLCBpcyB0aGF0IGNvcHlpbmcgaW5zdGVhZCBvZgo+IGhhcmQtbGlua2luZyBoYXMgdHdv
IG5hc3R5IHNpZGUgZWZmZWN0czoKPiAKPiAgIC0gdGhlIHNpemUgaW5jcmVhc2UgZm9yIHRoZSBi
dWlsZCBkaXJlY3RvcnkgaW5jcmVhc2Ugd2l0aCB0aGUgbnVtYmVyCj4gICAgIG9mIHBhY2thZ2Vz
IGFuZCB3aXRoIHRoZSBkZXB0aCBvZiB0aCBkZXBlbmRlbmN5IGNoYWlucyBmb3IgdGhvc2UKPiAg
ICAgcGFja2FnZXM6IGEgKHJlbGF0aXZlbHkgc21hbGwpIGJ1aWxkIHRoYXQgd2FzIHByZXZpb3Vz
bHkgdG90YWxsaW5nCj4gICAgIH4xM0dpQiBpbiBvdXRwdXQvLCBub3cgdG90YWxzIG5vcnRoIG9m
IDEyMkdpQiwgYW4gYWxtb3N0IDEwLXRpbWUKPiAgICAgaW5jcmVhc2U7Cj4gCj4gICAtIHRoZSBi
dWlsZCB0aW1lIGluY3JlYXNlcywgYXMgaXQgdGFrZXMgbW9wcmUgdGltZSB0byByZWFkK3dyaXRl
IGZpbGVzCgpzL21vcHJlL21vcmUKCj4gICAgIHRoYW4gaXQgdGFrZXMgdG8gY3JlYXRlIGEgbmV3
IGxpbmsgdG8gYSBmaWxlOyB0aGUgc2FtZSBidWlsZCBzYXcgYQoKYW4gaW5jcmVhc2UKCj4gICAg
IGluY3JlYXNlIG9mIGJ1aWxkIHRpbWUgZnJvbSA1bWluIDEwcyB0byA3bWluIDMwcywgYSA0NSUg
aW5jcmVhc2UuCj4gCj4gVGhlc2UgcmVncmVzc2lvbnMgYXJlIGJvdGggc2VyaW91cywgc28gcmV2
ZXJ0IHRoZSBjaGFuZ2U7IHdlJ2xsIGNvbWUgdXAKPiB3aXRoIGEgc3RvcGdhcCBtZWFzdXJlIGlu
IGZvbGxvdy11cCBjb21taXRzLgo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjFkNTJlNTJkOGRl
ZTA5NDBkMjhiM2EzODU1MWViMTgzYmUzNzgxMy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogSGVydmUgQ29kaW5hIDxoZXJ2
ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gQ2M6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dh
YXJkLmNvbT4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4KCldpdGggdGhlIHR5cG8gZml4ZWQ6ClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhl
cnZlLmNvZGluYUBib290bGluLmNvbT4KCkJlc3QgcmVnYXJkcywKSGVydsOpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
