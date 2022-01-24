Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865EAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26BA9400F1;
	Mon, 24 Jan 2022 08:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTQyy-rC0M0O; Mon, 24 Jan 2022 08:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03E7D4015C;
	Mon, 24 Jan 2022 08:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2B11BF2AA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B86F60A88
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T14-LtW7Z03A for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:12:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81F0060A46
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:12:51 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id BuT2nOgfHz0d2BuT2nS7Cp; Mon, 24 Jan 2022 09:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643011969; bh=kvjPrGRDmMiWuMj7xAdZ/ODNyMU2WiJWmKzXUMNLXM4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=E8MLBTkmbeV9XFhbkXjCcRRbOh6Vgvvot39+QoQgT43f7roOEbhtQUGJEOl+RSC6T
 RTGLih60R6WbTOy+mJjyOe+xKSgJXCtX8ujOhMJrjQgWhYD9t+7xcHX9CmcKrJyiZl
 XIoAXqgtQbscnL+ANf7CLeo6lpEsoI5a5Q5pU3Nr+PIeis5N3ThrzzuIGN5J78A8Dh
 1JCMEUUC1Plo3gYDNKbe+2w1Zy7Ctm/IjZTV1Y65JmCbJ6WAr2WewtvxgI9E1wRpqm
 NSYSdQ+CGUvWMlBcnmASpXECa+Zm8nk3NqCNv4q4WPc2vCtCBeCP1D4OFZHzaV1/gs
 9sN+zQ1UUHaZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 24 Jan 2022 09:12:47 +0100
Message-Id: <2BFF5C08-8E54-4689-894E-0A0BE3D6A71A@benettiengineering.com>
References: <1dea301e-8425-a1ca-fc69-db338825b19c@gmail.com>
In-Reply-To: <1dea301e-8425-a1ca-fc69-db338825b19c@gmail.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfIcHZ1UsxYgUNJcgg9+ksSSu2CbQLQf6hbhZwABn+C8bqMlt+f6chboLzMfBeMLDTDhQdQEJPtajlPYdy1KBHmok3R2MOZN5OGwtAcDfdNsvT9Y5lbAS
 2ykSoeaBpFu0DxUM1c2Lks97z35ZsgRmFWXvk2a5ai4Hsx006kCLWBepismVHdzXxnFYeFAtPWEkrhyz5i0QpIgI4dl9uifFQdrv0/LEkGzute9p4enCwXd1
 iu4nKABCoqtNzfx4Ptfq88Jl80h59TJ+Vnkqrfp8Sgh3tKi2UmVcRoJUWzhKLgdtRXt5U1EThgi9PXHmH1I+WlHcWYmZq6M3qYS2VImWpo1+6LYXkZnsq4/R
 6Q7ETxOL
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDI0IGdlbiAyMDIyLCBhbGxlIG9yZSAwNjo0MywgU2VyZ2V5IEt1em1pbm92
IDxrdXptaW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgQWxs
LAo+IAo+IDI0LjAxLjIwMjIgMDE6MDEsIEdpdWxpbyBCZW5ldHRpOgo+PiBJTUhPIHRoZSB3b3Jz
dCBkcmF3YmFjayBJIHNlZSB3aGlsZSB1c2luZyBleHRsaW51eC5jb25mIFZTIGJvb3Quc2NyIGlz
IHRoZSBtaXNzaW5nIGNoZWNrc3VtLiBFc3BlY2lhbGx5IG9uIGVtYmVkZGVkIHN5c3RlbXMgd2Ug
ZGVlcGx5IHRyZWF0Lgo+PiBOb3QgaGF2aW5nIHN1Y2ggY2hlY2tzdW0gY2FuIG1ha2Ugc3lzdGVt
IGJvb3Rpbmcgd2l0aG91dCBhIHBhcmFtZXRlciBvbiBsaW51eCBjb21tYW5kIGxpbmUgZm9yIGV4
YW1wbGUsIG9ubHkgYmVjYXVzZSAxIEFTQ0lJIGhhcyBiZWVuIGNvcnJ1cHRlZC4KPj4gSSBwcmVm
ZXIgdGhlIHN5c3RlbSB0byBub3QgYm9vdCBhdCBhbGwgaW4gZ2VuZXJhbCBpbnN0ZWFkIG9mIGhh
dmluZyBpdCAid29ya2luZyIgd2hpbGUgaGlkaW5nIHNvbWUgcG90ZW50aWFsIHByb2JsZW0uCj4+
IFdoYXQgZG8geW91IGFuZCBBbGwgdGhpbmsgYWJvdXQgdGhpcz8KPiAKPiBJTUhPIGV4dGxpbnV4
LmNvbmYgaXMgbW9yZSBkZWJ1Z2dpbmcgZnJpZW5kbHkuCj4gCj4gQm9vdC5zY3IgcmVxdWlyZXMg
dGhlIGZvbGxvd2luZyBjb21tYW5kOgo+IG1raW1hZ2UgLUMgbm9uZSAtQSBhcm0gLVQgc2NyaXB0
IC1kIGJvb3QuY21kIGJvb3Quc2NyCj4gCj4gVGhlIG1raW1hZ2UgdXRpbGl0eSAoQlIyX1BBQ0tB
R0VfSE9TVF9VQk9PVF9UT09MUykgaXMgbm90IG9uIHRoZSBib2FyZCwgeW91IG5lZWQgdG8gdHJh
bnNmZXIgdGhlIGNvbnZlcnRlZCBmaWxlIG92ZXIgdGhlIG5ldHdvcmsuIE9yIHJlY29ubmVjdCB0
aGUgbWljcm9TRCBjYXJkLgoKSSBhZ3JlZSB3aXRoIHRoaXMgdG9vLiBJ4oCZdmUgZm91bmQgbXlz
ZWxmIG1hbnkgdGltZXMgYmxhbWluZyBiZWNhdXNlIEkgY291bGRu4oCZdCBzaW1wbHkgbW9kaWZ5
IGJvb3Quc2NyIG9uIHRhcmdldCBhbmQgcmVib290LgpCdXQgSSBmaW5kIGl0IHN0aWxsIGRhbmdl
cm91cy4KCkFub3RoZXIgdGhpbmcgdGhhdCBJIGRvbuKAmXQgZmluZCBwb3NzaWJsZSB0byBkbyB3
aXRoIGV4dGxpbnV4LmNvbmYgaXMgdXNpbmcgdWJvb3Qgc2NyaXB0aW5nIHBvc3NpYmlsaXR5IHRo
YXQgZW5hYmxlcyB5b3UgdG8gZG8gbG90IG9yIHRoaW5ncywgbGlrZSBmZHQtb3ZlcmxheSBleHBh
bmQgYW5kIGFwcGx5LCBzaG93IGEgYm1wIGluc3RlYWQgb2YgaGF2aW5nIGEgc3RhdGljIHNwbGFz
aHNjcmVlbiBhbmQgc28gb24uCgpJIGRvbuKAmXQgdGhpbmsgdGhpcyBpcyBhY2hpZXZhYmxlIHdp
dGggZXh0bGludXguY29uZgoKVGhlc2UgYXJlIG9ubHkgbXkgdGhvdWdodHMgYnV0IEkgc3RpbGwg
ZG9u4oCZdCBoYXZlIGEgc29sdXRpb24gaG9uZXN0bHkuIEluIHBhcnRpY3VsYXIgdG8gdW5pZm9y
bSBib2FyZHMuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
