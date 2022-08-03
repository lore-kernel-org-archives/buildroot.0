Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A356EC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B63381764;
	Wed,  3 Aug 2022 20:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B63381764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkcuoFj04GXu; Wed,  3 Aug 2022 20:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635C28146D;
	Wed,  3 Aug 2022 20:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635C28146D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2FE1BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C10A8126C
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C10A8126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SovvDTOWaoiT for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:19:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491C781255
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 491C781255
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 20:19:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8B2660002;
 Wed,  3 Aug 2022 20:19:14 +0000 (UTC)
Date: Wed, 3 Aug 2022 22:19:13 +0200
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20220803221913.470cbf7a@windsurf>
In-Reply-To: <CAB0FRssCzSJocBF3yee4nOEf-z=92Dm93OLaKoM7sCn+5jGgzA@mail.gmail.com>
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-3-francois.perrad@gadz.org>
 <20220803183206.4a278247@windsurf>
 <CAB0FRssCzSJocBF3yee4nOEf-z=92Dm93OLaKoM7sCn+5jGgzA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659557955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2ukVmuaFDX1zhmrXyobBD6naIlI9Rmk5AJlGUdux2Q=;
 b=GUv2NHyxQOOQyr9RCiOkeH7CRcLHnBKvCv+wscIg/ZK4+d6BVfLiq+2BYHoUPHSH0EwW48
 1R55pwDZI+ZxR/SozmNNENmoy1U7NjWtiYB2WvdCTviX2HqYOP8pmLoMhAFPm7UxeB3/b8
 4zL4Ussc7qdAY5hgu2Xw6RkLIJPQUvAirl9WWofYKJiSX1Oe2mfE63WEHgcIu9swnUT15s
 8PDJwAoAvGZAmS95by8Pn9g5o3VC3SzI+LT915mmXP2y6/okZvohmAqoVZjvKg5W79vsHW
 Hcu32U14Vj75DJmIAjxhz/EcZozG8CFFXGnZ1BM5bZXFuRTgeW2VXOOz/xSXJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GUv2NHyx
Subject: Re: [Buildroot] [PATCH v2 2/3] package/qoriq-cadence-dp-firmware:
 add install in target
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
Cc: buildroot <buildroot@busybox.net>, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAzIEF1ZyAyMDIyIDIxOjQ1OjQ4ICswMjAwCkZyYW7Dp29pcyBQZXJyYWQgPGZyYW5j
b2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IGluIHYxLCB0aGUgY29tbWl0IG1lc3NhZ2Ug
d2FzIDoKCldoeSBoYXMgdGhlIHYyIGNvbW1pdCBtZXNzYWdlIGNoYW5nZWQsIHRvIHJlbW92ZSBp
bmZvcm1hdGlvbj8KCj4gdGhpcyBmaXJtd2FyZSBtdXN0IGJlIGluc3RhbGxlZCB3aXRoIHRoZSBr
ZXJuZWwsCj4gPiB0aGVyZSBhcmUgMiBjYXNlczoKPiA+ICAKPiAtIGluICQoVEFSR0VUX0RJUikv
Ym9vdAo+ID4gLSBpbiAkKEJJTkFSSUVTKSwgaW4gb3JkZXIgdG8gYmUgYnVuZGxlZCBpbnRvIGEg
Ym9vdCBwYXJ0aXRpb24KClRoaXMgZG9lc24ndCBleHBsYWluIHRoZSAqd2h5Ki4gSG93IGlzIHRo
ZSBmaXJtd2FyZSBiZWluZyB1c2VkIGZyb20KJChUQVJHRVRfRElSKS9ib290ID8KClRob21hcwot
LSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
