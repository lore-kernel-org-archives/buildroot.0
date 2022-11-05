Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A435C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECBC4034C;
	Sat,  5 Nov 2022 21:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECBC4034C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwvJyqA6pwXE; Sat,  5 Nov 2022 21:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2340323;
	Sat,  5 Nov 2022 21:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E2340323
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB9AF1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C69834032A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69834032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bc3VWUxMncZP for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F33400D9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87F33400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:01:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F27371BF20F;
 Sat,  5 Nov 2022 21:00:56 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:00:55 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105220055.464ea2f6@windsurf>
In-Reply-To: <20221103225224.6375-1-fontaine.fabrice@gmail.com>
References: <20221103225224.6375-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667682057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZKjeuyiEfcRvJUBk2iS829JewdmbX0wP4uv/W0EHzs=;
 b=dY/vCO2W5lRYlTw3eZjSLxquw2bRqo3lvgXFazNpwxeK+vhywpHGc60sAhvS3hXt3QHYPb
 oP1TSEK3dZgc/cDs25wlltTcww4PHE4xKvys4/wYKm+a8ZtJxQvcYVpEJC4EkBiWHgzjm5
 FHwLKqxoda9Y6xbN/OIqDf4REZySR8rl4yeBIj0J4EkvfW7AmdLJEjcFhdSrO7TfovHb6d
 cfyjrKciXMdZG3kZbVPKXBayS+syD63p7U+EyRzyaBdCAPwf8THMds2yASaX6tgZAmogIB
 bFRCl+kzofgMF1IioUIrICYFkhtGUihGsgtLLqvvsa/UzojOYP4McM/WCaT7OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dY/vCO2W
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 5.5.3
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgMyBOb3YgMjAyMiAyMzo1MjoyNCArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCBmb3IgcG9zc2libGUgYnVmZmVy
IHplcm9pemF0aW9uIG92ZXJydW4gaW50cm9kdWNlZCBhdCB0aGUgZW5kIG9mCj4gdjUuNS4yIHJl
bGVhc2UgY3ljbGUgaW4gR2l0SHViIHB1bGwgcmVxdWVzdCA1NzQzICgjNTc0MykgYW5kIGZpeGVk
IGluCj4gcHVsbCByZXF1ZXN0IDU3NTcgKCM1NzU3KS4gSW4gdGhlIGNhc2Ugd2hlcmUgYSBzcGVj
aWZpYyBtZW1vcnkKPiBhbGxvY2F0aW9uIGZhaWxlZCBvciBhIGhhcmR3YXJlIGZhdWx0IGhhcHBl
bmVkIHRoZXJlIHdhcyB0aGUgcG90ZW50aWFsCj4gZm9yIGFuIG92ZXJydW4gb2YgMOKAmXMgd2hl
biBtYXNraW5nIHRoZSBidWZmZXIgdXNlZCBmb3IgKEQpVExTIDEuMiBhbmQKPiBsb3dlciBvcGVy
YXRpb25zLiAoRClUTFMgMS4zIG9ubHkgYW5kIGNyeXB0byBvbmx5IHVzZXJzIGFyZSBub3QgYWZm
ZWN0ZWQKPiBieSB0aGUgaXNzdWUuIFRoaXMgaXMgbm90IHJlbGF0ZWQgaW4gYW55IHdheSB0byBy
ZWNlbnQgaXNzdWVzIHJlcG9ydGVkCj4gaW4gT3BlblNTTC4KPiAKPiBodHRwczovL2dpdGh1Yi5j
b20vd29sZlNTTC93b2xmc3NsL3JlbGVhc2VzL3RhZy92NS41LjMtc3RhYmxlCj4gCj4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
LS0tCj4gIHBhY2thZ2Uvd29sZnNzbC93b2xmc3NsLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uvd29s
ZnNzbC93b2xmc3NsLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKSXQncyBhIHZlcnNpb24gYnVtcCwgYnV0IHJlYWxseSBhIHB1
cmUgYnVnIGZpeCByZWxlYXNlLCB3aXRoIHZlcnkKbGltaXRlZCBjaGFuZ2VzLCBzbyBJIGRlY2lk
ZWQgdG8gdGFrZSBpdCBpbiBtYXN0ZXIuIEFwcGxpZWQsIHRoYW5rcyEKClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
