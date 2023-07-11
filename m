Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9406EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 17:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7291641E31;
	Tue, 11 Jul 2023 17:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7291641E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXgJeNVuxhyp; Tue, 11 Jul 2023 17:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A72941E2B;
	Tue, 11 Jul 2023 17:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A72941E2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA521BF3E5
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F9441E42
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 17:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F9441E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VM9FlUXcFKWB for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 17:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC6041E38
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CC6041E38
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 17:22:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:be68:b46e:ab7b:a099])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E963D13F8D9;
 Tue, 11 Jul 2023 19:22:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 11 Jul 2023 19:22:27 +0200
Date: Tue, 11 Jul 2023 19:22:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20230711172227.GF188780@scaer>
References: <20230710174542.16516-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710174542.16516-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689096151;
 bh=sgpSjsQ426xNvxmNokKmXdvdlBlXyQQtWoR0bpdEs9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DlNtmayLQ90pBvM6Os+IGqmG8Izlg7gUuG7Xx8Ub3zKO29vG2ctZHjPuquAwOfYip
 +3B8qvg6/u8mfVSHezH+/stC3aBjMx4locsMTp/7hd46w/1VXL2PIL7vXt1zvyMIzH
 n+9Bz/8/mf2J2pIAZOuX7BGcLSx4/qwykXYIyAl9h0mA2YBbb5WVSPEpX7D2MP91ur
 ISKrYJD1VjW5pYq1UcQ7iOqpRQFBed4w/2A6SjZmuf5ghQM4QLJ2/uZDQHRORnMjDo
 Eb6kzVHTh/grVrs4Q+sAoFqLFJORl/gVsZd85EA0/ms9cV0XQYLEaOZvLOvc6lGMsu
 68524dN0jh37A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DlNtmayL
Subject: Re: [Buildroot] [PATCH 1/1] package/yavta: update _SITE URL
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
Cc: Patrick Gerber <kpa_info@yahoo.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMy0wNy0xMCAxOTo0NSArMDIwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IEl0IGxvb2tzIGxpa2UgdGhlIHByb2plY3QgbW92ZWQg
dG8gaHR0cHM6Ly9naXQuaWRlYXNvbmJvYXJkLm9yZy95YXZ0YS5naXQuCj4gCj4gVXBkYXRlIFlB
VkFfU0lURSBVUkwgYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdl
L3lhdnRhL3lhdnRhLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS95YXZ0YS95YXZ0YS5tayBi
L3BhY2thZ2UveWF2dGEveWF2dGEubWsKPiBpbmRleCBkMTZiZWU2OWIxMTcuLmRiNDgxYjc3Yjk1
NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3lhdnRhL3lhdnRhLm1rCj4gKysrIGIvcGFja2FnZS95
YXZ0YS95YXZ0YS5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAgWUFWVEFfVkVSU0lPTiA9IDU4M2JlZGVmYzJhMjQ3ZDJjZmQzMmQxYjRhMGFiYmUz
ZTIwMTVjNzAKPiAtWUFWVEFfU0lURSA9IGh0dHBzOi8vZ2l0LmlkZWFzb25ib2FyZC5vcmcvZ2l0
L3lhdnRhLmdpdAo+ICtZQVZUQV9TSVRFID0gaHR0cHM6Ly9naXQuaWRlYXNvbmJvYXJkLm9yZy95
YXZ0YS5naXQKPiAgWUFWVEFfU0lURV9NRVRIT0QgPSBnaXQKPiAgWUFWVEFfTElDRU5TRSA9IEdQ
TC0yLjArCj4gIFlBVlRBX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLkdQTAo+IC0tIAo+IDIuNDEu
MAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
