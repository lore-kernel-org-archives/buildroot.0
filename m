Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6914EC4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11CFD40291;
	Mon, 26 Dec 2022 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11CFD40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdnKg-7YYHAY; Mon, 26 Dec 2022 21:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B31D40496;
	Mon, 26 Dec 2022 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B31D40496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 561BE1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31EF8813B3
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31EF8813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30h_cOyMD7Rv for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:13:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38767813A9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38767813A9
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 21:13:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DCA147802E5;
 Mon, 26 Dec 2022 22:13:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 22:13:40 +0100
Date: Mon, 26 Dec 2022 22:13:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221226211340.GG2893@scaer>
References: <20221226074749.143619-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221226074749.143619-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672089223;
 bh=KzZYYi/q7mez7e1aFAH+dWjVvYRt+oRYGbGJuECqWOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnVpt1TVDo60I5CBOzYROFgHnaRef4FHfAU6JSafLYpG5fzOiiRnHhxh82XPFPA5x
 sPeqYFwCBfsj6pGugR5pdiMurQ3CkBnXe74rvCR/zZfmW/Fk/qpBv8sWmj2BWNLjw9
 FHFsRG0D1wKDudn8dkWNslrj7g9ELY+XS0R4eb6qnoE6L0f973nYj3qn6rLNVSPnTW
 J4OvgD9ERMqxtzxSG2/yOE2e+wHdgowwV9W1n6JCtg27B4u6ZjTkX6uMYceXLOeYdr
 Q6gcxuwDts86IzHTYw6Q3Zq7u3uvacYuX+rQfZM3IZv+aiymw8wHiMgmxKah6t+vDJ
 5Pjed08xARNPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SnVpt1TV
Subject: Re: [Buildroot] [PATCH] package/lua-cjson: bump to version 2.1.0.10
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTEyLTI2IDA4OjQ3ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2x1YS1janNvbi9Db25maWcuaW4gICAg
ICB8IDIgKy0KPiAgcGFja2FnZS9sdWEtY2pzb24vbHVhLWNqc29uLmhhc2ggfCAyICstCj4gIHBh
Y2thZ2UvbHVhLWNqc29uL2x1YS1janNvbi5tayAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9sdWEtY2pzb24vQ29uZmlnLmluIGIvcGFja2FnZS9sdWEtY2pzb24vQ29uZmlnLmluCj4gaW5k
ZXggOTQ3NGIzMTc2Li4xYzE1M2ZhNDYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEtY2pzb24v
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9sdWEtY2pzb24vQ29uZmlnLmluCj4gQEAgLTEyLDQg
KzEyLDQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xVQV9DSlNPTgo+ICAKPiAgCSAgKEMtbW9kdWxl
KQo+ICAKPiAtCSAgaHR0cDovL3d3dy5reW5lLmNvbS5hdS9+bWFyay9zb2Z0d2FyZS9sdWEtY2pz
b24ucGhwCj4gKwkgIGh0dHBzOi8vd3d3Lmt5bmUuY29tLmF1L35tYXJrL3NvZnR3YXJlL2x1YS1j
anNvbi5waHAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEtY2pzb24vbHVhLWNqc29uLmhhc2gg
Yi9wYWNrYWdlL2x1YS1janNvbi9sdWEtY2pzb24uaGFzaAo+IGluZGV4IGIwNTJjNTE5OS4uNWRk
YzA3YmNjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhLWNqc29uL2x1YS1janNvbi5oYXNoCj4g
KysrIGIvcGFja2FnZS9sdWEtY2pzb24vbHVhLWNqc29uLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAK
PiAgIyBjb21wdXRlZCBieSBsdWFyb2Nrcy9idWlsZHJvb3QKPiAtc2hhMjU2ICA0NTVmYTdkMDdk
OGFjOWQ2MWY2OGY1Mzg5NThmOGUyODk3MjI1NmYzOGIwYTFjMjc0MDg3M2RhZjgwOWQxODM3ICBs
dWEtY2pzb24tMi4xLjAuNi0xLnNyYy5yb2NrCj4gK3NoYTI1NiAgMDJkZWEzNjhkMDc3NTM2NDdj
NzViZDllNjY2MGRkNGQwNmZmN2QwOTk1NmQ5MGQ1YWZjNGMzZjViNzhlZDE4NyAgbHVhLWNqc29u
LTIuMS4wLjEwLTEuc3JjLnJvY2sKPiAgc2hhMjU2ICA5NTc2ZTgyZWY1MDEzZmJlODBiM2JkNDQ2
YTdkOWRkZDQ3MzI4YmFhMjE4NmMzMWQzZDg4NWUyYTlhOGNkMzFlICBsdWEtY2pzb24vTElDRU5T
RQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS1janNvbi9sdWEtY2pzb24ubWsgYi9wYWNrYWdl
L2x1YS1janNvbi9sdWEtY2pzb24ubWsKPiBpbmRleCBlMDI5ZGFiNWMuLmUwOGQyMzAwNiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2x1YS1janNvbi9sdWEtY2pzb24ubWsKPiArKysgYi9wYWNrYWdl
L2x1YS1janNvbi9sdWEtY2pzb24ubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTFVBX0NKU09OX1ZFUlNJT04gPSAyLjEuMC42LTEKPiAr
TFVBX0NKU09OX1ZFUlNJT04gPSAyLjEuMC4xMC0xCj4gIExVQV9DSlNPTl9TVUJESVIgPSBsdWEt
Y2pzb24KPiAgTFVBX0NKU09OX0xJQ0VOU0UgPSBNSVQKPiAgTFVBX0NKU09OX0xJQ0VOU0VfRklM
RVMgPSAkKExVQV9DSlNPTl9TVUJESVIpL0xJQ0VOU0UKPiAtLSAKPiAyLjM3LjIKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
