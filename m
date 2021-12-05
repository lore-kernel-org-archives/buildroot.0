Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71E8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A39A40129;
	Sun,  5 Dec 2021 19:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AM-AnLfHqlaH; Sun,  5 Dec 2021 19:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E8FE4042C;
	Sun,  5 Dec 2021 19:15:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F22D1BF383
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D0F640129
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 19:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-CIJWdVVha2 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 19:15:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 847BB40178
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 19:15:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:55db:5b6b:bf8d:f8ab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35F86B004E8;
 Sun,  5 Dec 2021 20:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638731699;
 bh=WiGYvmlKifME2RejPeylL6YF7qnIsAPAqK/4EYL7LnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O0pHlH5+EvXZb360nhtm6D7c+g+mt4zQlpGLk81C+ud0OOn337/5r9k4eiNtZzCuZ
 6hfALSnFnxljMZzw1Vbv0eByUiV2Vs9XhKa6+6WBECrx1S6Ag3LiY4AhrwYBb1XDdq
 aubS1vUjNFI+vFXfMwJVgmM0oYiFsNJ+uTpTE59ckmKT87xTzdNcORNfzRKI0ph1g1
 5jZUaQPShVXRfkjy+cth+PLe9MKRcpohSHEsRncmYP5H3hTvVqAJ/dHAD3QwPTz+d5
 zA24Bq+tK/oTzUOOO5vGkzyyFyqPQfOL7dPvEoGFE78+k4ls54R09r2JGGWinnFgV/
 DAFYS4vMjk1qw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Dec 2021 20:14:56 +0100
Date: Sun, 5 Dec 2021 20:14:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211205191456.GB2603@scaer>
References: <20211202013902.1593562-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211202013902.1593562-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH next 0/2] fix name clash between libite and
 LiTE
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

Sm9hY2hpbSwgQWxsLAoKT24gMjAyMS0xMi0wMiAwMjozOSArMDEwMCwgSm9hY2hpbSBXaWJlcmcg
c3Bha2UgdGh1c2x5Ogo+IHRoaXMgcGF0Y2ggc2VyaWVzIHVwZGF0ZXMgbGliaXRlIGFuZCB3YXRj
aGRvZ2QgdG8gY29ycmVjdCB0aGUKPiB1bmZvcnR1bmF0ZSBuYW1lIGNsYXNoIGJldHdlZW4gbGli
aXRlIGFuZCB0aGUgRGlyZWN0RkIgTGlURQo+IHByb2plY3QncyBoZWFkZXIgZmlsZXMuCj4gCj4g
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMTg1Yzc1M2FmMmFhMTU5YjQ5
NGIxM2Y3OGIwODI2ZGRkYmU0YWVkNgo+IAo+IE5vdGU6IGlmIGFwcGx5aW5nIHRoaXMgc2VyaWVz
IGluIGZyYWdtZW50cywgcGxlYXNlIHVwZGF0ZSB3YXRjaGRvZ2QKPiAgICAgICBmaXJzdCwgb3Ro
ZXJ3aXNlIHRoZSBidWlsZCB3aWxsIGZhaWwgZHVlIHRvIHRoZSByZWxvY2F0aW9uIG9mCj4gICAg
ICAgdGhlIGxpYml0ZSBoZWFkZXJzLgoKU2VyaWVzIGNoZXJyeS1waWNrZWQgZnJvbSBuZXh0IGlu
dG8gbWFzdGVyLCBub3cuIFRoYW5rcyBmb3IgdGhlIGZhc3QKcm91bmQtdHJpcCBpbiBmaXhpbmcg
dGhpcyEg8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gQmVzdCByZWdhcmRzCj4gIC9K
b2FjaGltCj4gCj4gSm9hY2hpbSBXaWJlcmcgKDIpOgo+ICAgcGFja2FnZS93YXRjaGRvZ2Q6IGJ1
bXAgdG8gdmVyc2lvbiAzLjUKPiAgIHBhY2thZ2UvbGliaXRlOiBidW1wIHRvIHZlcnNpb24gMi41
LjEKPiAKPiAgcGFja2FnZS9saWJpdGUvbGliaXRlLmhhc2ggICAgICAgfCAyICstCj4gIHBhY2th
Z2UvbGliaXRlL2xpYml0ZS5tayAgICAgICAgIHwgMyArKy0KPiAgcGFja2FnZS93YXRjaGRvZ2Qv
d2F0Y2hkb2dkLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uvd2F0Y2hkb2dkL3dhdGNoZG9nZC5tayAg
IHwgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiAKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
