Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE4C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 264B660F20;
	Wed,  3 Aug 2022 16:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 264B660F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG5Ya6AiCCBJ; Wed,  3 Aug 2022 16:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4402260A6D;
	Wed,  3 Aug 2022 16:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4402260A6D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 600C11BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B0B6828A9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0B6828A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMWOyG6Ue_ZV for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:32:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12ECE82897
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12ECE82897
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:32:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3CE220002;
 Wed,  3 Aug 2022 16:32:07 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:32:06 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220803183206.4a278247@windsurf>
In-Reply-To: <20220803074349.7590-3-francois.perrad@gadz.org>
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-3-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659544328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+zPDGK7B/0roiF3oO4IkAwxFYu7SX0AWY3SVex83fI=;
 b=e3pceZE7idhH1nnlEdPuIxBQCVuH5qFM2ygzsazcOm3y/9L2aDqaY7IYO1R/3+11i2kiCx
 XFde3E7dyvNzFPLlvNbz+HxTnO6yKvekXFLLCTfna+z+ppisEuxpHzIrat+50EvGohp+0t
 qZNRWrVw1qNJbkFPG2QOBfF2oOf0zxGKB4sxw84wIqtUDJ7nMtwOaUl12rdQ91H+EjyH/1
 u4TH7mdqAVybaieQnxT7BVIgklUlxNO4fcIDhCcWO0fyGgjGLbZxiLQGyJ49Ttbo6p1aL9
 cfonw37MiOSaY5GiN2bEIF2016T4aSQi1ZNdnDVUqejMbO5Sx9BevaVz+kuMNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e3pceZE7
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gV2VkLCAgMyBBdWcgMjAyMiAwOTo0Mzo0OCArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSBmaXJtd2FyZSB0byAkKFRBUkdFVF9ESVIpL2Jvb3Qgb3RoZXIgdGhhbgo+IHRvICQoQklO
QVJJRVMpIGZvbGRlci4gVGhpcyBpcyBuZWVkZWQgaW4gdGhlIGNhc2UKPiBCUjJfTElOVVhfS0VS
TkVMX0lOU1RBTExfVEFSR0VUIGlzIG5vdCBzZXQKCkNvdWxkIHlvdSBjbGFyaWZ5IHdoeSBpbnN0
YWxsaW5nIHRoZSBrZXJuZWwgaW4gL2Jvb3QgaXMgcmVsYXRlZCB0bwpoYXZpbmcgb3Igbm90IHRo
aXMgZmlybXdhcmUgaW5zdGFsbGVkIGluIC9ib290PwoKPiAraWZlcSAoJChCUjJfTElOVVhfS0VS
TkVMX0lOU1RBTExfVEFSR0VUKSwpCj4gIFFPUklRX0NBREVOQ0VfRFBfRklSTVdBUkVfSU5TVEFM
TF9JTUFHRVMgPSBZRVMKPiAgUU9SSVFfQ0FERU5DRV9EUF9GSVJNV0FSRV9JTlNUQUxMX1RBUkdF
VCA9IE5PCj4gK2VuZGlmCgpTbyB0aGlzIG1lYW5zIHRoYXQgd2hlbiBCUjJfTElOVVhfS0VSTkVM
X0lOU1RBTExfVEFSR0VUPXksIHRoZSBmaXJtd2FyZQp3aWxsIG5vIGxvbmdlciBiZSBpbnN0YWxs
ZWQgaW4gJChCSU5BUklFU19ESVIpLCBwb3RlbnRpYWxseSBicmVha2luZwpleGlzdGluZyB1c2Fn
ZSBvZiB0aGlzIHBhY2thZ2U/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
