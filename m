Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60873C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086B341A5F;
	Mon,  5 Feb 2024 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086B341A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4n5bT7Q4IlM; Mon,  5 Feb 2024 21:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BA2B418B9;
	Mon,  5 Feb 2024 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BA2B418B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 406E81BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18694403A2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18694403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjrUfeDc9J3Z for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:51:49 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD8B94012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8B94012F
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E0FC9B0053D;
 Mon,  5 Feb 2024 22:51:45 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47036])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Feb 2024 22:51:45 +0100
MIME-Version: 1.0
Date: Mon, 05 Feb 2024 22:51:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain NAOUR <romain.naour@smile.fr>
In-Reply-To: <CAK-B9HS8LSjJCS2vQjAqrzn8aQMNUHGm-C=CfSg04r8kjpSY0g@mail.gmail.com>
References: <20240113201532.121274-1-ju.o@free.fr> <Zazvzc8l00sd25pH@landeda>
 <CAK-B9HS8LSjJCS2vQjAqrzn8aQMNUHGm-C=CfSg04r8kjpSY0g@mail.gmail.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <219e4983def7472087fdaae868a9ee59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707169908;
 bh=LWrcg2fubFUNZ6kwF+nsKO5mw6O5F8fyfjkubtt2Mxk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YAnYCjVGlVrZ64GpDroqU7gwfbu9GXRPoWLCj9l/JTZoByehcMA4AeA2bLsiugkZL
 jqeVcAKc4slg3MW+9a+yl3/+Y1YKf9YntP7ucWlmg74qQgPlePWhQHd4c0lISsdeXE
 6isQtVdxxcChKyD+tm0ids0yjKz6/W7pVjZ3ptDvil6HNQ0/b0B6gz+SZjf3Nyfjv7
 NeAK3WL9JkAB7dxgrAGLcT6Lmtrf66jqh+rQsfz+xyvTMG/4MRYeadcCIEuXpdH6I1
 MqbdMfYBihUW4pcv6sq9NB5FI3ufOU/eSxAI1r21GjwoaPGPgyuaGYO4kpXj0a8Hd4
 NT2PGvwYYKpGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YAnYCjVG
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add netcat runtime test
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLCBBbGwsCgpPbiAwNS8wMi8yMDI0IDE4OjQ5LCBSb21haW4gTkFPVVIgd3JvdGU6
Cj4gSGVsbG8gSnVsaWVuLCBBbGwsCj4gCj4gT24gU3VuLCBKYW4gMjEsIDIwMjQgYXQgMTE6MjDi
gK9BTSBZYW5uIEUuIE1PUklOIAo+IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4+
IAo+PiBKdWxpZW4sIEFsbCwKPj4gCj4+IE9uIDIwMjQtMDEtMTMgMjE6MTUgKzAxMDAsIEp1bGll
biBPbGl2YWluIHNwYWtlIHRodXNseToKPj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPgo+PiAKPj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPiBJ
dCBzZWVtcyB0aGlzIHRlc3QgaXMgZmFpbGluZyBpbiBnaXRsYWItY2kgZm9yIHNvbWUgcmVhc29u
Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjA5
Mzg1NDY2NAo+IAo+IGNhbiB5b3UgaGF2ZSBhIGxvb2s/CgpJIHdhcyBhYmxlIHRvIHJlcHJvZHVj
ZSB0aGUgaXNzdWUgd2l0aCBhIHZlcnkgc2xvdyBleGVjdXRpb24uCkkgcHJvcG9zZWQgYSBmaXgg
aW46Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyNDAyMDUyMTQ4MzcuMzQ5NzUzNS0xLWp1Lm9AZnJlZS5mci8KCj4gCj4gQmVzdCByZWdhcmRz
LAo+IFJvbWFpbgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
