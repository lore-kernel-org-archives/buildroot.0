Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A9C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59CF281277;
	Mon, 10 Apr 2023 17:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CF281277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7psrPVmJiy8Z; Mon, 10 Apr 2023 17:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC3A813D8;
	Mon, 10 Apr 2023 17:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC3A813D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 934C71BF3DA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3EB81277
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3EB81277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81gT6a-uh7wl for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:33:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B72081382
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B72081382
 for <buildroot@busybox.net>; Mon, 10 Apr 2023 17:33:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 734465FF95;
 Mon, 10 Apr 2023 19:33:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 19:33:27 +0200
Date: Mon, 10 Apr 2023 19:33:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230410173327.GG2819@scaer>
References: <20230405081842.244610-1-francois.perrad@gadz.org>
 <20230405081842.244610-2-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405081842.244610-2-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681148009;
 bh=LBoYswI+iNf357dgf0+19xo+Hm32uCEJGg1OJaBHR0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fs5TWqnT/95RycAUTFy3qHtIS2pXQSK9RuSns3+U4zLlzSaxEAXcPmQdueXZ6b3ph
 NduonKTDSUN4FF68c+LNWlZJA0SwjARirQtFYEIcQOPB+C8BHy+vHZaRUbspM6PxLy
 S2N3flPATwvI2HS6Xa1+WHs91t6wJ80QAziPN8BsDzUp+mhpQSO837WB0wSjcucKLY
 wtDywRDVyvuliYV1gMo370Tusm3PJqxjnJjIA2qwv2O9iTtyOkDAeTvgdwZOOWOnZT
 ZT6YYjbvNjxau2IPnrN8F61Ki5z0AZX4Y6fRoZRGO+bOkoPKBnpU5WzQJZqiUuFVaN
 B/xmVSNu9qC1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fs5TWqnT
Subject: Re: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*:
 configure eth0 with DHCP
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
bWUyX2RlZmNvbmZpZyB8IDEgKwo+ICBjb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xpbWVf
ZGVmY29uZmlnICB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9jb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xpbWUyX2RlZmNvbmZp
ZyBiL2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZTJfZGVmY29uZmlnCj4gaW5kZXgg
YTgyNjBhN2VhLi5hMzhmM2ExYzUgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9vbGltZXhfYTIwX29s
aW51eGlub19saW1lMl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL29saW1leF9hMjBfb2xpbnV4
aW5vX2xpbWUyX2RlZmNvbmZpZwo+IEBAIC0xNSw2ICsxNSw3IEBAIEJSMl9UQVJHRVRfR0VORVJJ
Q19IT1NUTkFNRT0iYTIwLW9saW51eGlubyIKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJX
ZWxjb21lIHRvIE9MaW51WGlubyEiCj4gIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWT15Cj4gIEJS
Ml9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlTMCIKPiArQlIyX1NZU1RFTV9ESENQPSJl
dGgwIgo+ICBCUjJfUk9PVEZTX09WRVJMQVk9ImJvYXJkL29saW1leC9hMjBfb2xpbnV4aW5vL3Jv
b3Rmc19vdmVybGF5Igo+ICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3Nj
cmlwdHMvZ2VuaW1hZ2Uuc2giCj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9h
cmQvb2xpbWV4L2EyMF9vbGludXhpbm8vZ2VuaW1hZ2UuY2ZnIgo+IGRpZmYgLS1naXQgYS9jb25m
aWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnIGIvY29uZmlncy9vbGltZXhf
YTIwX29saW51eGlub19saW1lX2RlZmNvbmZpZwo+IGluZGV4IDY1YTc4ZjUzNS4uNzRiNmE3NjRj
IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3Mvb2xpbWV4X2EyMF9vbGludXhpbm9fbGltZV9kZWZjb25m
aWcKPiArKysgYi9jb25maWdzL29saW1leF9hMjBfb2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnCj4g
QEAgLTE1LDYgKzE1LDcgQEAgQlIyX1RBUkdFVF9HRU5FUklDX0hPU1ROQU1FPSJhMjAtb2xpbnV4
aW5vIgo+ICBCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gT0xpbnVYaW5vISIK
PiAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZPXkKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZ
X1BPUlQ9InR0eVMwIgo+ICtCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4gIEJSMl9ST09URlNfT1ZF
UkxBWT0iYm9hcmQvb2xpbWV4L2EyMF9vbGludXhpbm8vcm9vdGZzX292ZXJsYXkiCj4gIEJSMl9S
T09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPiAg
QlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9vbGltZXgvYTIwX29saW51eGlu
by9nZW5pbWFnZS5jZmciCj4gLS0gCj4gMi4zNy4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
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
