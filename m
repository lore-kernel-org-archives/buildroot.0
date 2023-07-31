Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD867C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B43861163;
	Mon, 31 Jul 2023 19:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B43861163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJ-2wNIkuG8D; Mon, 31 Jul 2023 19:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A39B06114F;
	Mon, 31 Jul 2023 19:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39B06114F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B0261BF25B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 19:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9895B40156
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 19:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9895B40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4s03rbSd93Z for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 19:21:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A6FB401BE
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 19:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A6FB401BE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 514E2FF807;
 Mon, 31 Jul 2023 19:20:50 +0000 (UTC)
Date: Mon, 31 Jul 2023 21:20:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230731212049.10b538fd@windsurf>
In-Reply-To: <20230729065616.961984-1-james.hilliard1@gmail.com>
References: <20230729065616.961984-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690831256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFkYx2kg6oRh19ty3wqCcDvtT7InN8t+j5xZ29u91Mg=;
 b=PCg1MfvcVSYhzRg65yxb4BO4f+DHC/uCni8uSUjDGlNyeZAj6ZTWIVjYcaJFe2fes33vKH
 Lx8NgTShkLxuMkDPVin8cleLzN02O8XHd7jE+YvEMPlyGa5CPrkhWgicv8070NKEC6iLWE
 CrLbnBURVabEKa7/ALmRYw9FXydHgRtCyJs9zykMdJQwKjktiDEabOG1vR+NPjLL40PBsF
 9QSs8oRMgCYMy7vcUqOKu3O2h1AKCxiFWzBgu0pYKF1yfl06N8yIFZE9lQ9x6FWQWWXRZ2
 6PVpEv69ynq1HcKrSJXREpEhPc4VtAw9x60UMvfbHhppOqrE/Sus+jtbL7GnDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PCg1Mfvc
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254
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
Cc: Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpPbiBTYXQsIDI5IEp1bCAyMDIzIDAwOjU2OjE2IC0wNjAwCkphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gUkVBRE1FLm1kIGhh
c2ggY2hhbmdlZCBkdWUgdG8gc3ludGF4IGZpeDoKPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVt
ZC9zeXN0ZW1kLXN0YWJsZS9jb21taXQvNDlkZGI0NzU3YjE5N2IzMDMzMDliMGRjZGZjNWY4NThm
NGI4ZTE2OAo+IAo+IFJlbW92ZSBubyBsb25nZXIgc3VwcG9ydGVkL3JlcXVpcmVkIHZhbGdyaW5k
IGNvbmZpZyBvcHRpb24uCj4gCj4gRGlzYWJsZSBuZXcgdW5zdXBwb3J0ZWQgcGFzc3dkcWMgY29u
ZmlnIG9wdGlvbi4KPiAKPiBEaXNhYmxlIG5ldyB1bnN1cHBvcnRlZCB1a2lmeSBjb25maWcgb3B0
aW9uLgo+IAo+IERpc2FibGUgbmV3IHVuc3VwcG9ydGVkIHhlbmN0cmwgY29uZmlnIG9wdGlvbi4K
PiAKPiBVcGRhdGUgc3lzdGVtZC1ib290IGNvbmZpZyBvcHRpb25zIHRvIG5ldyBmb3JtYXQuCj4g
Cj4gQWRkIG5ldyBob3N0LXB5dGhvbi1weWVsZnRvb2xzIHN5c3RlbWQtYm9vdCBkZXBlbmRlbmN5
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5oYXNoIHwgIDQgKystLQo+
ICBwYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayAgIHwgMjkgKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlv
bnMoLSkKCkkgYW0gZ2V0dGluZyBiYWNrIHRvIHlvdSByZWdhcmRpbmcgdGhpcyB2ZXJzaW9uIGJ1
bXAuIERpZCB5b3UgcnVuIHRoZQpzeXN0ZW1kIHRlc3QgY2FzZXMgaW4gc3VwcG9ydGluZy90ZXN0
aW5nIGFmdGVyIGRvaW5nIHRoaXMgdmVyc2lvbiBidW1wPwoKSW5kZWVkLCBpdCBzZWVtcyBsaWtl
IHRoZSBzeXN0ZW1kIHRlc3QgY2FzZXMgYXJlIG5vIGJyb2tlbi4gU2VlCmh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy85NTAxNzUwNzcvZmFpbHVy
ZXMKZm9yIHRoZSBmdWxsIGxpc3Qgb2YgZmFpbGVkIGNhc2VzIChhIG51bWJlciBhcmUgbm90IHN5
c3RlbWQgcmVsYXRlZCwKYW5kIG5vdCByZWxldmFudCBoZXJlLCBidXQgbWFueSBhcmUgc3lzdGVt
ZCByZWxhdGVkKS4KCkkgbG9va2VkIGF0IG9ubHkgb25lLCBhbmQgdGhlIGZhaWx1cmUgaGFwcGVu
cyBhdCBydW50aW1lIGFuZCBnb2VzIGxpa2UKdGhpczoKCiMgc3lzdGVtY3RsIC0tbm8tcGFnZXIg
LS1mYWlsZWQgLS1uby1sZWdlbmQK4pePIHN5c3RlbWQtdmNvbnNvbGUtc2V0dXAuc2VydmljZSBs
b2FkZWQgZmFpbGVkIGZhaWxlZCBWaXJ0dWFsIENvbnNvbGUgU2V0dXAKIyBlY2hvICQ/CjAKCkkg
aGF2ZW4ndCBjaGVja2VkIHRoZSBvdGhlciBmYWlsdXJlcy4gQ291bGQgeW91IGhhdmUgYSBsb29r
IGF0IGZpeCB0aGUKaXNzdWU/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
