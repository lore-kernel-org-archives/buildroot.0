Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616F9C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D79E80D52;
	Tue,  2 Jul 2024 19:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_XWNvbcl8Gb; Tue,  2 Jul 2024 19:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCA880D54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BCA880D54;
	Tue,  2 Jul 2024 19:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 802C51BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D14F410B0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4Mq2equQYib for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08B7B410AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08B7B410AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08B7B410AE
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:25:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 94FB313F81D;
 Tue,  2 Jul 2024 21:24:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 02 Jul 2024 21:24:59 +0200
Date: Tue, 2 Jul 2024 21:24:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZoRUCxhtlsW0eDrz@landeda>
References: <80bb1c09-3932-4e4b-b6b3-3a8bc54bcaed@mind.be>
 <CABGWkvoesNPu1TJ+eRfQdL7U9NET_PQoJSw52SOboFsyhm_UCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvoesNPu1TJ+eRfQdL7U9NET_PQoJSw52SOboFsyhm_UCA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719948302;
 bh=Pze+t+jzL9Y0B9QM0vZHBtlOp7QOMJ4KhctWbCqbg+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=na8wooApYS0OcLuRUFxbul9AcMF+yHNA9zJiusTXd1wUuP020khMcZL+ib8l2h+Fq
 8uPveoJurC013Ur+7mwrfyS51GxcnFyY/L+gGKxjcki1gmCXJA8kTWsQa2G0jY44N7
 Qw1OgB0ai5y4PmpabDmHE41VG2ibnPb2cRZKYCLeRwhzK14bpSqgn3LDZNVcWcZZjE
 9LERuBAtyj1p3KfbAM5qqD7T5VCCOi/gzgy3BpHdGWFQVnOOsbAiJRJ2K/HGalZASZ
 1MRGQ5jUJ8vA8gTV9AaPp3gZJ3zRUVo6tBYQzUmisLKxHRKjO86A01FdiLSaMPB4UN
 6QrBJnLDjPcJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=na8wooAp
Subject: Re: [Buildroot] Thank you for fixing the fuzz-0 fallout
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDctMDIgMjE6MDcgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBUdWUsIEp1bCAyLCAyMDI0IGF0IDM6NTPigK9QTSBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+ID4gICBJJ2QgbGlrZSB0byB0aGFu
ayB5b3UgZXhwbGljaXRseSBmb3IgZml4aW5nIHRoZSBmYWxsb3V0IG9mIHRoZSBmdXp6LTAgY2hh
bmdlLgo+ID4gVGhhdCB3YXMgYSBiaWcgY2hhbmdlIHRoYXQgdG91Y2hlcyBhIGxvdCBvZiBwYWNr
YWdlcyB0aGF0IHlvdSdyZSBwcm9iYWJseSBub3QKPiA+IHJlYWxseSBpbnRlcmVzdGVkIGluLCBh
bmQgaXQncyBncmVhdCB0byBzZWUgeW91IHRha2Ugc28gbXVjaCByZXNwb25zaWJpbGl0eSBmb3Ig
aXQuCgpZZXMsIGFic29sdXRlbHksIHRoYW5rcyBmb3IgdGhhdCEKCj4gQXMgSSBhbHNvIG1lbnRp
b25lZCB0byBZYW5uIGluIGEgcHJldmlvdXMgZW1haWwsIEkgZGlkIG5vdCBleHBlY3QgdGhhdAo+
IHRoZSB0ZXN0IHJ1bgo+IGZvciB0aGUgc2VyaWVzIHlvdSBtZXJnZWQgd291bGQgZGV0ZWN0IG9u
bHkgYSBzbWFsbCBwb3J0aW9uIG9mIHRoZSBwYXRjaGVzIHRoYXQKPiBuZWVkZWQgdG8gYmUgY29y
cmVjdGVkLiBTbyBJIHRoaW5rIGl0IGlzIG5lY2Vzc2FyeSB0byB0cnkgdG8gZml4IHRoaXMKPiBw
cm9ibGVtIGFzIG11Y2gKPiBhcyBJIGNhbi4KPiAKPiBJIGFtIHZlcnkgcGxlYXNlZCB0aGF0IHlv
dSBhcHByZWNpYXRlIHdoYXQgSSBhbSBkb2luZyBkZXNwaXRlIHRoZSBmYWN0Cj4gdGhhdCB0aGlu
Z3MKPiBoYXZlbid0IGdvbmUgc21vb3RobHkuCgpJJ2Qgc2F5IHRoaW5ncyAqYXJlKiBnb2luZyBz
bW9vdGhseSwgaW4gZmFjdDogeW91IHByb3Bvc2VkIGEgcGF0Y2gsIGluCndoaWNoIHlvdSBhc3Nl
c3NlZCBhIHN0YXR1cywgdGhlIHBhdGNoIHdhcyByZXZpZXdlZCBhbmQgYXBwbGllZCwgc29tZQp0
aGluZ3MgYnJva2UsIHlvdSAoYW5kIGEgZmV3IG90aGVycyBhcyB3ZWxsKSBhcmUgZml4aW5nIHRo
ZSBtZXNzIGFzIHlvdQpjYW4uIFRoaXMgaXMgdGhlIHdheSB0aGluZ3Mgc2hvdWxkIGdvLgoKUmVn
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
