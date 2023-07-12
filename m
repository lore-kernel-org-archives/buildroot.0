Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF59EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 18:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AAE612E7;
	Wed, 12 Jul 2023 18:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AAE612E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8GMd36-dikX; Wed, 12 Jul 2023 18:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86CB7612D6;
	Wed, 12 Jul 2023 18:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86CB7612D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0E01BF3BA
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFBCF81F05
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 18:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFBCF81F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vFXYhngTdVK for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 18:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A718282107
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A718282107
 for <buildroot@busybox.net>; Wed, 12 Jul 2023 18:49:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e245:939f:c022:28d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1B5CF13F8D4;
 Wed, 12 Jul 2023 20:48:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 12 Jul 2023 20:48:54 +0200
Date: Wed, 12 Jul 2023 20:48:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230712184854.GH188780@scaer>
References: <20230712174654.743133-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712174654.743133-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689187737;
 bh=AloswY9YjVf6QPS45/uLvPPm+SwtCQlqpTbBmq7k2kE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yi6e6pEGPXEdcc4H0wP6gu1h6+pKc9abG5QayDzCXp5MLE+PYKwAbKZQN2Lv6TViS
 kQEk+m7AyVfAuPYr1HsdzIar3362+yx/vcO6Gn8QsgPTwX8e1CDs6Ls2PPkRWzwbYn
 gp5DUeyCFenD9ddhDESFWTdCJAOSywjd+TvW5x6XOKzhhr5in48CA2mLV5E1YyCyBW
 oZQpf4Ah4LG7sKdaMvBk7yG4Gb1c47c0CRjlXPvLn9ljY2qVSZY+MrG/juJQAB3Bk1
 5qQF25B1DglgWzkK/AHhb2nOaxPZGA4RZJIj7Gn9NxgTjPQj2khneDy26+akdhERHh
 Z3CLoIxQ1+liw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yi6e6pEG
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and
 U-Boot
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTEyIDE5OjQ2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBjb25maWdzL29saW1leF9zdG1wMTU3X29saW51eGlu
b19saW1lX2RlZmNvbmZpZyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9vbGltZXhf
c3RtcDE1N19vbGludXhpbm9fbGltZV9kZWZjb25maWcgYi9jb25maWdzL29saW1leF9zdG1wMTU3
X29saW51eGlub19saW1lX2RlZmNvbmZpZwo+IGluZGV4IDNiNTZmZWZlYy4uZGM3MjYzNTlhIDEw
MDY0NAo+IC0tLSBhL2NvbmZpZ3Mvb2xpbWV4X3N0bXAxNTdfb2xpbnV4aW5vX2xpbWVfZGVmY29u
ZmlnCj4gKysrIGIvY29uZmlncy9vbGltZXhfc3RtcDE1N19vbGludXhpbm9fbGltZV9kZWZjb25m
aWcKPiBAQCAtMTcsOCArMTcsOCBAQCBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJv
YXJkL29saW1leC9zdG1wMV9vbGludXhpbm8vZ2VuaW1hZ2UuY2ZnIgo+ICBCUjJfTElOVVhfS0VS
TkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fR0lUPXkKPiAgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHViLmNvbS9PTElNRVgvbGludXgtb2xpbWV4
LmdpdCIKPiAtIyBicmFuY2ggcmVsZWFzZS0yMDIzMDIxNy12NS4xMC4xMDUKPiAtQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fUkVQT19WRVJTSU9OPSJjNWEzMTcyNGJkZmFhYzg5NDU1M2I1MWM1YTBm
YjkyYzFmMTBmM2RiIgo+ICsjIGJyYW5jaCByZWxlYXNlLTIwMjMwNjIyLXY1LjEwLjE4MAo+ICtC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9SRVBPX1ZFUlNJT049ImZjNzQxMTNlMTRkNzZhZWE5NDgy
MjY0ZmY0MmUwNzM5N2I5NDU1M2QiCj4gIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05G
SUc9eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvb2xpbWV4
L3N0bXAxX29saW51eGluby9saW51eC5jb25maWciCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NV
UFBPUlQ9eQo+IEBAIC0zNSw4ICszNSw4IEBAIEJSMl9UQVJHRVRfVUJPT1Q9eQo+ICBCUjJfVEFS
R0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9DVVNU
T01fR0lUPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0
aHViLmNvbS9PTElNRVgvdS1ib290LW9saW51eGluby5naXQiCj4gLSMgcmVsZWFzZS0yMDIzMDEx
MCwgYmFzZWQgb24gMjAyMS4wNAo+IC1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9SRVBPX1ZFUlNJ
T049IjlhNDlhMjBmNzFjNjk4ZjUzOGRlZmJiNjlhNmM2Y2I2NTdkNDMxNWYiCj4gKyMgcmVsZWFz
ZS0yMDIzMDUxNSwgYmFzZWQgb24gMjAyMS4wNAo+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9S
RVBPX1ZFUlNJT049ImVmYWRmNzkzYTBhNTkyNGUyYzk2MzYyZGMxZGYzZTU2NjIyZWJiOTciCj4g
IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJTVE0zMi1PTGludVhpbm8tTElNRSIK
PiAgIyBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9CSU4gaXMgbm90IHNldAo+ICBCUjJfVEFSR0VU
X1VCT09UX0ZPUk1BVF9JTUc9eQo+IC0tIAo+IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
