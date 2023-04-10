Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053F1C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D70D81418;
	Mon, 10 Apr 2023 17:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D70D81418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CK6uACkqMwNO; Mon, 10 Apr 2023 17:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706DC81428;
	Mon, 10 Apr 2023 17:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706DC81428
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 567941C38D8
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 230A482105
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 230A482105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5ktu5BkcLMW for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07492820DB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07492820DB
 for <buildroot@busybox.net>; Mon, 10 Apr 2023 17:33:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 24F7A5FFAD;
 Mon, 10 Apr 2023 19:33:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 19:33:10 +0200
Date: Mon, 10 Apr 2023 19:33:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230410173310.GF2819@scaer>
References: <20230405081842.244610-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405081842.244610-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681147993;
 bh=sL1Jf9TuTsOCeVfYDpIbb+JITYHKkDpjenxO9e646AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZH1pXB2oktNSB9E3r4x6uosFOBbsP1vJTtkcaEdNDtxB0UUxKeNw5HVXuOkvUZQ5H
 wxSRWRgLKq5cDdezNRrq7eomsfGpnONwA1S3wuQnZG14CxeSo4Y2LKKBntwW9AIUxU
 /Qd5gN1mCFM9C0d5kBVhr7uGMs+5A0hV6k5eXoB13Bc5p49jYt3dDw9ovR2zR1uY8b
 tOKj5Tv36IA5VaSHIvO9Sm/Yte0mUcTtlzQGzxlXX74P8otdkWIOFNfOQ+v+3nSRiF
 oMCaLIdjln+KqvRaDAK1sYj94hRPCrlQabpmEEMwMMVQ2lz4i5rlP5jV0sPBJ1V/lX
 buAgWqgnrNCdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZH1pXB2o
Subject: Re: [Buildroot] [PATCH 1/2] configs/olimex_a20_olinuxino_lime*:
 bump Linux and U-Boot
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA0LTA1IDEwOjE4ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWUyX2RlZmNvbmZpZyB8IDQgKystLQo+ICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWVfZGVmY29uZmlnICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vbGltZXhfYTIwX29s
aW51eGlub19saW1lMl9kZWZjb25maWcgYi9jb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xp
bWUyX2RlZmNvbmZpZwo+IGluZGV4IDUwYTA5ODZhYi4uYTgyNjBhN2VhIDEwMDY0NAo+IC0tLSBh
L2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZTJfZGVmY29uZmlnCj4gKysrIGIvY29u
Zmlncy9vbGltZXhfYTIwX29saW51eGlub19saW1lMl9kZWZjb25maWcKPiBAQCAtMjIsNyArMjIs
NyBAQCBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL29saW1leC9hMjBfb2xp
bnV4aW5vL2dlbmltYWdlLmNmZyIKPiAgIyBLZXJuZWwKPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4g
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuOSIKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVS
U0lPTl9WQUxVRT0iNi4xLjIyIgo+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9ERUZDT05GSUc9eQo+
ICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ic3VueGkiCj4gIEJSMl9MSU5VWF9LRVJORUxf
Q09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9vbGltZXgvYTIwX29saW51eGluby9saW51eC1k
aXNhYmxlLWxpbWEuZnJhZ21lbnQiCj4gQEAgLTQ0LDcgKzQ0LDcgQEAgQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl80PXkKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQlVJ
TERfU1lTVEVNX0tDT05GSUc9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkK
PiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMy4wMSIKPiArQlIy
X1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMy4wNCIKPiAgQlIyX1RBUkdF
VF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9IkEyMC1PTGludVhpbm8tTGltZTIiCj4gIEJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfRFRDPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRIT04zPXkK
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vbGltZXhfYTIwX29saW51eGlub19saW1lX2RlZmNvbmZp
ZyBiL2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZV9kZWZjb25maWcKPiBpbmRleCAy
NWVjZjMxMTQuLjY1YTc4ZjUzNSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL29saW1leF9hMjBfb2xp
bnV4aW5vX2xpbWVfZGVmY29uZmlnCj4gKysrIGIvY29uZmlncy9vbGltZXhfYTIwX29saW51eGlu
b19saW1lX2RlZmNvbmZpZwo+IEBAIC0yMiw3ICsyMiw3IEBAIEJSMl9ST09URlNfUE9TVF9TQ1JJ
UFRfQVJHUz0iLWMgYm9hcmQvb2xpbWV4L2EyMF9vbGludXhpbm8vZ2VuaW1hZ2UuY2ZnIgo+ICAj
IEtlcm5lbAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
VkVSU0lPTj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS45
Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuMjIiCj4gIEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0RFRkNPTkZJRz15Cj4gIEJSMl9MSU5VWF9LRVJORUxfREVGQ09O
RklHPSJzdW54aSIKPiAgQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJv
YXJkL29saW1leC9hMjBfb2xpbnV4aW5vL2xpbnV4LWRpc2FibGUtbGltYS5mcmFnbWVudCIKPiBA
QCAtNDQsNyArNDQsNyBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+ICBCUjJfVEFSR0VU
X1VCT09UPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4gIEJS
Ml9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSIyMDIzLjAxIgo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSIyMDIzLjA0Igo+ICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0i
QTIwLU9MaW51WGluby1MaW1lIgo+ICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4gIEJS
Ml9UQVJHRVRfVUJPT1RfTkVFRFNfUFlUSE9OMz15Cj4gLS0gCj4gMi4zNy4yCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
