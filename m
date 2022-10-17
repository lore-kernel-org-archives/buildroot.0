Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCE2C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57DCF41819;
	Mon, 17 Oct 2022 18:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57DCF41819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg16SwjPqs3m; Mon, 17 Oct 2022 18:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CA3417E6;
	Mon, 17 Oct 2022 18:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CA3417E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F24B61BF322
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0DB405AB
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0DB405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPJ9SOlofK3S for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:04:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4EC6405A2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4EC6405A2
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:04:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:388f:ffd7:682:9f45])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 79484B0059A;
 Mon, 17 Oct 2022 20:03:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Oct 2022 20:03:50 +0200
Date: Mon, 17 Oct 2022 20:03:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20221017180350.GC3666@scaer>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-4-thomas.perale@mind.be>
 <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666029842;
 bh=dshsWaiCgg2v8uMTikOR5bctLWAY7AEkWSQm/R8lzVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=te77tW6awl+VQyV2P2KgawL4mc+LgH3ytvcOkz0xj1lqxFymAsRvvyFElghcZTUYL
 m3uz+oVhfPMcnkabY8CZlurlV1q2Q90ArI5+QIpuFXwWmxtSYuxBzVSRUTbiaQZ51e
 BPkDGhNzNU7+jU5gHnrtDEtPcN8CoTvOnGpLU9DlbuGDW6kDQPIvA3HnVXVzQqVO8r
 D0vpVuupQoFD0d49uh5oz5L3MAuG+po8naGMPLdmMij1o1W6mkJ+JYrC/uMLlxSiGp
 cZ3QaG6XY6YS4CPQWnzMs3/ZmE5C1UNZV9b5qT9zFX1sbc21sNoEQ3RmJa1sor+WHK
 ouXUzJkNdevxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=te77tW6a
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDIyLTEwLTE3IDA5OjA1IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBIaSBhbGwsCj4gVGhpcyBsb29rcyBp
bnRlcmVzdGluZywgb25lIHJlcXVlc3QgdGhvdWdoLi4uCj4gCj4gT24gTW9uLCBPY3QgMTcsIDIw
MjIsIDc6MjkgQU0gVGhvbWFzIFBlcmFsZSA8IFsxXXRob21hcy5wZXJhbGVAZXNzZW5zaXVtLmNv
bT4gd3JvdGU6Cj4gPiArwqAgwqAgwqAgwqAjIERlZmF1bHQgdG8gaG9zdC1nby1iaW4KPiAKPiAg
ICvCoCDCoCDCoCDCoGRlZmF1bHQgImhvc3QtZ28tYmluIiBpZiBCUjJfUEFDS0FHRV9IT1NUX0dP
X0JJTgo+ICAgK8KgIMKgIMKgIMKgZGVmYXVsdCAiaG9zdC1nbyIgaWYgQlIyX1BBQ0tBR0VfSE9T
VF9HTwo+IAo+IFBsZWFzZSBkb24ndCBkZWZhdWx0IHRvIGRvd25sb2FkaW5nIHNvbWV0aGluZyBw
cmVkb21waWxlZC4gRXNwZWNpYWxseSB3aGVuIHRoZSBiZWhhdmlvciBjdXJyZW50bHkgZGVmYXVs
dHMgdG8gY29tcGlsaW5nIGV2ZXJ5dGhpbmcKPiBmcm9tIHNvdXJjZS4KCkFncmVlZC4gVGhlIGRl
ZmF1bHQgc2hvdWxkIGJlIHRvIGJ1aWxkIGV2ZXJ5dGhpbmcgZnJvbSBzb3VyY2Ugd2hlbgpzb3Vy
Y2VzIGFyZSBhdmFpbGFibGUuIFRoZSBwcmUtYnVpbHQgcGFja2FnZXMgYXJlIG9ubHkgYSBmYWxs
YmFjayBhcwphIGNvbnZlbmllbmNlIGZvciB0aG9zZSB0aGF0IGFyZSB0b28gbXVjaCBpbiBhIGh1
cnJ5LgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gVGhhbmtzLAo+IENocmlzdGlhbiBTdGV3
YXJ0Cj4gCj4gTGlua3M6Cj4gMS4gbWFpbHRvOnRob21hcy5wZXJhbGVAZXNzZW5zaXVtLmNvbQoK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
