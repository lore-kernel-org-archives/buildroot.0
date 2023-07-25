Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8347EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A41418A0;
	Tue, 25 Jul 2023 21:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57A41418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hsAHm5wRbeW; Tue, 25 Jul 2023 21:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240C641928;
	Tue, 25 Jul 2023 21:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240C641928
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71C301BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C0028201C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C0028201C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2l6Q6vQQGk0s for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:14:17 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4444481FFE
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4444481FFE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 969B07802D1;
 Tue, 25 Jul 2023 23:14:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:14:13 +0200
Date: Tue, 25 Jul 2023 23:14:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211413.GY3544423@scaer>
References: <20230725103216.941579-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103216.941579-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319655;
 bh=/ElXRwctNNhkR2abImeeYie4ciOx4ROaBqqTAC8vCVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NARCNOVsLH76NOtdEVYHZ31Bj9apiBZBC5WR0dSui18BIZENOgP+kZYBm+AfqpwJB
 O/hm8nT1Bui/ZzRKvizxjnPsjkZwh1CHqcUTs5bqqkOtP/IbL5GMrJrB4kiX5iWDWc
 FUIBzvO+rr4sevQXjlZy215084rWA5V3dIvqcr6tnP5ajmAw4b6TYvp/jkaUJkt9iB
 6lyAetMZjPSLp5dq+xETxJh41jGKgqCdPxMRDyJ9SG7wLplBaoZmot94e89OC2NcI/
 tebUDIzr5qDiski8W9gguGRlj8IoR5T4Heeo7Gql/CmaELKbPY48h7pbyrXY4naUsJ
 5y5oMGEeWJCsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NARCNOVs
Subject: Re: [Buildroot] [PATCH] package/tree: bump to version 2.1.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTI1IDEyOjMyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3RyZWUvdHJlZS5oYXNoIHwgMiArLQo+
ICBwYWNrYWdlL3RyZWUvdHJlZS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90cmVl
L3RyZWUuaGFzaCBiL3BhY2thZ2UvdHJlZS90cmVlLmhhc2gKPiBpbmRleCAyOTgxNTNjODkuLjll
ZjQ4YjFlNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RyZWUvdHJlZS5oYXNoCj4gKysrIGIvcGFj
a2FnZS90cmVlL3RyZWUuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY2FsY3Vs
YXRlZAo+IC1zaGEyNTYgIDdkNjkzYTFkODhkM2M0ZTcwYTczZTAzYjhkYmJkYzEyYzI5NDVkNDgy
NjQ3NDk0ZjJmNWJkODNhNDc5ZWVlYWYgIHRyZWUtMi4wLjIudGd6Cj4gK3NoYTI1NiAgZDNjM2Q1
NWY0MDNhZjdjNzY1NTY1NDYzMjVhYTFlY2E5MGI5MThjYmFhZjZkM2FiNjBhNDlkODM2N2FiOTBk
NSAgdHJlZS0yLjEuMS50Z3oKPiAgc2hhMjU2ICAyMDRkOGVmZjkyZjk1YWFjNGRmNmM4MTIyYmMx
NTA1ZjQ2OGYzYTkwMWU1YTRjYzA4OTQwZTBlZGUxOTM4OTk0ICBMSUNFTlNFCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvdHJlZS90cmVlLm1rIGIvcGFja2FnZS90cmVlL3RyZWUubWsKPiBpbmRleCBk
YTBhY2JhZTQuLjgzYTQyN2I3NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RyZWUvdHJlZS5tawo+
ICsrKyBiL3BhY2thZ2UvdHJlZS90cmVlLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVRSRUVfVkVSU0lPTiA9IDIuMC4yCj4gK1RSRUVf
VkVSU0lPTiA9IDIuMS4xCj4gIFRSRUVfU09VUkNFID0gdHJlZS0kKFRSRUVfVkVSU0lPTikudGd6
Cj4gIFRSRUVfU0lURSA9IGh0dHA6Ly9tYW1hLmluZHN0YXRlLmVkdS91c2Vycy9pY2UvdHJlZS9z
cmMKPiAgVFJFRV9MSUNFTlNFID0gR1BMLTIuMCsKPiAtLSAKPiAyLjM5LjIKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
