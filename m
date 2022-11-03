Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524BEC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5006105C;
	Thu,  3 Nov 2022 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC5006105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSCZuAum1yvd; Thu,  3 Nov 2022 21:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290AD61056;
	Thu,  3 Nov 2022 21:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290AD61056
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9FF1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703C24187A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703C24187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8-3By-9OMBW for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:27:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 157754188F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 157754188F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:27:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A104100004;
 Thu,  3 Nov 2022 21:27:55 +0000 (UTC)
Date: Thu, 3 Nov 2022 22:27:53 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221103222753.501bf939@windsurf>
In-Reply-To: <20221103172247.1629518-1-vincent.stehle@arm.com>
References: <20221103172247.1629518-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667510875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxSmbGuOh3o/j4DFN4cXPSrlEYs4lq+/eswRuY7iLb4=;
 b=d7cPc9FLrCpwp+BdADK42e6uIQ03ZE+VTqN8TFs716jE9/EDxMAYgp3eitSTRiay7grZ6p
 sSMaeFLkS2/81ZH1/MQtRHsmi24sBl93NHZ6Tuypglyn9ASSCUbHCuYUqmroN1ujO+tbMd
 STwxT8YpYSu8YJS/fU6TSAMNCgtK3QvzVbdHHF/Sc47r87cHnN6uk2urA0GJ24pZfWB9Pf
 R2Bjdp+SJcxrxyjpnP/tzKP4pOh+QfveauS2Hq549CUV7N21dXbGvFfhG0NVq4wTiykoHA
 k8BgR0JvhRxBSV9xtaLjKcq7/QWr8WaLNfwQUrSaof7aSJzEEhkE1AVqMwAHPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d7cPc9FL
Subject: Re: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: bump u-boot and
 linux versions
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgMyBOb3YgMjAyMiAxODoyMjo0NyArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiAtIEJ1bXAgVS1Cb290IHZlcnNpb24gdG8gdjIw
MjIuMTAuCj4gLSBCdW1wIExpbnV4IGtlcm5lbCB2ZXJzaW9uIHRvIHY2LjAuMC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAtLS0KPiAgY29uZmlncy9x
ZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKV2Ugbm9ybWFsbHkgZG9uJ3QgdGFrZSB2
ZXJzaW9uIGJ1bXBzIGFmdGVyIC1yYzEsIGJ1dCB0aGlzIGRlZmNvbmZpZyBpcwpuZXcsIHNvIEkg
ZGVjaWRlZCB0byB0YWtlIHRoaXMgcGF0Y2ggaW4gbWFzdGVyLiBBcHBsaWVkLCB0aGFua3MhCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
