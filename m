Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECF0C46CD3
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 11:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3784A83B8C;
	Sat, 23 Dec 2023 11:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3784A83B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miXcmLbV3X2o; Sat, 23 Dec 2023 11:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7490383B74;
	Sat, 23 Dec 2023 11:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7490383B74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 172D91BF3C8
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 11:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3ECE60D51
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 11:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3ECE60D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1WL8nqKyRZH for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 11:17:53 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84E1360BE8
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 11:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E1360BE8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0381BB00573;
 Sat, 23 Dec 2023 12:17:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 12:17:46 +0100
Date: Sat, 23 Dec 2023 12:17:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZYbB2sIK9Cz1hStE@landeda>
References: <20231222203810.2235657-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222203810.2235657-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703330270;
 bh=hOTFuc+Z8tV2C2YKFoTx3+mdSjDI2LbvKcIlUF0xAZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+Jpg9v+U/LfdgWX5kG+e0JDZJogKynx89OwV/zaeBeCOJTeKuh32sBw4UYU2ics2
 OEoOmIB3FXwj4AD4eXhCnykRtdU04EuOuNRJK52zkD/wnLC62dG1BBA7U5UOcr6Jvw
 1mOWoBv+d5qwZseYMZWaibXRyvgse0lNMWe14VVrphq1Of03n2wxwyMniz7uVuaD3I
 1JLUxvit3ZMxpV/cf0VJs5bhg5uFaWY/59loxKh6l6sT4BaZeyWl0mWQrFo3ZUon2s
 rDc7KzcpfB2qrehy+Q0CaQOk5s2ao+UWeM4/m2Bc9Q9XJXA5dT8Yj4uUL8DfI0GlKQ
 nkxpjx9qjOyUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V+Jpg9v+
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: bump to version 2.12
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SnVsaWVuLCBBbGwsCgpPbiAyMDIzLTEyLTIyIDIxOjM4ICswMTAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gRm9yIHJlbGVhc2UgYW5ub3VuY2Ugb24gbWFpbGluZyBsaXN0LCBzZWUg
WzFdLgo+IEZvciByZWxlYXNlIGdlbmVyYWwgbmV3cywgc2VlIFsyXS4KPiAKPiBUaGlzIGNvbW1p
dCByZW1vdmVzIGFsbCBwYWNrYWdlIHBhdGNoZXMsIGFzIHRoZXkgYXJlIGFsbCBpbmNsdWRlZCBp
bgo+IHRoaXMgdmVyc2lvbi4KPiAKPiBUaGUgLmNoZWNrcGFja2FnZWlnbm9yZSBmaWxlIGlzIHVw
ZGF0ZWQgYWNjb3JkaW5nbHkgKHRoZSBlbnRyeSBmb3IKPiBwYXRjaCAwMDAxIGlzIHJlbW92ZWQp
Lgo+IAo+IFRoaXMgY29tbWl0IGFsc28gcmVtb3ZlcyBHUlVCMl9BVk9JRF9BVVRPUkVDT05GIGhv
b2tzLCBzaW5jZSBwYXRjaAo+IDAwMDEgaXMgcmVtb3ZlZC4KPiAKPiBUaGlzIGNvbW1pdCBhbHNv
IHJlbW92ZXMgdGhlIEdSVUIyX0lHTk9SRV9DVkVTIGVudHJpZXMgYXNzb2NpYXRlZCB0bwo+IHRo
ZSByZW1vdmVkIHBhdGNoZXMuIFRoZSB2ZXJzaW9uIGJ1bXAgc2hvdWxkIG5vdyBleHBsaWNpdGx5
IGV4Y2x1ZGUKPiB0aG9zZSBDVkVzLgo+IAo+IEZpbmFsbHksIHRoaXMgY29tbWl0IGludHJvZHVj
ZXMgYSBuZXcgcGF0Y2gsIGFkZGluZyBhIG1pc3NpbmcgZmlsZSBpbgo+IHRoZSByZWxlYXNlIHRh
cmJhbGwuCj4gCj4gWzFdIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvZ3J1Yi1k
ZXZlbC8yMDIzLTEyL21zZzAwMDUyLmh0bWwKPiBbMl0gaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251
Lm9yZy9naXR3ZWIvP3A9Z3J1Yi5naXQ7YT1ibG9iO2Y9TkVXUztoYj1yZWZzL3RhZ3MvZ3J1Yi0y
LjEyCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAt
LS0KPiBQYXRjaCB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgZTU5MzQ2Ziwgd2l0
aCBjb21tYW5kczoKPiAKPiAgICAgbWFrZSBjaGVjay1wYWNrYWdlCj4gICAgIC4uLgo+ICAgICAw
IHdhcm5pbmdzIGdlbmVyYXRlZAo+IAo+ICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwK
PiAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ICAgICAgICAgdGVzdHMuYm9vdC50
ZXN0X2dydWIKPiAgICAgLi4uCj4gICAgIE9LCj4gCj4gRmV3IGNvbW1lbnRzLCB0byBoZWxwIHRo
ZSByZXZpZXcgb2YgdGhpcyBwYXRjaDoKClRoYW5rcyBmb3IgdGhlIGV4dGVuZGVkIGluZm9ybWF0
aW9uLCB0aGF0IHdhcyB2ZXJ5IGhlbHBmdWwhIPCfkY0KClstLVNOSVAtLV0KPiBQYXRjaGVzIDAw
MDggYW5kIDAwMDkgaGFkIGluY29ycmVjdCB1cHN0cmVhbSBjb21taXQgSUQsIGluIHRoZWlyCj4g
IlVwc3RyZWFtOiIgZGF0YS4gVGhpcyBsaXN0IGdpdmVzIHRoZSBjb3JyZWN0IGNvbW1pdCBJRHMu
CgpJJ3ZlIHN1bW1hcmlzZWQgdGhlIGRpc2NyZXBhbmNleSBpbiB0aGUgY29tbWl0IGxvZywgZm9y
IHBvc3Rlcml0eSwgaW4KY2FzZSB3ZSB3b25kZXIgbGF0ZXIgb24uIEdvb2QgY2F0Y2ghCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
