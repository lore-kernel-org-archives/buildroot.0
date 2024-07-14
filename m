Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDCCC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EADCC40165;
	Sun, 14 Jul 2024 16:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAg8itRvNFCu; Sun, 14 Jul 2024 16:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9708402A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9708402A7;
	Sun, 14 Jul 2024 16:11:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFF21BF4E7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542DA4052B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W18p9MwA6hOk for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D70C5403A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70C5403A0
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70C5403A0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id A32F632482;
 Sun, 14 Jul 2024 23:11:19 +0700 (WIB)
Received: from [192.168.111.115] (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id B6AFB510CE;
 Sun, 14 Jul 2024 23:11:17 +0700 (WIB)
Message-ID: <5a147c46-12f8-44bf-8fb9-1747f49b618d@athaariq.my.id>
Date: Sun, 14 Jul 2024 23:11:08 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240607071359.767329-1-gael.portay@rtone.fr>
 <20240607071359.767329-3-gael.portay@rtone.fr>
 <89da691d-0f62-4e00-803d-4bfe49641ffd@mind.be>
 <20240712164437.1137d0c0@windsurf>
Content-Language: en-US
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Autocrypt: addr=foss@athaariq.my.id; keydata=
 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
 GMviPu198f0Mg1RQmg==
In-Reply-To: <20240712164437.1137d0c0@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:content-type:content-type
 :in-reply-to:from:from:content-language:references:subject
 :subject:user-agent:mime-version:date:date:message-id:received;
 s=dkim20240121; t=1720973479; x=1722183080; bh=moeM+LkhXgEuu/wJ
 m13QcmoMa+WXN74wyAYN1U8FNo0=; b=vZJpDaIrzULM0lK/1/llyP72+NHGDcin
 lspHw03OSwDXWJVX4SuIpKG93I6UHVLJ4EKx07LowIckZfOVXXg7KEz3+8POthn4
 R/aOefhD5yDJb2iYbcq3HQjRIXbIkFYsK9jSLfWCLzT1PSxEpe9CwDyDoAW6kTRH
 p9CnO/K1TlPNINmTu+dqMfJCSHtiq8avjYU/7W4kVTgGxfo5Lg/zp00Bw4+b2pwV
 hX3Yxxie3OdHUIQ8aarNsJkkIPh0NRt3qruMgyL2m1jAt2bSx6BLRFlUrCyhKUpY
 F82pgX5ICKuyXUPJL1aZpPG1kuyBbBb0i9D4uaA6iAep0rsu3zJVLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=vZJpDaIr
Subject: Re: [Buildroot] [next v2 2/2] package/rpi-firmware: bump version to
 5476720
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
Cc: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiBTbywgR2HDq2wsIEF0aGFhcmlxIHBsZWFzZSBjb29yZGluYXRlIHRv
IHNlbmQgYW4gdXBkYXRlIHRvIHJwaS1maXJtd2FyZQo+IHRoYXQgdXNlcyB0aGUgc3RhYmxlIGJy
YW5jaCwgYW5kIHRoYXQgd29ya3Mgd2l0aCB0aGUgY3VycmVudCBSUGkga2VybmVsCj4gd2UgdXNl
LgoKSSB0cmllZCBteSBiZXN0IHRvIHVwZGF0ZSB0aGUgZmlybXdhcmUgYW5kIGl0cyBjb3JyZXNw
b25kaW5nIGtlcm5lbCB0byAKdGhlIGxhdGVzdCBzdGFibGUgdmVyc2lvbi4gSG93ZXZlciwgSSBu
ZWVkIGhlbHAgdG8gdGVzdCB0aGUgY2hhbmdlcyBkdWUKdG8gbXkgaW5hYmlsaXR5IG9mIHJlY292
ZXJpbmcgbXkgZnJpZWQgUmFzcGJlcnJ5IFBpIDUgUE1JQy4gUGxlYXNlIGNoZWNrCnRoZSBwYXRj
aHdvcmsgYmVsb3cuCgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjQwNzE0MTYwNDU3LjM5NDM0LTEtZm9zc0BhdGhhYXJpcS5teS5pZC8KClNv
cnJ5IGZvciB0YWtpbmcgdG9vIGxvbmcuIFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZS4KClNp
bmNlcmVseSwKQXRoYWFyaXEgQXJkaGlhbnN5YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
