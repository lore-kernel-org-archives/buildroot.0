Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1007C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B56340A1E;
	Sun, 18 Sep 2022 16:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B56340A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7BdRqsURI_5; Sun, 18 Sep 2022 16:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5FAA40A19;
	Sun, 18 Sep 2022 16:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5FAA40A19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6334F1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D651416BF
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D651416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JCrJE_Ms8GRU for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07A1416B6
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07A1416B6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:23:47 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.46.240])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Zx58ovZpPsT4eZx58ogDR4; Sun, 18 Sep 2022 18:23:46 +0200
Message-ID: <197a9080-eb59-8854-318c-834e7548d9ca@benettiengineering.com>
Date: Sun, 18 Sep 2022 18:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220918125309.1128650-1-giulio.benetti@benettiengineering.com>
 <20220918153710.GC1127102@scaer>
 <789d2331-074e-8cb9-4378-4b91d10f7d0e@benettiengineering.com>
In-Reply-To: <789d2331-074e-8cb9-4378-4b91d10f7d0e@benettiengineering.com>
X-CMAE-Envelope: MS4xfPMzt/1hE6c6omqU5k64Tb8dJp4S07NbL4cc50mjUcZ+g3/6Cnry2VMLfkD17UPzuCRwyGegiJ5V0v4yDpssSLvBV9eOU+CWe3C9hxDj3FeTplYEsiLz
 ZgIvPlfvgI1S7wiZ7Lhst7UbRrkkO5f9T906QYHAR8iJx1D+/zZoodMREEeWg5Lh2drZJg1HU80iJ2GcaC0RETK0EESxds53FSbXY2562cjbdIXzJeV5dVxV
 8ndbv66iyjt45TT6fJ9qHGByDFOjjsxWzkD46r2UkFA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663518226; bh=nZJNWPehHQvPZ6VmXwJIBafvpyKeNUMkCsP/2JUqNI8=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=QkMLWNxsDvJN100g3TsYuu9xgTQMK5lvwldD5kEuUoEiHsULfHmwP1jRZ2uU6unK4
 u2sY6eOpPiGi3dQ2iC/BGULhUhuWpoUoUrNcxivWfGS4vUjEroaOMfm6yA4WVJ1bH8
 UnltQuClCVNe3f8f/8MR5xF3TYdGA81vhDmFRxsxbGHxzWXHmqIQUgv16lDTQebcsE
 GDyEXqtoSTLNRHDNdTD+ePnRwrZ2qOEq7d7l7vLuwXwU0ydswTCJ3mgzf2vcCa4cjY
 XaeErP2oGQoI07aKXWBoW16s9gAPzw/vBms9F5bCm3IK1oslKei/wo4ZEo1x9IuMs/
 L145c2uwMSong==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QkMLWNxs
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to
 a warning and -Werror enabled
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMDkvMjIgMTg6MjIsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhpIEFybmQsCgpzL0Fy
bmQvWWFubiBzb3JyeSEKCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNh
cwoKPiBPbiAxOC8wOS8yMiAxNzozNywgWWFubiBFLiBNT1JJTiB3cm90ZToKPj4gR2l1bGlvLCBB
bGwsCj4+Cj4+IE9uIDIwMjItMDktMTggMTQ6NTMgKzAyMDAsIEdpdWxpbyBCZW5ldHRpIHNwYWtl
IHRodXNseToKPj4+IEFkZCBwYXRjaCB0byBmaXggd2FybmluZyB0aGF0IGlzIHRyZWF0ZWQgbGlr
ZSBlcnJvcjoKPj4+IGBgYAo+Pj4gSW4gZnVuY3Rpb24gJ19fYnN3YXBfMzInLAo+Pj4gwqDCoMKg
wqAgaW5saW5lZCBmcm9tICdkb19ycG1iX3dyaXRlX2Jsb2NrJyBhdCBtbWNfY21kcy5jOjIyOTM6
Mjc6Cj4+PiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTE1L291dHB1dC0xL2hv
c3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvYml0cy9i
eXRlc3dhcC5oOjUyOjEwOiBlcnJvcjogJ2NudCcgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBb
LVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+Pj4gwqDCoMKgIDUyIHzCoMKgIHJldHVybiBf
X2J1aWx0aW5fYnN3YXAzMiAoX19ic3gpOwo+Pj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Pj4gbW1jX2NtZHMuYzogSW4gZnVuY3Rp
b24gJ2RvX3JwbWJfd3JpdGVfYmxvY2snOgo+Pj4gbW1jX2NtZHMuYzoyMjcwOjIyOiBub3RlOiAn
Y250JyB3YXMgZGVjbGFyZWQgaGVyZQo+Pj4gwqAgMjI3MCB8wqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgY250Owo+Pj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXn5+Cj4+PiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVk
IGFzIGVycm9ycwo+Pj4gYGBgCj4+PiBQYXRjaCBpcyBwZW5kaW5nIHVwc3RyZWFtOgo+Pj4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1tYy9wYXRjaC8yMDIyMDkx
ODEyNDIxMC4xMTI3MzQ1LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8K
Pj4KPj4gQXJuZCByZXF1ZXN0ZWQgYSBkaWZmZXJlbnQgZml4LCBhcmd1aW5nIHRoZSBvbmUgeW91
IHByb3Bvc2VkIGlzIGhpZGluZyBhCj4+IGNvbXBpbGVyIHdhcm5pbmcgd2l0aG91dCBmaXhpbmcg
dGhlIHJvb3QgY2F1c2UuCj4gCj4gWWVzLCBoZSdzIHRvdGFsbHkgcmlnaHQgYW5kIEkndmUganVz
dCByZS1zcGlubmVkIFYzIHBhdGNoOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1t
Yy8yMDIyMDkxODEyNDIxMC4xMTI3MzQ1LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbS9ULyNtY2UzODQwYzBiZjg0ZTE3NDM1NTJhYTk0MjhlZjkwOTdiNjEzYzYxMAo+IAo+
IE5vdyBJIHByZXBhcmUgc2VuZCB0aGUgVjIgQnVpbGRyb290IHBhdGNoLgo+IAo+IEJlc3QgcmVn
YXJkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
