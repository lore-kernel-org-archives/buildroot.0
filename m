Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF2EC001DF
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 14:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F309A612CC;
	Sun, 22 Oct 2023 14:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F309A612CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjTAM0sp9ZRu; Sun, 22 Oct 2023 14:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4B66125C;
	Sun, 22 Oct 2023 14:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A4B66125C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4D201BF276
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E452852F6
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 14:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E452852F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKPeM1cbMJkY for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 14:10:32 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795DF852AC
 for <buildroot@busybox.net>; Sun, 22 Oct 2023 14:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 795DF852AC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C012860129;
 Sun, 22 Oct 2023 16:10:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 16:10:28 +0200
Date: Sun, 22 Oct 2023 16:10:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231022141028.GK2607@scaer>
References: <20231020161902.48876-1-francois.perrad@gadz.org>
 <20231020161902.48876-2-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020161902.48876-2-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697983830;
 bh=3B5jkIblxrUy8BH1oVPYBb6M1o6wvOhp+2BVVLMyWL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEafh1veGjRxIluqtA1UgeIiRu5/lbCNQe6f0eKpDabYUCmLWw80Mcz0jbXxQWIRh
 xO/TdGAn4iMXG4wKqDNnj4bVkh16PhsNHaV66mhWYJsJfIlc+z1SlPTHKPlBYfwmc8
 DYDjmkwEWrYEQ2FuokmsyJInbyskmfqgE/uWIZCy6Sbl9mMroqT9QO1tECaRlzEWuv
 mbLpk1h9tXCkC+5etWc0yoiNfsDHvUo8q0GpPvppU9sVMpUjKBT7IIr7zfiVnwLF1P
 xX74674LkCgAQVwftt9W2Vs1XoAPBYHJhhhEJCzlKN/Lh27ltrE7433dXQxoEVh1mv
 y3ZUHuZ2X1TVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aEafh1ve
Subject: Re: [Buildroot] [PATCH 2/2] package/perl-mojolicious: bump to
 version 9.34
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTEwLTIwIDE4OjE5ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKSSBkaWQgbm90IHNlZSBhIGRlcGVuZGVuY3kgZnJvbSBtb2pv
bGljaW91cyB0byBuZXQtc3NoMiAodGhlIGZpcnN0IHBhdGNoCmluIHRoZSBzZXJpZXMpLCBzbyBJ
IGFzc3VtZWQgaXQgd2FzIE9LIHRvIGFwcGx5IG1vam9saWNpb3VzIGV2ZW4gaWYKbmV0LXNzaDIg
d2FzIG5vdCBhcHBsaWVkLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BlcmwtbW9qb2xpY2lvdXMvcGVybC1tb2pv
bGljaW91cy5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcGVybC1tb2pvbGljaW91cy9wZXJsLW1v
am9saWNpb3VzLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtbW9qb2xpY2lv
dXMvcGVybC1tb2pvbGljaW91cy5oYXNoIGIvcGFja2FnZS9wZXJsLW1vam9saWNpb3VzL3Blcmwt
bW9qb2xpY2lvdXMuaGFzaAo+IGluZGV4IDZkOGY1MDAxNS4uZGRmMjdhODA4IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcGVybC1tb2pvbGljaW91cy9wZXJsLW1vam9saWNpb3VzLmhhc2gKPiArKysg
Yi9wYWNrYWdlL3BlcmwtbW9qb2xpY2lvdXMvcGVybC1tb2pvbGljaW91cy5oYXNoCj4gQEAgLTEs
NiArMSw2IEBACj4gICMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cHM6Ly9jcGFuLm1l
dGFjcGFuLm9yZy8KPiAtbWQ1ICBlMDZjZTYxMWRkMjQ0NGYyY2E1Yjc0ZjNhOTEwYjY3OSAgTW9q
b2xpY2lvdXMtOS4zMi50YXIuZ3oKPiAtc2hhMjU2ICBiYzA0YzU1MmVlMjRlYWVjYzQ1ZmViODcw
OWQ0OWMyOTAxYmMyNmZiODJiNGExYThlMTc1NzRlMWNjYTA4M2RjICBNb2pvbGljaW91cy05LjMy
LnRhci5nego+ICttZDUgIDUzMGU2ODJjMTAxZWRhNmNhYTBiNjU0MzhhMGI3MDRkICBNb2pvbGlj
aW91cy05LjM0LnRhci5nego+ICtzaGEyNTYgIDUwNjlkNjhlNGUyZDhhZDY2M2RiNTg4NTliNGZl
YzBjZTc5YWIxMzRkOWU1ODA1NWFhYWYzZjBmM2E3M2EyYzYgIE1vam9saWNpb3VzLTkuMzQudGFy
Lmd6Cj4gIAo+ICAjIGNvbXB1dGVkIGJ5IHNjYW5jcGFuCj4gIHNoYTI1NiAgMTllMmUwZjIwNzll
YTFjZTE1NzZlYjRlY2MwNTc1YjMzZmU0NWIyYjhlNzFmNGFhNTg5ZDZiZWRkMWRhNGUwYSAgTElD
RU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtbW9qb2xpY2lvdXMvcGVybC1tb2pvbGlj
aW91cy5tayBiL3BhY2thZ2UvcGVybC1tb2pvbGljaW91cy9wZXJsLW1vam9saWNpb3VzLm1rCj4g
aW5kZXggNjNiMDJhNTE4Li4wNDBmYmYwOGUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXJsLW1v
am9saWNpb3VzL3BlcmwtbW9qb2xpY2lvdXMubWsKPiArKysgYi9wYWNrYWdlL3BlcmwtbW9qb2xp
Y2lvdXMvcGVybC1tb2pvbGljaW91cy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1QRVJMX01PSk9MSUNJT1VTX1ZFUlNJT04gPSA5LjMy
Cj4gK1BFUkxfTU9KT0xJQ0lPVVNfVkVSU0lPTiA9IDkuMzQKPiAgUEVSTF9NT0pPTElDSU9VU19T
T1VSQ0UgPSBNb2pvbGljaW91cy0kKFBFUkxfTU9KT0xJQ0lPVVNfVkVSU0lPTikudGFyLmd6Cj4g
IFBFUkxfTU9KT0xJQ0lPVVNfU0lURSA9ICQoQlIyX0NQQU5fTUlSUk9SKS9hdXRob3JzL2lkL1Mv
U1IvU1JJCj4gIFBFUkxfTU9KT0xJQ0lPVVNfTElDRU5TRSA9IEFydGlzdGljLTIuMAo+IC0tIAo+
IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
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
