Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1EFE748E7
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2328660FF0;
	Sat, 30 Sep 2023 20:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2328660FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGQE8Fstqv45; Sat, 30 Sep 2023 20:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF7860FEC;
	Sat, 30 Sep 2023 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF7860FEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAD61BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C5760FEC
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14C5760FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhicuI6gFfyl for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:29:15 +0000 (UTC)
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1A5960FD1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1A5960FD1
Received: from [192.168.50.162] ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mgZOqGisvW2JpmgaOqBGf2; Sat, 30 Sep 2023 22:29:12 +0200
Message-ID: <acf438eb-5fc1-4e23-82d8-5cd902a2287d@benettiengineering.com>
Date: Sat, 30 Sep 2023 22:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230930113651.572c4efa@windsurf>
 <5256DD48-6F80-4FB4-9E8E-796327057033@benettiengineering.com>
In-Reply-To: <5256DD48-6F80-4FB4-9E8E-796327057033@benettiengineering.com>
X-CMAE-Envelope: MS4xfA1ilKnIqTcFYjrArSzdDyr7q7eCywn/b1579+HDelVPoDVIg70x+mOY0dCoZseuTwN4ELYO0pQacUquqin4le7QuIYeq/g3FXAmntEJN9IryR7AUN8T
 X3luKQaU+C5C5vUjdx8hit3URXMYqg0KtUtMniDu1PTtAulJSAizzWpnNXyQPY7TCaKTHhO6YC15EVMBY6RNxi9lC+nhE1HXzYLDbkqq1eBUf5n4VT31EHFv
 AqGUevFFZvj2tzqdKyln2J4eeigcv5ZSCdqnfSFUxpwDPkCC8MvdfttP47fLDM3yeLwG5io4sQobeZ57xs7yxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696105752; bh=+sX5AnOn/WkCiUvPfGAMb+tp48sseP/QaiSE0GyLvfc=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=Zsuu6m9peHMpeYTyt1zkYJGU6wDvZE5/q8bUYETHgut7gIauxFLxdhgFQkEmvyIy+
 A/bR7fb+cOjkdu+/WHzs/jN+6cjhE7PNv8xtk9C3s/BDX1wVMf7wxczGXW8Let8po+
 LnqRW5skrdy061wbxXarjqTAYpm5lQN7RHjcmlbmTqcs7Z7WjDURO1KgGQb3JeZequ
 OTHtmWtqcOVNjbHITcsoJ9gWzGzi9VSgilECPStsngPgELj8W3pfdj0LTJBEwGjAtG
 dEvB7+GWXwOlz6ZqxRfvpfo1JhCGddsoyKhfXqz+aYwMPJY3ATSIE9Fa9nq7NdEHDI
 NnnO3uJRZudSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Zsuu6m9p
Subject: Re: [Buildroot] [PATCH] configs/bananapi_m2_berry: new defconfig
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMzAvMDkvMjMgMTc6MzEsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IAo+PiBJbCBnaW9ybm8g
MzAgc2V0IDIwMjMsIGFsbGUgb3JlIDExOjM3LCBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+Pgo+PiDvu79IZWxsbywKPj4KPj4+IE9u
IE1vbiwgIDcgQXVnIDIwMjMgMDA6MTg6MjEgKzAyMDAKPj4+IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPj4+Cj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLWJlcnJ5L2Jvb3QuY21kIGIvYm9h
cmQvYmFuYW5hcGkvYmFuYW5hcGktbTItYmVycnkvYm9vdC5jbWQKPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi5hODA4ZmEwNDA3Cj4+PiAtLS0gL2Rldi9udWxs
Cj4+PiArKysgYi9ib2FyZC9iYW5hbmFwaS9iYW5hbmFwaS1tMi1iZXJyeS9ib290LmNtZAo+Pj4g
QEAgLTAsMCArMSw3IEBACj4+PiArc2V0ZW52IGJvb3RhcmdzIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGVhcmx5cHJpbnRrIHJvb3Q9L2Rldi9tbWNibGswcDIgcm9vdHdhaXQgZHJtLmRlYnVnPTB4ZmYK
Pj4KPj4gSSBkcm9wcGVkIGVhcmx5cHJpbnRrIGFuZCBkcm0uZGVidWc9MHhmZiBmcm9tIHRoZXJl
LCBhcyBpdCdzIHJlYWxseSBhCj4+IGJpdCB0b28gbXVjaCBkZWJ1Z2dpbmcgb3JpZW50ZWQuCj4+
Cj4+IEluIGFueSBjYXNlLCBpdCdkIGJlIGdyZWF0IHRvIHVzZSBleHRsaW51eC5jb25mIGluc3Rl
YWQgb2YgdGhpcy4KCmFuZCB5ZXMsIEkgd2lsbCBzdWJzdGl0dXRlIHdpdGggZXh0bGludXguY29u
ZiwgaXQncyB2ZXJ5IHVzZWZ1bCBmb3IgCmRldmVsb3BpbmcvbW9kaWZ5aW5nIGF0IHJ1bnRpbWUv
cmVib290LgoKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBz
YXMKCj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9iYW5hbmFwaV9tMl9iZXJyeV9kZWZjb25maWcg
Yi9jb25maWdzL2JhbmFuYXBpX20yX2JlcnJ5X2RlZmNvbmZpZwo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAuLjk1NjUyZTc5MzkKPj4+IC0tLSAvZGV2L251bGwK
Pj4+ICsrKyBiL2NvbmZpZ3MvYmFuYW5hcGlfbTJfYmVycnlfZGVmY29uZmlnCj4+PiBAQCAtMCww
ICsxLDM3IEBACj4+PiArQlIyX2FybT15Cj4+PiArQlIyX2NvcnRleF9hNz15Cj4+PiArQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTD15Cj4+PiArQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJXZWxjb21l
IHRvIEJhbmFuYXBpIE0yIEJlcnJ5Igo+Pj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9
InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPj4+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBU
X0FSR1M9Ii1jIGJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLWJlcnJ5L2dlbmltYWdlLmNmZyIK
Pj4+ICtCUjJfTElOVVhfS0VSTkVMPXkKPj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKPj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuMzgi
Cj4+PiArQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InN1bnhpIgo+Pj4gK0JSMl9MSU5VWF9L
RVJORUxfRFRTX1NVUFBPUlQ9eQo+Pj4gK0JSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1F
PSJzdW44aS12NDAtYmFuYW5hcGktbTItYmVycnkiCj4+PiArQlIyX1BBQ0tBR0VfS01TQ1VCRT15
Cj4+PiArQlIyX1BBQ0tBR0VfTUVTQTNEPXkKPj4+ICtCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElV
TV9EUklWRVJfTElNQT15Cj4+PiArQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0w9eQo+Pj4g
K0JSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9eQo+Pj4gK0JSMl9QQUNLQUdFX0hUT1A9eQo+
Pgo+PiBJIGRyb3BwZWQga21zY3ViZSwgbWVzYTNkIGFuZCBodG9wLCBiZWNhdXNlIHRoZXkgZG9u
J3QgcXVhbGlmeSBmb3IgYQo+PiBtaW5pbWFsIGNvbmZpZ3VyYXRpb24uCj4+Cj4+IEFwcGxpZWQg
d2l0aCB0aG9zZSBjaGFuZ2VzLgo+IAo+IFRoYW5rIHlvdSBUaG9tYXMsIEnigJl2ZSBmb3Jnb3R0
ZW4gYWxsIHRob3NlIHBvaW50cyBiZWNhdXNlIEkgd2FzIGRlYnVnZ2luZyBMaW1hIG9uIFY0MC4K
PiAKPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBU
aG9tYXMKPj4gLS0KPj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
PiBodHRwczovL2Jvb3RsaW4uY29tCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
