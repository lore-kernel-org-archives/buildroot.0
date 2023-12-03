Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4798C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 17:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 989CF415D5;
	Sun,  3 Dec 2023 17:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 989CF415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOnIX_iey4wx; Sun,  3 Dec 2023 17:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05209414FA;
	Sun,  3 Dec 2023 17:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05209414FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16F401BF328
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E11A860F3B
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 17:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11A860F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xQCviujyM0W for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 17:13:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112DC60773
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 17:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112DC60773
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12C8E60003;
 Sun,  3 Dec 2023 17:13:53 +0000 (UTC)
Message-ID: <c1ea53d5-f4b6-4fda-bdb2-b7674e8d45d7@korsgaard.com>
Date: Sun, 3 Dec 2023 18:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 buildroot@buildroot.org
References: <20231122014108.2430309-1-gael.portay@rtone.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231122014108.2430309-1-gael.portay@rtone.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] Revert "board/raspberrypi: handle dtb
 overlays for all variants"
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
b21taXQgNjAyMWYzNjc4YjQ0ZDQzZGE3MDU3ZTMxMzVkYTg0MmNkZTFmZmEwNS4KPiAKPiBUaGF0
IGNoYW5nZSBpcyBubyBtb3JlIHJlbGV2YW50IHNpbmNlIHRoZSBnZW5pbWFnZS5jZmcgZmlsZXMg
YXJlCj4gZ2VuZXJhdGVkIGJ5IHRoZSBjb21taXQgZTM3ZWU1YWNkYyAoYm9hcmQvcmFzcGJlcnJ5
cGkvcG9zdC1pbWFnZS5zaDoKPiBnZW5lcmF0ZSBnZW5pbWFnZSBjb25maWcgZnJvbSB0ZW1wbGF0
ZSBpZiBub3QgcHJlc2VudCksIGFuZCBzaW5jZSB0aGUKPiB2YXJpYW50LXNwZWNpZmljIGZpbGVz
IHdlcmUgZHJvcHBlZCBvZmYgYnkgdGhlIGNvbW1pdCBmYzVjZGVlZDcyCj4gKGJvYXJkL3Jhc3Bi
ZXJyeXBpOiBkcm9wIHZhcmlhbnQtc3BlY2lmaWMgZ2VuaW1hZ2UgZmlsZXMpLgo+IAo+IFRoaXMg
cmVtb3ZlcyB0aGUgdmVyeSBsYXN0IGFsaXZlIHBpZWNlIG9mIGNoYW5nZSBvZiB0aGUgY29tbWl0
Cj4gNjAyMWYzNjc4YiAoYm9hcmQvcmFzcGJlcnJ5cGk6IGhhbmRsZSBkdGIgb3ZlcmxheXMgZm9y
IGFsbCB2YXJpYW50cyk7Cj4gdGhlIGNvbW1pdCBpcyBmdWxseSByZXZlcnRlZCBub3cuCj4gCj4g
U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KPiAtLS0K
PiBNYWludGFpbmVycywKPiAKPiBVbmxlc3MgSSBhbSBtaXN0YWtlbiwgdGhpcyBjb3VsZCBnb25l
LCByaWdodD8KCkkgYmVsaWV2ZSBzbywgeWVzLgoKQ29tbWl0dGVkIHRvIG5leHQsIHRoYW5rcy4K
Ci0tIApCeWUsIFBldGVyIEtvcnNnYWFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
