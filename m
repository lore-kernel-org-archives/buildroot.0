Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D23C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7625E40235;
	Wed,  9 Aug 2023 17:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7625E40235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vHiOilhanbT; Wed,  9 Aug 2023 17:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4632041BDB;
	Wed,  9 Aug 2023 17:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4632041BDB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3BB61BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 703D761241
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 703D761241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-SmchqQjyt1 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:40:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 664CB60E5C
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664CB60E5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A3EBE0007;
 Wed,  9 Aug 2023 17:40:40 +0000 (UTC)
Date: Wed, 9 Aug 2023 19:40:39 +0200
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez via buildroot <buildroot@buildroot.org>
Message-ID: <20230809194039.7158eeff@windsurf>
In-Reply-To: <20230809061501.300165-1-clement.ramirez@bootlin.com>
References: <20230809061501.300165-1-clement.ramirez@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691602840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MriCQpqzdp6uwaqGqOEr/sUyZtgJPeUSNiypnFt8C0=;
 b=dMC0rVkGGPXkxkPgXVLt66aeISLk8TNXzbZgW7JVRwBWn92S3op6tWPlZHk5LVocOQJvzS
 FTU6whISvoNK0WmdsjrdNi0fZUUuoVDcURjgJlcZUHOBdUZP44KxZllerECnxg7a4DjzrX
 n+h2gjXhG5QpKfDnDpf7CRxch3JsIPlHMU8yiYi8HvnNJ1gQ2MSiY+zD3H0NpdGpRVqo6L
 9Rd9v2y97x5j9Ls6oBeTxacVYyLRLMwtj+wllm7FpTLwLieSkPSqGoA2+ltWRkCreMN0m8
 PFRkaHgFa3VTwp1e3Ba3lQxQ4VugXYjawVsf2nHfzvA+t99sJ4LxykOZsPS57g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dMC0rVkG
Subject: Re: [Buildroot] [PATCH 1/1] package/diffutils: add
 DIFFUTILS_CPE_ID_VENDOR
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
Cc: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgOSBBdWcgMjAyMyAwODoxNTowMSArMDIwMApDbMOpbWVudCBSYW1pcmV6IHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gY3BlOjIuMzphOmdu
dTpkaWZmdXRpbHMgaXMgYSB2YWxpZCBpZGVudGlmaWVyIGZvcgo+IHRoaXMgcGFja2FnZToKPiBo
dHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvc2VhcmNoL3Jlc3VsdHM/bmFtaW5nRm9y
bWF0PTIuMyZrZXl3b3JkPWRpZmZ1dGlscwo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFJh
bWlyZXogPGNsZW1lbnQucmFtaXJlekBib290bGluLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9kaWZm
dXRpbHMvZGlmZnV0aWxzLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
