Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F2ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 09:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B0740445;
	Mon, 12 Sep 2022 09:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7B0740445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abroKvbLRwVz; Mon, 12 Sep 2022 09:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B884E40414;
	Mon, 12 Sep 2022 09:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B884E40414
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51901BF476
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADAE340414
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADAE340414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dr5io0_cjNGx for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 09:12:45 +0000 (UTC)
X-Greylist: delayed 00:07:37 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616D94039D
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org
 [IPv6:2001:67c:2050:102:465::203])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 616D94039D
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:12:45 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4MR0zf0qs5z9sd3;
 Mon, 12 Sep 2022 11:05:02 +0200 (CEST)
Message-ID: <5554ec40-062b-2e1e-e395-66509b97832e@othermo.de>
Date: Mon, 12 Sep 2022 11:05:01 +0200
MIME-Version: 1.0
Content-Language: en-US
To: erichiggins@gmail.com, buildroot@buildroot.org
References: <CAHfxMJ69P8NVSqJr2tkNajMbFG-FD=Wz2DUfdstRQSqi86_3qw@mail.gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <CAHfxMJ69P8NVSqJr2tkNajMbFG-FD=Wz2DUfdstRQSqi86_3qw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1662973502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkH9YK8ToEvNhW2c38a5ZNg5r9meheh4bslHwxR2xnA=;
 b=ASAnFxO63xZv7yfdQD1TYVkjbPT6S81XF4X/KEkHr9cRI0gf8LLXrMH+rV8/zUuv4jH6bc
 0SPnn2gZ+xZXxXJrROwBOvodZLUUjfqUJpxHWAkzvidNDO1+yxM20gTV0NIUKp7EE4r8X9
 2tizGFx1GxFIA8O07BbrrkyFHeq2jbBNXNA9jMEFsxXsEBexVONcHKgzf7uXH2C2GQIDKO
 Ht+8PNx5Vy2K1Y4LOeUJcObhG7Fhzqvw3QPYYahW4O2fV5yP9Gx0HPTbFxgB4Zrrh+29Rh
 ICxgHDve7DhMzNAsi8HMJKK0OoD4QMHNuxTV0XaGA4uyLgR1/ZCYYsJ8GHfeBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=ASAnFxO6
Subject: Re: [Buildroot] Patch for buildroot script utils/scanpypi
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRXJpYywKCmNhbiB5b3Ugc3VibWl0IHRoaXMgYXMgYSBwcm9wZXIgcGF0Y2ggdmlhIHRoaXMg
bWFpbGluZyBsaXN0IHNvIGl0IGNhbiBiZSAKcHJvcGVybHkgcmV2aWV3ZWQgaGVyZT8KClNlZSBo
dHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNo
ZXMgZnJvbSAKdGhlIG1hbnVhbC4KCkJlc3QsCk1hcmN1cwoKT24gMDguMDkuMjIgMTc6NTMsIGVy
aWNoaWdnaW5zQGdtYWlsLmNvbSB3cm90ZToKPiBIZWxsbyBhbGwsCj4gCj4gSSd2ZSBjcmVhdGVk
IGEgbWlub3IgcGF0Y2ggdG8gcmVzb2x2ZSBhIGJ1ZyBpbiB0aGUgdXRpbHMvc2NhbnB5cGkgCj4g
c2NyaXB0LiBJJ3ZlIHdyaXR0ZW7CoHVwIHRoZSBqdXN0aWZpY2F0aW9uLCBleGFtcGxlcywgYW5k
IHRlY2huaWNhbCAKPiBkZXRhaWxzIGluIHRoZSBmb2xsb3dpbmcgR2l0SHViIGdpc3Qgd2hpY2gg
YWxzbyBjb250YWlucyB0aGUgcGF0Y2ggY29udGVudHMuCj4gCj4gaHR0cHM6Ly9naXN0LmdpdGh1
Yi5jb20vZXJpY2hpZ2dpbnMvMjIzYjI0OTVhZGE2NDAwMWM0NGRlZWRkM2EzZGY2ZWQgCj4gPGh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL2VyaWNoaWdnaW5zLzIyM2IyNDk1YWRhNjQwMDFjNDRkZWVk
ZDNhM2RmNmVkPgo+IAo+IEhhcHB5IHRvIGRpc2N1c3MgZnVydGhlciBlaXRoZXIgb3ZlciBlbWFp
bCBvciBJUkMuCj4gCj4gVGhhbmtzIQo+IC1FcmljCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
