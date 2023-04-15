Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D28C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 295FE6079D;
	Sat, 15 Apr 2023 15:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295FE6079D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYwPpnMxk_ov; Sat, 15 Apr 2023 15:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 714F860758;
	Sat, 15 Apr 2023 15:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714F860758
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA991C404B
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08BAA405CD
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 15:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BAA405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-E4XhOrkRDB for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 15:27:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 320F540195
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 320F540195
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 15:27:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1269B5FFAC;
 Sat, 15 Apr 2023 17:27:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 17:27:00 +0200
Date: Sat, 15 Apr 2023 17:27:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Ott <stefan@ott.net>, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20230415152700.GN2819@scaer>
References: <20230412222640.109345-1-stefan@ott.net>
 <20230415151633.GM2819@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415151633.GM2819@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681572426;
 bh=7M5Lb8rGiTLC0i8hh3Z9aKkTAglEglt9imknwG2STjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6Q+qhRfu/N1g7aLa4jq098l1YNp9iZAVgGUgpReZIsAQHiRiCmzQBRNuJgvUoEtQ
 XgS2JUiRe5xJ5iE6+GzaouSMZtJUiteIeBwQ9SFkavqbxN4fAttpmXCq+//5yjIDVB
 hBehixlbiM20HKMAkGYU+YQ4oN7UoDPoHHszNWXNGjJqq1Mk08AXNS1i9VQ+LnmJ4y
 qyZ8fj18XNc5bXIX7PWnCeukL3Q6xJ6EauTVq0pGaSrpyOESiKxcHHCx46uwY44wDW
 DUfDGd1D+W4utJii1h09Op5Fw1FhHuObwzpan8I9dKJKPtTcp6Nfc94+rfviDo2e2G
 AoM3RJ1O9E9Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q6Q+qhRf
Subject: Re: [Buildroot] [PATCH 1/1] package/libgtk3: Remove atk-bridge from
 .pc file
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
Cc: Daniel Lang <d.lang@abatec.at>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRyacOhbiwgQWxsLAoKK1Rob21hcywgK0RhbmllbCwKCk9uIDIwMjMtMDQtMTUgMTc6MTYgKzAy
MDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1c2x5Ogo+IEFkcmnDoW4sIHF1ZXN0aW9uIGJlbG93
IGFsc28gZm9yIHlvdS4gOy0pClstLVNOSVAtLV0KPiBjb21taXQgbG9nIGZvciB0aGUgcGF0Y2gg
bWVudGlvbnMgdGhhdCBhdGstYnJpZGdlIHJlcXVpcmVzIGF0LXNwaTItY29yZQo+IGFuZCBhdC1z
cGkyLWF0aywgd2hpY2ggd2VyZSBub3QgcGFja2FnZWQgaW4gQnVpbGRyb290IGJhY2sgaW4gdGhl
IHRpbWUuCj4gSG93ZXZlciwgd2Ugbm93IGhhdmUgYm90aC4gU286IHNob3VsZCB3ZSBkcm9wIHRo
aXMgcGF0Y2gsIGFuZCBhZGQgdGhlCj4gZGVwZW5kZW5jeSBvbnRvIGF0LXNwaTItYXRrIChhbmQg
dGh1cyBhdC1zcGkyLWNvcmUpLCBub3c/CgpPSywgSSB0aGluayBJIGhhdmUgYW4gYW5zd2VyIG5v
dzoKICAgIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlz
dC8/c2VyaWVzPTM0MzgwMQoKSSdsbCBsb29rIGF0IHRoYXQgc2VyaWVzIG5vdy4uLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
