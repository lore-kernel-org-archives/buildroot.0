Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9CBC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 18:59:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A8561244
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 18:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9A8561244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616EE60710;
	Fri,  5 Nov 2021 18:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSl6JOYKRZcx; Fri,  5 Nov 2021 18:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B655A6067A;
	Fri,  5 Nov 2021 18:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C16D1BF2F8
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 18:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BEDF81C2F
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 18:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUiliDtpspwr for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 18:59:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0347181C20
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 18:59:36 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j4R3mIk2gueW5j4R3mb4fy; Fri, 05 Nov 2021 19:59:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636138774; bh=ojmm3/9FZ9MR7Sqm9AqsUmzP9+vWS62/8V11krm2LaE=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=BPjil3hQyidiyiVE1+cB/urvKzFjCRccUn6jK1R5G0/d5JcD2jgxHeng3aDnWDHBo
 Xc0f1OsVq3KcM7nOXyHbdbyZvCLryqOWjTzNJphWydrpoUk8rN0tpNNyI+X9zQEeBh
 kPhDf77lO/BzN0+aD5kL/XzJogB4w85uK8h+UWRrTWGxFjrhELdm2/QhC8BKTtoePX
 qd0OfvFMCt2wk8yRIBcY/Z8nmnYOGn97RTFfxPhd2W1pbrIP+MQxTn0Ki3SzxRIKHW
 ZQa7IZi5Vxx5I/E2iJCdxrCZSgaE30LWmAeWoOnLfspJJ4YPDKF9Kfc6lyXMEMR5tZ
 fz1jcmquney9A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <64499E53-A306-4C85-956F-2CDF8A9F3E61@benettiengineering.com>
Message-ID: <24766a67-1024-3069-a93b-7a40acab2656@benettiengineering.com>
Date: Fri, 5 Nov 2021 19:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <64499E53-A306-4C85-956F-2CDF8A9F3E61@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGy5dOZtNNg3nPEPe6oMOTLtF5g29MVbOgQ0JQp7jyfE5hBYf8mNiWE5Md3M5gaVXnFwbgHhVzwmIaqQZc3BGSWhJjYnN2rnPZ4r7G8MIE94O4u/bU8D
 2q8HvXEil6UvpSQRfp9mS7O18mXk7cnUgiRvDyMnHbhN/8vj2v+8UIsccQfm9wn4af68fV1Mn2Qtnbx86q9aFS58KM12rMYdPFYPtbYGKCq3uWoSpnVbih8o
 ZSp4zmV1rxj5reLLfCR/IY6NVYIJyTIbhMVO38RM7PgJR0DsD+zJdKp3mP8nClq1+4J7wwHlMUWJ32fIyZG+HIfRxOrzCK/M78H2iy3goYoqplNiCRGt1Dws
 HdkaXQJKxCw8NcH/OMguidWq94rvL4o2swofHAuP216CA7iZfzZ+ahQbiTCB1d/PqVtw4g/QEoZ1L+13InsbhxPx/vN/RBHW9GDMyhDDpQb210ieLy0=
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwKCk9uIDExLzUvMjEgNjowOCBQTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gCj4+
IElsIGdpb3JubyA1IG5vdiAyMDIxLCBhbGxlIG9yZSAxNjo0NiwgTHVjYSBDZXJlc29saSA8bHVj
YUBsdWNhY2VyZXNvbGkubmV0PiBoYSBzY3JpdHRvOgo+Pgo+PiDvu79IaSBHaXVsaW8sCj4+Cj4+
PiBPbiAwNS8xMS8yMSAxNDoyNCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBIaSBMdWNhLAo+
Pj4KPj4+Pj4gSWwgZ2lvcm5vIDUgbm92IDIwMjEsIGFsbGUgb3JlIDEyOjA1LCBMdWNhIENlcmVz
b2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+IGhhIHNjcml0dG86Cj4+Pj4KPj4+PiDvu79IaSBH
aXVsaW8sCj4+Pj4KPj4+Pj4gT24gMDQvMTEvMjEgMTg6MjMsIEdpdWxpbyBCZW5ldHRpIHdyb3Rl
Ogo+Pj4+PiBIaSBMdWNhLAo+Pj4+Pgo+Pj4+Pj4gT24gMTEvNC8yMSAxMDoyNiBBTSwgTHVjYSBD
ZXJlc29saSB3cm90ZToKPj4+Pj4+IEhpIEdpdWxpbywKPj4+Pj4+Cj4+Pj4+PiB0aGFua3MgZm9y
IHRoZXNlIGFuZCB0aGUgb3RoZXIgb2xpbWV4IHBhdGNoZXMgeW91IGFyZSBzZW5kaW5nLiBUaG9t
YXMKPj4+Pj4+IGFwcGxpZWQgdGhlbSBmYXN0ZXIgdGhhbiBJIGNvdWxkIHJldmlldyBhbmQgdGVz
dCB0aGVtLi4uIGxldCBtZSB0cnkgdGhpcwo+Pj4+Pj4gdGltZSA6KQo+Pj4+Pgo+Pj4+PiBJJ3Zl
IGp1c3Qgc2VudCB0aGUgdjIgc2VyaWVzLCBkbyB3ZSB3YWl0IHVudGlsIHlvdSBnaXZlIGEgVGVz
dGVkLWJ5OiA/Cj4+Pj4KPj4+PiBKdXN0IHNlbnQgbXkgVGVzdGVkLWJ5IHRvbywgYnV0IEkgb25s
eSBidWlsZCB0ZXN0ZWQgc2luY2UgSSBoYXZlIG5vIGxpbWUKPj4+PiBib2FyZC4KPj4+Cj4+PiBI
YXZlIHlvdeKAmXZlIGdpdmVuIGEgdHJ5IG9uIGxpbWUyIGF0IGxlYXN0Pwo+Pgo+PiBObywgYXBv
bG9naWVzLCBJIGRvbid0IGhhdmUgYW55ICJsaW1lKiIgYm9hcmQuLi4gbm8gbGltZSwgbm8gbGlt
ZTIuCj4+Cj4+IEkgaGF2ZSBvbmx5IGFuIEEyMCBtaWNybyBidXQgaXQgaGFzIG5vIE1BTEkgZGVm
Y29uZmlnIGluIEJ1aWxkcm9vdCBhbmQKPj4gc28gaXQgZG9lc24ndCBhcHBlYXIgaW4gdGhpcyBz
ZXJpZXMuCj4gCj4gT2ssIG5vIHByb2JsZW0sIEkgZ2l2ZSBhIHRyeSB0aGVuIDotKQoKSSd2ZSBq
dXN0IHRlc3RlZCwgb24gbXkgcmVjZW50IHByZXZpb3VzIGxpbnV4L3UtYm9vdCBidW1wIEkgZGlk
bid0IHNlZSAKdGhhdCBMaW1hIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBpbiBMaW51eCBzdW54aV9k
ZWZjb25maWcgc28gb24gbmV4dCAKaXRlcmFpb24gSSdtIGdvaW5nIHRvIHNlbmQgYW5vdGhlciBw
YXRjaCB0aGF0IGFkZHMgYSBsaW51eC5mcmFnbWVudCB0byAKZGlzYWJsZSBMaW1hIGluIGZhdm91
ciBvZiBNYWxpLiBUaGVuIHRoZSBjaG9pY2Ugb2YgdXNpbmcgTGltYStNZXNhM2QgaXMgCmEgdXNl
ciBkZWNpc2lvbi4KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdp
bmVlcmluZyBzYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
