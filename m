Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C3FC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B5160BD8;
	Sun, 14 Aug 2022 14:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B5160BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i5wukaFI0lq; Sun, 14 Aug 2022 14:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5111660BE8;
	Sun, 14 Aug 2022 14:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5111660BE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E4C61BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06BCD823DD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06BCD823DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6wres_9o5xs for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 176A9827BA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 176A9827BA
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:51:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C2B6360136;
 Sun, 14 Aug 2022 16:51:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:51:00 +0200
Date: Sun, 14 Aug 2022 16:51:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814145100.GF2775145@scaer>
References: <20220814125621.1227931-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125621.1227931-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488662;
 bh=vdMhxIZFlboF2Hm8Wvk8zI/NmIEemPnKdVOydA7rYw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jIWvwbFvgTjbQhF8qlfLyjW3W85DUveSiz6XuxablNdFgGY/KL0zQK4xIx9eZKKfj
 8NcOh/gnvH+ByOjtms8iI48dVEpwMli5CwAQqXrjnn9FyXz7DXdhO9Lbk/LwiaJD5a
 ppvEmIRxl1FsAPsWYw4cTpBIsXsr8LfFItU95s0f5gkt8Or62DmVxbRLvCDdHp3lzY
 eWrDEOPLyk1N058b6ZNBtaJmex0fF21CDjYoTrcl0g8b4BAmp6Mt0OUPqlKyUCYj5k
 GStvuPZ1c9N2DO69YJXdmvejbuG05743E7aosOPvMZe8JW3XfLg6DjgjPohVt7DiiZ
 +2LsYI1y10HCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jIWvwbFv
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.50.9
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
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9wYW5nby9wYW5nby5oYXNoIHwgNCArKy0t
Cj4gIHBhY2thZ2UvcGFuZ28vcGFuZ28ubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGFuZ28vcGFuZ28uaGFzaCBiL3BhY2thZ2UvcGFuZ28vcGFuZ28uaGFzaAo+IGluZGV4IDlhNzMw
MDFjOS4uNDhkN2Y0ZDVhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGFuZ28vcGFuZ28uaGFzaAo+
ICsrKyBiL3BhY2thZ2UvcGFuZ28vcGFuZ28uaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIEZy
b20gaHR0cHM6Ly9mdHAuYWNjLnVtdS5zZS9wdWIvR05PTUUvc291cmNlcy9wYW5nby8xLjUwL3Bh
bmdvLTEuNTAuOC5zaGEyNTZzdW0KPiAtc2hhMjU2ICBjZjYyNmY1OWRkMTQ2YzAyMzE3NGM0MDM0
OTIwZTk2NjdmMWQyNWFjMmMxNTY5NTE2ZDYzMTM2YzMxMTI1NWZhICBwYW5nby0xLjUwLjgudGFy
Lnh6Cj4gKyMgRnJvbSBodHRwczovL2Z0cC5hY2MudW11LnNlL3B1Yi9HTk9NRS9zb3VyY2VzL3Bh
bmdvLzEuNTAvcGFuZ28tMS41MC45LnNoYTI1NnN1bQo+ICtzaGEyNTYgIDFiNjM2YWFiZjkwNTEz
MGQ4MDYzNzIxMzZmNWUxMzdiNmEyN2YyNmQ0N2RlZmQ5MjQwYmY0NDRmNmE0ZmU2MTAgIHBhbmdv
LTEuNTAuOS50YXIueHoKPiAgCj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYgIGQyNDU4
MDdmOTAwMzI4NzJkMTQzOGQ3NDFlZDIxZTI0OTBlMTE3NWRjOGFhM2FmYTVkZGI2YzhlNTI5YjU4
ZTUgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wYW5nby9wYW5nby5tayBiL3BhY2th
Z2UvcGFuZ28vcGFuZ28ubWsKPiBpbmRleCAzMGIxZGU5ZDIuLjM0ODc1OTA5MiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3BhbmdvL3BhbmdvLm1rCj4gKysrIGIvcGFja2FnZS9wYW5nby9wYW5nby5t
awo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgUEFO
R09fVkVSU0lPTl9NQUpPUiA9IDEuNTAKPiAtUEFOR09fVkVSU0lPTiA9ICQoUEFOR09fVkVSU0lP
Tl9NQUpPUikuOAo+ICtQQU5HT19WRVJTSU9OID0gJChQQU5HT19WRVJTSU9OX01BSk9SKS45Cj4g
IFBBTkdPX1NPVVJDRSA9IHBhbmdvLSQoUEFOR09fVkVSU0lPTikudGFyLnh6Cj4gIFBBTkdPX1NJ
VEUgPSBodHRwOi8vZnRwLmdub21lLm9yZy9wdWIvR05PTUUvc291cmNlcy9wYW5nby8kKFBBTkdP
X1ZFUlNJT05fTUFKT1IpCj4gIFBBTkdPX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+IDIu
MzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
