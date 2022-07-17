Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D8EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B506D83EC5;
	Sun, 17 Jul 2022 13:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B506D83EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIuCgIsh5dFi; Sun, 17 Jul 2022 13:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD89183EB5;
	Sun, 17 Jul 2022 13:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD89183EB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 040361BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2AF783EAD
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AF783EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBBUlA36sQGl for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:12:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B7D83E9C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38B7D83E9C
 for <buildroot@busybox.net>; Sun, 17 Jul 2022 13:12:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5EA0C780500;
 Sun, 17 Jul 2022 15:12:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:12:46 +0200
Date: Sun, 17 Jul 2022 15:12:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220717131246.GB2249625@scaer>
References: <20220713143350.3131081-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713143350.3131081-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658063568;
 bh=CXMl/zAHestJCGFaYz9n4OJnZtfVNH8B6aAZ7n2y4ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwMSol3bxwkfi1PMsfuksKh6EuA2d6wJFKN0dnIgqgpNLNPH6Emygt7h1F0ZRNu1Y
 XegPdyD5rj6ICUXnCKaKPpAGpZlW4cjtFWzsXyiCLribrHSgnrE1nQQFtuMk4O+8FX
 epRZNsZyEFYoD4ZuwI2MEz2MmD0a8GsRi+/rmVZv1UR91nWC2jKM8u87Mb81nTKHlU
 Cm0vNo63n/CG+KocpQRGDuPH4Kgx1H+RunLMS9rPH4IxcYuswsIH+BCabw0BOcKzxp
 A7sZUZeWkBLgeKw8fLQ6xcRdME68fDigGz7qH3ZD7cV3070miZyt6k626uKp5OzOyo
 brrkLPs6am5QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uwMSol3b
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA3LTEzIDE2OjMzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWUyX2RlZmNvbmZpZyB8IDQgKystLQo+ICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWVfZGVmY29uZmlnICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vbGltZXhfYTIwX29s
aW51eGlub19saW1lMl9kZWZjb25maWcgYi9jb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWUyX2RlZmNvbmZpZwo+IGluZGV4IDJmOTU5NDkyMS4uYTAzMmViOTIyIDEwMDY0NAo+IC0tLSBh
L2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZTJfZGVmY29uZmlnCj4gKysrIGIvY29u
Zmlncy9vbGltZXhfYTIwX29saW51eGlub19saW1lMl9kZWZjb25maWcKPiBAQCAtMjMsNyArMjMs
NyBAQCBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL29saW1leC9hMjBfb2xp
bnV4aW5vL2dlbmltYWdlLmNmZyIKPiAgIyBLZXJuZWwKPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4g
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjMyIgo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSI1LjE1LjUzIgo+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9ERUZDT05GSUc9
eQo+ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ic3VueGkiCj4gIEJSMl9MSU5VWF9LRVJO
RUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9vbGltZXgvYTIwX29saW51eGluby9saW51
eC1kaXNhYmxlLWxpbWEuZnJhZ21lbnQiCj4gQEAgLTQ1LDcgKzQ1LDcgQEAgQlIyX1RBUkdFVF9S
T09URlNfRVhUMl80PXkKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRfVUJPT1Rf
QlVJTERfU1lTVEVNX0tDT05GSUc9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9O
PXkKPiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4wNCIKPiAr
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4wNyIKPiAgQlIyX1RB
UkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9IkEyMC1PTGludVhpbm8tTGltZTIiCj4gIEJSMl9U
QVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04z
PXkKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vbGltZXhfYTIwX29saW51eGlub19saW1lX2RlZmNv
bmZpZyBiL2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZV9kZWZjb25maWcKPiBpbmRl
eCBlMjQ4NTdlMGMuLmIyMzY0Y2E1OSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL29saW1leF9hMjBf
b2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9vbGltZXhfYTIwX29saW51
eGlub19saW1lX2RlZmNvbmZpZwo+IEBAIC0yMyw3ICsyMyw3IEBAIEJSMl9ST09URlNfUE9TVF9T
Q1JJUFRfQVJHUz0iLWMgYm9hcmQvb2xpbWV4L2EyMF9vbGludXhpbm8vZ2VuaW1hZ2UuY2ZnIgo+
ICAjIEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUu
MTUuMzIiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUuNTMi
Cj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0RFRkNPTkZJRz15Cj4gIEJSMl9MSU5VWF9LRVJORUxf
REVGQ09ORklHPSJzdW54aSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklM
RVM9ImJvYXJkL29saW1leC9hMjBfb2xpbnV4aW5vL2xpbnV4LWRpc2FibGUtbGltYS5mcmFnbWVu
dCIKPiBAQCAtNDUsNyArNDUsNyBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+ICBCUjJf
VEFSR0VUX1VCT09UPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15
Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09U
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjA0Igo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjA3Igo+ICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNP
TkZJRz0iQTIwLU9MaW51WGluby1MaW1lIgo+ICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15
Cj4gIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlUSE9OMz15Cj4gLS0gCj4gMi4zNC4xCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
