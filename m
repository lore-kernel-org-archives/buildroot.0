Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E61C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A32C418BC;
	Tue, 25 Jul 2023 21:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A32C418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68jppPE43RqP; Tue, 25 Jul 2023 21:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A381A41911;
	Tue, 25 Jul 2023 21:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A381A41911
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46F701BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2091B81AEA
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2091B81AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAy08zDuEuXP for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:13:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13C3881AD1
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C3881AD1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 66DB77802E5;
 Tue, 25 Jul 2023 23:13:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:13:54 +0200
Date: Tue, 25 Jul 2023 23:13:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211354.GX3544423@scaer>
References: <20230725103207.941558-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103207.941558-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319636;
 bh=mtuQTXIkK/2hZXVZz/NLkOohwbTSdwqa30TToZ4lVEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OoxojF+d0i9ZSUlLQ7N5OPnB1C/CIMin8eh63zYYHTjE9nAdbhM+IlOQ/3h3BWCoc
 4dyDR3g82HLgyr6kxbRc9sGYnIRxn7cp0/fmeFL2vlz194AyBzzwUOzF6RYb1rSn5O
 0L8OTdXxw6llcZT9axCpp4yOvx8bb1w8YgmEEX8lZBvaCYVIePwzjZsxoS47LF4qLs
 60zMBmzRbfAg/XZ2qcC51cmh07lvK1Y9b3zqgm+iztIG5/sHOw1AfN72Q0OBOfdrAW
 +YEwnyp9Ak1wpB653ofEu4gurYmdpwclkO9YdxpJH182Q4fwwaeR+UU6/0PGUT0FaX
 kMe1oRjljV+ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OoxojF+d
Subject: Re: [Buildroot] [PATCH] package/parted: bump to version 3.6
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
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BhcnRlZC9wYXJ0ZWQuaGFzaCB8IDIg
Ky0KPiAgcGFja2FnZS9wYXJ0ZWQvcGFydGVkLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3BhcnRlZC9wYXJ0ZWQuaGFzaCBiL3BhY2thZ2UvcGFydGVkL3BhcnRlZC5oYXNoCj4gaW5k
ZXggOGExNjdkOWJiLi42NjQzYmE5ZmIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wYXJ0ZWQvcGFy
dGVkLmhhc2gKPiArKysgYi9wYWNrYWdlL3BhcnRlZC9wYXJ0ZWQuaGFzaAo+IEBAIC0xLDUgKzEs
NSBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJl
Cj4gLXNoYTI1NiAgNDkzOGRkNWMxYzEyNWY2Yzc4YjFmNGIzZTI5NzUyNmYxOGVlNzRhYTQzZDQ1
YzI0ODU3OGIxZDI0NzBjMDVhMiAgcGFydGVkLTMuNS50YXIueHoKPiArc2hhMjU2ICAzYjQzZGJl
MzNjY2EwZjlhMTg2MDFlYmFiNTZiNzg1MmIxMjhlYzFhM2RmM2E5YjMwY2NkZTVlNzMzNTllNjEy
ICBwYXJ0ZWQtMy42LnRhci54ego+ICAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2
ICAwYWJiZmY4MTRjZDAwZTJiMGI2ZDA4Mzk1YWYyYjQxOWMxYTkyMDI2YzRiNGFkYWNiYjY1Y2Nk
YTQ1ZmE1OGNmICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGFydGVkL3BhcnRlZC5t
ayBiL3BhY2thZ2UvcGFydGVkL3BhcnRlZC5tawo+IGluZGV4IDZkNDYyNmUyZS4uYmZkOWVmMzQz
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGFydGVkL3BhcnRlZC5tawo+ICsrKyBiL3BhY2thZ2Uv
cGFydGVkL3BhcnRlZC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gIAo+IC1QQVJURURfVkVSU0lPTiA9IDMuNQo+ICtQQVJURURfVkVSU0lPTiA9
IDMuNgo+ICBQQVJURURfU09VUkNFID0gcGFydGVkLSQoUEFSVEVEX1ZFUlNJT04pLnRhci54ego+
ICBQQVJURURfU0lURSA9ICQoQlIyX0dOVV9NSVJST1IpL3BhcnRlZAo+ICBQQVJURURfREVQRU5E
RU5DSUVTID0gaG9zdC1wa2djb25mIHV0aWwtbGludXgKPiAtLSAKPiAyLjM5LjIKPiAKPiBfX19f
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
