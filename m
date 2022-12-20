Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEA5C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 16:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6580C80FA1;
	Tue, 20 Dec 2022 16:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6580C80FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGZnqetrIo81; Tue, 20 Dec 2022 16:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A315E80DD1;
	Tue, 20 Dec 2022 16:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A315E80DD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC291BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4970D80DA8
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4970D80DA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGDX7k38DY4M for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 16:24:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1582B80B85
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1582B80B85
 for <buildroot@busybox.net>; Tue, 20 Dec 2022 16:24:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A04CE5FFAF;
 Tue, 20 Dec 2022 17:24:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 17:24:10 +0100
Date: Tue, 20 Dec 2022 17:24:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221220162410.GI2909@scaer>
References: <20220102104318.2631-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220102104318.2631-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671553453;
 bh=ENTsMoHRS1mYer5Lo0l7eUtSXyB1Ont0ctYDPxQ5PL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YazagchCBXpUEAgrDr737NpPsg+AnDKS16ifXGsCFcpk1n2fjAvtScv6zZAjkqjOk
 YAJ44gKqfx5dQ4qT06deZDbHoWaKygroD79IVsJmaPlmUpbc4Q5iWemTXaGJEz4ar3
 SSq/GNIWDTWdnEhAzxCaHqyj8+O1AS3F+KSxT5XKd+GzgMasVDgm2c/bSinN5u1RDD
 SsBPj+SRg3i/YvoOoIE7ReGsB5zBcI30C7K+X3dscc32chN97fEuF1QWancbLAAmPa
 H6tXfDhlJQyh+2XJdyVYaUhcWACttyE9LyYxOuO6nMBrsKK4QHADAqs7lFy95TpSxl
 6tgy9h8Tb3wng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YazagchC
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.34.0
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTAyIDExOjQzICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGVybC9wZXJsLm1rIGIvcGFja2FnZS9wZXJsL3BlcmwubWsKPiBpbmRleCBmNjYxZmVmMDEu
LmQ3ZjljNThkZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BlcmwvcGVybC5tawo+ICsrKyBiL3Bh
Y2thZ2UvcGVybC9wZXJsLm1rCj4gQEAgLTUsOCArNSw4IEBACj4gICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gIAo+ICAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24gaGVyZSwgYWxzbyB1cGRh
dGUgdXRpbHMvc2NhbmNwYW4KCllvdSBmb3Jnb3QgdG8gYWxzbyB1cGRhdGUgdXRpbHMvc2NhbmNw
YW4sIGFzIHRoZSBjb21tZW50IGFib3ZlLCBhbHNvCmF1dGhvcmVkIGJ5IHlvdSwgaW5zdHJ1Y3Rz
LiA7LSkKClNvIEkndmUgcHVzaGVkIGEgZml4LXVwIGNvbW1pdCB0byBtYXN0ZXIuCgpJZGVhbGx5
LCB0aGVyZSBzaG91bGQgYmUgYW4gYXV0by1kZXRlY3Rpb24gaW4gcGxhY2UsIHNvIHRoYXQgd2Ug
ZG8gbm90CmhhdmUgdG8gbWFudWFsbHkgc3luYyB0aGUgdHdvLiBDb3VsZCB5b3UgaGF2ZSBhIGxv
b2sgaW50byB0aGF0LCBwbGVhc2U/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtUEVSTF9W
RVJTSU9OX01BSk9SID0gMzIKPiAtUEVSTF9WRVJTSU9OID0gNS4kKFBFUkxfVkVSU0lPTl9NQUpP
UikuMQo+ICtQRVJMX1ZFUlNJT05fTUFKT1IgPSAzNAo+ICtQRVJMX1ZFUlNJT04gPSA1LiQoUEVS
TF9WRVJTSU9OX01BSk9SKS4wCj4gIFBFUkxfU0lURSA9IGh0dHBzOi8vd3d3LmNwYW4ub3JnL3Ny
Yy81LjAKPiAgUEVSTF9TT1VSQ0UgPSBwZXJsLSQoUEVSTF9WRVJTSU9OKS50YXIueHoKPiAgUEVS
TF9MSUNFTlNFID0gQXJ0aXN0aWMgb3IgR1BMLTEuMCsKPiBAQCAtMTUsNyArMTUsNyBAQCBQRVJM
X0NQRV9JRF9WRU5ET1IgPSBwZXJsCj4gIFBFUkxfREVQRU5ERU5DSUVTID0gJChUQVJHRVRfTkxT
X0RFUEVOREVOQ0lFUykKPiAgUEVSTF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgCj4gLVBFUkxf
Q1JPU1NfVkVSU0lPTiA9IDEuMy41Cj4gK1BFUkxfQ1JPU1NfVkVSU0lPTiA9IDEuMy42Cj4gICMg
RE8gTk9UIHJlZmFjdG9yIHdpdGggdGhlIGdpdGh1YiBoZWxwZXIgKHRoZSByZXN1bHQgaXMgbm90
IHRoZSBzYW1lKQo+ICBQRVJMX0NST1NTX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vYXJzdi9w
ZXJsLWNyb3NzL3JlbGVhc2VzL2Rvd25sb2FkLyQoUEVSTF9DUk9TU19WRVJTSU9OKQo+ICBQRVJM
X0NST1NTX1NPVVJDRSA9IHBlcmwtY3Jvc3MtJChQRVJMX0NST1NTX1ZFUlNJT04pLnRhci5nego+
IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
