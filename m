Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7CC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76426F74D;
	Thu, 11 Jan 2024 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E76426F74D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4_O_Yuqv4wG; Thu, 11 Jan 2024 20:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 318CA6F738;
	Thu, 11 Jan 2024 20:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 318CA6F738
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 441101BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DDB984011
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DDB984011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YcFLcwJFgGH for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:22:09 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE9084008
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE9084008
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD75EB0055A;
 Thu, 11 Jan 2024 21:22:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 21:22:03 +0100
Date: Thu, 11 Jan 2024 21:22:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaBN6-d-0-ENbQgi@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
 <ZaA4GvpdWkjt9kb5@landeda>
 <CAHDQB6PaKTpFgpK+jaMVrDmbkUDz5-qv-MTrWT7wFNM7HFM44w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHDQB6PaKTpFgpK+jaMVrDmbkUDz5-qv-MTrWT7wFNM7HFM44w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705004526;
 bh=4yQ3Rh+UkRHLq3Hwpb5jA4qNBthy2SZogxmpcUEwpO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gEvdOcPqXPtwqdBD8nQ1EI/PjNGGcb5TpxtO1YYLM7x6+2b7apUl/RuEyZjFzmZgu
 0goa9MnrcrR0owRa7uAcbCTS/VT76i+Oyz32P/wTxlaPyM1uYAf1mp8o8fDpDKSQwj
 R2f7XyznS1+LY0cYFXw90SYsVJhWjOBfrkTSzqwnnaTicq0cz1EahJhoVUhoBeINSZ
 UrmYCMJmHoDyHT0vLeiWsMs0RMEHHv1tLAlXQeI0eZkudC7anamH0A9EJ8w7U/UZXt
 ukfBy1a9rnJp0z1cAUzRGufQOLUM0xHEoCLNZrsg/qsLKX4G5P0GRTIpwC65xNfest
 v7MkwvnQij4WA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gEvdOcPq
Subject: Re: [Buildroot] [PATCH v3 08/11] package/flutter-sdk-bin: add dart
 arguments for different runtime modes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRhbSwgQWxsLAoKT24gMjAyNC0wMS0xMSAxMjo0MCAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtl
IHRodXNseToKPiBPbiBUaHUsIEphbiAxMSwgMjAyNCBhdCAxMTo0OeKAr0FNIFlhbm4gRS4gTU9S
SU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjQtMDEtMDIgMTY6
NTkgLTA3MDAsIEFkYW0gRHVza2V0dCBzcGFrZSB0aHVzbHk6Cj4gPiA+IE5vdyB0aGF0IHByb2Zp
bGUgbW9kZSBpcyBhbiBvcHRpb24gZm9yIHRoZSBmbHV0dGVyLWVuZ2luZSBwYWNrYWdlLCB0aGUg
bG9naWMKPiA+ID4gaW4gcGFja2FnZS9mbHV0dGVyLXNkay1iaW4vZmx1dHRlci1zZGstYmluLm1r
IGlzIG5vIGxvbmdlciBzdWZmaWNpZW50LgpbLS1TTklQLS1dCj4gPiA+ICBpZmVxICgkKEJSMl9F
TkFCTEVfUlVOVElNRV9ERUJVRykseSkKPiA+ID4gLUhPU1RfRkxVVFRFUl9TREtfQklOX1NES19S
T09UID0gXAo+ID4gPiAtICAgICAkKEhPU1RfRkxVVFRFUl9TREtfQklOX1NES19FTkdJTkUpL2Nv
bW1vbi9mbHV0dGVyX3BhdGNoZWRfc2RrCj4gPiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9ERUJV
R19GTEFHUyA9IC0tZW5hYmxlLWFzc2VydHMKPiA+ID4gIEhPU1RfRkxVVFRFUl9TREtfQklOX1NE
S19QUk9EVUNUID0gZmFsc2UKPiA+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX1NES19ST09UID0g
JChIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfRU5HSU5FKS9jb21tb24vZmx1dHRlcl9wYXRjaGVk
X3Nkawo+ID4gPiArZWxzZSBpZmVxICgkKEZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERV9QUk9G
SUxFKSx5KQo+ID4gPiArSE9TVF9GTFVUVEVSX1NES19CSU5fUFJPRklMRV9GTEFHUyA9IC0tdHJh
Y2std2lkZ2V0LWNyZWF0aW9uCj4gPiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfUFJPRFVD
VCA9IGZhbHNlCj4gPiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfUk9PVCA9ICQoSE9TVF9G
TFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkvY29tbW9uL2ZsdXR0ZXJfcGF0Y2hlZF9zZGsKPiA+
ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX1NES19WTV9QUk9GSUxFID0gdHJ1ZQo+ID4gPiAgZWxz
ZQo+ID4gPiAtSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX1JPT1QgPSBcCj4gPiA+IC0gICAgICQo
SE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkvY29tbW9uL2ZsdXR0ZXJfcGF0Y2hlZF9z
ZGtfcHJvZHVjdAo+ID4gPiArSE9TVF9GTFVUVEVSX1NES19CSU5fREVCVUdfRkxBR1MgPQo+ID4g
PiArSE9TVF9GTFVUVEVSX1NES19CSU5fUFJPRklMRV9GTEFHUyA9Cj4gPiA+ICBIT1NUX0ZMVVRU
RVJfU0RLX0JJTl9TREtfUFJPRFVDVCA9IHRydWUKPiA+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklO
X1NES19ST09UID0gJChIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfRU5HSU5FKS9jb21tb24vZmx1
dHRlcl9wYXRjaGVkX3Nka19wcm9kdWN0Cj4gPiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtf
Vk1fUFJPRklMRSA9IGZhbHNlCj4gPiA+ICBlbmRpZgo+ID4gVGhpcyBpZi1lbGlmLWVsc2UgYmxv
Y2sgaXMgbm90IGluIHRoZSBzYW1lIG9yZGVyIGFzIHRoZSBvbmUgdG8gZW5hYmxlCj4gPiBwcm9m
aWxpbmcgaW4gZmx1dHRlci1lbmdpbmUuIEhlcmUgeW91IGhhdmU6IGRlYnVnLCBwcm9maWxpbmcs
IHJlbGVhc2UsCj4gPiB3aGlsZSBpbiBmbHV0dGVyLWVuZ2luZSB0aGUgb3JkZXIgaXM6IHByb2Zp
bGluZywgZGVidWcsIHJlbGVhc2UuCj4gPgo+ID4gU2hvdWxkbid0IHRoZSB0d28gbWF0Y2gsIGku
ZS4gc2hvdWxkIHdlIHN3YXAgdGhlIGRlYnVnIGFuZCBwcm9maWxpbmcKPiA+IGJsb2NrcyBoZXJl
Pwo+IE5vIHdvcnJpZXMgaWYgeW91IHJlLWFycmFuZ2UgdGhlIGlmLWVsaWYtZWxzZSBibG9jayB0
byBtYXRjaCB3aGF0IGlzCj4gaW4gZmx1dHRlci1lbmdpbmUuIFRoZSBvdXRjb21lIGlzIHRoZSBz
YW1lLgoKQXMgd2UgZGlzY3Vzc2VkIG9uIElSQywgdGhlIG91dGNvbWUgaXMgbm90IHRoZSBzYW1l
LiBJbmRlZWQsCkZMVVRURVJfRU5HSU5FX1JVTlRJTUVfTU9ERV9QUk9GSUxFIGlzIHN1cHBvc2Vk
IHRvIHdpbiBvdmVyCkJSMl9FTkFCTEVfUlVOVElNRV9ERUJVRywgc28gdGhhdCB3aGVuIGJvdGgg
ZGVidWcgYW5kIHByb2ZpbGluZyBhcmUKZW5hYmxlZCwgd2UgZG8gcHJvZmlsZSwgbm90IGRlYnVn
LgoKQW5kIGFzIGNvbmNsdWRlZCBvbiBJUkMsIEknbGwgc3dhcCB3aGVuIGFwcGx5aW5nLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
