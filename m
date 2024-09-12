Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B227AEED634
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 17:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB48E61151;
	Thu, 12 Sep 2024 17:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1LZOjW5Zd2X; Thu, 12 Sep 2024 17:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6056113D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6056113D;
	Thu, 12 Sep 2024 17:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23321BF2E3
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 17:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C06D641A4C
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 17:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYXMvB0yhtWy for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 17:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6981441A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6981441A47
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6981441A47
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 17:44:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6782D5FFAA;
 Thu, 12 Sep 2024 19:44:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 Sep 2024 19:44:17 +0200
Date: Thu, 12 Sep 2024 19:44:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZuMoce338wPIgE89@landeda>
References: <20240912162232.1588976-1-sairon@sairon.cz>
 <ZuMl3F2Wga2vO-mH@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuMl3F2Wga2vO-mH@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726163059;
 bh=sU1sSzmJ9bmCqz1T+/6p6qCVXaf5VSX0sdCjOR57yGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ML23p5OBuwk3old9OkfB8DkQYJn+7CFpAnXfjELgzklGi3qYP4ArFu3xbkYnu6d5+
 9SO6K42w2RVvI3X37h43Vl47BjxlKUu7pfwBLH9fBac4lmYmD7uStoh805uEEUBr3d
 RygpnUYLNcNKV5IVGiWPz1S0anfO4FIJ147ObXnus1+fHxJkk+9PkLU7n/mT/X8wEP
 ScsXCjveS2IBt0VnXW9HVI9eAW3XduKKQ+dCN7EHs08n3BANkdIqPuKflFJ8xXGIAh
 diEd7Ibaa7ULGGapw/SVJSpDIYPs29L5b7vXWIMWabO4oUu45TaGcBAKmd003fk/lg
 wJlVVwnJnI4Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ML23p5OB
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: fix build with
 BR2_PACKAGE_SYSTEMD enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTA5LTEyIDE5OjMzICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtl
IHRodXNseToKPiBPbiAyMDI0LTA5LTEyIDE4OjIyICswMjAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+ID4gQWZ0ZXIgdXBkYXRlIHRvIHY0LjAuNCwgcHJvcHMtbmcgYnVpbGQgZmFpbHMg
b24gbGlua2VyIGVycm9yIGlmCj4gPiBCUjJfUEFDS0FHRV9TWVNURU1EIGlzIGVuYWJsZWQ6Cj4g
PiAvYnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2MveDg2XzY0LWJ1aWxkcm9vdC1saW51eC1n
bnUvMTMuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC1idWlsZHJvb3QtbGludXgtZ251L2Jpbi9sZDog
c3JjL3cubzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBzeW1ib2wgJ3NkX3Nlc3Npb25fZ2V0X3Vp
ZEBATElCU1lTVEVNRF8yMDknCj4gPiAvYnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2MveDg2
XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvMTMuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC1idWlsZHJv
b3QtbGludXgtZ251L2Jpbi9sZDogL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC94ODZfNjQtYnVpbGRy
b290LWxpbnV4LWdudS9zeXNyb290L3Vzci9saWI2NC9saWJzeXN0ZW1kLnNvLjA6IGVycm9yIGFk
ZGluZyBzeW1ib2xzOiBEU08gbWlzc2luZyBmcm9tIGNvbW1hbmQgbGluZQo+ID4gY29sbGVjdDI6
IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzClstLVNOSVAtLV0KPiA+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX1NZU1RFTUQpLHkpCj4gPiAgUFJPQ1BTX05HX0RFUEVOREVOQ0lFUyArPSBz
eXN0ZW1kCj4gPiAgUFJPQ1BTX05HX0NPTkZfT1BUUyArPSAtLXdpdGgtc3lzdGVtZAo+ID4gK1BS
T0NQU19OR19MSUJTICs9IC1sc3lzdGVtZApbLS1TTklQLS1dCj4gSW4gb3RoZXIgd29yZHMsIHRo
ZXJlIGlzIGFuIGlzc3VlIHRoYXQgbXVzdCBiZSBmaXhlZCBpbiB0aGUgcGFja2FnZSwgbm90Cj4g
aW4gQnVpbGRyb290LgoKQW5kIGl0IHNlZW1zIHVwc3RyZWFtIGhhcyBhbHJlYWR5IG5vdGljZWQs
IGFuZCB3ZSBoYXZlIGEgcGF0Y2ggdG8KYmFja3BvcnQ6CgogICAgaHR0cHM6Ly9naXRsYWIuY29t
L3Byb2Nwcy1uZy9wcm9jcHMvLS9jb21taXQvY2EwMDRkNDY1N2Q1ZThiNDY4YTQ1NTJlZGU0Mjli
ZTUzMTkzYTNhOQoKKGluY2lkZW50YWxseSwgaXQncyB0aGUgZmlyc3QgY29tbWl0IHJpZ2h0IGFm
dGVyIHRoZSA0LjAuNCByZWxlYXNlLi4uIEF0CmxlYXN0LCB0aGVyZSB3aWxsIGJlIG5vIGNvbmZs
aWN0ISA6LV0gKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
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
