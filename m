Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1048C77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 15:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 278DC40BD2;
	Tue,  9 May 2023 15:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 278DC40BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYPomHaG87iQ; Tue,  9 May 2023 15:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51FC2405D1;
	Tue,  9 May 2023 15:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51FC2405D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1601BF20B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 15:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF8C684359
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 15:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8C684359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OagJ7GkS0i8K for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 15:41:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6699484354
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6699484354
 for <buildroot@buildroot.org>; Tue,  9 May 2023 15:41:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 829F0780511;
 Tue,  9 May 2023 17:41:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 17:41:24 +0200
Date: Tue, 9 May 2023 17:41:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20230509154124.GZ252090@scaer>
References: <20230419125200.3533794-1-raphael.melotte@mind.be>
 <20230508214525.GV252090@scaer>
 <7812dded-6b51-a8e9-e506-4eb44297e2ef@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7812dded-6b51-a8e9-e506-4eb44297e2ef@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683646886;
 bh=NGv4z1jhIZco1zLUDhx4qduJq84u1rBfWSmhKP5sDUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu9iL9ki4ddv8wzqealdMm3ILTXjD48mOmxl6V9nleAdgeQI3iLWGRq0JBd/9l1R/
 g85DB8g3Pe+8wVmOAFAXoHzbteZHZh21S4CP4OW3DFAcy2M/pE1d1OkGb/z2C4g+1q
 gyM5/NchLGG9m8vpAbcEvVRrrjHBNrJzLPZ7Y6922Eb58IE3YHYz+2ROTudSnuPYJk
 gt6Ji1oCDryZVBT12bYzn+irmy191KWC0Ydl3+qqVXHt3PDM0jjpMCwBHZZzj7WmXn
 4DklPu18JZRcz/CTuo1wbENKwVi51Uh/D5RZrpk0PK3PQ9IORRizf/+O5HsmmFFa+o
 XWBVDGSXKRwLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hu9iL9ki
Subject: Re: [Buildroot] [PATCH 1/1] package: busybox: backport fix for
 missing getrandom()
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGFlbCwgQWxsLAoKT24gMjAyMy0wNS0wOSAxMjowNyArMDIwMCwgUmFwaGHDq2wgTcOpbG90
dGUgc3Bha2UgdGh1c2x5Ogo+IE9uIDUvOC8yMyAyMzo0NSwgWWFubiBFLiBNT1JJTiB3cm90ZToK
PiA+ICAgICAuLi4uL2J1aWxkL2J1c3lib3gtMS4zNi4wL01ha2VmaWxlLmZsYWdzOjE2NTogKioq
IHVudGVybWluYXRlZCBjYWxsIHRvIGZ1bmN0aW9uICdzaGVsbCc6IG1pc3NpbmcgJyknLiAgU3Rv
cC4KPiBBcHBhcmVudGx5IHRoaXMgZGVwZW5kcyBvbiB0aGUgaG9zdCdzIG1ha2UgdmVyc2lvbiAo
Zm9yIHJlZmVyZW5jZSBzZWUKPiBbMV0pLiBJdCdzIGxvb2tzIGxpa2UgdGhlIG51bWJlciBzaWdu
ICgnIycpIHRoYXQgdGhlIHBhdGNoIHVzZXMgaW4gdGhlCj4gc2hlbGwgaW52b2NhdGlvbiBtdXN0
ICpub3QqIGJlIGVzY2FwZWQgd2l0aCBHTlUgTWFrZSB2ZXJzaW9uIDQuMyssIGJ1dAo+ICptdXN0
KiBiZSBlc2NhcGVkIHdpdGggdmVyc2lvbiA0LjIuMSBhbmQgZWFybGllci4uCj4gSSdsbCB0cnkg
dG8gZml4IGl0IGFuZCBzZW5kIGEgVjIsIHNvcnJ5IGZvciB0aGUgYW5ub3lhbmNlLgoKU2VlIGhv
dyB3ZSd2ZSBhbHJlYWR5IHNvbHZlZCBpdCBpbiBCdWlsZHJvb3Q6CiAgICAzNWM1Y2Y1NmQyMWEg
IE1ha2VmaWxlOiBtYWtlLTQuMyBub3cgbG9uZ2VyIHVuLWVzY2FwZXMgXCMgaW4gbWFjcm9zCgog
ICAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzM1
YzVjZjU2ZDIxYQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
