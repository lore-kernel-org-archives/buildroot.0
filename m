Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224E3C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601274199B;
	Sun, 14 Aug 2022 17:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601274199B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ieyzGLrKnqx; Sun, 14 Aug 2022 17:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE4241990;
	Sun, 14 Aug 2022 17:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE4241990
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4AD81BF359
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DBE741990
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DBE741990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Moh5xEzeHF-i for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 17:51:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 667F94198A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 667F94198A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 17:51:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 72FDE60132;
 Sun, 14 Aug 2022 19:51:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 19:51:22 +0200
Date: Sun, 14 Aug 2022 19:51:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20220814175122.GH2854108@scaer>
References: <a79265c3-bb87-b896-eb44-a8d96392d220@grenoble.cnrs.fr>
 <CA+TH9VkvGR70Tyi4--fWok28o_3QiwKvxBHhM2d=hrs5OvqLsg@mail.gmail.com>
 <13d1b5f3-0571-66db-4f9e-064f586847ab@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13d1b5f3-0571-66db-4f9e-064f586847ab@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660499486;
 bh=LvyGTzd6LNus7pKmz2JVjt03G2T+QqMzcsRYd65smWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uMrIhjqAFGUX5a1HO0K0dqXbCLIGHm9I2O23HXQLcwZvuXWoHaIejavqPRGSSgZpC
 vVUJPk/IOsypTIPMu1smj6riGDR9jCLdojzzo+43p0ZJ3SQCtZF++CSWxvj/9zIug7
 fqVbQYV6ekqkiGvSywI/JedyHpzUbGApZpPNkx0SREuynXUJucc3T/+1W90QN81L74
 SczVSncMbYlm6llqQme9ARJtKiozdGxn/Ve7Nj2og6PMSQEyt/WQwj01iXTOEdB5bZ
 3WwqwNLWKC5dmzYEpSl2u/pvBsXChjmNZYAs6DEAOGX/iu++fSLAJiWJpsDL/Ql9VB
 8JyvEYtxyBm5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uMrIhjqA
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: speed up DHCP lease
 acquisition
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
 Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWRnYXIsIEFuZ2VsbywgQWxsLAoKT24gMjAyMi0wOC0xNCAwMDoyNSArMDIwMCwgRWRnYXIgQm9u
ZXQgc3Bha2UgdGh1c2x5Ogo+IE9uIDEzLzA4LzIwMjIgMjM6MzYsIEFuZ2VsbyBDb21wYWdudWNj
aSB3cm90ZToKPiA+IEkgc3VnZ2VzdCBjaGVja2luZyB3aHkgb2J0YWluaW5nIHRoZSBsZWFzZSBm
YWlscyBvbiB5b3VyIGJvYXJkIG9uIHRoZQo+ID4gZmlyc3QgdHJ5Cj4gCj4gV2hhdCBXaXJlc2hh
cmsgc2hvd3MsIGlzIHRoYXQgb24gdGhlIGZpcnN0IHRyeSB0aGUgaG9zdCB0b29rIHRocmVlCj4g
c2Vjb25kcyB0byByZXNwb25kIHRvIHRoZSBESENQIHJlcXVlc3QuIFRocmVlIHNlY29uZHMgaXMg
anVzdCB0aGUKPiB0aW1lb3V0IG9mIHVkaGNwYywgc28gaXQgaGFkIGp1c3QgZ2l2ZW4gdXAgd2Fp
dGluZyBmb3IgdGhlIHJlc3BvbnNlLgo+IFRoaXMgZG9lcyBub3Qgc2VlbSB0byBiZSBib2FyZC1z
cGVjaWZpYyB0byBtZS4KCkkgcmVhbGx5IHBvbmRlcmVkIHRoaXMgYW5kIEFuZ2VsbydzIGNvbmNl
cm5zLCBidXQgaW4gdGhlIGVuZCBJIHRvbwpiZWxpZXZlIHRoaXMgaXMgbm90IGJvYXJkLXNwZWNp
ZmljLCBhbmQgaXMgYSB3ZWxjb21lIGZpeCwgc28gSSBhcHBsaWVkCnRvIG1hc3Rlci4KClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+IEkgZG8gbm90IGtub3cgd2h5IHRoZSBob3N0cyBkb2VzIG5v
dCByZXNwb25kIGZhc3Rlci4gSXQgaXMgYSBxdWl0ZQo+IHZhbmlsbGEgVWJ1bnR1IDIwLjA0LCB3
aXRoIHRoZSBFdGhlcm5ldCBwb3J0IGNvbmZpZ3VyZWQgYXMg4oCcU2hhcmVkIHRvCj4gb3RoZXIg
Y29tcHV0ZXJz4oCdLgo+IAo+IFJlZ2FyZHMsCj4gCj4gRWRnYXIuCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
