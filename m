Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746D0C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFF4F83FB9;
	Sat, 20 Jan 2024 18:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFF4F83FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bzjwjOui684; Sat, 20 Jan 2024 18:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED5284446;
	Sat, 20 Jan 2024 18:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED5284446
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDA1B1BF409
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D0D421C3
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D0D421C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3WB8Nl7WvD0 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 18:16:14 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66D81420B0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 18:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D81420B0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5254C13F8B3;
 Sat, 20 Jan 2024 19:16:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 19:16:03 +0100
Date: Sat, 20 Jan 2024 19:16:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZawN46u8W5x-Mj-T@landeda>
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
 <20231121193448.1151936-3-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121193448.1151936-3-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705774571;
 bh=04yq/HP8Db3MrF3IL874sj2axulB/8uE0TzoZTGK2Ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jY3kP04/AWFY/ecQ8f7sL6r4gXUopqiiblNFjj00AdXTM2ryV1zTSI5fzBXyvosvO
 XfHdJCqqwmO9JWI4dbj8N/N68MOfShcF7QWxnHJwfisNgvP8lvdOwqjoL5toiC9QBZ
 Xtx73yir9MGVwd+ylWOVEJIfIy+joQF4cM8yL8MzjaakqCeKrODkVAok0/khzLW/3f
 PEY6LjRzpNQ4ZY/Elr+pCePSAZZL/RQgf5mOgVTQKhVzmT8b2Nqg5hNdkA3SG1l0bt
 VbFq6X5vcIyU2o2rU8l+1MGcVBvyTOP3CrzVV04Hnq3Q1xY/Z1ZrhnbhBPnZBfC5DW
 XIs0Ez9lQzDrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jY3kP04/
Subject: Re: [Buildroot] [v1 2/4] package/rpi-firmware: bump version for pi5
 support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDqWwsIEFsbCwKCk9uIDIwMjMtMTEtMjEgMjA6MzQgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gVGhpcyBidW1wcyB0byA3ZTljMjA2M2ZjMTUyNzRmYmM0ZGFiMWNhNjE0Zjky
Mjg4MzRkODgxWzFdIHRoYXQgc3RhdGVzCj4gIkFkZCBzdXBwb3J0IGZvciBQSSA1Ii4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+IC0tLQo+
ICBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaCB8IDIgKy0KPiAgcGFja2Fn
ZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaCBiL3BhY2thZ2UvcnBpLWZpcm13YXJl
L3JwaS1maXJtd2FyZS5oYXNoCj4gaW5kZXggZWMxMzExNWYzYi4uNjU5NjEzNTkxZCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaAo+ICsrKyBiL3Bh
Y2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4g
ICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDMzYWVhMmNiOWMzYmU5NGMzZGQ2YTk2ZmJi
MzQ0M2VlZTVhZjFkYzVmYzkxNDBlMWZhZGM1MDgzMjk4MzA2NGUgIHJwaS1maXJtd2FyZS0zZjIw
YjgzMmIyN2NkNzMwZGViNjQxOWI1NzBmMzFhOTgxNjdlZWY2LnRhci5nego+ICtzaGEyNTYgIGYz
NDQyZmI4MDk2NmZhZjFlMjhhMzJmOWQ5YjkxYWNiNGI4N2M2ZmYzM2YwY2VkNDE3OWVjNmNjYmZh
OTJjNjUgIHJwaS1maXJtd2FyZS03ZTljMjA2M2ZjMTUyNzRmYmM0ZGFiMWNhNjE0ZjkyMjg4MzRk
ODgxLnRhci5nego+ICBzaGEyNTYgIGM3MjgzZmY1MWY4NjNkOTNhMjc1YzY2ZTNiNGNiMDgwMjFh
NWRkNGQ4YzFlN2FjYzQ3ZDg3MmZiZTUyZDNkNmIgIGJvb3QvTElDRU5DRS5icm9hZGNvbQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgYi9wYWNrYWdl
L3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKPiBpbmRleCA1M2Q2ZDhjYTA2Li5lNzY1ZDBl
YTgyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+
ICsrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+IEBAIC00LDcgKzQs
NyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4gLVJQSV9GSVJNV0FSRV9W
RVJTSU9OID0gM2YyMGI4MzJiMjdjZDczMGRlYjY0MTliNTcwZjMxYTk4MTY3ZWVmNgo+ICtSUElf
RklSTVdBUkVfVkVSU0lPTiA9IDdlOWMyMDYzZmMxNTI3NGZiYzRkYWIxY2E2MTRmOTIyODgzNGQ4
ODEKCldlIGFyZSBub3cgdXNpbmcgYSB2ZXJzaW9uIG1vcmUgcmVjZW50IHRoYW4gdGhhdCAodGhh
dCB5b3UgYWxzbwpzdWJtaXR0ZWQpLCBzbyBJIG1hcmtlZCB0aGlzIGEgbm90LWFwcGxpY2FibGUu
CgpUaGFua3MhCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgUlBJX0ZJUk1XQVJFX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGZpcm13YXJlLCQoUlBJX0ZJUk1XQVJFX1ZFUlNJ
T04pKQo+ICBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICBSUElfRklSTVdB
UkVfTElDRU5TRV9GSUxFUyA9IGJvb3QvTElDRU5DRS5icm9hZGNvbQo+IC0tCj4gMi40Mi4xCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
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
