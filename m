Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B9C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 20:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4291342E27;
	Fri, 19 Jan 2024 20:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4291342E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yrgcwDhfvw1; Fri, 19 Jan 2024 20:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E73D42DFF;
	Fri, 19 Jan 2024 20:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E73D42DFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE7D1BF98E
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFFF242DFF
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFFF242DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDeiOyryIyJz for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 20:35:47 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AC7941E1D
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 20:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC7941E1D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A000113F846;
 Fri, 19 Jan 2024 21:35:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 21:35:40 +0100
Date: Fri, 19 Jan 2024 21:35:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZardHEVqvVLucJQM@landeda>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <20231211155951.4079886-3-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211155951.4079886-3-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705696545;
 bh=vNIqs7vds5/9nPp5+YbPjjrY6Bt9TyEDas5ZrssZRk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3vc1TRJd+jObULceIo9aziwqSI0Bg3e3gBNUCp4dbO1Z9NnACSJxhYLw7zecJN4a
 T8mSvzhQ+wQtpqijmY60a18MXjRTBbsXwiK5ilyUSRnUw6bBvcJLUbHziy1E3m8TAq
 XwH6YSU4pKg+4LkxWUHPV3YYmjgRxryF0JVkdtZCZpi0xhO9Kcw957lRlaO/6yWBLi
 Xh9n5ws6sGjeFERlis+1pRSwavyBbQBSze9KUc6GNgWlhy7/AFKUTwurQ9DhLS61El
 TiLJQ6hzpdVsGgnvtxAbUCO2eLOG3ZY3gHVx8pxKfLm4KWZsAo1zRbyR4mIglpZlY2
 xRyk+RilMM64g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R3vc1TRJ
Subject: Re: [Buildroot] [PATCH v2 2/2] configs: add raspberrypi 5 defconfig
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gVGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhbiBpbWFnZSBmb3IgdGhlIFJh
c3BiZXJyeVBpIDUuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRh
eUBydG9uZS5mcj4KWy0tU05JUC0tXQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9jb25maWdzL3Jh
c3BiZXJyeXBpNV9kZWZjb25maWcKPiBAQCAtMCwwICsxLDQwIEBACj4gK0JSMl9hYXJjaDY0PXkK
PiArQlIyX2NvcnRleF9hNzZfYTU1PXkKPiArQlIyX0FSTV9GUFVfVkZQVjQ9eQo+ICtCUjJfQVJN
NjRfUEFHRV9TSVpFXzE2Sz15CgpTbywgd2UgY2hvb3NlIDE2SyBmb3IgdGhlIHVzZXJsYW5kIHBh
Z2UgYWxpZ25tZW50LCBiZWNhdXNlLi4uCgpbLS1TTklQLS1dCj4gK0JSMl9MSU5VWF9LRVJORUw9
eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkKPiArQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxsaW51
eCwxN2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRmN2UxNmNiKS9saW51eC0xN2YxMzVi
NzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRmN2UxNmNiLnRhci5neiIKPiArQlIyX0xJTlVYX0tF
Uk5FTF9ERUZDT05GSUc9ImJjbTI3MTIiCgouLi4gdGhlIGJjbTI3MTJfZGVmY29uZmlnIGluIHRo
ZSBrZXJuZWwgdHJlZSBkZWZhdWx0IHRvIHVzZSAxNksgcGFnZXM6CiAgICBDT05GSUdfQVJNNjRf
MTZLX1BBR0VTPXkKClRoaXMgaXMgYWxsIGEgbGl0dGxlIGJpdCBtdXJreSBmb3IgbWUsIGJ1dCB0
aGUga2VybmVsIGhlbHAgZm9yCkNPTkZJR19BUk02NF8xNktfUEFHRVMgc3RhdGVzOgoKICBUaGUg
c3lzdGVtIHdpbGwgdXNlIDE2S0IgcGFnZXMgc3VwcG9ydC4gQUFyY2gzMiBlbXVsYXRpb24KICBy
ZXF1aXJlcyBhcHBsaWNhdGlvbnMgY29tcGlsZWQgd2l0aCAxNksgKG9yIGEgbXVsdGlwbGUgb2Yg
MTZLKQogIGFsaWduZWQgc2VnbWVudHMuCgpCdXQgd2UgYXJlIG5vdCBkb2luZyAzMi1vbi02NCBp
biBCdWlsZHJvb3QsIHdlJ3JlIG9ubHkgZG9pbmcgcHVyZQo2NC1iaXQuCgpJZiBJIGludGVycmV0
IHRoZSBrZXJuZWwgaGVscCB0ZXh0IGNvcnJlY3RseSwgYWFyY2g2NCB1c2VybGFuZCBpcyBub3QK
aW1wYWN0ZWQgYnkgdGhlIHBhZ2Ugc2l6ZSB0aGUga2VybmVsIHVzZXMsIHNvIHdlIGNhbiBzdGls
bCB1c2UgNEsgcGFnZXMKaW4gdXNlcmxhbmQuCgpPciBkbyB3ZSBqdXN0IHdhbnQgdG8gYXZvaWQg
YW55IGNvbmZ1c2lvbiBhdCBhbGwsIGFuZCBhbHdheXMgY29uc2lkZXIKdGhhdCB0aGUgdXNlcmxh
bmQgYW5kIGtlcm5lbCBwYWdlIHNpemUgbXVzdCBtYXRjaD8gT3IgZGlkIEkganVzdAptaXNpbnRl
cnByZXQgdGhlIGtlcm5lbCBoZWxwIHRleHQsIGFuZCB0aGUgdHdvICptdXN0KiBtYXRjaD8KCklm
IEkgbWlzc2VkIHNvbWV0aGluZywgb3IgYW0gd3Jvbmcgc29tZXdoZXJlLCBqdXN0IHllbGwhIDst
KQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gKyMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBr
ZXJuZWwgc291cmNlcwo+ICtCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPiArQlIyX0xJ
TlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImJyb2FkY29tL2JjbTI3MTItcnBpLTUtYiIKPiAr
Cj4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiArCj4gK0JSMl9QQUNL
QUdFX1JQSV9GSVJNV0FSRT15Cj4gK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklM
RT0iYm9hcmQvcmFzcGJlcnJ5cGk1L2NvbmZpZ181LnR4dCIKPiArQlIyX1BBQ0tBR0VfUlBJX0ZJ
Uk1XQVJFX0NNRExJTkVfRklMRT0iYm9hcmQvcmFzcGJlcnJ5cGk1L2NtZGxpbmVfNS50eHQiCj4g
KyMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCX09WRVJMQVlTIGlzIG5vdCBz
ZXQKPiArCj4gKyMgUmVxdWlyZWQgdG9vbHMgdG8gY3JlYXRlIHRoZSBTRCBpbWFnZQo+ICtCUjJf
UEFDS0FHRV9IT1NUX0RPU0ZTVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkK
PiArQlIyX1BBQ0tBR0VfSE9TVF9NVE9PTFM9eQo+ICsKPiArIyBGaWxlc3lzdGVtIC8gaW1hZ2UK
PiArQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15
Cj4gK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPiArIyBCUjJfVEFSR0VUX1JP
T1RGU19UQVIgaXMgbm90IHNldAo+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2Fy
ZC9yYXNwYmVycnlwaTUvcG9zdC1idWlsZC5zaCIKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1ND
UklQVD0iYm9hcmQvcmFzcGJlcnJ5cGk1L3Bvc3QtaW1hZ2Uuc2giCj4gLS0gCj4gMi40My4wCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
