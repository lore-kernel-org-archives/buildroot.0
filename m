Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92CAC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 12:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B6081A2B;
	Sat, 13 May 2023 12:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B6081A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSQ18sYyPK_Y; Sat, 13 May 2023 12:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604B9818D7;
	Sat, 13 May 2023 12:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604B9818D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5EB21BF5DE
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78BE8818A1
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 12:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BE8818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRRh1LnOCUBj for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 12:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4955981306
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4955981306
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:03:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6057E19F5BE;
 Sat, 13 May 2023 14:03:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 14:03:29 +0200
Date: Sat, 13 May 2023 14:03:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230513120329.GQ2582048@scaer>
References: <20230513105441.GN2582048@scaer>
 <355A9DF0-610B-4742-8703-554D7EFF1FCC@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <355A9DF0-610B-4742-8703-554D7EFF1FCC@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683979411;
 bh=caf8U/x6JHcMqiJdpbn+qeSXGA5eKbl0hbH4/mjKVP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dyl2/HbQ0mOPXDnmQtcaVAYuFvaJyn3sgMWFTC1Jm9Hq1C28sIZ2StRVaFWwtOkOF
 WKso8A3N9v+I/1UA3zybsjveGZMM9GiBsYNxTejBm/pBSlKZA05vk+7Wv7aRHKbksT
 bNSlDmle/xbTU4ep1NMJu/EUxq0V4ljdVEveBMBC5vEsxd0F4YdiS4+L+hkMfRwYyT
 3NohTd54EifGpdPy+BMa9BNvU753EQ7lTExxPO7DbpgiIY1VR5gS/gmQlBFfiao7NW
 0dTeKECTTiv8OJRer+wf6FCxrA6bXsIyKfZXtTbjp9t06ZIELgEq0w8fSU/GjLkUoR
 1vwrApHDBSTGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dyl2/HbQ
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump to version 2.6.3
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

R2l1bGlvLCBBbGwsCgpPbiAyMDIzLTA1LTEzIDEzOjU0ICswMjAwLCBHaXVsaW8gQmVuZXR0aSBz
cGFrZSB0aHVzbHk6Cj4gPiBJbCBnaW9ybm8gMTMgbWFnIDIwMjMsIGFsbGUgb3JlIDEyOjU1LCBZ
YW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gaGEgc2NyaXR0bzoKPiA+PiAu
Li5ldmVudC1hbmQtbGlic3FsaXRlMy1jaGVja2VkLXdoZW4tbmYucGF0Y2ggfCA3OSArKysrKysr
KysrKysrKysrKysrCj4gPj4gLi4uZWFkLWZpeC1saW5raW5nLXdoaWxlLXN0YXRpYy1saW5raW5n
LnBhdGNoIHwgNDkgLS0tLS0tLS0tLS0tCj4gPj4gLi4uZS5hYy1hbGxvdy10by1kaXNhYmxlLW5m
c3JhaGVhZC10b29sLnBhdGNoIHwgNjggLS0tLS0tLS0tLS0tLS0tLQo+ID4gICAgJCAuL3V0aWxz
L2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4gPiAgICAuY2hlY2twYWNrYWdlaWdub3Jl
OjEwNzg6IGlnbm9yZWQgZmlsZSBwYWNrYWdlL25mcy11dGlscy8wMDAxLW5mc3JhaGVhZC1maXgt
bGlua2luZy13aGlsZS1zdGF0aWMtbGlua2luZy5wYXRjaCBpcyBtaXNzaW5nCj4gPiAgICAuY2hl
Y2twYWNrYWdlaWdub3JlOjEwNzk6IGlnbm9yZWQgZmlsZSBwYWNrYWdlL25mcy11dGlscy8wMDAy
LWNvbmZpZ3VyZS5hYy1hbGxvdy10by1kaXNhYmxlLW5mc3JhaGVhZC10b29sLnBhdGNoIGlzIG1p
c3NpbmcKPiBBaCwgSeKAmW0gY3VyaW91cyB0byB1bmRlcnN0YW5kIGhvdyBpdCBoYXBwZW5lZC4K
ClRoYXQ7cyBiZWNhdXNlIC5jaGVja3BhY2thZ2VpZ25vcmUgaXMgcmxhdGl2ZWx5IG5ldywgYW5k
IHRoZXJlIHdhcyB1bnRpbApyZWNlbnRseSBubyB0b29saW5nIHRoYXQgY2hlY2tlZCB0aGUgYWJv
dmUuIEkndmUgcmVjZW50bHkgYXBwbGllZCBhCmVuaGFuY2VtZW50IHRvIGNoZWNrLXBhY2thZ2Ug
dGhlYXQgZGV0ZWN0cyB0aGF0LCBidXQgaXQgc3RpbGwgaXMgbm90CmVub3VnaCBpbiBhbGwgY2Fz
ZXMuCgpTbyBtYWludGFpbmVycyBoYXZlIHRoZSBkdXR5IHRvIGNoZWNrIGZvciB0aGF0IGZvciBu
b3csIG9yIHRoZSBDSSB3aWxsCndoaW5lLiA7LSkKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
