Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804E9C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D3E60BE8;
	Sun, 14 Aug 2022 14:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D3E60BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ea9sQ_63kXri; Sun, 14 Aug 2022 14:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3D660BDD;
	Sun, 14 Aug 2022 14:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3D660BDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBF91BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB2B1827C6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB2B1827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fn1hHIiq0aXQ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:50:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0528A8277E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0528A8277E
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:50:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4B4C36014E;
 Sun, 14 Aug 2022 16:50:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:50:26 +0200
Date: Sun, 14 Aug 2022 16:50:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814145026.GD2775145@scaer>
References: <20220814125601.1227888-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125601.1227888-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488628;
 bh=zccICSyfV4GZRrQhY+DsTpXla0/zc4O4vWQue9ah96Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ly8AOjmkVlrMSxAtqTIEhPt70pwGeOlHKq1feQ0biuI6HqShm++2rs3cpZD49XWV6
 z7rEHf0iZZmC5LS7tcHiIqe2ZRBmwn/3QKatrBmuK95Sz/0x6qDUGfY/HbzhC7mT0C
 rLc+GEvlDW7x8KwRdpRO3qYSjlOAHhxhfU5chdRtrywnpnXi0x5NaMn6lyyfRwGRYw
 5DJa3Vl2UtrFurV2y5joKZS2yRiDoM+/Ss6eGw9ASlEDFyGIjt2sYqsySZ0d0anrs3
 h6GUvgbpEP1WJyFNaek+HaVt1zLuZgmCiKFoCtfqReJFH/3LBJm6fv/BNUPyIjFCiM
 y0guRELTOvMYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ly8AOjmk
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 6.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDE0OjU2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9uYW5vL25hbm8uaGFzaCB8IDQgKystLQo+
ICBwYWNrYWdlL25hbm8vbmFuby5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uYW5v
L25hbm8uaGFzaCBiL3BhY2thZ2UvbmFuby9uYW5vLmhhc2gKPiBpbmRleCA4MzA4MDA1YmIuLjgz
ZGU4NWI0MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25hbm8vbmFuby5oYXNoCj4gKysrIGIvcGFj
a2FnZS9uYW5vL25hbm8uaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIExvY2FsbHkgY2FsY3Vs
YXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCj4gLSMgaHR0cHM6Ly93d3cubmFuby1l
ZGl0b3Iub3JnL2Rpc3QvdjYvbmFuby02LjMudGFyLnh6LmFzYwo+ICsjIGh0dHBzOi8vd3d3Lm5h
bm8tZWRpdG9yLm9yZy9kaXN0L3Y2L25hbm8tNi40LnRhci54ei5hc2MKPiAgIyB1c2luZyBrZXkg
QkZEMDA5MDYxRTUzNTA1MkFEMERGMjE1MEQyOEQ0RDJBMEFDRTg4NAo+IC1zaGEyNTYgIGViNTMy
ZGE0OTg1NjcyNzMwYjUwMGY2ODVkYmFhYjg4NWE0NjZkMDhmYmJmNzQxNTgzMmI5NTgwNWU2Zjg2
ODcgIG5hbm8tNi4zLnRhci54ego+ICtzaGEyNTYgIDQxOTlhZThjYTc4YTc3OTZkZTU2ZGUxYTQx
YjgyMWRjNDc5MTJjMDMwN2U5ODE2YjU2Y2MzMTdkZjM0NjYxYzAgIG5hbm8tNi40LnRhci54ego+
ICBzaGEyNTYgIGZjODJjYThiNmZkYjE4ZDRlM2U4NWNmZDhhYjU4ZDFiY2QzZjFiMjlhYmU3ODI4
OTVhYmQ5MWQ2NDc2M2Y4ZTcgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uYW5vL25h
bm8ubWsgYi9wYWNrYWdlL25hbm8vbmFuby5tawo+IGluZGV4IGNhZDIxNWJlZC4uZWNmYzM3NDEy
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmFuby9uYW5vLm1rCj4gKysrIGIvcGFja2FnZS9uYW5v
L25hbm8ubWsKPiBAQCAtNSw3ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAg
Cj4gIE5BTk9fVkVSU0lPTl9NQUpPUiA9IDYKPiAtTkFOT19WRVJTSU9OID0gJChOQU5PX1ZFUlNJ
T05fTUFKT1IpLjMKPiArTkFOT19WRVJTSU9OID0gJChOQU5PX1ZFUlNJT05fTUFKT1IpLjQKPiAg
TkFOT19TSVRFID0gaHR0cHM6Ly93d3cubmFuby1lZGl0b3Iub3JnL2Rpc3QvdiQoTkFOT19WRVJT
SU9OX01BSk9SKQo+ICBOQU5PX1NPVVJDRSA9IG5hbm8tJChOQU5PX1ZFUlNJT04pLnRhci54ego+
ICBOQU5PX0xJQ0VOU0UgPSBHUEwtMy4wKwo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
