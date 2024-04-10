Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965DFCD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47AE760E8D;
	Wed, 10 Apr 2024 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sQxDNkDSCw2; Wed, 10 Apr 2024 21:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553F860E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553F860E90;
	Wed, 10 Apr 2024 21:08:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC281BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFB4160E90
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkMBqbXdCimQ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:08:18 +0000 (UTC)
X-Greylist: delayed 14157 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Apr 2024 21:08:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82AC160E8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82AC160E8D
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82AC160E8D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:08:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4944F20004;
 Wed, 10 Apr 2024 21:08:15 +0000 (UTC)
Message-ID: <f85e872c-8d99-4dcf-997e-95d3a382b463@yoseli.org>
Date: Wed, 10 Apr 2024 23:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
 <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
 <20240410215656.1756a37e@windsurf>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20240410215656.1756a37e@windsurf>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712783295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5PB2/IFPmPeeV2gbluJXDLbFE+1f8RxjWYC17ct3io=;
 b=Yx6szqU0pd5gTte0mEOMDszR2zfuMO3ZbPM92pcmXU37A/4sAOvaGyNSEYykTvmTQwG4e9
 egoDuhhigHhIKTPyKd9O0Lf1IdDbmYvPeCtjRn3eXzzt6fuoN5J0ncCuoiMxq87KXS0m54
 yPGYbuSw6+7XWbQDp4xHpYoPnMxHQtgHfSYEwtEN2koJGesIw+nNoX32+/O7CceFUWTUOc
 hkivYVXdkWBYYNDT0vTCBdylj+uKyZo1xBFduykdhNi+xtIdk2cnN0VLaXmHyeEBAlwhXh
 Uqa08mQA+aX3tD9Dzi0OnOv16sYXAQ3hwK1DUnSIKlE9VTNH512ZrhUAGGQaaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=Yx6szqU0
Subject: Re: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x
 Colfdire
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 yann.morin.1998@free.fr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTAvMDQvMjAyNCAyMTo1NiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IEhlbGxvLAo+IAo+IE9uIFdlZCwgMTAgQXByIDIwMjQgMTk6MTI6MDkg
KzAyMDAKPiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGku
b3JnPiB3cm90ZToKPiAKPj4gVGhlIG02OGsgZmFtaWx5IG9ueSBoYXMgb25lIENvbGRmaXJlIHZh
cmlhbnQsIG5hbWVseSB0aGUgNTIwOC4gQWRkIHRoZQo+PiBzdXBwb3J0IGZvciB0aGUgTUNGNTQ0
MXggQ1BVIGZhbWlseSBpbiB0aGUgY29uZmlndXJhdGlvbiBmaWxlLgo+PiBUaGlzIGNvdmVycyBN
Q0Y1NDQxMCwgTUNGNTQ0MTUsIE1DRjU0NDE2LCBNQ0Y1NDQxNyBhbmQgTUNGNTQ0MTguCj4gCj4g
SW50ZXJlc3RpbmcuIEkgYWx3YXlzIHRob3VnaHQgdGhhdCBDb2xkZmlyZSBtZWFudCAibm8gTU1V
IiBhbmQgNjhrCj4gbWVhbnQgIk1NVSIsIGJ1dCBJIHdhcyB3cm9uZy4gVGhlIGZhbWlseSBvZiA2
OGsgYW5kIGNvbGRmaXJlIGlzIHF1aXRlCj4gbWVzc3ksIGRpZmZpY3VsdCB0byBmaW5kIGNsZWFy
IGFuZCByZWxpYWJsZSBzb3VyY2VzIG9mIGluZm9ybWF0aW9uLgoKSW5kZWVkLCBpdCAqaXMqIGEg
bWVzcyA6LSkuCgo+IAo+PiArY29uZmlnIEJSMl9HQ0NfVEFSR0VUX0FSQ0gKPj4gKwlkZWZhdWx0
ICJjZiIgICAgICAgICAgICBpZiBCUjJfbTY4a19jZjU0NDF4Cj4gCj4gVGhlIHByb2JsZW0gd2l0
aCB0aGlzIGlzIHRoYXQgImNmIiBpcyBub3QgYSB2YWxpZCB2YWx1ZSBmb3IgZ2NjIC1tYXJjaD0K
PiBvcHRpb24uIExvb2sgYXQgdGhlIGRvY3VtZW50YXRpb24gYXQ6Cj4gaHR0cHM6Ly9nY2MuZ251
Lm9yZy9vbmxpbmVkb2NzL2djYy0xMy4yLjAvZ2NjL002ODB4MC1PcHRpb25zLmh0bWwKPiAKPiBU
aGUgdmFsaWQgdmFsdWVzIG9mIC1tYXJjaCBhcmU6Cj4gCj4gICAgUGVybWlzc2libGUgdmFsdWVz
IG9mIGFyY2ggZm9yIE02ODB4MCBhcmNoaXRlY3R1cmVzIGFyZTog4oCYNjgwMDDigJksCj4gICAg
4oCYNjgwMTDigJksIOKAmDY4MDIw4oCZLCDigJg2ODAzMOKAmSwg4oCYNjgwNDDigJksIOKAmDY4
MDYw4oCZIGFuZCDigJhjcHUzMuKAmS4gQ29sZEZpcmUKPiAgICBhcmNoaXRlY3R1cmVzIGFyZSBz
ZWxlY3RlZCBhY2NvcmRpbmcgdG8gRnJlZXNjYWxl4oCZcyBJU0EgY2xhc3NpZmljYXRpb24KPiAg
ICBhbmQgdGhlIHBlcm1pc3NpYmxlIHZhbHVlcyBhcmU6IOKAmGlzYWHigJksIOKAmGlzYWFwbHVz
4oCZLCDigJhpc2Fi4oCZIGFuZAo+ICAgIOKAmGlzYWPigJkuCj4gCj4gV2hhdCBoYXBwZW5zIHdo
ZW4geW91IGRvbid0IHNwZWNpZnkgLW1hcmNoPyBEbyB5b3Uga25vdyB3aGljaCBvZiBpc2FhLAo+
IGlzYWFwbHVzLCBpc2FiIGFuZCBpc2FjIHRoZSBNQ0Y1NDQxeCBjb3JyZXNwb25kcyB0bz8KCkkg
ZGlkIG5vdCBjaGVjayB3aGF0IGhhcHBlbnMsIGJ1dCBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIGZp
bGUgaXQgaXMgaXNhYzoKaHR0cHM6Ly9naXRodWIuY29tL2djYy1taXJyb3IvZ2NjL2Jsb2IvbWFz
dGVyL2djYy9jb25maWcvbTY4ay9tNjhrLWRldmljZXMuZGVmI0wxNjgKCkpNCgo+IAo+IEJlc3Qg
cmVnYXJkcywKPiAKPiBUaG9tYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
