Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B602DC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5000D81F76;
	Tue,  1 Aug 2023 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5000D81F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnnigAjft1SY; Tue,  1 Aug 2023 20:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9029681492;
	Tue,  1 Aug 2023 20:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9029681492
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA8991BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7665460B31
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7665460B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rv8gFjI2rv6s for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:20:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 664F860AF1
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664F860AF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 394D540005;
 Tue,  1 Aug 2023 20:20:23 +0000 (UTC)
Date: Tue, 1 Aug 2023 22:20:21 +0200
To: carrier.nicolas0@gmail.com
Message-ID: <20230801222021.652fae9a@windsurf>
In-Reply-To: <20230801093737.1648437-1-carrier.nicolas0@gmail.com>
References: <20230801093737.1648437-1-carrier.nicolas0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690921223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QExyk35HrLnaVGlkLJTI9pSsDRygX9fIMHE2/yJth0s=;
 b=OPUrK3EBOXGlszH2+l/0GTtWDWam7g7hkzPcGl5S8JfIdlWmIF/Pbohlq2SeL+wQ7NHSc5
 Lb0IpnmpfwTN1VEfZJrjXJAb8vned4YIUuYZ9D0NdMHTpBUbHYUnjIcxGDjyuO8xElcaqB
 6AxQk2O5rRMIF0V68IIAlpqpAA9+aCcjY0Nf9576CvYnQwiCZssLaVol0HGw/UugeIYbku
 IB3W5lKaGlF2qA9Wp+F0RNUxWQWTmSVUrtKwTSSpQNzrfx/u2cwGgVm85+WoxR0+zpyKcm
 yjMi6xjYLW8QCn75j/6X5GjHBQU+BeDBSgn5vNLTB7bE0yiGxD+vZUSeq+Rg1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OPUrK3EB
Subject: Re: [Buildroot] [PATCH] package/less: install the lessecho command
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmljb2xhcywKCk9uIFR1ZSwgIDEgQXVnIDIwMjMgMTE6Mzc6MzUgKzAyMDAKY2Fycmll
ci5uaWNvbGFzMEBnbWFpbC5jb20gd3JvdGU6Cgo+IEZyb206IE5pY29sYXMgQ2FycmllciA8bmlj
b2xhcy5jYXJyaWVyQG5hdi10aW1pbmcuc2FmcmFuZ3JvdXAuY29tPgo+IAo+IGl0IGlzIHJlcXVp
cmVkIGJ5LCBmb3IgZXhhbXBsZSB0aGUgcyBjb21tYW5kLCBhbGxvd2luZyB0byB3cml0ZSB0byBh
IGZpbGUKCkkgdGhpbmsgeW91IHNob3VsZCBjbGFyaWZ5IHRoYXQgeW91J3JlIHRhbGtpbmcgYWJv
dXQgdGhlICJzIGNvbW1hbmQiCmluc2lkZSBsZXNzLiBCZWNhdXNlIEkgd2FzIHRoaW5raW5nIHlv
dSB3ZXJlIHRhbGtpbmcgYWJvdXQgYSBwcm9ncmFtCmNhbGxlZCAicyIuCgpJIGNhbm5vdCBhcHBs
eSB5b3VyIHBhdGNoOiB3ZSBuZWVkIHlvdXIgU2lnbmVkLW9mZi1ieSBsaW5lLgoKPiAgZGVmaW5l
IExFU1NfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICAJJChJTlNUQUxMKSAtbSAwNzU1ICQoQEQpL2xl
c3MgJChUQVJHRVRfRElSKS91c3IvYmluL2xlc3MKPiArCSQoSU5TVEFMTCkgLW0gMDc1NSAkKEBE
KS9sZXNzZWNobyAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vbGVzc2VjaG8KPiAgZW5kZWYKCkkgdGhp
bmsgdGhlIGJlc3Qgc29sdXRpb24gaXMgaW4gZmFjdCB0byBkcm9wIExFU1NfSU5TVEFMTF9UQVJH
RVRfQ01EUwplbnRpcmVseSwgc28gdGhhdCAibWFrZSBpbnN0YWxsIiBpcyB1c2VkIGluc3RlYWQu
IEl0IGluc3RhbGxzIHRoZQpmb2xsb3dpbmc6CgrilJTilIDilIAgdXNyCiAgICDilJzilIDilIAg
YmluCiAgICDilILCoMKgIOKUnOKUgOKUgCBsZXNzCiAgICDilILCoMKgIOKUnOKUgOKUgCBsZXNz
ZWNobwogICAg4pSCwqDCoCDilJTilIDilIAgbGVzc2tleQogICAg4pSU4pSA4pSAIHNoYXJlCiAg
ICAgICAg4pSU4pSA4pSAIG1hbgogICAgICAgICAgICDilJTilIDilIAgbWFuMQogICAgICAgICAg
ICAgICAg4pSc4pSA4pSAIGxlc3MuMQogICAgICAgICAgICAgICAg4pSc4pSA4pSAIGxlc3NlY2hv
LjEKICAgICAgICAgICAgICAgIOKUlOKUgOKUgCBsZXNza2V5LjEKCnVzci9zaGFyZS9tYW4gaXMg
Z29pbmcgdG8gYmUgcmVtb3ZlZCBhdXRvbWF0aWNhbGx5IGJ5IEJ1aWxkcm9vdCBhdCB0aGUKZW5k
IG9mIHRoZSBidWlsZC4gU28gdGhhdCBsZWF2ZSB1cyB3aXRoIHVzci9iaW4gd2l0aCBsZXNzLCBs
ZXNzZWNobyBhbmQKbGVzc2tleS4gU28gSSBiZWxpZXZlIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8g
bGV0IHRoZSBkZWZhdWx0ICJtYWtlCmluc3RhbGwiIGRvIGl0cyBqb2IuCgpJIHdvdWxkIGhhdmUg
Zml4ZWQgdGhhdCBteXNlbGYgd2hlbiBhcHBseWluZywgYnV0IEkgbmVlZCB5b3VyClNpZ25lZC1v
ZmYtYnkgaW4gdGhlIHBhdGNoIHRvIGJlIGFibGUgdG8gcHJvY2VlZC4KClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
