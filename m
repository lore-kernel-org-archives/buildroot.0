Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F993C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE59B415EA;
	Sun,  3 Dec 2023 17:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE59B415EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHPlq-wzzZrw; Sun,  3 Dec 2023 17:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3999B414FA;
	Sun,  3 Dec 2023 17:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3999B414FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 704BD1BF328
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 558D44047D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 558D44047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShJ5TK2NMjB1 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:14:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F87400D8
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59F87400D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 523F760009;
 Sun,  3 Dec 2023 17:14:23 +0000 (UTC)
Message-ID: <ae2caa93-0d0a-44d7-8621-c617ba0690d3@korsgaard.com>
Date: Sun, 3 Dec 2023 18:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 buildroot@buildroot.org
References: <20231122014108.2430309-1-gael.portay@rtone.fr>
 <20231122014108.2430309-2-gael.portay@rtone.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231122014108.2430309-2-gael.portay@rtone.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] Revert "Fix rasberry Pi 64bit firmware
 overlay inclusion"
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMTEvMjAyMyAwMi40MSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgNTFkNmQ2YzU4MDQzMjQzNWYyYjJmOTVlZDM1ZTIyYTVlY2JlOWRjYi4KPiAKPiBUaGF0
IGNoYW5nZSBpcyBubyBtb3JlIHJlbGV2YW50IHNpbmNlIHRoZSBnZW5pbWFnZS5jZmcgZmlsZXMg
YXJlCj4gZ2VuZXJhdGVkIGJ5IHRoZSBjb21taXQgZTM3ZWU1YWNkYyAoYm9hcmQvcmFzcGJlcnJ5
cGkvcG9zdC1pbWFnZS5zaDoKPiBnZW5lcmF0ZSBnZW5pbWFnZSBjb25maWcgZnJvbSB0ZW1wbGF0
ZSBpZiBub3QgcHJlc2VudCksIGFuZCBzaW5jZSB0aGUKPiB2YXJpYW50LXNwZWNpZmljIGZpbGVz
IHdlcmUgZHJvcHBlZCBvZmYgYnkgdGhlIGNvbW1pdCBmYzVjZGVlZDcyCj4gKGJvYXJkL3Jhc3Bi
ZXJyeXBpOiBkcm9wIHZhcmlhbnQtc3BlY2lmaWMgZ2VuaW1hZ2UgZmlsZXMpLgo+IAo+IFRoaXMg
cmVtb3ZlcyB0aGUgdmVyeSBsYXN0IGFsaXZlIHBpZWNlIG9mIGNoYW5nZSBvZiB0aGUgY29tbWl0
Cj4gNTFkNmQ2YzU4MCAoRml4IHJhc2JlcnJ5IFBpIDY0Yml0IGZpcm13YXJlIG92ZXJsYXkgaW5j
bHVzaW9uKTsgdGhlCj4gY29tbWl0IGlzIGZ1bGx5IHJldmVydGVkIG5vdy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+IC0tLQo+IE1haW50
YWluZXJzLAo+IAo+IFVubGVzcyBJIGFtIG1pc3Rha2VuLCB0aGlzIGNvdWxkIGdvbmUsIHJpZ2h0
PwoKSSBiZWxpZXZlIHNvLCB5ZXMuIENvbW1pdHRlZCB0byBuZXh0LCB0aGFua3MuCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
