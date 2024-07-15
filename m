Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945AEC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E76403DF;
	Mon, 15 Jul 2024 16:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqrkPMJQmB8h; Mon, 15 Jul 2024 16:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2751403E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2751403E4;
	Mon, 15 Jul 2024 16:11:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1197A1BF401
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 16:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F38AF811FE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 16:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4wPAnA_IQ43 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 16:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FA51811FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA51811FC
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FA51811FC
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 16:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 448CF514A3;
 Mon, 15 Jul 2024 23:11:18 +0700 (WIB)
Received: from [192.168.111.115] (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id DB4E51F92F;
 Mon, 15 Jul 2024 23:11:17 +0700 (WIB)
Message-ID: <76e31942-7475-4a57-bbd9-8e594d0707cc@athaariq.my.id>
Date: Mon, 15 Jul 2024 23:11:09 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
References: <20240714160457.39434-1-foss@athaariq.my.id>
 <D2PZUUV1LBT7.1EDN48KIUUPUB@gmail.com>
Content-Language: en-US
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Autocrypt: addr=foss@athaariq.my.id; keydata=
 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
 GMviPu198f0Mg1RQmg==
In-Reply-To: <D2PZUUV1LBT7.1EDN48KIUUPUB@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:content-type:content-type
 :in-reply-to:from:from:content-language:references:subject
 :subject:user-agent:mime-version:date:date:message-id:received;
 s=dkim20240121; t=1721059878; x=1722269479; bh=DuTojy4yd7e6oXJd
 7fw/LYFrTdR9vUqf0cIaa7xH+wg=; b=LhwOE/SZ+lLr2JWzfqh7EODPPAxKf14G
 OHMqYzp/azk753iEybEUzWN+FH/tu6AMkC4oIoO6GDlTUD4kSfny8RFa4ZWCP+sN
 69C4uR33O9YpT+nDBzbPqO7p/ogXPj8fTAv3Il+IYRMsyYAsqNyDtW8xUuiitsro
 UaXUCptbh6KbrjyPAGbQ1ZolTjvDNKLGmodrCz915iTjUY0ubC55EzKKcGBdNSh4
 EmIC/4xu/DLe4mbrTocdgwqq33Vqrr3bflyV+FMuDCOr9UolwhuY+Wbt6L1QmRm3
 qZluQWYa6T7TJDOAesaZ18QFRBdxTKNkXvhWcbwmezx3sJJRd5Kn3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=LhwOE/SZ
Subject: Re: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzIGFuZCBHYcOrbCwKCiA+IFRoYW5rcywgYnV0IGhlcmUgeW91J3JlIHN1Ym1p
dHRlZCBhIGRpZmYgYWdhaW5zdCB0aGUgcHJldmlvdXMKID4gcmFzcGJlcnJ5cGk1X2RlZmNvbmZp
ZyBzdWJtaXNzaW9uLiBQbGVhc2Ugc3VibWl0IGEgZnVsbCBwYXRjaCBhZGRpbmcKID4gdGhlIGNv
bXBsZXRlIHN1cHBvcnQgZm9yIFJQaTUsIG5vdCBhIGRpZmYgYWdhaW5zdCBzb21lIHJhbmRvbSBv
dGhlcgogPiBwYXRjaCBwb3N0ZWQgb24gdGhlIG1haWxpbmcgbGlzdC4KCkkgZG9uJ3QgdGhpbmsg
aXQncyBmcm9tIHJhbmRvbSBwYXRjaGVzLCBpdCBqdXN0IG15IHNoYW1lZnVsIG1pc3Rha2UKd2hp
bGUgcmViYXNpbmcgdGhlIHBhdGNoIHRvIHRoZSBtYXN0ZXIgYnJhbmNoLiBMZXQgbWUgZXhwbGFp
bi4KCiA+IExldCdzIGJhY2sgdG8gdGhlIGNvbW1pdCBtZXNzYWdlOyBpdCB3b3VsZCBoYXZlIG1v
cmUgc2Vuc2UgaWYgeW91IHRlbGwKID4geW91ciBjaGFuZ2UgdXBkYXRlcyB0byB0aGUgcGFja2Fn
ZSB2ZXJzaW9uIHRvIGEgdGFnCgpPa2F5IGRvbmUsIHBsZWFzZSByZXZpZXcgdGhlIHBhdGNoIHNl
cmllczoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRj
aC8yMDI0MDcxNTE2MDk0MS45MDM1My0xLWZvc3NAYXRoYWFyaXEubXkuaWQvCgpQbGVhc2Ugbm90
ZSB0aGF0IGhvc3QtcmFzcGJlcnJ5cGktdXNiYm9vdCBoYXMgbm8gcHJvcGVyIHRhZyBmb3IgUlBp
NQpzdXBwb3J0LiBUaGVyZWZvcmUsIHBpY2tpbmcgYSBjb21taXQgd2l0aCBleHBsaWNpdCBSUGk1
IHN1cHBvcnQKbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbiBpcyB0aGUgb25seSB3YXkgdG8g
ZG8uCgogPiBJdCBpcyBub3QgbmVjZXNzYXJ5IHRvIFNpZ25lZC1vZmYtYnkgKHR3aWNlKSBpbiB0
aGUgY2hhbmdlbG9nIPCfmYIuCgpBaCB5ZXMg8J+YrSBJIGZvcmdvdCB0byBvbWl0ICItcyIgZmxh
ZyBmcm9tICJnaXQgc2VuZC1lbWFpbCAuLi4iLiBJIGFtIHNvCnNvcnJ5IGZvciB0aGF0IDooCgog
PiBQbGVhc2UgZG9uJ3QgY2hhbmdlIHRoZSBhdXRob3Igb2YgZXhpc3RpbmcgcGF0Y2hlcy4gVGhp
cyBjaGFuZ2UgaXMKID4gc3B1cmlvdXMuCgpZZXQgYW5vdGhlciBteSBzaGFtZWZ1bCBtaXN0YWtl
IDooIHNvbWVob3cgaXQgbWVzc2VkIHVwIGFmdGVyIG11bHRpcGxlCnRpbWVzIG9mIHJlYmFzZS4g
TXkgYmlnIGFwb2xvZ3kgZm9yIGFueW9uZSB3aG8gZ290IG9mZmVuZGVkIGZyb20gdGhpcy4KSSBo
YXZlIG5vIGludGVudGlvbiBvZiBsZXR0aW5nIHNvbWVvbmUgZG93bi4KClNpbmNlcmVseSwKQXRo
YWFyaXEgQXJkaGlhbnN5YWgKCk5COiBIb3cgdG8gbm90IHBhbmljIGFmdGVyIGluaGFsZWQgbWFn
aWMgc21va2UgdGhhdCBlbWl0dGVkIGZyb20gYSBjaGlwPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
