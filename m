Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEA7C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1397260C06;
	Sun, 14 Aug 2022 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1397260C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf686RuHqx8V; Sun, 14 Aug 2022 14:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF8AA60BE8;
	Sun, 14 Aug 2022 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF8AA60BE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A221D1BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D800827BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D800827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x6qeP2JnYbI for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:51:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B14C823DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B14C823DD
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:51:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3056D60136;
 Sun, 14 Aug 2022 16:51:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:51:18 +0200
Date: Sun, 14 Aug 2022 16:51:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814145118.GG2775145@scaer>
References: <20220814125630.1227952-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125630.1227952-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488688;
 bh=qcBKj0QBSSPuCOYf5Sp4o/ByLDqnV/rvwlHUJmcgclM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B8h3qT108/3JNsDJw1ru9Rzif4HoNzCg7kqEZBng2bBoc6EYSfxrsQ0bEjOhHw0Lj
 ZHjw/uH8gOd2GXfuTl3AQjAiDbyBEtQflrJOx66a00ZytRq0feSuMGBorPvwjvseM8
 YZctwEhnj+wHpQ4HDh1waY7ZqfuHEU3AmLjHF7avolCi2MHITiTraJ13SlPd2ajNZ9
 0PeQybcBhNSOytzfiG6RCtEp7KFp0W4N4e61/j71bhXMWw9KPV4B6poz6H81u/2NoU
 8Wut9Xmh7N3WJuftqaz5PRvZUYOJ0NGNriTTeIafSM441Qffsh08WU/o0Ld/Yk3w93
 D/KRA3mYNZEXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B8h3qT10
Subject: Re: [Buildroot] [PATCH] package/webp: bump to version 1.2.4
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
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS93ZWJwL3dlYnAuaGFzaCB8IDIgKy0KPiAg
cGFja2FnZS93ZWJwL3dlYnAubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2VicC93
ZWJwLmhhc2ggYi9wYWNrYWdlL3dlYnAvd2VicC5oYXNoCj4gaW5kZXggYTk1MDg2ZTgxLi45Njll
NGNkM2QgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJwL3dlYnAuaGFzaAo+ICsrKyBiL3BhY2th
Z2Uvd2VicC93ZWJwLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKPiAtc2hhMjU2ICA3NjU2NTMyZjgzN2FmNWY0Y2VjM2ZmNmJhZmU1NTJjMDQ0ZGMzOWJmNDUz
NTg3YmQ1Yjc3NDUwODAyZjRhZWU2ICBsaWJ3ZWJwLTEuMi4yLnRhci5nego+ICtzaGEyNTYgIDdi
ZjVhOGEyOGNjNjliY2ZhOGNiMjE0ZjJjMzA5NTcwM2M2YjczYWM1ZmJhNGQ1NDgwYzIwNTMzMWQ5
NDk0ZGYgIGxpYndlYnAtMS4yLjQudGFyLmd6Cj4gIHNoYTI1NiAgNWFlYzg2OGY2NjllMzg0YTIy
MzcyYTRlOGExYTZjZDdkNDRjNjRjZDQ1MWY5NjBjYTY5Y2MxNzBkMWUxM2FjZiAgQ09QWUlORwo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYnAvd2VicC5tayBiL3BhY2thZ2Uvd2VicC93ZWJwLm1r
Cj4gaW5kZXggNjcwYTdiODAxLi4zOGExNTY0YTYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJw
L3dlYnAubWsKPiArKysgYi9wYWNrYWdlL3dlYnAvd2VicC5tawo+IEBAIC00LDcgKzQsNyBAQAo+
ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1XRUJQX1ZFUlNJT04gPSAxLjIu
Mgo+ICtXRUJQX1ZFUlNJT04gPSAxLjIuNAo+ICBXRUJQX1NPVVJDRSA9IGxpYndlYnAtJChXRUJQ
X1ZFUlNJT04pLnRhci5nego+ICBXRUJQX1NJVEUgPSBodHRwOi8vZG93bmxvYWRzLndlYm1wcm9q
ZWN0Lm9yZy9yZWxlYXNlcy93ZWJwCj4gIFdFQlBfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+IC0t
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
