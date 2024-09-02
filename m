Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C1CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 18:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54D6C40026;
	Mon,  2 Sep 2024 18:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hclb9jYebQ4l; Mon,  2 Sep 2024 18:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1513140142
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1513140142;
	Mon,  2 Sep 2024 18:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 298D81BF360
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1672D40142
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpGc7faMDTNT for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 18:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEBC440026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEBC440026
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEBC440026
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 18:13:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A6B4413F8A9;
 Mon,  2 Sep 2024 20:12:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 20:12:57 +0200
Date: Mon, 2 Sep 2024 20:12:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZtYAKcvPQjSaZAMh@landeda>
References: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
 <ZtXmlczpG3mqy3im@landeda>
 <CABGWkvoL1NXo8zD=w+qx+TH+CJiS+vtc9SYBgj_Qwx6k8w_XCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvoL1NXo8zD=w+qx+TH+CJiS+vtc9SYBgj_Qwx6k8w_XCQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725300780;
 bh=25mvytksstyKdU9BEMdVNhpE1nM0/eT+JxyhE4okP5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhgJf2Po+wg2+kH16l1G+7rxwofMU+5+xlD++Vf/aT/q7m11Di2dBofKvhcqMYEqE
 DKN0PuCO1T5qhDtbZciqAQ7XUnSmjGFFmUvK+0EkSzL2rchZKiXFbs4P7zjvu4Zh+2
 cbMaGlOpaaPdkQCzbakx9dIeIPV2PbvZvCTYFPmxHSTLZhtfAAkvFplSgAmcHXgpG5
 08WnR4onpk5Ddmu9K/MjMEfyim9DIstBvQn2IUvkmIgKUN1a5XyaXgu7dLFvI8ef0s
 W3GLvyPjuDVzP+PZTHAW29Cz9D+D8xJZRwQ72xiXOhXosUNsyq9Rw/dFsnAqYUAsZb
 8WXQixo3kDJKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JhgJf2Po
Subject: Re: [Buildroot] [PATCH v3 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDktMDIgMTk6NTIgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBNb24sIFNlcCAyLCAyMDI0IGF0IDY6MjPigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+IEJ1dCBz
aW5jZSB3ZSBhcmUgdHJ5aW5nIHRvIG1vdmUgYXdheSBmcm9tIHRoZSBnaXRodWIgbWFjcm8gKGxv
bmcgdGVybQo+ID4gZ29hbCksIEknZCBldmVuIHN1Z2dlc3Qgd2UgZGlyZWN0bHkgc3dpdGNoIHRv
IHVzaW5nIHRoZSBnaXQgZG93bmxvYWQKPiA+IG1ldGhvZDoKPiA+ICAgICBCQUJFTERfVkVSU0lP
TiA9IDEuOS4yCgpPZiBjb3Vyc2UsIGhlcmUsIHdlJ2QgbmVlZCB0byBoYXZlOiBCQUJFTERfVkVS
U0lPTiA9IGJhYmVsZC0xLjkuMgoKYmVjYXVzZSB0aGF0J3Mgd2hhdCB0aGUgdGFnIGlzIG5hbWVk
LgoKVGhpcyB3aWxsIGFsc28gYnJlYWsgdGhlIHJlbGVhc2UtbW9uaXRvcmluZywgYnV0IEkgYW0g
YWxyZWFkeSB3b3JraW5nLAphcyBwYXJ0IG9mIHRoZSBwbGFuIHRvIG1pZ3JhdGUgYXdheSBmcm9t
ICQoY2FsbCBnaXRodWIpLCBvbiBhIHdheSB0byBiZQphYmxlIHRvIHNwZWNpZnkgYSAiZG93bmxv
YWQgdmVyc2lvbiIgdGhhdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgImFjdHVhbAp2ZXJzaW9uIi4u
LgoKSW4gdGhlIG1lYW50aW1lLCB3ZSdsbCBoYXZlIHRvIGxpdmUgd2l0aCB0aGF0IGxpbWl0YXRp
b24uLi4KCihhbmQgdG8gYmUgY2xlYXI6IEkgc3RpbGwgc3VnZ2VzdCB1c2luZyB0aGUgZ2l0IGRv
d25sb2FkIG1ldGhvZCwgbm90IHRoZQpnaXRodWIgbWFjcm8pLgoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
