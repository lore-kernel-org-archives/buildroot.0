Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C670C001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3193E60E34;
	Mon,  3 Jul 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3193E60E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gzpt4krcwBuH; Mon,  3 Jul 2023 20:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7649A60D9D;
	Mon,  3 Jul 2023 20:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7649A60D9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 753211BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF088149D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF088149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGFXvZPpunt6 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71CE813AB
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B71CE813AB
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:28:59 +0000 (UTC)
Received: from [192.168.50.162] ([84.33.147.71])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GQALqbYTqJ5z3GQALqFL3D; Mon, 03 Jul 2023 22:28:57 +0200
Message-ID: <b47ee9f0-f5c0-7803-d321-b8010cf4af11@benettiengineering.com>
Date: Mon, 3 Jul 2023 22:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
 <20230703215926.69c0f67e@windsurf>
 <4b2a4210-9670-7d31-2ba4-245460f05196@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <4b2a4210-9670-7d31-2ba4-245460f05196@benettiengineering.com>
X-CMAE-Envelope: MS4xfCvOFMcx/pHkciYAlhB/3CvZA6Op1Xj3b0+yMS67ozmAepFyNiV6dAxphWTiZZEUJP7RjK/LUEWXEBxTdtQSu1A1O8pHkSjVIXUweMihHjZ9SWUt73rb
 UJNDFzpunC/RZRo5r83puo69/i48DXaqBNRtlsBOmKD3R80HlIpFYCZeiQrxnwi7v9kuSdbMJq9q9Cz9jDMsnBG1H21/k3iq4YxTNADIp0w71CjyqjQaLZML
 OoOA4APadVdSDgooQ1BF2MtVUWUkN168+303uc1ErL8BOaVbdQ2UzNf5bz4jChCTgIxysN3gGJD9nPVpHiCyaWw6MVr1jKfR7S8etBaMdFk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688416137; bh=5n0nhT5U9bgiIypWDyshXY9UtKj/Fr/6ZcBNv4h+LF0=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=lK48k0M19ZqKe2h4XFz+GPUE9yfPz+Z+JQflEjvc39wc27kUxIb4sPft1I0hQ5ekM
 ZxV+/qbWYPVZaPp6pVFRl4H8ipHpIVicZUQwz+9ysaRRPO5oyorVr0DwyCpKq/HGhE
 8zbr2L8tDEjuat1x46nmtv7o0KY3Nx82blDVCtLU8Th+tyYjWLdIr4LVe5K18s4P3V
 F3BkSkO2fh+pbWyeSU3BCd7cw54Hy0hufumBLsLpw2OrPTG9peQSvYjP4f91P/7Afe
 wG9tyRn/htwPTRhn3R4TYBxYgHqZ3cBCSLn69OIVbe5YN2v/UgWRzIZSYYXMNLmuEH
 K6oYrqJLiPilA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lK48k0M1
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to version
 2023-06-23
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDcvMjMgMjI6MTYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IE9uIDAzLzA3LzIzIDIx
OjU5LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiBPbiBNb24swqAgMyBKdWwgMjAyMyAyMTox
NjoxNSArMDIwMAo+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2lu
ZWVyaW5nLmNvbT4gd3JvdGU6Cj4+Cj4+PiBJdCBub3cgc3VwcG9ydHMgYnVpbGRpbmcgd2l0aCBM
aW51eCB2ZXJzaW9uID4gNi4xCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+PiAtLS0KPj4+IMKgIHBh
Y2thZ2UvcnRsODE5MmV1L3J0bDgxOTJldS5oYXNoIHwgMiArLQo+Pj4gwqAgcGFja2FnZS9ydGw4
MTkyZXUvcnRsODE5MmV1Lm1rwqDCoCB8IDIgKy0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBUaGlzIHBhdGNoIGRvZXNuJ3QgYXBw
bHkgY2xlYW5seSBvbiB0aGUgY3VycmVudCBtYXN0ZXIuIEFyZSB5b3Ugc3VyZQo+PiBpdCdzIGJh
c2VkIG9uIG1hc3Rlcj8KPiAKPiBQYXJkb24sIHRoZXJlIHdhcyBhbm90aGVyIHBhdGNoIHBlbmRp
bmcgdGhhdCBub3cgSSByZWplY3QgYW5kIHNlbmQgYSBWMgo+IG9mIHRoaXMgb25lLgoKVGhpcyBp
cyB0aGUgY29ycmVjdGVkIHBhdGNoOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNzAzMjAyMDIwLjEzNDAzOTUtMS1naXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0
aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
