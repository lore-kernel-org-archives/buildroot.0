Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8FEEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 20:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6520E81E44;
	Mon, 17 Jul 2023 20:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6520E81E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxmxUeHM57ej; Mon, 17 Jul 2023 20:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91BB481E3C;
	Mon, 17 Jul 2023 20:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91BB481E3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1901BF2C5
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26F6D60EAA
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 20:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F6D60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDb_pKiODuxL for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 20:12:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3BF60D75
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC3BF60D75
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 20:12:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E16FFF806;
 Mon, 17 Jul 2023 20:11:57 +0000 (UTC)
Date: Mon, 17 Jul 2023 22:11:55 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20230717221155.6f06a5fd@windsurf>
In-Reply-To: <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
References: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
 <20230714121834.22742681@windsurf>
 <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689624717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKu9AmALbphqRej1CeTgAQoP9hyHGOiJAPlRzkvaL7s=;
 b=So2s8PtN+2Iiq3moj0N1Q8XOiU0B1F9ISN3yXEoG4j6T3qFzTFshhKVRre0D4OdGjJPBX0
 dFR7eoilLvvVxKIic77cz5gQGPKUTbB96s+OlvNh/ogq0KiNieWOQ1xrYA1reeSMhQvhGm
 LRkZbY1mdWixnscMQ/iZdspxh0ii9koQ2m5e1wx+EcoHK13ySp0zdB9xNxUcp60DQhhxQx
 PtdLdLPCTQoJOmebcDj7Yt7v/7QU99pMldvmTKmLJ/c2MCWYXuMEwiSe0MfpOkQJ6OMAtd
 /hERgRADvlivT+kEHGYrATVGCanHoyWXCuteJQB60UrM6HO2PrrgbmyCjq0TFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=So2s8PtN
Subject: Re: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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

SGVsbG8gSWduYWN5LAoKT24gTW9uLCAxNyBKdWwgMjAyMyAxNjowOTozMiArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiBTdXJlLiAgSSBzdGFydGVkIGhhdmluZyBhIGxvb2sgYW5kIHN0dW1ibGVkIHVwb24gYW4g
aXNzdWUgd2hpbGUKPiB0ZXN0LXBrZydpbmcgbGliYnBmLiAgQXNpZGUgZnJvbSBtYW55IHRvb2xj
aGFpbnMganVzdCBiZWluZyBza2lwcGVkCj4gKHN1cHBvc2VkbHkgYmVjYXVzZSBvZiB0aGVpciBs
YWNrIG9mIHRoZSBtaW5pbXVtIGtlcm5lbCBoZWFkZXJzCj4gdmVyc2lvbiksIGl0IHN1Y2NlZWRl
ZCB3aXRoIHRob3NlIGdsaWJjIGFuZCBtdXNsIHRvb2xjaGFpbnMgdGhhdCBpdAo+IGRpZG4ndCBz
a2lwLCBhbmQgZmFpbGVkIHdpdGggYnItbWlwczY0LW42NC1mdWxsLiAgVGhlIGxhdHRlciBpcyBi
YXNlZAo+IG9uIHVDbGliYyB2MS4wLjM2IGFuZCBpdCB0dXJucyBvdXQgdUNsaWJjIHByaW9yIHRv
IHYxLjAuMzggaGFzIG5vCj4gd29ya2luZyBkZWZpbml0aW9uIG9mIEZfRFVQRkRfQ0xPRVhFQywg
cmVxdWlyZWQgYnkgbGliYnBmLgoKUGxlYXNlIG5vdGUgdGhhdCB0aGlzIGlzIGEgc2VwYXJhdGUg
cHJvYmxlbSwgdW5yZWxhdGVkIHRvIHlvdXIgZWZmb3J0Cm9mIG1ha2luZyBlbGZ1dGlscyBidWls
ZGFibGUgd2l0aCBtdXNsLiBUaGVyZWZvcmUsIHdlIHdpbGwgbm90IHJlcXVpcmUKeW91IHRvIGZp
eCBhbGwgb3RoZXIgdW5yZWxhdGVkIHByb2JsZW1zLiBPZiBjb3Vyc2UsIGlmIHlvdSB3YW50IHRv
CnRhY2tsZSBhbmQgc29sdmUgdGhvc2UgdW5yZWxhdGVkIHByb2JsZW1zOiBncmVhdCEgQnV0IGRv
bid0IGZlZWwgbGlrZQp5b3UgaGF2ZSB0bzogaWYgdGhleSBhcmUgdW5yZWxhdGVkLCB3ZSBhcmUg
bm90IGdvaW5nIHRvIG1ha2Ugc29sdmluZwp0aGVtIGEgcmVxdWlyZW1lbnQgb2YgbWVyZ2luZyB5
b3VyIHBhdGNoZXMgcmVsYXRlZCB0byBlbGZ1dGlscy9tdXNsLgoKPiBOb3cgSSBoYXZlIHRoZSBm
b2xsb3dpbmcgcHJvYmxlbTogaG93IGNhbiBJIGRldGVybWluZSwgZnJvbSB0aGUKPiBDb25maWcu
aW4ncyBwb2ludC1vZi12aWV3LCB0aGF0IHRoZSB1Q2xpYmMgdXNlZCBieSB0aGUgdG9vbGNoYWlu
IGlzCj4gdG9vIG9sZD8gIFRoZXJlIGFyZSB2YXJpYWJsZSB0aGF0IGFyZSBzZXQgd2hlbiB0aGUg
dG9vbGNoYWluIGlzCj4gdWNsaWJjLWJhc2VkLCBidXQgaW4gdGhpcyBjYXNlIEkgaGF2ZQo+IEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQ1VTVE9NX1VDTElCQz15IGFuZCBubyB3YXkgdG8ga25vdyB0
aGUgYWN0dWFsCj4gdmVyc2lvbi4gIEZvcmJpZGRpbmcgbGliYnBmIGFzIHNvb24gYXMKPiBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0NVU1RPTV9VQ0xJQkM9eSBzZWVtcyBvdmVya2lsbC4KCkFybm91
dCByZXBsaWVkIG9uIHRoYXQsIGFuZCBnZW5lcmFsbHkgc3BlYWtpbmcgd2UgZG9uJ3QgcmVhbGx5
IGNhcmUKYW55bW9yZSBhYm91dCAidG9vIG9sZCB1Q2xpYmMiLCBJIHdvdWxkIHByb2JhYmx5IG5v
dCBib3RoZXIgdHJ5aW5nIHRvCnN1cHBvcnQgYWxsIG9sZCB1Q2xpYmMgdG9vbGNoYWlucy4KClRo
b21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
