Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625ACC07E9B
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CDC610CC
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CDC610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5632600C9;
	Tue, 20 Jul 2021 21:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YS-dp9JVZuDI; Tue, 20 Jul 2021 21:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D9A6069A;
	Tue, 20 Jul 2021 21:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BADB1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA956003C
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQh7kNoHtIfx for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:41:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A9946002E
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:40:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B9273240003;
 Tue, 20 Jul 2021 21:40:56 +0000 (UTC)
Date: Tue, 20 Jul 2021 23:40:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20210720234055.14967287@windsurf>
In-Reply-To: <20210630234717.21742-3-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-3-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/mupdf: bump to version 1.18.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720214055.i-6lgMZvvMoBl-HKOsCK087D_EZxLNvoJutkOR8ey6s@z>

SGVsbG8gUmFwaGHDq2wsCgpPbiBUaHUsICAxIEp1bCAyMDIxIDAxOjQ3OjE1ICswMjAwClJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4gd3JvdGU6Cgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL211cGRmL0NvbmZpZy5pbiBiL3BhY2thZ2UvbXVwZGYvQ29uZmlnLmluCj4g
aW5kZXggZGMyOTZiM2U4YS4uZjc5Njk2NTc1MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL211cGRm
L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbXVwZGYvQ29uZmlnLmluCj4gQEAgLTEwLDYgKzEw
LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01VUERGCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSlBF
Rwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xDTVMyCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TkpQRUcKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9HVU1CT19QQVJTRVIKCkkgZml4ZWQgdGhlIGFs
cGhhYmV0aWMgb3JkZXJpbmcgaGVyZS4KCj4gLSMgTW9kZXJuIHZlcnNpb25zIG9mIG11cGRmIGRl
cGVuZCBvbiBPcGVuR0wsCj4gLSMgd2UgZGlzYWJsZSBpdCBiZWNhdXNlIGl0IG1heSBub3QgYmUg
YXZhaWxhYmxlOgo+ICtpZm5lcSAoJChCUjJfUEFDS0FHRV9GUkVFR0xVVCkseSkKCkFuZCBoZXJl
IGZpeGVkIHRoZSBvcHRpb24gbmFtZSAoaXQncyBCUjJfUEFDS0FHRV9MSUJGUkVFR0xVVCkgYW5k
CnN3aXRjaGVkIHRvIHBvc2l0aXZlIGxvZ2ljLCBpLmU6CgppZmVxICgkKEJSMl9QQUNLQUdFX0xJ
QkZSRUVHTFVUKSx5KQouLi4gZG8gc3R1ZmYgaWYgZW5hYmxlZAplbHNlCi4uLiBkbyBzdHVmZiBp
ZiBkaXNhYmxlZAplbmRpZgoKQXBwbGllZCB3aXRoIHRob3NlIGNoYW5nZXMuCgpUaGFua3MhCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5l
dC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
