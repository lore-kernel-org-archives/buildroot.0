Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58F7C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A34681E92;
	Sat, 24 Feb 2024 20:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sh1Keqll6lcH; Sat, 24 Feb 2024 20:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3E981FB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C3E981FB6;
	Sat, 24 Feb 2024 20:02:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA6EF1BF289
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97E0060638
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCsq8ucAFP1E for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FCE260637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FCE260637
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FCE260637
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:02:11 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dyDorIn0hQ6eAdyDprtNgm; Sat, 24 Feb 2024 21:02:09 +0100
Message-ID: <f8f01a43-d619-4618-bc1c-1fcb4a0187dc@benettiengineering.com>
Date: Sat, 24 Feb 2024 21:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Scott Fan <fancp2007@gmail.com>
References: <20240222130716.1311432-1-fancp2007@gmail.com>
 <20240223131603.2313178-1-fancp2007@gmail.com>
 <197750aa-c25f-44d9-89ac-872053953422@benettiengineering.com>
 <CAFkzVZakp7V77zob-AnBXFg3oRtDGnL=L81Gp+mNw8dbUHO4GQ@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAFkzVZakp7V77zob-AnBXFg3oRtDGnL=L81Gp+mNw8dbUHO4GQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfBvp+6qfnYBLSI1+D/T0uMM3rZSFqyboQPJUE++pp7NFZIXzULYa0WfB7o1g7pLf61VDntxH4pg5aPvY6CZyyr5ETXsnC0hKqMUcds2KmMlGquX2TuiS
 0L+/YiRhBrYMtqaPY78EEBrMbvSDzfVfPewgnjQqXyiL0ZnJRp5LKuFmjfjMibGSzPeU7NHgCaPjPrqm1oe4jnoRpbpwX/SE0T8Zvc9K8ACjjxcsvctJDWK6
 5A0R9FEI913iAcLFwYLxNw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708804929; bh=Z3F5dqzpYpg+UzE/pEdSSlH0U8+87qx3m1S4dq2NmFY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IS44csS8TLN8xaYRhSgBZjEeLJc2OOw0shKx4ku0MUDPMB1w1DaxQI4aDCZE9ndbF
 s20MEe/Jzc2yDr5Gno8oSWtWeYuFe2s0MutePr9l6KMIetPdY7xf9FLKB/u8OTqdtB
 u5XF1tViatpvDRwSQn7gVEI0Qal5iOJulv5OU0GXRDJv2VRqqZRKZKz5jVrtrxePf5
 h4xkmvzBWl5fqOUDGFGRiKaEgTbX5fnDW4PGsLs+UFVfatyNrNioaILBkD2HWRyc9M
 jwdlDEeC6w4Nb8J4gSXLriH7OQkWHhXjD6JCRju3tUEqMZd/5h89YGj71Me6qOEwUH
 SVaOYNfluxcfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=IS44csS8
Subject: Re: [Buildroot] [PATCH v7]
 configs/friendlyarm_nanopi_neo2_defconfig: new board
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

SGkgU2NvdHQsCgpPbiAyNC8wMi8yNCAxMTozMSwgU2NvdHQgRmFuIHdyb3RlOgo+IEhpIEdpdWxp
bywKPiAKPiBUaGUgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19NREVWIGlzIGZv
ciB0aGUgZXRoZXJuZXQgcG9ydAo+IG9uIHRoZSBib2FyZC4KPiBXaXRob3V0IHRoZSBjb25maWcs
IHRoZSBldGgwIGludGVyZmFjZSB3aWxsIGJlIG5vdCBhY2Nlc3NpYmxlLgo+IFRoZSBgaWZjb25m
aWcgZXRoMGAgY29tbWFuZCB3aWxsIHJlcG9ydCBlcnJvcjogRGV2aWNlIG5vdCBmb3VuZAoKT2ss
IHNvdW5kcyBnb29kLiBTbyBjYW4geW91IHBsZWFzZSByZXBvcnQgaXQgaW4gdGhlIGNvbW1pdCBs
b2cgYW5kLi4KCj4gCj4gU2NvdHQgRmFuCj4gCj4gT24gU2F0LCBGZWIgMjQsIDIwMjQgYXQgMTI6
MjTigK9BTSBHaXVsaW8gQmVuZXR0aQo+IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPiB3cm90ZToKPj4KPj4gSGkgU2NvdHQsCj4+Cj4+IE9uIDIzLzAyLzI0IDE0OjE1LCBT
Y290dCBGYW4gd3JvdGU6Cj4+Cj4+IFsgU05JUCBdCj4+Cj4+PiArCj4+PiArIyBTeXN0ZW0KPj4+
ICtCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gRnJpZW5kbHlBUk0gTmFub1Bp
IE5FTzIiCgouLi5pbiBhIGNvbW1lbnQgaGVyZT8KCj4+PiArQlIyX1JPT1RGU19ERVZJQ0VfQ1JF
QVRJT05fRFlOQU1JQ19NREVWPXkKPj4KPj4gV2hhdCBkbyB5b3UgbmVlZCBNREVWIGJ5IGRlZmF1
bHQgZm9yPyBJcyB0aGVyZSBzb21lIHBlcmlwaGVyYWwgdGhhdAo+PiBuZWVkcyB0byBzaG93IHVw
IGF1dG9tYXRpY2FsbHkgb3RoZXJ3aXNlIHRoZSBiYXNpYyBmdW5jdGlvbmFsaXR5IGlzCj4+IGNv
bXByb21pc2VkPwoKVGhhbmsgeW91IQoKQmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpD
RU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
