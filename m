Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED103C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898DA409A9;
	Mon, 21 Nov 2022 21:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898DA409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNmdG67HAS6n; Mon, 21 Nov 2022 21:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5E0408BB;
	Mon, 21 Nov 2022 21:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5E0408BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEDD51BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FB440510
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FB440510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ue1fNjvHtFz for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:50:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E0A4031E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87E0A4031E
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:50:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6954A13F88D;
 Mon, 21 Nov 2022 22:50:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 22:50:05 +0100
Date: Mon, 21 Nov 2022 22:50:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20221121215005.GR2516@scaer>
References: <20221116084313.1068060-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116084313.1068060-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669067408;
 bh=3HZnYESpsi0y2fKyuSQGI0RuI1HG91FmcQ9Xf6G9Aeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/FoseiQjZPBdizDLaF12+GiK65lxJvPFxQnR+zvpovfJUj8dEbgevTK0XDgtadOI
 MQcbaTJM5HdU+YxPu2bcDq34Y5Ltqce36QogcEk8Y/SZ/ZILydgM/sJadlLE4riicZ
 KllXb3uXB4wF6rl/XFgiThAN88gF+VOwub0r/nkRlw/QtemVmlNE70hGxfyaJhh4Ps
 YKDkeBCjuzVoy1e6D8JHGuui+aFHggq+kBgFtsIAvEPczfIJmBqRoH0Srz3jZy9c/Q
 ne4wk6ryPzyp2UYGkDvfcWGs0eFwq5eRB4a3jiYoXl4qMalp7TumsUuSJ1Q0bxHjkp
 rxLptNJ1VjSWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b/FoseiQ
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/mali-driver=3A_remove_?=
 =?utf-8?q?Miqu=C3=A8l_from_the_DEVELOPERS_list?=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWlxdcOobCwgQWxsLAoKT24gMjAyMi0xMS0xNiAwOTo0MyArMDEwMCwgTWlxdWVsIFJheW5hbCB2
aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBJIGFtIG5vdCByZWFsbHkgbWFpbnRhaW5pbmcg
dGhlc2UgcGFja2FnZXMsIEkgZG9uJ3QgZm9sbG93IGNsb3NlbHkKPiBlbm91Z2ggbm9yIHVzZSB0
aGVtIHRvIHRha2UgdGhlIHRpbWUgdG8gbWFrZSB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMuCj4gR2l1
bGlvIGhhcyBiZWVuIG11Y2ggbW9yZSByZWFjdGl2ZSB0aGFuIG1lIHRvIGZpeCBpc3N1ZXMgYW5k
IGhlIGlzCj4gYWxyZWFkeSBsaXN0ZWQgZm9yIHRoZW0gYW55d2F5Lgo+IAo+IENjOiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcyEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBE
RVZFTE9QRVJTIHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGFmMjFiOGJkZDAu
LjUxZjdiM2I4ZDYgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMK
PiBAQCAtMjE1MiwxMCArMjE1Miw2IEBAIEY6CWNvbmZpZ3MvYmFuYW5hcGlfbTJfcGx1c19kZWZj
b25maWcKPiAgTjoJTWlraGFpbCBCb2lrbyA8bWlraGFpbGJvaWtvODVAZ21haWwuY29tPgo+ICBG
OglwYWNrYWdlL2xpYmZyaWJpZGkvCj4gIAo+IC1OOglNaXF1w6hsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiAtRjoJcGFja2FnZS9tYWxpLWRyaXZlci8KPiAtRjoJcGFja2Fn
ZS9yb2NrY2hpcC1tYWxpLwo+IC0KPiAgTjoJTWlyY2VhIEdsaWdhIDxnbGlnYS5taXJjZWFAZ21h
aWwuY29tPgo+ICBGOglwYWNrYWdlL21idWZmZXIvCj4gIAo+IC0tIAo+IDIuMzQuMQo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
