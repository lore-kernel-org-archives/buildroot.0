Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD01C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 09:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4F341978;
	Sun, 14 Aug 2022 09:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4F341978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7It0-7HvW8g; Sun, 14 Aug 2022 09:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA1FA41727;
	Sun, 14 Aug 2022 09:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA1FA41727
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAE441BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9377083EC6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9377083EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxcaNh2oCOFP for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 09:40:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4428F83EC5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4428F83EC5
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 09:40:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CBB0E60143;
 Sun, 14 Aug 2022 11:40:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 11:40:47 +0200
Date: Sun, 14 Aug 2022 11:40:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814094047.GD2854108@scaer>
References: <20220814090621.1226531-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814090621.1226531-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660470050;
 bh=RvzBN5mfmzmMJQHCNJ0tLTX9f5t55xoed0ZJolSGubs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBgJRYtcoNGnm5AnoitXrmVg1wB4o4Hr1IxPd4LB4vL35SOrO8MaNFphnsCZAViNf
 /l1fAw/u0Nl0bGgv/vUNHH+mwaDh1FhWi/IHliWQNAUXyzhmVKt0wTQJ9NMVjszZwb
 pub5F0V3qRCAUavl1bPfu9wSNVuzXBFG6VBKZFMJRnKQ1gCUWuJFu9/g8jHGNslQNS
 N1O1WdGRBa6K3CXE37GR/3FcF8F2Nm70dFuR6xHMwqabSf/S8o0CRMvHUJ8Er/vfdr
 5rPyjonUmPIauWVvm+47gDa9ZWfa1iuKqVO8Xn8iaXv672usPYrRASJ59tHtwyCZen
 BGNnEFKd+X/5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oBgJRYtc
Subject: Re: [Buildroot] [PATCH] package/sqlite: security bump to version
 3.39.2
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDExOjA2ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGFwcGx5IGZpeCBmb3IgQ1ZFLTIwMjItMzU3MzcKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0K
PiAgcGFja2FnZS9zcWxpdGUvc3FsaXRlLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uvc3FsaXRlL3Nx
bGl0ZS5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUuaGFz
aCBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoCj4gaW5kZXggZDZhNzRjZDRjLi5kNWFmMjI5
N2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zcWxpdGUvc3FsaXRlLmhhc2gKPiArKysgYi9wYWNr
YWdlL3NxbGl0ZS9zcWxpdGUuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY29t
cHV0ZWQKPiAtc2hhMjU2ICBlOTBiY2FlZjZkZDU4MTNmY2RlZTRlODY3ZjZiNjVmM2M5YmZkMGFl
YzBmMTAxN2Y5ZjNiYmNlMWU0ZWQwOWUyICBzcWxpdGUtYXV0b2NvbmYtMzM5MDAwMC50YXIuZ3oK
PiArc2hhMjU2ICA4NTJiZThhNjE4M2ExN2JhNDdjZWUwYmJmZjc0MDBiN2FhNWFmZmQyODNiZjNi
ZWVmYzM0ZmNkMDg4YTIzOWRlICBzcWxpdGUtYXV0b2NvbmYtMzM5MDIwMC50YXIuZ3oKPiAgc2hh
MjU2ICA2NmUwNTZiNmU4Njg3ZjMyYWYzMGQ1MTg3NjExYjk4YjEyYThmNDZmMDdhYWY2MmY0MzU4
NWYyNzZlOGYwYWM5ICB0ZWEvbGljZW5zZS50ZXJtcwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Nx
bGl0ZS9zcWxpdGUubWsgYi9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsKPiBpbmRleCBjYzlmN2U2
NzkuLjAxZGJiMTUzYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsKPiAr
KysgYi9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtU1FMSVRFX1ZFUlNJT04gPSAzLjM5LjAKPiAt
U1FMSVRFX1RBUl9WRVJTSU9OID0gMzM5MDAwMAo+ICtTUUxJVEVfVkVSU0lPTiA9IDMuMzkuMgo+
ICtTUUxJVEVfVEFSX1ZFUlNJT04gPSAzMzkwMjAwCj4gIFNRTElURV9TT1VSQ0UgPSBzcWxpdGUt
YXV0b2NvbmYtJChTUUxJVEVfVEFSX1ZFUlNJT04pLnRhci5nego+ICBTUUxJVEVfU0lURSA9IGh0
dHBzOi8vd3d3LnNxbGl0ZS5vcmcvMjAyMgo+ICBTUUxJVEVfTElDRU5TRSA9IFB1YmxpYyBkb21h
aW4KPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
