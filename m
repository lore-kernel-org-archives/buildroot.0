Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA85C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 15:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38764150F;
	Wed, 22 Dec 2021 15:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YN5ao77p4m9; Wed, 22 Dec 2021 15:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1897C41517;
	Wed, 22 Dec 2021 15:10:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE0431BF283
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 15:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB16541517
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 15:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ve6R8cRqUzbS for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 15:10:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E8A4150F
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 15:10:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x15so9999871edv.1
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dAO/4VHyU9FbY4vlgtYFKy90GKTI4JS7SUVwAiwcmcY=;
 b=pZtR77CTGaXmY8Y4OSMjMyUg+K8YoO4z8DKDui+AXPWJlR7KvvYK2Uyxg3hAWAx1Ug
 1eIcWAoTs1Mua3q66uDwMiDCHyANmAAOQs2ZGiZy92UJFMTZwxgZPcm6lfLOsruXZ3+B
 GhSOnkQXVfAJZatcYGtfZseSlWKJTchO7SRVfcmNfTe+jrocRJolfexQw8svnEWLHPZZ
 R7XQxgKNhUDG+Z21jJREbtYjt6InX3mkCm6kxytO3lF6ikTt9Xg53tGlSl5pw8ahRzHU
 WOHR3FJYqxSPH0WZfJ4GE09yc1sMunraI/9wpKAYTxRV8wJO+YyEEQ1cT+gC/70AXYZB
 50bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dAO/4VHyU9FbY4vlgtYFKy90GKTI4JS7SUVwAiwcmcY=;
 b=exAz49GwWhISvmtV/p8M/uqShbRhz7u4oKzEXXVGUSqjXWAvreJZEfwjx2cYOaz1CZ
 5kYykHgrwPV2wlv+JcB9Z61g0mFOg3tPo7udTwkEbtu1HBIIcXlEDa2Y5F7Xuqi9xWpz
 B1QNptJEWaZtp57wKxoPRmOjuq2rUGAA0NlA6+l5mkiZpbwfXIe1Hytagn/WTjBNoifK
 NBNYYs8uq26Rjm3Ye9nWcEwkoGy82dHD6oWyBhlfMAFCfu3jhFjHEhNRj6jkg/ujtlhh
 nKo+wQdHVUKt6MKJC+N5JG9voTOXtUUAlMkS25NyKMMn8KpY/G1PohpPyNSsnB64ZWma
 08+Q==
X-Gm-Message-State: AOAM531Vtr8ms7ZVmdbIBSEM2uCU+NDcCmjpJ/g5shS4HuPCxkMkfuT5
 WoyFvf0Ym4bq32LK6u2+9rk3QnE84TJlFsoOcvo=
X-Google-Smtp-Source: ABdhPJy0Z51ke7mBlzCFVFPDcMXjmoitcKve35fbih7dJudaIQ4bd8ee2R24SR914XtvWAZonoUYeJprHgJr08Im3BY=
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr2383801edc.25.1640185809898; 
 Wed, 22 Dec 2021 07:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20211222140737.1179968-1-fontaine.fabrice@gmail.com>
 <20211222153846.6fce3a2d@windsurf>
In-Reply-To: <20211222153846.6fce3a2d@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Dec 2021 16:09:26 +0100
Message-ID: <CAPi7W83J6TXe4MvbDVY-h1seFX=ecCccLgajiXDWSWyqE9314w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: force host-python3
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAyMiBkw6ljLiAyMDIxIMOgIDE1OjM4LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBXZWQsIDIyIERlYyAyMDIx
IDE1OjA3OjM3ICswMTAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBCdWlsZCBvZiBub2RlanMgZmFpbHMgaWYgcHl0aG9uIDMuMTAg
aXMgaW5zdGFsbGVkIG9uIGhvc3QuCj4gPiBBcyBzdWdnZXN0ZWQgYnkgQXJub3V0IGluCj4gPiBo
dHRwczovL2J1Z3MuYnVpbGRyb290Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQ0NTEsIHVzZSB0aGUg
c2FtZQo+ID4gd29ya2Fyb3VuZCB0aGFuIGluIHF0NXdlYmtpdCB0byBmb3JjZSBob3N0LXB5dGhv
bjMgKHdoaWNoIGlzIGluIHZlcnNpb24KPiA+IDMuOSkKPgo+IFdlIGFscmVhZHkgaGF2ZSBwYXRj
aGVzIHBlbmRpbmcgdGhhdCBidW1wIGhvc3QtcHl0aG9uMyB0byAzLjEwLCBzbyBpcwo+IHRoaXMg
cmVhbGx5IHRoZSByaWdodCBhcHByb2FjaD8KPgo+IE9yIGFyZSB5b3Ugc2VuZGluZyB0aGlzIGFz
IHNvbWV0aGluZyB3ZSBzaG91bGQgdGhlbiBiYWNrcG9ydCBpbiBzdGFibGUKPiByZWxlYXNlcywg
YXMgYSBmaXg/Ckkgd291bGQgc2F5IHRoYXQgdGhpcyBwYXRjaCBzaG91bGQgYmUgYXBwbGllZCBp
biBzdGFibGUgcmVsZWFzZXMgYW5kIG1hc3Rlci4KSU1ITywgdGhpcyBpcyBub3QgZXhwZWN0ZWQv
Y29ycmVjdCB0aGF0IG5vZGVqcyB1c2VzIHRoZSBweXRob24gYmluYXJ5CnRoYXQgaXQgZm91bmRz
IG9uIGhvc3QgaW5zdGVhZCBvZiBob3N0LXB5dGhvbjMuCkN1cnJlbnRseSB0aGlzIGlzIHJhaXNp
bmcgYSBidWlsZCBmYWlsdXJlIHdpdGggcHl0aG9uIDMuMTAgYnV0CnRvbW9ycm93LCB0aGlzIGNv
dWxkIGFnYWluIHJhaXNlIHVuZXhwZWN0ZWQgYnVpbGQgZmFpbHVyZXMsIGZvcgpleGFtcGxlLCBp
ZiBub2RlanMgcmVtb3ZlcyBzdXBwb3J0IGZvciBweXRob24gMi4KPgo+ID4gSXQgc2hvdWxkIGJl
IG5vdGVkIHRoYXQgcHl0aG9uIDMuMTAgc3VwcG9ydCBoYXMgYmVlbiBhZGRlZCBpbiB2ZXJzaW9u
Cj4gPiAxNC4xOC4yOiBodHRwczovL2dpdGh1Yi5jb20vbm9kZWpzL25vZGUvcmVsZWFzZXMvdGFn
L3YxNC4xOC4yCj4KPiBJc24ndCB0aGlzIGEgYmV0dGVyIGFwcHJvYWNoID8KPgo+IFRob21hcwo+
IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9i
b290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
