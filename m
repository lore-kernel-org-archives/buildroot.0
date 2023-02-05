Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C561DC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6413C81D5F;
	Sun,  5 Feb 2023 14:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6413C81D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3FGlMygCBP_X; Sun,  5 Feb 2023 14:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627AB81765;
	Sun,  5 Feb 2023 14:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 627AB81765
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBF31BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D2F60758
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9D2F60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wveLUYHJfLkH for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:17:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD2A60671
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CD2A60671
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:17:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E8FBC0004;
 Sun,  5 Feb 2023 14:17:52 +0000 (UTC)
Date: Sun, 5 Feb 2023 15:17:51 +0100
To: Casey Reeves <casey@xogium.me>
Message-ID: <20230205151751.2173e6de@windsurf>
In-Reply-To: <20230119121004.3416962-2-casey@xogium.me>
References: <20230119121004.3416962-1-casey@xogium.me>
 <20230119121004.3416962-2-casey@xogium.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675606672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+aN80k1G9dZrjXUvm1CwD7dc+Rm5I4R6xQrRHdhPL8=;
 b=Cr6iqjGK9/Ag2twOcfdA8gEOvQfc7qAWGLeAoUXCu5TFEHzn+HUz1m7TMQ5SVf3RxwHcGH
 z+Sv3WF2Uu+04ONWeY/Ul532ROmNJWRmmipo6okCEtXZF+RFmTmnvwngLqyjMpYHWByru8
 A18hHOjIm6ki9b+eucRfsr38zDxtsn6+HPt2Gk4TaNCCkzx+5EtkxwyJ3Xpdmlc7HfUX/P
 gVaMBLAooT0ROKTVrbQ59wC2FdMhSFex8TQBF9xF8e5XIkd1+ZvlBuCMqQaOZYGPMUDYhW
 2uiJeD6Of3HNomIwUEedajXralwdtpHeqoKlGJrMH7lirF3OQQn8X2RrVbptDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cr6iqjGK
Subject: Re: [Buildroot] [PATCH 1/2] package/lzop: provide a patch to allow
 overriding of modification time
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

SGVsbG8sCgpPbiBUaHUsIDE5IEphbiAyMDIzIDEzOjEwOjAzICswMTAwCkNhc2V5IFJlZXZlcyA8
Y2FzZXlAeG9naXVtLm1lPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBhbGxvd3MgbHpvcCB0byBvdmVy
cmlkZSB0aGUgbW9kaWZpY2F0aW9uIHRpbWUgdXNpbmcKPiAkU09VUkNFX0RBVEVfRVBPQ0guCj4g
VGhlIG9yaWdpbmFsIHBhdGNoIHdyaXR0ZW4gYnkgRmxvcmlhbiBCw6R1ZXJsZSBpcyBmb3IgbHpv
cCAxLjA0LCBhbmQKPiBoZW5jZSBuZWVkZWQgdG8gYmUgYmFja3BvcnRlZCB0byB0aGUgMS4wMyBy
ZWxlYXNlIGJ1aWxkcm9vdCBpcyBtYWtpbmcKPiB1c2Ugb2YuCgpBbnkgcmVhc29uIHdoeSB3ZSdy
ZSBub3QgdXNpbmcgbHpvcCAxLjA0ID8gTWF5YmUgd2Ugc2hvdWxkIGJ1bXAgbHpvcAoxLjA0IGZp
cnN0ID8KCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbHpvcC8wMDAzLWFsbG93LW92
ZXJyaWRpbmctbW9kaWZpY2F0aW9uLXRpbWUucGF0Y2gKPiBAQCAtMCwwICsxLDQ2IEBACj4gK0Zy
b20gZDM3MTcwNjVkNGI0ZGQ3ZGZhODhlYmMxNTQxODVjZTc1MjEyN2U5MyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiArRnJvbTogQ2FzZXkgUmVldmVzIDxjYXNleUB4b2dpdW0ubWU+Cj4gK0Rh
dGU6IFRodSwgMTkgSmFuIDIwMjMgMTA6MDY6MzEgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBh
bGxvdyBvdmVycmlkaW5nIG1vZGlmaWNhdGlvbiB0aW1lCgpDb3VsZCB5b3UgcHJlc2VydmUgdGhl
IGF1dGhvcnNoaXAgb2YgdGhlIG9yaWdpbmFsIHBhdGNoIGF0Cmh0dHBzOi8vZ2l0LnBlbmd1dHJv
bml4LmRlL2NnaXQvcHR4ZGlzdC90cmVlL3BhdGNoZXMvbHpvcC0xLjA0LzAwMDItYWxsb3ctb3Zl
cnJpZGluZy1tb2RpZmljYXRpb24tdGltZS5wYXRjaAo/CgpZb3VyIHBhdGNoIGlzIHByZXR0eSBt
dWNoIGV4YWN0bHkgdGhlIHNhbWUsIHNvIHdlIHJlYWxseSB3YW50IHRvIGtlZXAKdGhlIG9yaWdp
bmFsIGF1dGhvcnNoaXAuIFRoZSBwYXRjaCBzaG91bGQgc3RpbGwgY2FycnkgeW91cgpTaWduZWQt
b2ZmLWJ5IGFuZCBhIHJlZmVyZW5jZSB0byB3aGVyZSB0aGUgb3JpZ2luYWwgcGF0Y2ggd2FzIGZv
dW5kLgoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
