Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB82CC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 18:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FE5640463;
	Mon,  2 Jan 2023 18:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE5640463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72G3COH4_XUH; Mon,  2 Jan 2023 18:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5FFE4031F;
	Mon,  2 Jan 2023 18:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5FFE4031F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1B241BF2C6
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D2168130D
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2168130D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GaoRATnqQsf for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 18:08:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8189812F6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8189812F6
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 18:08:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3857:b2b8:1cc5:be09])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 29B5C5FFA1;
 Mon,  2 Jan 2023 19:08:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Jan 2023 19:08:21 +0100
Date: Mon, 2 Jan 2023 19:08:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin =?utf-8?B?Tmllc3Ryw7Nq?= <m.niestroj@grinn-global.com>
Message-ID: <20230102180821.GX2498764@scaer>
References: <20221103102102.924370-1-m.niestroj@grinn-global.com>
 <20221103102102.924370-2-m.niestroj@grinn-global.com>
 <20221211091013.GN1044805@scaer> <87tu1941pl.fsf@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tu1941pl.fsf@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672682906;
 bh=VvcsBjQEEl/2d1BqZPNLzjTw7YV3jOQywg1GYK0IJHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f11Iv4BjQBhK6FlDGk7vxj7g1cK9Mil95/tC/IRoRUNh3vLy9Dyo0eRSc5L4E+jbo
 Rm5/pVbjpHNPgOmxAtBF8bQ5e/TxkGhIXB9m0Lhem0PGXMF1pAzrEPfWQbImPnbN1G
 8A7UzUu+lg0GnYDMhXy9DO/5bK66k7FIffUmj+C1QHlzfgTeYLX4myy29PDUOJw7gW
 lIZXgiU91x/ZHWJF/TIhArChixMuTIQU6Z5w3nveTCZMT8yuYo5XdsqICldoWIW6Yw
 HO7v+7CuhpC00RArsp6bIpUcgKUGobLXHBUqZAcSrCgChjOAdHvRoiLsJ+GlxNePQy
 /QskAbLmB4rHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f11Iv4Bj
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bleak: bump version
 to 0.19.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyY2luLCBBbGwsCgpPbiAyMDIzLTAxLTAyIDEyOjIzICswMTAwLCBNYXJjaW4gTmllc3Ryw7Nq
IHNwYWtlIHRodXNseToKPiAiWWFubiBFLiBNT1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
PiB3cml0ZXM6Cj4gPiBNYXJjaW4sIEFsbCwKPiA+Cj4gPiBPbiAyMDIyLTExLTAzIDExOjIxICsw
MTAwLCBNYXJjaW4gTmllc3Ryb2ogc3Bha2UgdGh1c2x5Ogo+ID4+IFNpZ25lZC1vZmYtYnk6IE1h
cmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgo+ID4gQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KPiBJIGhhdmUgbm90aWNlZCB0aGF0IHRoaXMgcGF0Y2ggd2FzIGFw
cGxpZWQgdG8gbWFzdGVyIHdpdGhvdXQgUEFUQ0ggMS8yCj4gdGhhdCBhZGRzIHB5dGhvbi1kYnVz
LW5leHQgcGFja2FnZSwgd2hpY2ggaXMgYSBydW50aW1lIGRlcGVuZGVuY3kuCgpJbmRlZWQsIHRo
aXMgaXMgYSBjb21wbGV0ZSBvdmVyc2lnaHQgaGVyZSwgYW5kIEkgZG9uJ3QgcmVtZW1iZXIgd2h5
IEkKZGlkIG5vdCBhcHBseSBpdC4uLgoKSSdsbCBsb29rIGludG8gcmlnaHQgbm93IChidXQgcGxl
YXNlIGFsbG93IGRpbm5lciB0byBiZSBhbiB1bm1hc2thYmxlCmludGVycnVwdCBzaG91bGQgdGhh
dCB0cmlnZ2VyIGJlZm9yZSBJJ20gZG9uZSA7LSkgKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
