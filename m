Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A69C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 08:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E911F60B00;
	Wed, 19 Jan 2022 08:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YprJW5suyeVT; Wed, 19 Jan 2022 08:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 262AC60807;
	Wed, 19 Jan 2022 08:16:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6DEDC1BF35B
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C37C60807
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJ2ooNU8OeNh for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 08:16:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C84607C9
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 08:16:55 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id A69FnTFwKc6LXA69Gn7FAN; Wed, 19 Jan 2022 09:16:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642580214; bh=4hzz2W+EyfsggaB8jm97es9cWb8KAKvHrOrQ1TbiD4U=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=JZWrynhqBTTaGerTFEGi3Cke/N3HYrqKtFrhwRz3Sl/2TOj7wQZrY3g7Nac+mrt40
 rEFED1ntDEe1kj922Rrw042h/YPcri/t4Y/FUcNoMTZG3Go7QvWjxlW1m3JKmaIUOb
 yzUY5+nEn2au+C0LGHvu+FZ1wVBebRrCVLAgv1rMTPgAnNGW1Nre1KNQs7vY6VsEF1
 CcEFxz1wwZix28Snf0uCaBYDnSok8wFf76bGAqnsESo/UicwddfV+N8q8OyQS3KKdH
 vB1Cxu40axCQyVfq9tylS1nwOLeIXorW46mLQP3wxmlKv616i94qbu/Hf9yBtkMro6
 RN63O0ZGfkkOQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 19 Jan 2022 09:16:53 +0100
Message-Id: <1F1B4469-02B4-4D3D-A4DD-B2A76124B13C@benettiengineering.com>
References: <YefIQplvD1EaBOXX@antec>
In-Reply-To: <YefIQplvD1EaBOXX@antec>
To: Stafford Horne <shorne@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfMKfEQqlOQ39EufVhla+rV8vdGIHF88QRjfSXj5kIiXo6pTdR/tVtIAaUW+3RKOsyVHBhf0w8kagU9md5rGzfE2RVfAl/hFCQugpjB21/W03rHUp6gKJ
 BoDQnARg16fV6JdKad5nitW/TwEsKRCuPQJ4t2lh2vkfOOdTw2RQFxuaC9XFGI+j+ngmG8FfuXyqB52PIVXz/SdLk0rXj1SIiv+qv6mYfoTKfRGrFsBLhiT6
 8cvqgfQvFlOx7uQpeTR8B/+ifsvDCkwdJgu1D8gj4dV+5CiHzmcAsJ7GFuhHSW/lAaI0RXJHK98teQ6WUzILXXDi/J7/3d3ICX0pQz/IbPRj97UeBBB/Snrg
 ctOaWBW9JK6ilmXcUqe2tmnoBhz20qsks5MiQNYLAydNUfxWVw9S545aQpGj8wL698tOVFAO
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: define _REENTRANT for
 OpenRISC when -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Will Newton <will.newton@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RhZmZvcmQsCgo+IElsIGdpb3JubyAxOSBnZW4gMjAyMiwgYWxsZSBvcmUgMDk6MTQsIFN0
YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v09uIFdl
ZCwgSmFuIDE5LCAyMDIyIGF0IDA4OjU0OjExQU0gKzAxMDAsIFRob21hcyBQZXRhenpvbmkgd3Jv
dGU6Cj4+IEhlbGxvIEZhYnJpY2UsCj4+IAo+Pj4gT24gVHVlLCAxOCBKYW4gMjAyMiAyMzoyNDoy
NCArMDEwMAo+Pj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
IHdyb3RlOgo+Pj4gCj4+PiBQYXRjaCBhZGRlZCBieSBjb21taXQgZWVlOTZiMGYwYWQyMjRiM2Uw
OWE5Yjk4YzI2ZDA1NmUxOGYxN2ZkNSBvbiBnY2MKPj4+IDkuMy4wIG11c3QgYWxzbyBiZSBhcHBs
aWVkIG9uIGdjYyAxMCBhbmQgMTEgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZAo+Pj4gZmFp
bHVyZSBvbiBudW1lcm91cyBwYWNrYWdlcyAoYmFiZWx0cmFjZTIsIHBjc2MtbGl0ZSwgdHBtMi1w
a2NzMTEsCj4+PiBldGMuKToKPj4+IAo+Pj4gY29uZmlndXJlOjEzNzc0OiBjaGVja2luZyB3aGV0
aGVyIHB0aHJlYWRzIHdvcmsgd2l0aCAtcHRocmVhZAo+Pj4gY29uZmlndXJlOjEzODY4OiAvaG9t
ZS9naXVsaW9iZW5ldHRpL2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L2Jp
bi9vcjFrLWxpbnV4LWdjYyAtbyBjb25mdGVzdCAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdF
RklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0ICAtT3MgLWcyICAtc3RkPWdudTk5
IC1wdGhyZWFkIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQgIGNvbmZ0ZXN0LmMgICA+JjUKPj4+IGNvbmZ0ZXN0LmM6Mjc6MjY6
IGVycm9yOiAjZXJyb3IgIl9SRUVOVFJBTlQgbXVzdCBiZSBkZWZpbmVkIgo+Pj4gICAyNyB8ICMg
ICAgICAgICAgICAgICAgICAgICAgICBlcnJvciAiX1JFRU5UUkFOVCBtdXN0IGJlIGRlZmluZWQi
Cj4+PiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Cj4+PiAKPj4+IEl0IHNo
b3VsZCBiZSBub3RlZCB0aGF0IGV4dGVybmFsIGJvb3RsaW5zIHdpbGwgaGF2ZSB0byBiZSByZWJ1
aWx0Lgo+Pj4gCj4+PiBGaXhlczoKPj4+IC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvY2I1OGQ0ZmJhZWIwOGQxODhjMmY4YmYwNWVmMTYwNDc4OWZhODc2Ngo+Pj4gLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83YWY5ZDRiNjhiZDQ2ZWQyNjBl
ZDY2YmEyY2MzYzljMjE0ODJlNzQxCj4+PiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzZmOTI2YmVjMTQ2NzUyODczZjgwMzJiNTkzZjBkZTFjYjIyMmVhNDYKPj4+IAo+
Pj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Cj4+IAo+PiBXb3csIHRoaXMgcGF0Y2ggc3RpbGwgaGFzbid0IGJlZW4gYWNjZXB0ZWQg
aW4gdXBzdHJlYW0gZ2NjPyBJdCdzIGJlZW4KPj4gc3VibWl0dGVkIGEgbG9vb25nIHRpbWUgYWdv
IEkgYmVsaWV2ZS4KPiAKPiBIZWxsbywKPiAKPiBJIG11c3QgaGF2ZSBtaXNzZWQgdGhpcyBvbmUu
ICBJdCBsb29rcyBnb29kIHRvIG1lIEkgd2lsbCBwdXNoIGl0IHVwc3RyZWFtLgoKSeKAmXZlIGp1
c3Qgd3JpdHRlbiBJIHdvdWxkIGhhdmUgcGluZ2VkIHlvdSBzb29uIGFuZCB5b3XigJl2ZSBhcHBl
YXJlZDotKQpCZXR0ZXIgdGhpcyB3YXkhCgpLaW5kIHJlZ2FyZHMK4oCULQpHaXVsaW8gQmVuZXR0
aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiAKPiAtU3RhZmZvcmQKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
