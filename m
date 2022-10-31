Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A49DC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 022A3817A3;
	Mon, 31 Oct 2022 12:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022A3817A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2S1jrWXWjvI; Mon, 31 Oct 2022 12:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0613881774;
	Mon, 31 Oct 2022 12:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0613881774
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDDB51BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9406405AD
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9406405AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLiI9H_U3MdJ for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:07:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68A73405A2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68A73405A2
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:07:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AEA7FF807;
 Mon, 31 Oct 2022 12:07:18 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:07:17 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221031130717.7e6e1aa6@windsurf>
In-Reply-To: <20220916074147.571920-1-vincent.stehle@arm.com>
References: <20220914140821.3158921-1-vincent.stehle@arm.com>
 <20220916074147.571920-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667218039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXjGM2LoMVOgcv32rSRFSHVUkiqkzPH6Cmqh/zptgGA=;
 b=I65CoYB0DWc1qfE/Ke1DBsglqQvMi8XBor92u3YXzmnEysMdoVskS67u4C2gOxqVQoRkVV
 ae6Y6eGeVHEGbPsj9uBGy1j3HlwH7EpDcWGW5MbFnglIPzrL9Dn3QeqnFJak4DBminWalF
 MX4GyAWqgKG1UYFFxDvXxFLSQwNVqNBUAx5fLdeZiYWHArUcCBjOvZrFaKX5D4qqEvkvUT
 CV4k6BOCqWFqODlAYd0njIK2DyHRZd+sN6ANWmYHK1XwuZLZTAtoYHvmhWCA/QK4Pt3Zdk
 p2SBjARGyr70fyhEYZ0xUUfKgCUdmQVFY1o+cdUwNH5jU4iJTJZkz816+24AJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I65CoYB0
Subject: Re: [Buildroot] [PATCH v2] configs/qemu_aarch64_ebbr: new defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmluY2VudCwKCk9uIEZyaSwgMTYgU2VwIDIwMjIgMDk6NDE6NDcgKzAyMDAKVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPiB3cm90ZToKCj4gQWRkIGEgZGVmY29u
ZmlnIHRvIGJ1aWxkIGFuIEFBcmNoNjQgVS1Cb290IGJhc2VkIGZpcm13YXJlIGltcGxlbWVudGlu
ZyB0aGUKPiBzdWJzZXQgb2YgVUVGSSBkZWZpbmVkIGJ5IEVCQlJbMV0sIGFzIHdlbGwgYXMgYSBM
aW51eCBPUyBkaXNrIGltYWdlIGJvb3RpbmcKPiB3aXRoIFVFRkksIHRvIHJ1biBvbiBRZW11Lgo+
IAo+IFRoZSBnZW5lcmF0ZWQgZmlybXdhcmUgYmluYXJ5IGNhbiBhbHNvIGJlIHVzZWQgdG8gaW5z
dGFsbCBvciBydW4gYW5vdGhlciBPUwo+IHN1cHBvcnRpbmcgdGhlIEVCQlIgc3BlY2lmaWNhdGlv
bi4KPiAKPiBXZSBkbyBub3QgaGF2ZSBMaW51eCA1LjE5IGhlYWRlcnMgYXQgdGhlIG1vbWVudCB0
aGVyZWZvcmUgd2UgcmVseSBvbiA1LjE3Cj4gaW4gdGhlIGRlZmNvbmZpZy4KPiAKPiBbMV06IGh0
dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvZWJicgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAKPiAtLS0K
PiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBVc2Ugc2hvcnRjdXQgbGV0dGVyIFUgZm9yIGJvb3Qg
cGFydGl0aW9uIGluIGdlbmltYWdlIGNvbmZpZyBmaWxlCj4gICAgIChzdWdnZXN0ZWQgYnkgR2l1
bGlvIGFuZCBSb21haW4pCj4gICAtIERyb3AgdG9vbGNoYWluIHdjaGFyIGZyb20gdGhlIGRlZmNv
bmZpZyAoc3VnZ2VzdGVkIGJ5IEdpdWxpbyBhbmQKPiAgICAgUm9tYWluKQo+ICAgLSBNZW50aW9u
IGluIHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHdlIHJlbHkgb24gTGludXggaGVhZGVycyA1LjE3
Cj4gICAgIGJlY2F1c2Ugd2UgZG8gbm90IGhhdmUgNS4xOSAoc3VnZ2VzdGVkIGJ5IEdpdWxpbykK
Cj4gK046CVZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiArRjoJY29u
Zmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcKCkkndmUgYWxzbyBhZGRlZCBib2FyZC9x
ZW11L2FhcmNoNjQtZWJici8gaGVyZSwgYW5kIGFwcGxpZWQuIFRoYW5rcyBhCmxvdCEKClRob21h
cwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
