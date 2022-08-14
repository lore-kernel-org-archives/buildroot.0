Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D04EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2DE2828DD;
	Sun, 14 Aug 2022 14:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DE2828DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elKL5DuEmlWx; Sun, 14 Aug 2022 14:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4E2827C6;
	Sun, 14 Aug 2022 14:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4E2827C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18401BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACD53827DD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD53827DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlJ3T4AmOBXd for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:50:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0768277E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF0768277E
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:50:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ECB646014D;
 Sun, 14 Aug 2022 16:50:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:50:07 +0200
Date: Sun, 14 Aug 2022 16:50:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814145007.GC2775145@scaer>
References: <20220814125550.1227865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125550.1227865-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488610;
 bh=6XIvjnAifkVNz40w096OaL2bNI3m9O6VzwzQqh4MEvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1dFd0w9zS5hffpxfuq1RueWZ191SLYUEqf8m9L9fMT+t8MwVjJnq5crr6BR0euDG
 8TnZ74RPZO3s3YM/4G4PFnHTU8gA9w6dle/UDhJTso/NzVwCR+Jqs49fgCGYR+F7PH
 B+zdPyGiHYJJbFnRCKvUn8HrM+uwZpM4rWMywdj8peX2otsAioL5/XATBhYqebRhuU
 qoCygYOtz9ouRPuKHalqfKpvQ8sFJv99mNFqy9Hh1WaT0tgePAFBo9NYEFZM8Fo8Es
 hsc32fnYNT349cWIuYzDKgLHL1PhwIae1vPVeboYzbOEBrT9u2xO/TiLwgZvlaUaYp
 AYfeyiZ4tJdOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t1dFd0w9
Subject: Re: [Buildroot] [PATCH] package/libcap: bump to version 2.65
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDE0OjU1ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9saWJjYXAvbGliY2FwLmhhc2ggfCAyICst
Cj4gIHBhY2thZ2UvbGliY2FwL2xpYmNhcC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJjYXAvbGliY2FwLmhhc2ggYi9wYWNrYWdlL2xpYmNhcC9saWJjYXAuaGFzaAo+IGluZGV4
IDdjNDhjZDk1MC4uNWZjODE3MzkwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliY2FwL2xpYmNh
cC5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJjYXAvbGliY2FwLmhhc2gKPiBAQCAtMSw1ICsxLDUg
QEAKPiAgIyBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzL3NlY3VyaXR5L2xp
bnV4LXByaXZzL2xpYmNhcDIvc2hhMjU2c3Vtcy5hc2MKPiAtc2hhMjU2ICBjODQ2NWUxZjBiMDY4
ZDVmYzA2MTk5MjMxMTM1Y2NhYzdhZGI1NmQ2NjJiMWRlOTM1ODkyNTJlOGNkMDcxZTEzICBsaWJj
YXAtMi42NC50YXIueHoKPiArc2hhMjU2ICA3M2UzNTAwMjBjYzMxZmUxNTM2MDg3OWQxOTM4NGZm
YTMzOTVhODI1ZjA2NWZjZjZiZGEzYTVjZGY5NjViZWJkICBsaWJjYXAtMi42NS50YXIueHoKPiAg
Cj4gICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlOgo+ICBzaGEyNTYgIGY1OGM4MGJjY2U4YzkyOWRi
MzlhMjNjMzJlOTI0ODc2ZTMzMTFmM2ZmYTU0ZjY2MDc2YzM4MDU2ZDM4ZmE1OWIgIExpY2Vuc2UK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjYXAvbGliY2FwLm1rIGIvcGFja2FnZS9saWJjYXAv
bGliY2FwLm1rCj4gaW5kZXggOTFlMDI2MzhlLi43MjhhNmJhNmMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJjYXAvbGliY2FwLm1rCj4gKysrIGIvcGFja2FnZS9saWJjYXAvbGliY2FwLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJ
QkNBUF9WRVJTSU9OID0gMi42NAo+ICtMSUJDQVBfVkVSU0lPTiA9IDIuNjUKPiAgTElCQ0FQX1NJ
VEUgPSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzL3NlY3VyaXR5L2xpbnV4
LXByaXZzL2xpYmNhcDIKPiAgTElCQ0FQX1NPVVJDRSA9IGxpYmNhcC0kKExJQkNBUF9WRVJTSU9O
KS50YXIueHoKPiAgTElCQ0FQX0xJQ0VOU0UgPSBHUEwtMi4wIG9yIEJTRC0zLUNsYXVzZQo+IC0t
IAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
