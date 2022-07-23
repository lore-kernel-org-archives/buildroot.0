Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D88C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 864A940AEA;
	Sat, 23 Jul 2022 12:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864A940AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85svWqHPT1mP; Sat, 23 Jul 2022 12:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B1FA40AEB;
	Sat, 23 Jul 2022 12:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1FA40AEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC371BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60CE840AE8
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60CE840AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2iVbQ4dzx0x for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:57:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDF4401A4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EDF4401A4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:57:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 294EA1BF203;
 Sat, 23 Jul 2022 12:57:27 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:57:26 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723145726.25bebec2@windsurf>
In-Reply-To: <20220529131811.481017-6-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-6-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658581047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dB04ry6eoim2XXQ4L+fv4DPmY89vqjq3t7fxnga7fTI=;
 b=Ibo79xeXleeIi6C9l2wweIoLS12Eh+YY32K0rPv9EWMYGIEP7EWZ2I/5pjBRnZypgRCjGi
 QbHNl7W7nVz+CTeS9mz7WKSb26f6Ea2AoJ7falYY6WX3BQLN/fPROh88oJQp1LGjpyxUQK
 Gg3ffSQ2rIIx5kxQvfoT+BrVMOErehMxjSgYXX4SlMCSWoxLB44XiQxyg6jHjyi7+LymsU
 Vm161uhvoSCKcsNqk9f1oNnyDbP1e1TWZn8iWKjrN0tAdkB8mxxK1AWSMUb4eJ4dQSXrZn
 CQYIPl4JdAnGxSmcD4z9x0WYjwh2bIZsf1kdHBdMft5MIvQ/+iB/NtUhzYP1Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ibo79xeX
Subject: Re: [Buildroot] [PATCH for-next 06/11] package/gcc: add missing
 --enable-libquadmath-support option
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

T24gU3VuLCAyOSBNYXkgMjAyMiAxNToxODowNiArMDIwMApSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+IHdyb3RlOgoKPiBXaGVuIEJSMl9UT09MQ0hBSU5fSEFTX0xJQlFVQURN
QVRIIGlzIHNldCwgLS1lbmFibGUtbGlicXVhZG1hdGgtc3VwcG9ydAo+IG9wdGlvbiBpcyBtaXNz
aW5nLiBTbyB0aGUgZmxvYXQxMjggc3VwcG9ydCBpcyBub3QgZnVsbHkgZW5hYmxlZCBpbiBnY2Mu
Cj4gCj4gVGhpcyBsZWFkIHRvIGEgYnVpbGQgaXNzdWUgd2l0aCBnY2MgMTIgb24gUG93ZXJQQyBw
b3dlcjggZHVlIHRvIG1pc3NpbmcKPiBNXzJfU1FSVFBJcSBkZWZpbml0aW9uIChwcm92aWRlZCBi
eSBsaWJxdWFkbWF0aC5oKS4KPiAKPiAuLi8uLi8uLi9saWJnZm9ydHJhbi9pbnRyaW5zaWNzL2Vy
ZmNfc2NhbGVkLmM6IEluIGZ1bmN0aW9uIOKAmGVyZmNfc2NhbGVkX3IxN+KAmToKPiAuLi8uLi8u
Li9saWJnZm9ydHJhbi9pbnRyaW5zaWNzL2VyZmNfc2NhbGVkLmM6MTQzOjIyOiBlcnJvcjog4oCY
TV8yX1NRUlRQSXHigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBk
aWQgeW91IG1lYW4g4oCYTV8yX1NRUlRQSWbigJk/Cj4gICAxNDMgfCAjIGRlZmluZSBfTV8yX1NR
UlRQSSBNXzJfU1FSVFBJcQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn4KPiAKPiBUaGlzIGlzIGZpeGVkIGJ5IGFkZGluZyAtLWVuYWJsZS1saWJxdWFkbWF0aC1zdXBw
b3J0IChsaWtlIGNyb3NzdG9vbC1uZwo+IGhhbmRsaW5nIFsxXSkuCj4gCj4gRml4ZXM6Cj4gaHR0
cHM6Ly9naXRsYWIuY29tL2t1YnU5My90b29sY2hhaW5zLWJ1aWxkZXIvLS9qb2JzLzI1MTAxNzg3
NjYKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2Nyb3NzdG9vbC1uZy9jcm9zc3Rvb2wtbmcv
YmxvYi9jcm9zc3Rvb2wtbmctMS4yNS4wL3NjcmlwdHMvYnVpbGQvY2MvZ2NjLnNoI0wzNzAKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UvZ2NjL2djYy5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhv
bWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
