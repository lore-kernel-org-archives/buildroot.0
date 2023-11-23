Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4BDC5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 10:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E267B8146D;
	Thu, 23 Nov 2023 10:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E267B8146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FS3m3UOom4x2; Thu, 23 Nov 2023 10:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397D88146E;
	Thu, 23 Nov 2023 10:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397D88146E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6901BF48D
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54DF061046
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54DF061046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joLZORhAWFUR for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 10:12:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFCD36102F
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 10:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCD36102F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FCC340005;
 Thu, 23 Nov 2023 10:12:34 +0000 (UTC)
Date: Thu, 23 Nov 2023 11:12:33 +0100
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <20231123111233.24b5dbf2@windsurf>
In-Reply-To: <20231121193448.1151936-1-gael.portay@rtone.fr>
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1700734354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrbJYyVYpoNPnAatssOkPEBZXvQ3uohVuOsup6a2ins=;
 b=nOb6Xq/1HyGVdl6XbXGZO4hDK0JCXCtTHFJeGBBWWJ2LHuD8M3VXrx7EoIBnCDMRIco4g7
 vUhjdVrH7MSkIFy5zFIPCQN7DWIv6cHX12qLpQXr90FFhx++lw45GZdPhAPTa0H7re31ey
 adCrCwKzMN9c59DllExn//CrcsgFKGKdwijbYXKxexSB5URJ99OcS54cL73Nx2kzjg+HVb
 eCo4UMk/SUw/oLLwgQ46j/Syams/5GeyTufh1UYA0Y4j8Xj2cc2KQbm2H0qjIwFLvRGGjr
 XDzWzHsGI7i1O86i+6QuZ1+lolu53WMDealUJY6UB7xPCCVAMe97ss2LcKUxXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nOb6Xq/1
Subject: Re: [Buildroot] [v1 0/4] [PATCH 0/3] Add support for Pi5
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBOb3YgMjAyMyAyMDozNDo0NCArMDEwMApHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5QHJ0b25lLmZyPiB3cm90ZToKCj4gVGhlIG91dHB1dCBib290cyBmaW5lIGFuZCBpdCBydW5z
IGdldHR5IG9uIHVhcnQgYW5kIHZpcnR1YWwgdHR5IGlmIGl0IGlzCj4gYnVpbHQgdXNpbmcgdGhl
IHRvb2xjaGFpbiBidWlsdCBieSBidWlsZHJvb3QuCj4gCj4gVGhlIG91dHB1dCBib290cyB0aGUg
a2VybmVsIGJ1dCB0aGUga2VybmVsIGNhbm5vdCBydW4gdGhlIGluaXQgcHJvY2Vzcwo+IGlmIGl0
IGlzIGJ1aWx0IHVzaW5nIHRoZSBib290bGluIHByZWJ1aWx0IHRvb2xjaGFpbi4gU29tZXRoaW5n
IGlzIGJyb2tlbgo+IGR1ZSB0byB0aGUgMTZrIE1NVSBwYWdlLXNpemUgOigKCkkgKnRoaW5rKiB0
aGlzIGlzIGV4cGVjdGVkLiBUaGUgQm9vdGxpbiB0b29sY2hhaW5zIGFyZSBidWlsdCBmb3IgdGhl
CmRlZmF1bHQgcGFnZSBzaXplIG9mIDRLQiwgc28gdGhlIGxpYmMgaW4gdGhvc2UgdG9vbGNoYWlu
cyBleHBlY3RzIDRLQgpwYWdlcywgYW5kIHRoaXMgYnJlYWtzIGlmIHlvdSBtaXggaXQgd2l0aCBj
b2RlIHRoYXQgd2FzIGJ1aWx0IGZvciAxNiBLQgpwYWdlIHNpemUuCgo+IFF1ZXN0aW9uOiB0aGUg
ZGV2aWNlLXRyZWUgb3ZlcmxheXMgYXJlIHRha2VuIGZyb20gdGhlIHJwaS1maXJtd2FyZTsgaXMK
PiB0aGVyZSBhIHBsYW4gdG8gY29tcGlsZSB0aGUgb25lIGZyb20gdGhlIGRvd25zdHJlYW0ga2Vy
bmVsIHNvdXJjZXMKPiBpbnN0ZWFkPyBieSB0d2Vha2luZyB0aGUgbGludXgubWsgbWF5YmU/CgpU
aGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgaXQgd291bGQgYmUgYSB0d2VhayBpbiBsaW51eC5tayB0
aGF0IGlzCnNwZWNpZmljIHRvIGhvdyB0aGUgZG93bnN0cmVhbSBSUGkga2VybmVsIGRvZXMgaXQu
IEJ1dCB0aGUgbWFpbmxpbmUKa2VybmVsIGhhcyBncm93biBzdXBwb3J0IGZvciBidWlsZGluZyBE
VCBvdmVybGF5cyB0b28uIElzIGl0IHNpbWlsYXIgdG8KaG93IHRoZSBkb3duc3RyZWFtIFJQaSBr
ZXJuZWwgZG9lcyBpdD8KCldoaWNoIHR3ZWFrIHdvdWxkIGJlIG5lZWRlZCBpbiBsaW51eC5tayB0
byBidWlsZCBvdmVybGF5cyBpbiB0aGUKZG93bnN0cmVhbSBSUGkga2VybmVsPwoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
