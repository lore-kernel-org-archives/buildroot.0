Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C937ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 11:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D575417C3;
	Tue,  6 Sep 2022 11:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D575417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCN5WHZwHYko; Tue,  6 Sep 2022 11:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DCF417BC;
	Tue,  6 Sep 2022 11:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33DCF417BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F116A1BF337
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1D2780E48
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D2780E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1xFMuQKZ1ML for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 11:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D65B881A33
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D65B881A33
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 11:48:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6726B0057F;
 Tue,  6 Sep 2022 13:48:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 13:48:11 +0200
Date: Tue, 6 Sep 2022 13:48:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20220906114811.GZ1490660@scaer>
References: <20220906102322.899679-1-kory.maincent@bootlin.com>
 <20220906102322.899679-2-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906102322.899679-2-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662464897;
 bh=OZLPTtqjlfgySzR9F845gR6GRIE75RXBtEk9jye37Ao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H07ZiVq/MK45nVKJXyVXggZDQnSd6zSY8n6voKIVQ9rRS/Qw7jQZ471593qdu2NDU
 LcHez3oi9A8uHIqas/+qEx21K9Tvw6mHm76oF4/YANmuRikMiEmvUyJKNpH5qlmhv7
 yPObBf4SGVRsdZxpPBir/k7WoEaorZ290AhjS9wZEciIYmVQaHKWMoT0sl93HWhkdg
 uKD6glITOSG4uQGutaUMGe4IQ7dZJYBl9+nbcdK1bGzx/OMD+w3TMuPbhiocCrrt0H
 CKvcM7yIFybW7faQloITdUjkZSh1lVmVdrdRs7hcJUSCv9Fa8ifbKiitZ1kmV9T5I0
 v/vgxqzlvnd4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H07ZiVq/
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-pillow: remove
 host-python-pillow support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 thomas.petazzoni@bootlin.com, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjItMDktMDYgMTI6MjMgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEZyb206IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFp
bmNlbnRAYm9vdGxpbi5jb20+Cj4gCj4gaG9zdC1weXRob24tcGlsbG93IHdhcyBuZWVkZWQgdG8g
YnVpbGQgb3B0ZWUtb3MgZnJvbSBTVE1pY3JvZWxlY3Jvbmljcwo+IGR1cmluZyBpdHMgcmMgdmVy
c2lvbnMgYnV0IGlzIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBpbiB0aGUgcmVsZWFzZS4KPiBJdCBp
cyB0aGVuIHVzZWxlc3MgdG8ga2VlcCB0aGlzIHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
S29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9w
eXRob24tcGlsbG93L3B5dGhvbi1waWxsb3cubWsgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0
aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rIGIvcGFja2FnZS9weXRob24tcGlsbG93L3B5dGhv
bi1waWxsb3cubWsKPiBpbmRleCA3Y2ZmNTRlOWVhLi4zMTcyNWEzZTQ2IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCj4gKysrIGIvcGFja2FnZS9w
eXRob24tcGlsbG93L3B5dGhvbi1waWxsb3cubWsKPiBAQCAtNzEsMTggKzcxLDQgQEAgZWxzZQo+
ICBQWVRIT05fUElMTE9XX0JVSUxEX09QVFMgKz0gLS1kaXNhYmxlLXdlYnAgLS1kaXNhYmxlLXdl
YnBtdXgKPiAgZW5kaWYKPiAgCj4gLUhPU1RfUFlUSE9OX1BJTExPV19ERVBFTkRFTkNJRVMgPSBo
b3N0LXBrZ2NvbmYKPiAtSE9TVF9QWVRIT05fUElMTE9XX0JVSUxEX09QVFMgPSBcCj4gLQlidWls
ZF9leHQgXAo+IC0JLS1kaXNhYmxlLWZyZWV0eXBlIFwKPiAtCS0tZGlzYWJsZS1qcGVnIFwKPiAt
CS0tZGlzYWJsZS1sY21zIFwKPiAtCS0tZGlzYWJsZS14Y2IgXAo+IC0JLS1kaXNhYmxlLWpwZWcy
MDAwIFwKPiAtCS0tZGlzYWJsZS10aWZmIFwKPiAtCS0tZGlzYWJsZS13ZWJwIFwKPiAtCS0tZGlz
YWJsZS13ZWJwbXV4Cj4gLUhPU1RfUFlUSE9OX1BJTExPV19JTlNUQUxMX09QVFMgPSAkKEhPU1Rf
UFlUSE9OX1BJTExPV19CVUlMRF9PUFRTKQo+IC0KPiAgJChldmFsICQocHl0aG9uLXBhY2thZ2Up
KQo+IC0kKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPiAtLSAKPiAyLjI1LjEKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
