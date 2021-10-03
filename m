Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C22BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3EF661207
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 12:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3EF661207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13E5426C6;
	Sun,  3 Oct 2021 12:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXcpt_YWtASQ; Sun,  3 Oct 2021 12:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52FD4267F;
	Sun,  3 Oct 2021 12:49:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 734901BF327
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F9A94267F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 12:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XUMD1LHNQph for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 12:49:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BDEA425E2
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 12:49:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D7318B0055A;
 Sun,  3 Oct 2021 14:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633265347;
 bh=GIEgCBqmzwPZJz0aABMdFRtWxtyVG16Z7SRhHwBApiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hobV09rbzphEMLhAfxOPbiCgPoWTi5/RuNBhnbBUrmlKkuDBba+/FJ0kqf7CEtaNt
 g/pp0p8mKDwS+S66JGRQ+ABM47B7uGAkUNYMTWpCvHDBd0Z3t4mySA7mENHziukXuI
 5SqG2WqgGyxTYZXjNH/D9xuKGSpov5dG55zAJRLwZbEzvseT2sQjwlr0eYzfFy+jX0
 F4TGf8s+r7uq+wJp9dFE4+fGxsFStxmspjEXSq9luFUTb38KdxcC5l8OAXRvqIUSJY
 xfB47Dqcj5KxjnZp3Ac3wOS/z8AWK+m5Y7xAoJsYviPHGba2sH3B3G+aQOlSboz8gY
 Lss8ABzOo0xSw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 14:49:00 +0200
Date: Sun, 3 Oct 2021 14:49:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211003124900.GI1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-7-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923155726.87851-7-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 6/7] boot/edk2: add support to i386
 architecture
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMDktMjMgMTc6NTcgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IEFkZCBzdXBwb3J0IHRoZSBidWlsZCB0aGUgZmlybXdhcmUgZm9yIFFFTVUg
aTM4NiBwYyBtYWNoaW5lCj4gCj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5t
YWluY2VudEBib290bGluLmNvbT4KPiAtLS0KPiAgYm9vdC9lZGsyL0NvbmZpZy5pbiB8IDEyICsr
KysrKysrKysrLQo+ICBib290L2VkazIvZWRrMi5tayAgIHwgMTIgKysrKysrKysrKy0tCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvYm9vdC9lZGsyL0NvbmZpZy5pbiBiL2Jvb3QvZWRrMi9Db25maWcuaW4KPiBpbmRl
eCAxNTA4MDY4OTlmLi45Zjg5ODhiY2NhIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRrMi9Db25maWcu
aW4KPiArKysgYi9ib290L2VkazIvQ29uZmlnLmluCj4gQEAgLTEsNiArMSw2IEBACj4gIGNvbmZp
ZyBCUjJfVEFSR0VUX0VESzIKPiAgCWJvb2wgIkVESzIiCj4gLQlkZXBlbmRzIG9uIEJSMl94ODZf
NjQgfHwgQlIyX2FhcmNoNjQKPiArCWRlcGVuZHMgb24gQlIyX3g4Nl82NCB8fCBCUjJfYWFyY2g2
NCB8fCBCUjJfaTM4Ngo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF81
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVMKPiAgCWhlbHAKPiBAQCAtMTMs
OSArMTMsMTggQEAgaWYgQlIyX1RBUkdFVF9FREsyCj4gIAo+ICBjaG9pY2UKPiAgCXByb21wdCAi
UGxhdGZvcm0iCj4gKwlkZWZhdWx0IEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1GX0kzODYg
aWYgQlIyX2kzODYKPiAgCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX09WTUZfWDY0
IGlmIEJSMl94ODZfNjQKPiAgCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX0FSTV9W
SVJUX1FFTVUgaWYgQlIyX2FhcmNoNjQKPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX0VESzJfUExB
VEZPUk1fT1ZNRl9JMzg2Cj4gKwlib29sICJpMzg2Igo+ICsJZGVwZW5kcyBvbiBCUjJfaTM4NiB8
fCBCUjJfeDg2XzY0CgpBcyB0aGVyZSB3YXMgYSBidWlsZCBmYWlsdXJlIHdpdGggQlIyX3g4Nl82
ND15LCBJJ3ZlIGp1c3QgZHJvcHBlZCB0aGF0CnBvc3NpYmlsaXR5OiBCUjJfVEFSR0VUX0VESzJf
UExBVEZPUk1fT1ZNRl9JMzg2IGlzIG9ubHkgYXZhaWxhYmxlIGZvcgpCUjJfaTM4Ni4KCklmIHlv
dSBoYXZlIHRoZSBvcHBvcnR1bml0eS9uZWVkIHRvIGxvb2sgaW50byB0aGF0LCBhIGZ1cnRoZXIg
cGF0Y2ggaXMKbW9zdCB3ZWxjb21lIQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+ICsJaGVscAo+ICsJICBQbGF0Zm9ybSBjb25maWd1cmF0aW9u
IGZvciBhIGdlbmVyaWMgaTM4NiB0YXJnZXQuCj4gKwkgIFRoaXMgcGxhdGZvcm0gd2lsbCBib290
IGZyb20gZmxhc2ggYWRkcmVzcyAweDAuCj4gKwkgIEl0IHNob3VsZCB0aGVyZWZvcmUgYmUgdXNl
ZCBhcyB0aGUgZmlyc3QgYm9vdGxvYWRlci4KPiArCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0VESzJf
UExBVEZPUk1fT1ZNRl9YNjQKPiAgCWJvb2wgIng4Ni02NCIKPiAgCWRlcGVuZHMgb24gQlIyX3g4
Nl82NAo+IEBAIC05NCw2ICsxMDMsNyBAQCBlbmRjaG9pY2UKPiAgCj4gIGNvbmZpZyBCUjJfVEFS
R0VUX0VESzJfRkRfTkFNRQo+ICAJc3RyaW5nCj4gKwlkZWZhdWx0ICJPVk1GIiBpZiBCUjJfVEFS
R0VUX0VESzJfUExBVEZPUk1fT1ZNRl9JMzg2Cj4gIAlkZWZhdWx0ICJPVk1GIiBpZiBCUjJfVEFS
R0VUX0VESzJfUExBVEZPUk1fT1ZNRl9YNjQKPiAgCWRlZmF1bHQgIlFFTVVfRUZJIiBpZiBCUjJf
VEFSR0VUX0VESzJfUExBVEZPUk1fQVJNX1ZJUlRfUUVNVQo+ICAJZGVmYXVsdCAiUUVNVV9FRkki
IGlmIEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fVklSVF9RRU1VX0tFUk5FTAo+IGRpZmYg
LS1naXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4gaW5kZXggZmFi
ZDBjNWI0NS4uYWIzY2RhZDQ2NCAxMDA2NDQKPiAtLS0gYS9ib290L2VkazIvZWRrMi5tawo+ICsr
KyBiL2Jvb3QvZWRrMi9lZGsyLm1rCj4gQEAgLTE0LDcgKzE0LDkgQEAgRURLMl9ERVBFTkRFTkNJ
RVMgPSBlZGsyLXBsYXRmb3JtcyBob3N0LXB5dGhvbjMgaG9zdC1hY3BpY2EgaG9zdC11dGlsLWxp
bnV4Cj4gIEVESzJfSU5TVEFMTF9UQVJHRVQgPSBOTwo+ICBFREsyX0lOU1RBTExfSU1BR0VTID0g
WUVTCj4gIAo+IC1pZmVxICgkKEJSMl94ODZfNjQpLHkpCj4gK2lmZXEgKCQoQlIyX2kzODYpLHkp
Cj4gK0VESzJfQVJDSCA9IElBMzIKPiArZWxzZSBpZmVxICgkKEJSMl94ODZfNjQpLHkpCj4gIEVE
SzJfQVJDSCA9IFg2NAo+ICBlbHNlIGlmZXEgKCQoQlIyX2FhcmNoNjQpLHkpCj4gIEVESzJfQVJD
SCA9IEFBUkNINjQKPiBAQCAtNTUsNyArNTcsMTMgQEAgRURLMl9HSVRfU1VCTU9EVUxFUyA9IFlF
Uwo+ICBFREsyX0JVSUxEX1BBQ0tBR0VTID0gJChARCkvQnVpbGQvQnVpbGRyb290Cj4gIEVESzJf
UEFDS0FHRVNfUEFUSCA9ICQoQEQpOiQoRURLMl9CVUlMRF9QQUNLQUdFUyk6JChTVEFHSU5HX0RJ
UikvdXNyL3NoYXJlL2VkazItcGxhdGZvcm1zCj4gIAo+IC1pZmVxICgkKEJSMl9UQVJHRVRfRURL
Ml9QTEFURk9STV9PVk1GX1g2NCkseSkKPiAraWZlcSAoJChCUjJfVEFSR0VUX0VESzJfUExBVEZP
Uk1fT1ZNRl9JMzg2KSx5KQo+ICtFREsyX0RFUEVOREVOQ0lFUyArPSBob3N0LW5hc20KPiArRURL
Ml9QQUNLQUdFX05BTUUgPSBPdm1mUGtnCj4gK0VESzJfUExBVEZPUk1fTkFNRSA9IE92bWZQa2dJ
YTMyCj4gK0VESzJfQlVJTERfRElSID0gT3ZtZklhMzIKPiArCj4gK2Vsc2UgaWZlcSAoJChCUjJf
VEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9YNjQpLHkpCj4gIEVESzJfREVQRU5ERU5DSUVTICs9
IGhvc3QtbmFzbQo+ICBFREsyX1BBQ0tBR0VfTkFNRSA9IE92bWZQa2cKPiAgRURLMl9QTEFURk9S
TV9OQU1FID0gT3ZtZlBrZ1g2NAo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
