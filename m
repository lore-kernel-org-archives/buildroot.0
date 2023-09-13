Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053FACA5531
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 09:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E2E60FC9;
	Wed, 13 Sep 2023 09:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E2E60FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8NZ00nsVmmF; Wed, 13 Sep 2023 09:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A64A660EFA;
	Wed, 13 Sep 2023 09:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64A660EFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43AF71BF847
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C8D1822DA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C8D1822DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M80tkJ4bZYW1 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 09:55:56 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E8DE822D8
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 09:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8DE822D8
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:169:c1d8:428a:7cc3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 37CD7780395;
 Wed, 13 Sep 2023 11:55:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 11:55:46 +0200
Date: Wed, 13 Sep 2023 11:55:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230913095546.GC2693@scaer>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
 <20230913114548.027eb2a8@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913114548.027eb2a8@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694598953;
 bh=33f5Bq5Pau4IwQW/rIAUSTFrDwOo0c/pGx+uChe5s0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0grSH5oHBX6dk2DOLvmmW0lkLxV2rj6HK8RuTCy7UMuMksvrUXhNv0R2sbRGaxud
 IR0Mbo/r7ph/weOUogkqzU1trOwvabTK83Z8Ft9fug4mEqrYdZS+kbx8L/f3YbVSWT
 lJ5TihCTzZvZRKcD+8RNUOqWBct92GDbcQUf5h5VD9cN5CGsExFkyRO9YB4P00hgR+
 2l6mUifl13GItdJuV9LjdFYPumxy57lILMW0lYSm65RmtTirm78lO6lTZlBQ8z4fsG
 9X+9+phOB4pnKAoIFCz9+EG9tV9oPcAekvccpPn1v4x/O23A1TLCBLn194F0nw3T1N
 i/lkrlaM5hJfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U0grSH5o
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5: fix upstream git trees
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTA5LTEzIDExOjQ1ICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHNwYWtlIHRodXNseToKPiBPbiBXZWQsIDEzIFNlcCAyMDIzIDAwOjE1OjQ4ICswMjAwCj4gIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBTaW5jZSBj
b21taXRzIDRlOGI1ZjliZWU5YyBbMF0sIDZjZmJkNTFkOThkMSBbMV0sIGFuZCBkODM4YTQxNmM0
ZWQgWzJdLAo+ID4gdGhlIHJlcG9zaXRvcnkgd2UgY2xvbmUgZnJvbSBpcyB0aGUgY2dpdCBicm93
c2VyLCBhbmQgaXQgZG9lcyBub3Qgc2VydmUKPiA+IHRoZSBnaXQgdHJlZSwgb25seSB0aGUgYnJv
d3NlcjoKWy0tU05JUC0tXQo+IFNvIGhvdyBkb2VzIGl0IHdvcmsgdG9kYXk/IEl0IGZhbGxzIGJh
Y2sgdG8gc291cmNlcy5idWlsZHJvb3Qub3JnPwoKSXQgaW5kZWVkIGZhbGxzIGJhY2sgdG8gcy5i
Lm86CgogICAgJCBtYWtlIHF0NWNvYXAtc291cmNlCiAgICBbLi4uXQogICAgZmF0YWw6IHJlcG9z
aXRvcnkgJ2h0dHBzOi8vY29kZS5xdC5pby9jZ2l0L3F0L3F0Y29hcC5naXQvJyBub3QgZm91bmQK
ICAgIERldGVjdGVkIGEgY29ycnVwdGVkIGdpdCBjYWNoZS4KICAgIFRoaXMgaXMgdGhlIHNlY29u
ZCB0aW1lIGluIGEgcm93OyBiYWlsaW5nIG91dAogICAgd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAt
dCAzIC1PICcvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8ucXQ1Y29h
cC01LjE1LjItYnIxLnRhci5nei5NalRweGEvb3V0cHV0JyAnaHR0cDovL3NvdXJjZXMuYnVpbGRy
b290Lm5ldC9xdDVjb2FwL3F0NWNvYXAtNS4xNS4yLWJyMS50YXIuZ3onCiAgICBbLi4uXQogICAg
MjAyMy0wOS0xMyAxMTo1Mjo1OCAoMTAxNiBLQi9zKSAtIOKAmC9ob21lL3ltb3Jpbi9kZXYvYnVp
bGRyb290L08vbWFzdGVyL2J1aWxkLy5xdDVjb2FwLTUuMTUuMi1icjEudGFyLmd6Lk1qVHB4YS9v
dXRwdXTigJlzYXZlZCBbMTc4NTU3LzE3ODU1N10KCiAgICBxdDVjb2FwLTUuMTUuMi1icjEudGFy
Lmd6OiBPSyAoc2hhMjU2OiAwYWQwNWEyMzA1NDM3YjliOTZhNDMyMmJmYWRhYTI2ZjA0M2JhMTY4
NDVkNTMwM2U1M2MwMGM4MmIzN2IyNDNmKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
