Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF90C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 14:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE5C41FC3;
	Wed, 10 Jan 2024 14:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DE5C41FC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJZbJVEFhubz; Wed, 10 Jan 2024 14:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A1241E52;
	Wed, 10 Jan 2024 14:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A1241E52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0507F1BF277
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1C740A56
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 14:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1C740A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_J3Z03Txm-W for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 14:15:47 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95548436B5
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95548436B5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3F1ACB0053D;
 Wed, 10 Jan 2024 15:15:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 15:15:39 +0100
Date: Wed, 10 Jan 2024 15:15:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZZ6mi3k_YH33GQVV@landeda>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-4-james.hilliard1@gmail.com>
 <ZZ548XGug565N5dq@landeda>
 <CADvTj4oNQr+v54t4QyTpyN-jvC+DgvyXFmu9io79c3xPJ=Kybw@mail.gmail.com>
 <ZZ6mAgM-c8Rx0Xky@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZ6mAgM-c8Rx0Xky@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704896145;
 bh=OjT2ljvwfxI/wCx4U5GLvWbixB8kwExElaXOs6ZMSDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kH0aZtL8ELubNaqRtfHUmcGJBt6/upLfBh+DRdxLBi4ELwt2Yw4SZmQV/Cl6DV7iK
 zL0KMc88MBaSNxFvZQ3uI7tpsqYOPG3PKiroFnerPYSgw6U67eUTN9yQqTtRJU1W1n
 we7M6yTsOkA43UIW6mIv5lDYc1EbVApMjw1ply6Jj4LttPy8CL8cSQ+qGq4I7DrSN8
 28x4IWCf5Ag4pr3Ugi6T13PXfKxCqOpRH/KJeH/mmGKOWlgppCDmxz+TtPXsd0W5Wb
 6d2ghkuh6E4h0PASlxhfZ9oPrYv3zONDW5tG0u97CjWMYQBL8FXQRHTCtKCgdW3+Uq
 A7VBh/eZYR8kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kH0aZtL8
Subject: Re: [Buildroot] [PATCH 4/6] package/python-swig: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDEtMTAgMTU6MTMgKzAxMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5Ogo+IE9uIDIwMjQtMDEtMTAgMDQ6MzAgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiA+IE9uIFdlZCwgSmFuIDEwLCAyMDI0IGF0IDQ6MDHigK9BTSBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiA+IE9uIDIwMjQtMDEt
MTAgMDI6MzggLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+
ID4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIHdpdGggdGhlIHN3aWcgcGFja2FnZSB3ZSBhbHJlYWR5
IGhhdmU/Cj4gICAgICQgbWFrZSBkZWZjb25maWcKPiAgICAgJCBtYWtlIGhvc3Qtc3dpZy1jb25m
aWd1cmUKPiAgICAgJCBtYWtlIGhvc3Qtc3dpZy1idWlsZAoKU29ycnksIEkgbWVhbnQgJ2hvc3Qt
cHl0aG9uLXN3aWcnIGluc3RlYWQgb2YgJ2hvc3Qtc3dpZycsIGFib3ZlLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
