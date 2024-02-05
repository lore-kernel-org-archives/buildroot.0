Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CFEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15DB60F3B;
	Mon,  5 Feb 2024 13:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15DB60F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6G3N_FAycOBm; Mon,  5 Feb 2024 13:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB4960E43;
	Mon,  5 Feb 2024 13:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB4960E43
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 332771BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E7560E43
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E7560E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uiaAP4U49ag for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:25:47 +0000 (UTC)
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA6FA60BDD
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6FA60BDD
Received: from [192.168.17.140] (unknown [85.119.216.19])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id 414D65242906;
 Mon,  5 Feb 2024 14:25:44 +0100 (CET)
Message-ID: <a84e5989-528c-4ab1-9889-c2ecb696131c@andin.de>
Date: Mon, 5 Feb 2024 14:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
References: <5d1e6b74-ed9c-48d7-abfc-9de470b04be0@linatsea.fr>
 <CAHDQB6MLReoc97UouTVk5ROG2jd3JLQXbNHvpbgt3UDiPnDHkQ@mail.gmail.com>
 <977bc5e8-28c7-44b4-8651-9522d205aa59@linatsea.fr>
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <977bc5e8-28c7-44b4-8651-9522d205aa59@linatsea.fr>
X-Spamd-Bar: ---
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202309151109; t=1707139544;
 bh=m05HgMO6uBQWCZ2Fv6WPrppd6EspqkOSxacJJRvwtec=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=crHmPf5HBm8JuAfmCKyvXuPiZTMZhHeaNzgjsG8N0Y/TWS9T3jky9fhsft08yABgU
 0YnyzGXx0TNF3Z3BDYKZX6dxV33QClPKDx3GK51BAYtYbbPbV7MFxZ1oKy491g8fVD
 8e5eDf1v8IpDmg4aT2foMyldvWQ83X3jtXNWWh9SzqiU0RRQSR269+D3nN7jCRzxG7
 ZjXgA283JigX+ofgQGKTN1tN/elIcs5H2Tfgyykzm0i7Cjz3yh+Q79E05axNx9CF3c
 BDEpNehMhsjuoJ2qBE+nrO+vjGuQiKfqp/u1UsymhAlwv9YyHQL8jjlJ2l31eJN2Oz
 lE5uCT6nPNVsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=andin.de header.i=@andin.de
 header.a=rsa-sha256 header.s=kas202309151109 header.b=crHmPf5H
Subject: Re: [Buildroot] dracut: no longer works since bump to 059
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

SGksCgpPbiAwNC4wMi4yNCAxMDoxMiwgVGhpZXJyeSBCdWx0ZWwgd3JvdGU6Cj4gRGVhciBBZGFt
LAo+IAo+IHBsZWFzZSBzZWUgbXkgY29tbWVudHMgYmVsb3cKPiAKPiBMZSAwMy8wMi8yMDI0IMOg
IDEzOjU1LCBBZGFtIER1c2tldHQgYSDDqWNyaXTCoDoKPj4gSGVsbG8gVGhpZXJyeTsKPj4KPj4g
SSBhbSBnb2luZyB0byB0b3AtcG9zdCB0byBib3RoZXIgWWFubi4gOykKPj4KPj4gRHJhY3V0IHN1
cHBvcnQgaW4gQnVpbGRyb290IGlzIHZlcnkgYnJva2VuIGFuZCBtdXN0IGJlIHBhdGNoZWQgdG8g
d29yayAKPj4gcHJvcGVybHkuCgo8c25pcD4KSSB0cmllZCBwaW5wb2ludGluZyB0aGUgcHJvYmxl
bSwgd2hpY2ggYWN0dWFsbHkgaXMgdGhhdCB0aGUgdGVzdCBmYWlscyAKYmVjYXVzZSB1c3IvbGli
L2xpYnouc28gaXMgbm8gbG9uZ2VyIGluIHRoZSBwcm9kdWNlZCBjcGlvLgoKQmlzZWN0aW5nIHVw
c3RyZWFtIGRyYWN1dCBJIGFycml2ZWQgYXQKICAgZDAxMGZhMCAgcmVmYWN0b3IoZHJhY3V0LWlu
c3RhbGwpOiBmb3JrKCkgaW5zdGVhZCBvZiBwb3BlbigpLCAKc2FuaXRpc2UgbGluZSByZWFkaW5n
ClRoaXMgY29tbWl0IGlzIGFscmVhZHkgY29udGFpbmVkIGluIHRhZyAwNTgsIHNvIGJ1bXBpbmcg
dG8gdGhhdCB3b3VsZG50IApoZWxwLiBVbmZvcnR1bmF0ZWx5IHRoZSBjb250ZW50IG9mIHRoZSBj
aGFuZ2UgaXMgc29tZXRoaW5nIEkgZG9udCAKdW5kZXJzdGFuZCByaWdodCBub3cuCgpJdCBoYXMg
aG93ZXZlciB0aGUgZWZmZWN0IHRoYXQgbm9uZSBvZiAvdXNyL2xpYi8qIGlzIGxhbmRpbmcgaW4g
dGhlIGNwaW8gCmFueW1vcmUuCgoKcmVnYXJkcywKQW5kcmVhcwoKPiAKPiBBcyBsb25nIGFzIHBy
b2R1Y2luZyBhIGJ1c3lib3gtaW5pdCBiYXNlZCByYW1kaXNrIHN0aWxsIHdvcmtzIC4uLgo+IAo+
Pgo+Pgo+PiBUaGFua3Mgc28gbXVjaCEKPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaGllcnJ5Cj4gCj4+
IEFkYW0KPj4KPj4gT24gVGh1LCBGZWIgMSwgMjAyNCBhdCAxOjQz4oCvUE0gVGhpZXJyeSBCdWx0
ZWwgCj4+IDx0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcj4gd3JvdGU6Cj4+Cj4+IMKgwqDCoCBI
aSwgc2luY2UgYnVtcCB0byB0aGlzIHZlcnNpb24sCj4+Cj4+IMKgwqDCoCBpbnZvY2F0aW9uIG9m
ICdsZGQnIHdyYXBwZXIgZmFpbHMgaW4gZHJhY3V0LWluc3RhbGwuCj4+Cj4+IMKgwqDCoCBBZnRl
ciBhbmFseXNpcywgdGhpcyBpcyBiZWNhdXNlIHZlcnNpb24gdXNlcyAiZXhlY2xwIiBmb3IKPj4g
wqDCoMKgIGxhdW5jaGluZyB0aGUgJ2xkZCcgd3JhcHBlciB2YXJpYWJsZSwKPj4gwqDCoMKgIHdo
aWNoIGluIG91dCBjYXNlIGNvbnNpc3RzIGluIHRoZSBleGVjdXRhYmxlIG5hbWUgKyB0aGUgcm9v
dGZzCj4+IMKgwqDCoCBhcmd1bWVudCwgbGVhZGluZyB0byB0aGUgZmF1bHQuCj4+Cj4+IMKgwqDC
oCBWZXJzaW9uIDA1NyB1c2VkIHRvIGNhbGwgInBvcGVuIiBpbnN0ZWFkIHRoYXQgd2hhdCBPayB3
aXRoIHRoYXQuCj4+Cj4+IMKgwqDCoCBUaGllcnJ5Cj4+Cj4+IMKgwqDCoCAtLQo+PiDCoMKgwqAg
d3d3LmxpbmF0c2VhLmZyIDxodHRwOi8vd3d3LmxpbmF0c2VhLmZyPgo+PiDCoMKgwqAgLS0gwqDC
oMKgIHd3dy5saW5hdHNlYS5mciA8aHR0cDovL3d3dy5saW5hdHNlYS5mcj4KPj4gwqDCoMKgIF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IMKgwqDCoCBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IMKgwqDCoCBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
PiDCoMKgwqAgaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4+Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
