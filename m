Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053E7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67A3B40198;
	Sat, 11 Dec 2021 09:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLBjAz6gR2pZ; Sat, 11 Dec 2021 09:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F967401DC;
	Sat, 11 Dec 2021 09:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32FB71BF363
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D31742A26
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 09:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWZlN1rrjDu1 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 09:17:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02FF242A25
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 09:17:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AD6E7B00576;
 Sat, 11 Dec 2021 10:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639214225;
 bh=t68157cGRlWK1CyNLRK1puxDnM2d03GBiexVprBld24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTqqTXbWV9r0DFXq1ji/19IRI7EsaI3gSZITPqkzQFtpdKkohGNm3mLzQT56vE2Ml
 8i3hvkbW5luhcdti8KxPAIGAUMAehSagdyYagm5pgVatPaK8JDKVG2qmw6Mof/oI5b
 9jRIZ4M71t6OFTr69usI5rEXV7i0KMi4KguV3ueB+1IFKwVXIpXa7Y9pZVIxsB19NP
 6CtwIgB3DfizJ0qOwWjqbavt2ybGGDmdU/kBQnfgSJMNNK3iIKnqu2nVdQZUqTESTz
 iDDIhv6URTWIu8g4u5f9X0J/zJKADsqTphXrsgkTyWFcOwgC3JqR07N+XXHiJPcDLe
 MCAr/hWaaKXQg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Dec 2021 10:17:01 +0100
Date: Sat, 11 Dec 2021 10:17:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211211091701.GO2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
 <20211210201130.GL2603@scaer>
 <8186e105-a959-e35a-4506-1553b8d6c06e@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8186e105-a959-e35a-4506-1553b8d6c06e@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBKb3PDqSwgQWxsLAoKT24gMjAyMS0xMi0xMSAwOTo0MyArMDEwMCwgQXJub3V0IFZh
bmRlY2FwcGVsbGUgc3Bha2UgdGh1c2x5Ogo+IE9uIDEwLzEyLzIwMjEgMjE6MTEsIFlhbm4gRS4g
TU9SSU4gd3JvdGU6Cj4gPkpvc8OpLCBBbGwsCj4gPgo+ID5PbiAyMDIxLTEyLTEwIDE2OjEyICsw
MjAwLCBKb3PDqSBQZWtrYXJpbmVuIHNwYWtlIHRodXNseToKPiA+PkFkZCBwYWNrYWdlIHRvIGF2
b2NhZG8gZnJhbWV3b3JrJ3MgYWV4cGVjdC4KPiA+Pgo+ID4+U2lnbmVkLW9mZi1ieTogSm9zw6kg
UGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gPlstLVNOSVAtLV0KPiA+
PmRpZmYgLS1naXQgYS9wYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluIGIvcGFja2FnZS9hZXhwZWN0
L0NvbmZpZy5pbgo+ID4+bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PmluZGV4IDAwMDAwMDAwMDAu
LmVmYTJiZThiOTEKPiA+Pi0tLSAvZGV2L251bGwKPiA+PisrKyBiL3BhY2thZ2UvYWV4cGVjdC9D
b25maWcuaW4KPiA+PkBAIC0wLDAgKzEsMTIgQEAKPiA+Pitjb25maWcgQlIyX1BBQ0tBR0VfQUVY
UEVDVAo+ID4+Kwlib29sICJhZXhwZWN0Igo+ID4+KwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJ
QlMgIyBkbG9wZW4oKQo+ID4+KwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OCj4gPgo+ID5EbyBu
b3Qgc2VsZWN0IHB5dGhvbiwgZGVwZW5kIG9uIGl0Lgo+IAo+ICBXaHkgbm90PyBDdXJyZW50bHkg
d2UgaGF2ZSB0aGUgZm9sbG93aW5nIHBhY2thZ2VzIHRoYXQgc2VsZWN0IHB5dGhvbigzKToKPiBj
aWZzLXV0aWxzLCBkb2NrZXItY29tcG9zZSwgZHN0YXQsIGdsc2xzYW5kYm94LXBsYXllciwgZ3Bz
ZCwgamFjazIsCj4gbGlic2lncm9rZGVjb2RlLCBtaWRvcmksIG9wa2ctdXRpbHMsIHJhbmdlci4K
Ck5vbmUgc2VsZWN0cyBweXRob24gKGFrYSBweXRob24yLCB3aGljaCBpcyB3aGF0IEkgaW1wbGll
ZCB3aGVuIHdyaXRpbmcKJ3B5dGhvbicpOgoKICAgICQgZ2l0IGdyZXAgLUUgJ3NlbGVjdCBCUjJf
UEFDS0FHRV9QWVRIT05cPicKICAgIFtub25lLCBuYXVnaHQsIG5peCwgemlsY2hdCgpZZXMsIHRo
ZXkgZG8gaG93ZXZlciBzZWxlY3QgcHl0aG9uMy4KCkFuZCBzaW5jZSB3ZSBkbyB3YW50IHRvIGdl
dCByaWQgb2YgcHl0aG9uIChha2EgcHl0aG9uMiksIGl0IHdvdWxkIGJlCnZlcnkgZGlzYXBvaW50
aW5nIHRvIGludHJvZHVjZSBhIG5ldyBwYWNrYWdlIHRoYXQgaXMgcHl0aG9uMi1vbmx5LCBvcgp0
aGF0IGluY29uc2lkZXJhdGVseSBzZWxlY3RzIGl0LgoKPiAgQWN0dWFsbHksIHJhbmdlciBpcyBh
IGdyZWF0IGV4YW1wbGU6IGl0J3MgYWxzbyBhIHRvb2wgdGhhdCBpcyBqdXN0IGEgdG9vbAo+IGFu
ZCBqdXN0IGhhcHBlbnMgdG8gYmUgaW1wbGVtZW50ZWQgaW4gcHl0aG9uLiBTbyBzZWxlY3QgaXMg
YXBwcm9wcmlhdGUsIGxpa2UKPiB3ZSBkbyBmb3IgYW55IHRvb2wgdGhhdCBoYXBwZW5zIHRvIGJl
IGltcGxlbWVudGVkIGluIEdvLCBSdXN0LCAuLi4KPiAKPiAgSG93ZXZlciwgbm90ZSB0aGF0IHlv
dSBuZWVkIGVpdGhlcgo+IAo+IAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OMyBpZiAhQlIyX1BB
Q0tBR0VfUFlUSE9OCj4gb3IKPiAJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfUFlUSE9OCj4gCXNl
bGVjdCBCUjJfUEFDS0FHRV9QWVRIT04zCgpZZXMsIHRoaXMgaXMgd2hhdCBzaG91bGQgYmUgZG9u
ZS4KCkJ1dCBkZWZpbml0ZWx5IGRvIG5vdCBzZWxlY3QgcHl0aG9uIChha2EgcHl0aG9uMikuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
