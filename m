Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B3CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 08:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74A261013;
	Wed, 18 Oct 2023 08:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A74A261013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_f4ZalzHw_k; Wed, 18 Oct 2023 08:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E383060AFF;
	Wed, 18 Oct 2023 08:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E383060AFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67FF91BF285
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4090941DC1
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 08:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4090941DC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SE-P4nj9o1Nj for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 08:53:05 +0000 (UTC)
X-Greylist: delayed 893 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Oct 2023 08:53:05 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A91141DA9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A91141DA9
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 08:53:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFA501C000E;
 Wed, 18 Oct 2023 08:53:01 +0000 (UTC)
Date: Wed, 18 Oct 2023 10:53:01 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231018105301.495c5899@bootlin.com>
In-Reply-To: <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697619182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v+l0V9qHRtpMu1GP9DxKUc/HUlzGakFj+QB0rGbHBg=;
 b=leGSWQlLCJdODyGUELYAyYvz5nhkLEX9CdkehvC17VpqmpL+kNh7Yz93ikelLaz2CS28iQ
 hqGAKXWXfZYgFNd27KO4/ALr+LUYFNF80IMaRcI/sDRm/QHWrNPWuUQeFjsIzbPMZGpdM2
 gmuSE3qJqfbSRiK31ZLJaV73TCKrPO9jPihSveBuHYARRLV5a1NnxH462k7T+Dz2wOmnsK
 WBjfP4DzkpKtI4R29FidFd7nnjJ/tSFS/UkWXXgLIA4s94EnCJ4kuiJK9CwCKPR2J0XwdF
 O4o07QGCHYEO5E3GcKi8oht8heD+e060DYEZ/Dr2oI77NAWC771/jBKleqp0Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=leGSWQlL
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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

SGkgWWFubiwKCk9uIFR1ZSwgMTcgT2N0IDIwMjMgMjM6MDE6MjAgKzAyMDAKIllhbm4gRS4gTU9S
SU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IGNvbW1pdCAyMWQ1MmU1MmQ4
ZGUgKHBhY2thZ2UvcGtnLXV0aWxzLm1rOiBicmVhayBoYXJkbGlua3MgaW4gZ2xvYmFsCj4ge1RB
UkdFVCwgSE9TVH1fRElSIG9uIHBlci1wYWNrYWdlIGJ1aWxkKSB3YXMgcmVjZW50bHkgcmV2ZXJ0
ZWQsIHNvIHdlCj4gYXJlIGJhY2sgdG8gYSBzaXR1YXRpb24gd2hlcmUgaXQgaXMgcG9zc2libGUg
Zm9yIHBhY2thZ2VzIGFuZCBwb3N0LWJ1aWxkCj4gc2NyaXB0cyB0byBtb2RpZnkgZmlsZXMgaW4t
cGxhY2UsIGFuZCB0aHVzIGltcGFjdCBmaWxlcyBpbiBhbnkgYXJiaXRyYXJ5Cj4gcGVyLXBhY2th
Z2UgZGlyZWN0b3J5LCB3aGljaCBtYXkgYnJlYWsgdGhpbmdzIG9uIHJlYnVpbGQgZm9yIGV4YW1w
bGUuCj4gCj4gMjFkNTJlNTJkOGRlIHdzYSB0b28gYmlnIGEgaGFtbWVyLCBidXQgd2UgY2FuIHN0
aWxsIGFwcGx5IHRoZSByZWFzb25pbmcKCnMvd3NhL3dhcy8KCj4gZnJvbSBpdCwgdG8gdGhlIGFn
Z3JlZ2F0aW9uIG9mIHRoZSBmaW5hbCB0YXJnZXQgYW5kIGhvc3QgZGlyZWN0b3JpZXMuCj4gCj4g
VGhpcyBzb2x2ZXMgdGhlIGNhc2UgZm9yIHBvc3QtYnVpbGQgc2NyaXB0cyBhdCBsZWFzdC4gV2Ug
bGVhdmUgdGhlIGNhc2UKPiBvZiBpbnRlci1wYWNrYWdlIG1vZGlmaWNhdGlvbiBhc2lkZSwgYXMg
aXQgaXMgYSBiaWdnZXIgaXNzdWUgdGhhdCB3aWxsCj4gbmVlZCBtb3JlIHRoYW4ganN1dCBjb3B5
aW5nIGZpbGVzIGFyb3VuZC4KCnMvanN1dC9qdXN0LwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5u
IEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogSGVydmUgQ29kaW5hIDxo
ZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gQ2M6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4KPiAtLS0KPiAgTWFrZWZpbGUgICAgICAgICAgICAgfCAgNCArKy0tCj4gIHBhY2th
Z2UvcGtnLXV0aWxzLm1rIHwgMTUgKysrKysrKysrKysrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKClsuLi5dCgo+IC0tLSBhL3BhY2th
Z2UvcGtnLXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctdXRpbHMubWsKPiBAQCAtMjE0LDEw
ICsyMTQsMTkgQEAgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMpLHkpCj4gICMg
JDE6IHNwYWNlLXNlcGFyYXRlZCBsaXN0IG9mIHBhY2thZ2VzIHRvIHJzeW5jIGZyb20KPiAgIyAk
MjogJ2hvc3QnIG9yICd0YXJnZXQnCj4gICMgJDM6IGRlc3RpbmF0aW9uIGRpcmVjdG9yeQo+ICsj
ICQ0OiBsaXRlcmFsICJjb3B5IiBvciAiaGFyZGxpbmsiIHRvIGNvcHkgb3IgaGFyZGxpbmsgZmls
ZXMgZnJvbSBzcmMgdG8gZGVzdAo+ICBkZWZpbmUgcGVyLXBhY2thZ2UtcnN5bmMKPiAgCW1rZGly
IC1wICQoMykKPiAgCSQoZm9yZWFjaCBwa2csJCgxKSxcCj4gLQkJcnN5bmMgLWEgLS1saW5rLWRl
c3Q9JChQRVJfUEFDS0FHRV9ESVIpLyQocGtnKS8kKDIpLyBcCj4gKwkJcnN5bmMgLWEgXAo+ICsJ
CQktLWhhcmQtbGlua3MgXAoKWW91IHByZXNlcnZlIGhhcmQgbGlua3MgKC0taGFyZC1saW5rcykg
aW4gYWxsIGNhc2VzIChjb3B5IGFuZCBoYXJkbGluaykuCkluIGNhc2Ugb2YgY29weSwgaXMgaXQg
Y29ycmVjdCB0byBwcmVzZXJ2ZSBoYXJkIGxpbmtzID8KCj4gKwkJCSQoaWYgJChmaWx0ZXIgaGFy
ZGxpbmssJCg0KSksIFwKPiArCQkJCS0tbGluay1kZXN0PSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBr
ZykvJCgyKS8sIFwKPiArCQkJCSQoaWYgJChmaWx0ZXIgY29weSwkKDQpKSwgXAo+ICsJCQkJCSQo
ZW1wdHkpLCBcCj4gKwkJCQkJJChlcnJvciBwZXItcGFja2FnZS1yc3luYyBjYW4gb25seSAiY29w
eSIgb3IgImhhcmRsaW5rIiwgbm90ICIkKDQpIikgXAo+ICsJCQkJKSBcCj4gKwkJCSkgXAo+ICAJ
CQkkKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoMikvIFwKPiAgCQkJJCgzKSQoc2VwKSkKPiAg
ZW5kZWYKClsuLi5dCgpCZXN0IHJlZ2FyZHMsCkhlcnbDqQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
