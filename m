Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB04AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B44CF610FD
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B44CF610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB23E61566;
	Fri,  5 Nov 2021 13:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyVNv5yE84RE; Fri,  5 Nov 2021 13:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232DA6156C;
	Fri,  5 Nov 2021 13:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B72A11BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B284F4047E
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FT1kM7jGQ3l for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 13:24:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25D41401D4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 13:24:28 +0000 (UTC)
Received: from smtpclient.apple ([151.36.1.27])
 by Aruba Outgoing Smtp  with ESMTPA
 id izCimUyiAFf01izCjmZDCJ; Fri, 05 Nov 2021 14:24:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636118667; bh=bGEW8djvBSSHyMWVYYmysGodkQdlK6po6GD6elJSApg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=anWVNZa3KaXMXTnWV0xARKOr+Vp+FfRGjE+zcP4nbeHFB8K8yrFKUqB5O0v6KutJh
 7sa2SwU9E2s+3eEPEHTmyCAGb5TSgvJ69RC/kg9WP69fKoCvomXnL+4WjAPHRYIKgb
 ppghcVcP9RqoexhSZLE+qIxgOJRjd64W+L+iFaawXIbhuGE/Zxjd4zSiE/d75ILNnl
 WgJ3eMZ8pWhUbFPWdPPZJnY0t/oqfFJcNAxTfl9lgDbnuzfZreVwlvdsd0RPq+e6Oe
 Q/HoJQGYZpXDVN17UwrRb8VPN3Qvj3mpeVWbSNZehyqG3i0BLLQNDcbCYoQK8hmrCg
 Zc9CvjVFH8C3g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 5 Nov 2021 14:24:24 +0100
Message-Id: <CC4DEBFE-15CC-4593-9F6D-7775ECF08A71@benettiengineering.com>
References: <27c59ddf-4bcb-86e1-91cf-28b45848d446@lucaceresoli.net>
In-Reply-To: <27c59ddf-4bcb-86e1-91cf-28b45848d446@lucaceresoli.net>
To: Luca Ceresoli <luca@lucaceresoli.net>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfDsCXQBmIw6CuxZKf/LRJLknNCB9jaZp6LebGL5lM4xkF83ZDgcV3AovgnzUwAtW/id0krrcB1diH+Hy9ieCdlfGa2iNYe88lf3bYwUzQ0/isGAwgqYE
 a6kNyrt/sdvhFpw3nOObqcoNy+ofQcoge8khl9UbKtD4UjBWIXinDCm5Mig743QiLKUw2omBIxRzzf8ag/aj113pWInP0PJEnbxiKxmMOtK9f8r/pkKOhA24
 l/vdxEtboEpnit9eDMUXIndWMq60VS/exQDt/A9LUBeh20ZKJHsyHBpl4CBYSVjLuwAu95U/9u7+ij17EfYDBbr6ePTHG1+zTDB2jAQ2Wlq7Z+A8ogemOB0e
 wFE+V1ApYalu5DMgpvR16s/g/+aNV8cFNHMIK2eBIzwHrcH65ceqvIyLwuKesEPqAkhosmuZSEwWw3kGIR0Bgh+L3X6wo2nm1ITSlgrz7Cekoxp2CeaV92RX
 CX7t8yUfSEamRkU9
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCj4gSWwgZ2lvcm5vIDUgbm92IDIwMjEsIGFsbGUgb3JlIDEyOjA1LCBMdWNhIENl
cmVzb2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1
bGlvLAo+IAo+PiBPbiAwNC8xMS8yMSAxODoyMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEhp
IEx1Y2EsCj4+IAo+Pj4gT24gMTEvNC8yMSAxMDoyNiBBTSwgTHVjYSBDZXJlc29saSB3cm90ZToK
Pj4+IEhpIEdpdWxpbywKPj4+IAo+Pj4gdGhhbmtzIGZvciB0aGVzZSBhbmQgdGhlIG90aGVyIG9s
aW1leCBwYXRjaGVzIHlvdSBhcmUgc2VuZGluZy4gVGhvbWFzCj4+PiBhcHBsaWVkIHRoZW0gZmFz
dGVyIHRoYW4gSSBjb3VsZCByZXZpZXcgYW5kIHRlc3QgdGhlbS4uLiBsZXQgbWUgdHJ5IHRoaXMK
Pj4+IHRpbWUgOikKPj4gCj4+IEkndmUganVzdCBzZW50IHRoZSB2MiBzZXJpZXMsIGRvIHdlIHdh
aXQgdW50aWwgeW91IGdpdmUgYSBUZXN0ZWQtYnk6ID8KPiAKPiBKdXN0IHNlbnQgbXkgVGVzdGVk
LWJ5IHRvbywgYnV0IEkgb25seSBidWlsZCB0ZXN0ZWQgc2luY2UgSSBoYXZlIG5vIGxpbWUKPiBi
b2FyZC4KCkhhdmUgeW914oCZdmUgZ2l2ZW4gYSB0cnkgb24gbGltZTIgYXQgbGVhc3Q/CgpPdGhl
cndpc2UgSSBjYW4uCgpHaXVsaW8KCj4gCj4gLS0gCj4gTHVjYQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
