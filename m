Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFDECD379F
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0072C421E8;
	Fri, 15 Sep 2023 20:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0072C421E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93cdHGSgFB4a; Fri, 15 Sep 2023 20:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62B3421EB;
	Fri, 15 Sep 2023 20:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E62B3421EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4971BF39E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F2183CAA
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F2183CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEBxvy6rrNYX for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 20:11:59 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DD1D83C8F
 for <buildroot@busybox.net>; Fri, 15 Sep 2023 20:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD1D83C8F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C8FA1200412;
 Fri, 15 Sep 2023 22:11:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 22:11:52 +0200
Date: Fri, 15 Sep 2023 22:11:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230915201152.GA2571@scaer>
References: <20230912185706.2605439-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912185706.2605439-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694808716;
 bh=CCxpW91syyPJ2LzlHq5YMXf5R2yJfETT8iAc7s+wMiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQ5K6aYjOqSPAknOMwCVmKLw0+W5QEOYPXchsUx0yqxBwZloY5re7tF/vO8tgL+TK
 tdHqnMPxVnd6H9U1biYRUom0CXw+TTAC7ljfnymNsrQKsxEva0jXWmQKsOthQOroEp
 FwLNGLGaErPGviIY9kc38D6LDW0nuKERC24277nV+DSCXxc/GZSLXUJ10Twnw6G53o
 nrOSQ4qi+lbMS0N+f2xkh7T/+IthqjJaI1zDIcrhgdPPggGmChSwMN/R1l7PwUz/yJ
 cPpaT0c+PJBF5VZkvbOK5LCsyGuLnek6EXm2xl8eyyEUK+9sCpZeCQBgL31t/yTpUE
 8a6QL0IUGSjJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NQ5K6aYj
Subject: Re: [Buildroot] [PATCH v2] package/luajit: bump to version
 41fb94defa8f830ce69a8122b03f6ac3216d392a
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgorVGhvbWFzCgpPbiAyMDIzLTA5LTEyIDIwOjU3ICswMjAwLCBGcmFu
Y29pcyBQZXJyYWQgc3Bha2UgdGh1c2x5Ogo+IFRoZSBMdWFKSVQgcHJvamVjdCBzd2l0Y2hlcyB0
byBhIHJvbGxpbmcgcmVsZWFzZSBzY2hlbWUuCj4gTm93LCB0aGUgdmVyc2lvbiBjb250YWlucyB0
aGUgdGltZXN0YW1wIG9mIGl0cyBsYXRlc3QgY29tbWl0Lgo+IAo+IFRoZSB0aW1lc3RhbXAgY2Fu
IGJlIHNlZW4gaW4gYnVpbGQgbG9nOgo+ID09PT0gU3VjY2Vzc2Z1bGx5IGluc3RhbGxlZCBMdWFK
SVQgMi4xLjE2OTMzNTA2NTIgdG8gL3VzciA9PT09ClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sdWFqaXQvbHVhaml0Lm1rIGIvcGFja2FnZS9sdWFqaXQvbHVhaml0Lm1rCj4gaW5k
ZXggMmEyN2FhNTA1Li4wN2NiNmUwMTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWFqaXQvbHVh
aml0Lm1rCj4gKysrIGIvcGFja2FnZS9sdWFqaXQvbHVhaml0Lm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxVQUpJVF9WRVJTSU9OID0g
ODYzNWNiYWJmMzA5NGM0ZDhiZDAwNTc4YzdkODEyYmVhODdiYjJkMwo+ICtMVUFKSVRfVkVSU0lP
TiA9IDQxZmI5NGRlZmE4ZjgzMGNlNjlhODEyMmIwM2Y2YWMzMjE2ZDM5MmEKPiAgTFVBSklUX1NJ
VEUgPSAkKGNhbGwgZ2l0aHViLEx1YUpJVCxMdWFKSVQsJChMVUFKSVRfVkVSU0lPTikpCgpJbiB5
b3VyIHYxLCB5b3Ugd2VyZSB1c2luZyB0aGUgZ2l0IG1ldGhvZCB0byBkbyB0aGUgZG93bmxvYWQs
IGJ1dCB0aGlzCnYyIG5vIGxvbmdlciBkb2VzLgoKV2UgYXJlIHVzaW5nIHRoZSBnaXRodWItZ2Vu
ZXJhdGVkIGFyY2hpdmUsIGFuZCB0aGF0IGFwcGxpZXMgdGhlCmV4cG9ydC1zdWJzdCByZXBsYWNl
bWVudHMgb24gdGhlIGdpdGh1YiBzaWRlLCBzbyB0aGUgLnJlbHZlciBmaWxlIGhhcwpiZWVuIHJl
cGxhY2VkIGluIHRoZSBhcmNoaXZlIHNlcnZlZCBieSBnaXRodWIuIFRoZW4sIHNlZSBiZWxvdy4u
LgoKWy0tU05JUC0tXQo+ICsjIGVtdWxhdGlvbiBvZiBnaXQgYXJjaGl2ZSB3aXRoIC5naXRhdHRy
aWJ1dGVzICYgZXhwb3J0LXN1YnN0Cj4gKyMgVGltZXN0YW1wIG9mIHRoZSAkKExVQUpJVF9WRVJT
SU9OKSBjb21taXQsIG9idGFpbmVkIGluIHRoZSBMdWFKaXQKPiArIyByZXBvLCB3aXRoOiAgIGdp
dCBzaG93IC1zIC0tZm9ybWF0PSVjdCAkKExVQUpJVF9WRVJTSU9OKQo+ICtkZWZpbmUgTFVBSklU
X1JPTExJTkdfVkVSU0lPTgo+ICsJZWNobyAxNjkzMzUwNjUyID4kKEBEKS8ucmVsdmVyCj4gK2Vu
ZGVmCj4gK0xVQUpJVF9QT1NUX0VYVFJBQ1RfSE9PS1MgPSBMVUFKSVRfUk9MTElOR19WRVJTSU9O
Cj4gK0hPU1RfTFVBSklUX1BPU1RfRVhUUkFDVF9IT09LUyA9IExVQUpJVF9ST0xMSU5HX1ZFUlNJ
T04KCkFzIEkgZXhwbGFpbmVkIG15IHJldmlldyBvZiB5b3VyIHYxLCB0aGUgcGxhY2Vob2xkZXIg
dG8gYmUgcmVwbGFjZWQgaW4KdGhlIGNvbW1pdGVyIFVOSVggdGltZSwgc28gdGhpcyBpcyByZXBy
b2R1Y2libGUsIGJlY2F1c2UgdGhpcyBkb2VzIG5vdApzdWZmZXIgZnJvbSBsb2NhbCBzZXR0aW5n
cyAobm8gdGltZXpvbmUsIG5vIGxlYXAgc2Vjb25kLi4uKS4KClNvLCB3ZSBkb24ndCBuZWVkIHRo
ZXNlIGhvb2tzIHdoZW4gd2UgdXNlIHRoZSBnaXRodWIgdGFyYmFsbC4uLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
