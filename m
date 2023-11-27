Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D18AC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0EE81499;
	Mon, 27 Nov 2023 18:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E0EE81499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaoMRVpLsyr6; Mon, 27 Nov 2023 18:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822D3813FA;
	Mon, 27 Nov 2023 18:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822D3813FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4D6A1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DA7360F2E
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA7360F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CqKINF0JY3f for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:45:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AF5C60F2B
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF5C60F2B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C81DAB00573;
 Mon, 27 Nov 2023 19:45:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:45:01 +0100
Date: Mon, 27 Nov 2023 19:45:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20231127184501.GC3177259@scaer>
References: <20231120214150.671145-1-gael.portay@rtone.fr>
 <20231120231125.2ba705f9@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231120231125.2ba705f9@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701110707;
 bh=x0uk8mogeWFL5SrOSe1xU5+6WWbx2ZFPqVwWWNWXOz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OwmCwjNzpoznGaxJ7wVAP7/1/KYhAPgSTg14t1Wi5xNSeyZLeJvJ5LsdVU8aX0IN7
 jJXTSX488o6eC/jLWRcbJd8rnZO6Jq5W7Y/FnpLeA5VUtsmAZd/LY0P84zmMkmfVM6
 KaUfmTpUQCBtbJ7vWnIhBm7eb1T/r+NvaslCi76nCpSfbKDM4b1TJVezNWbiaEFxxm
 co8PBVXZlwzVcUz+z0caCOIVBv24entzTDHTwSx75NCNvS9OFHSUjJcbrtbSRF9MSk
 Ofr82njwCt86J6CTU/f2E5c0Sj6+dzqY3sdwdwYcwqSqdFpssSGkbbKp8A1y6WIeRw
 PIgIht87l85wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OwmCwjNz
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: fix autoprobing of
 bluetooth driver
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
Cc: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjMtMTEtMjAgMjM6MTEgKzAxMDAsIFBldGVyIFNlaWRlcmVyIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIDIwIE5vdiAyMDIzIDIyOjQxOjUwICswMTAwLCBHYcOrbCBQ
T1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPiB3cm90ZToKPiA+IFRoZSBjb21taXQgNjg5Yjlh
YzQzOSAocGFja2FnZS9ycGktZmlybXdhcmU6IHJld29yayBib290L2NvbmZpZyBmaWxlCj4gPiBo
YW5kbGluZykgaGFzIHNwbGl0IGluIHR3byB0aGUgcHJvcGVydHk6Cj4gPiAJZHRvdmVybGF5PW1p
bml1YXJ0LWJ0LGtybmJ0PW9uCj4gPiBJbnRvOgo+ID4gCWR0b3ZlcmxheT1taW5pdWFydC1idAo+
ID4gCWR0b3ZlcmxheT1rcm5idD1vbgpbLS1TTklQLS1dCj4gLi4uYWx0ZXJuYXRpdmUgcGF0Y2gg
KHJlbW92aW5nIHRoZSBmYWlsaW5nIGxpbmUpIGFscmVhZHkgc3VnZ2VzdGVkLCBzZWUgWzZdIGZv
cgo+IGRldGFpbHMgYW5kIHJlYXNvbmluZy4uLgo+IFs2XSBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwODA4MTgwOTU5LjI4MDkxLTItcHMu
cmVwb3J0QGdteC5uZXQvCgpUaGFua3MgZm9yIHRoZSBoZWFkcy11cCBvbiB0aGF0IHBhdGNoLCBJ
J2xsIGxvb2sgaW50byBpdCBub3c6IEl0IHN0YXRlcwoiYXMgbm8gb25lIGNvbXBsYWluZWQgc2lu
Y2UgMjAyMSBqdXN0IGRyb3AgaXQiIGJ1dCBHYcOrbCBub3RpY2VkIG5vdywgc28KaXQgbWFrZXMg
c2Vuc2UgdG8gYXBwbHkgaGlzIHBhdGNoIG5vdy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
