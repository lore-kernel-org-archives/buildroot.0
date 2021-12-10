Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 17:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B2C853B2;
	Fri, 10 Dec 2021 17:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJwH5nJ_hPje; Fri, 10 Dec 2021 17:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D0F853AF;
	Fri, 10 Dec 2021 17:06:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5281BF35D
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 17:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA52853AF
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqxbjka2Oy1J for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 17:06:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D56EF85397
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 17:06:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 947E0B005F8;
 Fri, 10 Dec 2021 18:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639155987;
 bh=ZqkLj4LZu+8xn/byMahThiZsOP7YzRmiV4KzVQoMP2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjX+lWGnSI88+Dbso4bqsx5Mk1erSvqUrhYinCIUEEf24K2D3c1uEi146Br1giPsA
 U6Xbiw3554q2nU5b+KvCsrFGNgN6Q7T/5+lVahd6f2rURkRAvdzIcSbCZ69lZewUTP
 IIBTylMWeqLY8ssRsH7a3yrs3H/eom1yfyglS0Otnu+KummI/1fQ1cja4kJKayJxgH
 /00uKPDHKNnipLe1W6fFc14arMkHfiJdnLOUnjO0MTWb4ftS36QEPDUB9ZNQ6wIXVQ
 Ftr7McaMDoOAlYc6PL5bkX7Z2WmqWThKc8GOEy7Uz/sm6TfOhQ619rqsZfK2L4ZoFF
 MJ9DO9SHIo8LA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 18:06:23 +0100
Date: Fri, 10 Dec 2021 18:06:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211210170623.GH2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <23c2c119-b051-ddff-877f-34a34c51b0ac@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23c2c119-b051-ddff-877f-34a34c51b0ac@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/7] package/opensc: new package
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2l1bGlvLCBBbGwsCgpPbiAyMDIxLTEyLTEwIDE1OjQ5ICswMTAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gT24gMTAvMTIvMjEgMTU6MTIsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6
Cj4gPlRoZSBwYXRjaCB3aWxsIGFkZCBhIGJhc2ljIG9wZW5zYyBwYWNrYWdlIHRvIGJ1aWxkCj4g
Pm9uIGJ1aWxkcm9vdC4KWy0tU05JUC0tXQo+ID5kaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2Mv
b3BlbnNjLm1rIGIvcGFja2FnZS9vcGVuc2Mvb3BlbnNjLm1rCj4gPm5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gPmluZGV4IDAwMDAwMDAwMDAuLjcyMjFlZWU5NDQKPiA+LS0tIC9kZXYvbnVsbAo+ID4r
KysgYi9wYWNrYWdlL29wZW5zYy9vcGVuc2MubWsKPiA+QEAgLTAsMCArMSwxNCBAQAo+ID4rIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+KyMKPiA+KyMgb3BlbnNjCj4gPisjCj4gPisjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ID4rCj4gPitPUEVOU0NfVkVSU0lPTiA9IDAuMjIuMAo+ID4rT1BF
TlNDX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDL09wZW5TQy9yZWxlYXNlcy9kb3du
bG9hZC8kKE9QRU5TQ19WRVJTSU9OKQo+IFBsZWFzZSB1c2UgZ2l0aHViIHdyYXBwZXIgXl5eCgpB
Y3R1YWxseSwgbm8uIFRoZSBnaXRodWIgaGVscGVyIGlzIG9ubHkgdG8gZG93bmxvYWQgYXJiaXRy
YXJ5IGhhc2hlcyBhbmQKdGFncywgd2hlcmUgdGhlIGFyY2hpdmVzIGFyZSBnZW5lcmF0ZWQgb24g
dGhlIGZseSBieSBHaXRodWIuCgpJbiB0aGUgY2FzZSBvZiBvcGVuc2MsIHRoZXJlIGFyZSBhY3R1
YWwgcmVsZWFzZXMsIHdoaWNoIHdlcmUgdXBsb2FkZWQgdG8KR2lodWIgYnkgdGhlIG9wZW5zYyBt
YWludGFpbmVyLCBhbmQgc28gdGhpcyBpcyB0aGUgYXJjaGl2ZSB3ZSB3YW50IHRvCnVzZSwgbm90
IHRoZSBhdXRvZ2VuZXJhdGVkIG9uZS4KCj4gPitPUEVOU0NfTElDRU5TRSA9IExHUEwtMi4xKwo+
ID4rT1BFTlNDX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gPitPUEVOU0NfREVQRU5ERU5DSUVT
ID0gb3BlbnNzbCBwY3NjLWxpdGUKPiA+K09QRU5TQ19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiBE
byB3ZSBuZWVkIHRvIGluc3RhbGwgdG8gc3RhZ2luZz8KCk9wZW5TQyBpbnN0YWxscyBhdCBsZWFz
dCBvbmUgbGlicmFyeSwgbGlib3BlbnNjLCBzbyBwcmVzdW1hYmx5LCB5ZXMsIHdlCm5lZWQgdG8g
aW5zdGFsbCBpbiBzdGFnaW5nLi4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiA+Kwo+ID4r
JChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+ID4KPiAKPiBCZXN0IHJlZ2FyZHMKPiAtLSAK
PiBHaXVsaW8gQmVuZXR0aQo+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
