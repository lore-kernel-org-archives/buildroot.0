Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C4C7EE26
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 16:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E30683CBB;
	Tue, 23 May 2023 16:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E30683CBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P42jg01adqbA; Tue, 23 May 2023 16:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDF883C7F;
	Tue, 23 May 2023 16:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FDF883C7F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D43EB1BF371
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A702340905
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 16:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A702340905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dm6PMWzZiDe5 for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 16:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68DAB408C2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68DAB408C2
 for <buildroot@buildroot.org>; Tue, 23 May 2023 16:29:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c6ab:9448:2172:d8b3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 316212003C3;
 Tue, 23 May 2023 18:29:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 May 2023 18:29:35 +0200
Date: Tue, 23 May 2023 18:29:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230523162935.GJ621937@scaer>
References: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
 <20230521151038.GA171618@scaer> <20230521151644.GC171618@scaer>
 <CABGWkvo-xhQAJWc2+Jqn=ni-kzH7fqqzOnzwkGLVhe7_wn2GWQ@mail.gmail.com>
 <20230521200026.GC621937@scaer>
 <CABGWkvqMw3JGeRLHXzF4dvZPvC+VgLJ4Hd-W+HXAdTqHbd5S3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvqMw3JGeRLHXzF4dvZPvC+VgLJ4Hd-W+HXAdTqHbd5S3Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684859379;
 bh=z8RKCOotHtYCUaCgbqWoVrAhpXnMnZhwy+r+1tnxozU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SUKepPepIHIsF2brJx4V5r8OxDfxirLBIdp9SrlO+sK61M6+y9KbQy+NHRQshye7K
 B0OcjegFrCcJsVacs3kEJCGoqvWJ+Ry9feUvW/BnInGfPhBWkLuTkokCVFgmhAVhu4
 H9EE9e3XPifJADhpkdq4JaXeoMA7pZnskVaqIc17Yj8G6bqN3rsXsHD6b4iOmAUoKr
 WJgGXMlE+OXSGkbpvm5puGiPkvs0JUtVaOemn2osjN3pVtb4qQwpQzx+kmCUsddMBR
 b0bTuCiDuyWYMAad9d4pZE1/L7bVU9Gd186I9zrtILe3GkSKcjefzFvDaYliJ5UQjO
 U85wjWJqVRbyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SUKepPep
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjMtMDUtMjIgMTI6MzIgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIE1heSAyMSwgMjAyMyBhdCAxMDowMOKAr1BNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjMtMDUtMjEg
MjA6MzYgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNwYWtlIHRodXNseToKPiA+IFNvLCBteSBwb3Np
dGlvbiBpcyB0aGF0IHdlIHNob3VsZCByZWFsbHkgYWRkIHRoZSBkZXBlbmRlbmN5IG9uIGtlcm5l
bAo+ID4gaGVhZGVycyBpbiBtYXN0ZXIsIGFuZCBpZi93aGVuIHVwc3RyZWFtIGFwcGxpZXMgdGhl
IGhlYWRlcnMgaW5jbHVkZQo+ID4gcGF0Y2gsIHRoZW4gd2UgY2FuIHNlZSB0byByZWxheCB0aGUg
cmVzdHJpY3Rpb24uClstLVNOSVAtLV0KPiBUaGUgaXNzdWUgaXMgbm90IHJlbGF0ZWQgdG8gaW5z
dGFsbGF0aW9uIGJ1dCB0byBjb21waWxhdGlvbi4gVGhlICJtYWtlIGNoZWNrIgo+IGNvbW1hbmQg
ZG9lcyBub3Qgc2VsZWN0aXZlbHkgY29tcGlsZSBwcm9ncmFtcyBidXQgY29tcGlsZXMgYWxsIG9m
IHRoZW0uCj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBhY3Qgb24gdGhlICJDb25maWcuaW4iIGZp
bGUgaW5zdGVhZCBvZiAibGlibW5sLm1rIiBieQo+IG1ha2luZyB0aGUgb3B0aW9uICJCUjJfUEFD
S0FHRV9MSUJNTkxfRVhBTVBMRVMiIGRlcGVuZHMgb24KPiAiQlIyX1RPT0xDSEFJTl9IRUFERVJT
X0FUX0xFQVNUXzRfMTEiPwoKWWVzLCB0aGF0LCBwbGVhc2UhIDotKQoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
