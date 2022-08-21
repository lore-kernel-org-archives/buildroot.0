Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE4C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 20:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE51860BA9;
	Sun, 21 Aug 2022 20:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE51860BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGsXLHIOv8GD; Sun, 21 Aug 2022 20:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED2960AE5;
	Sun, 21 Aug 2022 20:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED2960AE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC1DF1BF317
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F1C40124
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 20:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F1C40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiIDBbrsDexI for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 20:13:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61EBF400A6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61EBF400A6
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 20:13:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 79DFD13FA34;
 Sun, 21 Aug 2022 22:13:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 22:13:01 +0200
Date: Sun, 21 Aug 2022 22:13:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=C3=B6rgen?= Sigvardsson <jorgen.sigvardsson@gmail.com>
Message-ID: <20220821201301.GT2167049@scaer>
References: <20220211081357.40439-1-jorgen.sigvardsson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211081357.40439-1-jorgen.sigvardsson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661112783;
 bh=Us+mNnnIiE4w/Z+qzrX2qGvGcrUTXY3gx2XdLwtRXjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=beBrMSul+v/wEFih7p/sJuKwQybfozuHDPD583xL9+X/2Wh0YIgn1uC8sYkZYMe0P
 ty9NeAV5Y4h8k/iTQPyRwwcVmv605sMvIwGovnH/X6PB+KjNBZYvOB1ZkzMpG0EsWx
 VpucCF2IMe1pLSjv9BmI7RMM4GeruvU1P2X/4Ar1EycnzJOrjGulZRoSSMJa8FZjAv
 PY2CU18xzjTfB6Oi0Qvm6rMNouGH96j0R/1oHYM4hgjgCjjThtfaH3RO6XOT7o7y1h
 XDFU8Pt3ZUfroOM6ty3S+vLZZp2tjyUgQu4ybPGni0LT+1WR7P6Ool8oa8JDgvbhR/
 qWAb+e9CuR33g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=beBrMSul
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: option for
 building with LWS_WITH_ZIP_FOPS
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

SsO2cmdlbiwgQWxsLAoKU29ycnkgZm9yIHRoZSBsYXRlciBmZWVkYmFjay4KCk9uIDIwMjItMDIt
MTEgMDk6MTMgKzAxMDAsIErDtnJnZW4gU2lndmFyZHNzb24gc3Bha2UgdGh1c2x5Ogo+IFNpZ25l
ZC1vZmYtYnk6IErDtnJnZW4gU2lndmFyZHNzb24gPGpvcmdlbi5zaWd2YXJkc3NvbkBnbWFpbC5j
b20+Cj4gLS0tCj4gK2lmIEJSMl9QQUNLQUdFX0xJQldFQlNPQ0tFVFMKPiArCj4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRTX1pJUF9GT1BTCj4gKwlib29sICJlbmFibGUgc2Vydmlu
ZyBmaWxlcyBmcm9tIHppcCBhcmNoaXZlcyIKPiArCWRlZmF1bHQgeQoKT3B0aW9ucyBzaG91bGQg
bm90IGRlZmF1bHQgdG8geSwgdW5sZXNzIGZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LgoKPiAr
CWhlbHAKPiArCSAgQnkgZW5hYmxpbmcgdGhpcyBmbGFnLCBmaWxlcyBjYW4gYmUgc2VydmVkIGZy
b20gYSAocHJlZmVyYWJseQo+ICsJICB1bmNvbXByZXNzZWQpIHppcCBmaWxlLiBGdXJ0aGVybW9y
ZSwgdGhlIGNvbnRhaW5lZCBmaWxlcyBjYW4KPiArCSAgYmUgZ3ppcHBlZC4gR3ppcHBlZCBmaWxl
cyBtYXkgYmUgZGVsaXZlcmVkIGFzLWlzIChubyBkZWZsYXRpb24KPiArCSAgbmVlZGVkKSB0byBj
bGllbnRzIHRoYXQgYWNjZXB0IGd6aXBwZWQgZW5jb2RlZCBjb250ZW50cyAoYWxsCj4gKwkgIG1v
ZGVybiBicm93c2VycyBkbyB0aGF0KS4KClRoaXMgaXMgYWxsIGEgYml0IGNvbmZ1c2luZy4uLiAi
VW5jb21wcmVzc2VkIHppcGZpbGVzIHRoYXQgY2FuIGNvbnRhaW4KZ3ppcHBlZCBmaWxlcywgd2hp
Y2ggY2FuIGJlIHNlcnZlZCBhcy1pcy4uLiIKCk1heWJlIGp1c3QgZHVwbGljYXRlIHRoZSBoZWxw
IHRleHQgb2YgdGhlIGNvcnJlc3BvbmRpbmcgb3B0aW9uOgoKICAgIG9wdGlvbihMV1NfV0lUSF9a
SVBfRk9QUyAiU3VwcG9ydCBzZXJ2aW5nIHByZS16aXBwZWQgZmlsZXMiIE9GRikKCj4gK2lmZXEg
KCQoQlIyX1BBQ0tBR0VfTElCV0VCU09DS0VUU19aSVBfRk9QUykseSkKPiArTElCV0VCU09DS0VU
U19DT05GX09QVFMgKz0gLURMV1NfV0lUSF9aSVBfRk9QUz1PTgo+ICtlbmRpZgoKVGhlIG9wdGlv
biBtdXN0IGJlIGV4cGxpY2l0bHkgZGlzYWJsZWQ6CgogICAgaWZlcSAoJChCUjJfUEFDS0FHRV9M
SUJXRUJTT0NLRVRTX1pJUF9GT1BTKSx5KQogICAgTElCV0VCU09DS0VUU19DT05GX09QVFMgKz0g
LURMV1NfV0lUSF9aSVBfRk9QUz1PTgogICAgZWxzZQogICAgTElCV0VCU09DS0VUU19DT05GX09Q
VFMgKz0gLURMV1NfV0lUSF9aSVBfRk9QUz1PRkYKICAgIGVuZGlmCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
