Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239CBC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16DB60F56;
	Sat,  4 Nov 2023 18:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16DB60F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZsB_YaM_-1a; Sat,  4 Nov 2023 18:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C11B60F31;
	Sat,  4 Nov 2023 18:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C11B60F31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5E021BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F62F41A60
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F62F41A60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvAjlm8ZyqW3 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:38:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 671AE41989
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671AE41989
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6444AC0002;
 Sat,  4 Nov 2023 18:38:19 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:38:18 +0100
To: Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <20231104193818.519472c7@windsurf>
In-Reply-To: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
References: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699123099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6EB4JZ6wtzL6OXfHnbASm8bN/4TIqTVNrL1isBwhgs=;
 b=DjEJGBEPcgMDvaNpTmUxQ1vOzfFXGzT755GEVCPfEQ4AVvjx0P7xyd8dgJxh5vrTbhqU+F
 ou2zNnKWM0+O50Ng00cUvz+hFS6yjodyi6ElZ+zDim29bT/CUHa0ETwjEN5LS7gHXnRaYI
 c9/iXZozNmyYjiqGHhNsmTC4c6oJNH7JWizLoByJP5HFCpGldeoWAU65x2zuzMaR9Okgu2
 LQQIjtImVWQEV53sLL2spDq9YIzBMktzp5MsdX79hJMk4YDeMxX916tbcsb52BM2ZQb1et
 Qhg18Cckq+YSRBlUkUfAJnmZc931t6o8o/3fjzg0S9bHB2uHFjtU//+VbPyPBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DjEJGBEP
Subject: Re: [Buildroot] [PATCH 1/2] board/licheepi_zero: move board files
 to their own directory
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gRnJpLCAyNyBPY3QgMjAyMyAxMzo0Njo1OSArMDIwMApGcmFu
Y29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdC5mb3NzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEdy
b3VwIGZpbGVzIGZvciBib2FyZCBsaWNoZWVwaV96ZXJvIHVuZGVyIGEgbmV3IGRpcmVjdG9yeS4g
VGhpcyBpcwo+IHRvIHByZXBhcmUgZm9yIGEgbmV3IGJvYXJkIGFsc28gY29taW5nIHRvIHRoZSBs
aWNoZWVwaSBkaXJlY3RvcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgRHVnYXN0IDxm
cmFuY29pcy5kdWdhc3QuZm9zc0BnbWFpbC5jb20+Cj4gLS0tCj4gIGJvYXJkL2xpY2hlZXBpL3sg
PT4gbGljaGVlcGlfemVyb30vYm9vdC5jbWQgICAgIHwgMAo+ICBib2FyZC9saWNoZWVwaS97ID0+
IGxpY2hlZXBpX3plcm99L2dlbmltYWdlLmNmZyB8IDAKPiAgYm9hcmQvbGljaGVlcGkveyA9PiBs
aWNoZWVwaV96ZXJvfS9yZWFkbWUudHh0ICAgfCAwCgpDb3VsZCB5b3UgcmVuYW1lIHRoZSBmb2xk
ZXIgdG8gbGljaGVlcGktemVybyBpbnN0ZWFkIG9mIGxpY2hlZXBpX3plcm8/CgpJIHdvdWxkIGhh
dmUgZG9uZSBpdCBteXNlbGYgd2hpbGUgYXBwbHlpbmcgaWYgdGhlcmUgd2VyZSBubyBvdGhlcgpp
c3N1ZXMgd2l0aCB0aGUgcGF0Y2ggc2VyaWVzLCBidXQgSSBoYXZlIGNvbW1lbnRzIG9uIFBBVENI
IDIvMi4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
