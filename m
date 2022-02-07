Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432B2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D417F404BF;
	Mon,  7 Feb 2022 17:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xr5SwL8KLpo1; Mon,  7 Feb 2022 17:40:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD806404CD;
	Mon,  7 Feb 2022 17:40:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEF41BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68EEB60B96
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yEJSzmRH_XY for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D5B7600D4
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:40:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4514:5b91:b120:9d9f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 586E219F5D1;
 Mon,  7 Feb 2022 18:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644255609;
 bh=/rajLzsWrROkA9OTNQeUb+8K493eNqU3N5b7ViOJ31I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ks4MkTFurLHJweZrDTrnOxxuC00l9qz0+RbpTYF33WZF2gUHFXREpvwX+8eFdzn6U
 0fJO5xEwFEiCaGZEt7GEFNIoWDcEgn++mgIESDNBQ8KR9ypkP0AtGTlGxAVjPfkNXQ
 jAw6l1A887dCqFdfw5NAkgmBQxozh9DQTOAJuMQnJsj6ky892KoAbBnLqA5VG+/pCu
 6cxIEgX8SKS9LL6avJXyhNGdpmj0jYCZMf6bHS9rp6S1+n+di8dt1qadHFJKYj+LbE
 v2SZzo/sxXwPs2pF5vl2wITo7EZ1lxXYKCjtYoK5k157HLU0sX/uY3cd328eHB0SnR
 YkrS1Fw+F9suQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 07 Feb 2022 18:40:02 +0100
Date: Mon, 7 Feb 2022 18:40:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Guo Ren <ren_guo@c-sky.com>
Message-ID: <20220207174002.GB2249818@scaer>
References: <d046141a-5913-b486-24fd-8f631df7c515@benettiengineering.com>
 <C43F4BCB-0323-42DB-B6C4-9E6F88DCD876@c-sky.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C43F4BCB-0323-42DB-B6C4-9E6F88DCD876@c-sky.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] csky_gx6605s build failure
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R3VvLCBBbGwsCgpPbiAyMDIyLTAyLTA3IDE1OjMzICswODAwLCBHdW8gUmVuIHNwYWtlIHRodXNs
eToKPiBXZeKAmXJlIHVzaW5nIGJ1aWxkcm9vdCB0byBidWlsZCBjazYxMCB0b29sY2hhaW4sIGhl
cmUgaXMgdGhlIGJ1aWxkIGxvZzoKPiBodHRwczovL2dpdGxhYi5jb20vYy1za3kvYnVpbGRyb290
Ly0vam9icy8xOTc4MjI5MDEwCj4gSGVyZSBpcyB0aGUgUWVtdSB0ZXN0aW5nIGxvZzoKPiBodHRw
czovL2dpdGxhYi5jb20vYy1za3kvYnVpbGRyb290Ly0vam9icy8xOTc4MjI5MDQwCj4gCj4gQ291
bGQgd2UgdXNlIHRoaXMgdG9vbGNoYWluIHdoaWNoIGJ1aWx0IGZyb20gYnVpbGRyb290IGFzIHRo
ZSBleHRlcm5hbCB0b29sY2hhaW4geW91IG1lbnRpb25lZD8KPiBodHRwczovL2dpdGxhYi5jb20v
Yy1za3kvYnVpbGRyb290Ly0vam9icy8xOTc4MjI5MDEwL2FydGlmYWN0cy9maWxlL291dHB1dC9p
bWFnZXMvdG9vbGNoYWluX3RoZWFkXzYxMF9jb21wYXRfbmV4dF9nbGliY19icl9kZWZjb25maWdf
OGM5OWFlMWM3Y2I2NmMwZjA2MmVkNDUzZmQ5YWU0YzU5NDIyYTQyYS50YXIueHoKPiAKPiBQczoK
PiBDazYxMCBJU0EgaXMgbWNvcmUod2UgY2FsbCBpdCBhYml2MSksIGdjYyAxMiBkb2VzbuKAmXQg
c3VwcG9ydCBpdCwgaGVyZSBpcyB0b29sY2hhaW4gcmVsYXRlZCByZXBvIChiYXNlIG9uIGdjYyA2
LjMpOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9jLXNreS9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9w
YXRjaGVzLzAwMDMtdmVyc2lvbi5wYXRjaAo+IAo+IEdpdCBodWIgcmVwbzoKPiAtZWxzZSBpZmVx
ICgkKEJSMl9HQ0NfVkVSU0lPTl9DU0tZKSx5KQo+IC1HQ0NfU0lURSA9ICQoY2FsbCBnaXRodWIs
Yy1za3ksZ2NjLCQoR0NDX1ZFUlNJT04pKQo+IC1HQ0NfU09VUkNFID0gZ2NjLSQoR0NDX1ZFUlNJ
T04pLnRhci5negoKRG8geW91IHRoaW5rIHlvdSBjb3VsZCBzZW5kIGFuIHVwZGF0ZSB0byB0aGUg
ZGVmY29uZmlnIHdlIGhhdmUgaW4tdHJlZSwKYW5kIGFueSBjaGFuZ2UgeW91J3ZlIG1hZGUgb24g
eW91ciBCdWlsZHJvb3QgZm9yaywgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
