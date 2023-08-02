Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061ACC04A6A
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 14:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C8F6122A;
	Wed,  2 Aug 2023 14:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C8F6122A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AryYiPOSHH0N; Wed,  2 Aug 2023 14:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A9C61242;
	Wed,  2 Aug 2023 14:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A9C61242
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F8421BF372
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3C640313
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3C640313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rwDXCRkIMx5 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 14:11:44 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A9840576
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 14:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A9840576
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:aecc:7f70:551b:efac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E317F2003B4;
 Wed,  2 Aug 2023 16:11:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 16:11:36 +0200
Date: Wed, 2 Aug 2023 16:11:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230802141136.GF421096@scaer>
References: <20230731214559.99648-1-james.hilliard1@gmail.com>
 <20230801200154.GE421096@scaer>
 <CADvTj4r5Zv4t1RsAFBMRyKwTRYCJ2FWOC1nWwQjdrzvwD=q+tw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4r5Zv4t1RsAFBMRyKwTRYCJ2FWOC1nWwQjdrzvwD=q+tw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690985501;
 bh=cXLc9R8rOLEjldzvu0pljrIsnQKHWa0jAEqAgVPaXtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JVdMfnDKcCFFr/rH3Dc76IFfreSAUTBAYtrg+aRFaqoqrgA9VdTvPiMs0LUEG7r0h
 cimTKm3GkWwgYAhfEXCphaS0COWzOeKCR+96sgONFPdbJQCZEaUDFmOed013AM3RCZ
 bHuVEXZ+QiT8g3h48V9foqc5icEyoszHyy3pHdN/l1hdPjN7c2Q4nps+TGs+4fwlYx
 +YvvkpIlKyYQ+qYZhLkzCwOVF7ZD5L9l6gX5wjXlvcQGmyAwmw1/7QsWBqgccQ743K
 biuzcbyNSlnj1qjr14b+mJ2VNujrn3lxi2XvtmHH1Oj5eJu3A8Xld+WxQlpGKTlqV1
 A2UALVd1bORRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JVdMfnDK
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: select kdb
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDgtMDEgMTU6MDkgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBUdWUsIEF1ZyAxLCAyMDIzIGF0IDI6MDHigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBPbiAyMDIzLTA3LTMxIDE1
OjQ1IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiA+IFdlIG5lZWQgdG8g
c2VsZWN0IEJSMl9QQUNLQUdFX0tCRCB3aGVuIGJ1aWxkaW5nIHN5c3RlbWQgd2l0aCB2Y29uc29s
ZS4KPiA+IFRoaXMgaXMgdHJpdmlhbCB0byBleHBsYWluLCBpbmRlZWQsIGJ1dCB3aGF0IGlzIG5v
dCB0cml2aWFsIHRvIGV4cGxhbgo+ID4gYnV0IG1vc3QgaW50ZXJlc3RpbmcsIGFuZCBhcyBJIGRp
ZCBhc2sgaW4gbXkgcHJldmlldyBtYWlsLCBpcyB0byBleHBsYWluCj4gPiB3aHk6Cj4gWWVhaCwg
SSB0cmllZCB0byBmaWd1cmUgdGhhdCBvdXQsIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IHJlYXNv
biBmb3IKPiB0aGUgdGVzdCBub3QKPiBmYWlsaW5nIHByZXZpb3VzbHkuCgpJbiB0aGUgbWVhbnRp
bWUsIFJvbWFpbiBoYXMgc2VudCBhIHBhdGNoIHRoYXQgZXhwbGFpbnMgdGhlIGlzc3VlLCBhbmQK
YWRkcyB0aGUgYXBwcm9wcmlhdGUgb3B0aW9uIHRvIHNvbHZlIGl0LgoKUmVnYXJkcywKWWFubiBF
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
