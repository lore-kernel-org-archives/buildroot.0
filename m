Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A27FCD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 07:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 707A681D70;
	Mon,  1 Apr 2024 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aqpE4GRvEGD; Mon,  1 Apr 2024 07:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1078781D47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1078781D47;
	Mon,  1 Apr 2024 07:58:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B229A1BF373
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2A960818
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 07:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGho-GT0VuIf for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 07:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.172;
 helo=mout-p-202.mailbox.org; envelope-from=hypnotoad@lindra.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D6E5607B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6E5607B9
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D6E5607B9
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 07:58:21 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4V7Nfr72J6z9sWt;
 Mon,  1 Apr 2024 09:58:12 +0200 (CEST)
Message-ID: <40ae9b7a-21fb-4462-a891-eb1326bc7d56@lindra.de>
Date: Mon, 1 Apr 2024 09:58:11 +0200
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: buildroot@buildroot.org, peter@korsgaard.com, gustavo@zacarias.com.ar
From: Ralf Dragon <hypnotoad@lindra.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1711958293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3LslRU9oINGl+F5r6SdbUsqYDmloDmLv6Gh35DKV9po=;
 b=PxbFm1kW8wUWrfP/sIGHe3qFlQMsy7LjY165215azT96Y3zWp8Px4cgrjC6KWkYcsBQ6ki
 49coICIwZi4kEjuno4qhCVn5YT6CVuT9FwxJTqZj2tTz/qGPY0ZW2i1lC36wna1qEbzm7I
 Hqa2NfX201lWJ49VMVgGEbGlEQMOk63sMfRsIb9yLQT7ULRU0CJ10r36m+/0GXz+vryFkA
 A8uo2G+jJtEqi3rlF6++BDe4Knoz/BZNoenrG7aO4SlillXvwoT89oIdo/srWSQOH4UoP9
 zfXSpXiyoYOL0WGeKfZtx9KBHhe63TwHYsHroUp4sHlgTGHlwdSrN+DOEbef1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=PxbFm1kW
Subject: [Buildroot] problem compiling host-tiff-4.6.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBhbGwsCgpmb3IgbWUgaW4gY3VycmVudCBtYXN0ZXIgYW5kIDIwMjQuMDIueCBicmFuY2hl
cywgdGhlIHBhY2thZ2UgCmhvc3QtdGlmZi00LjYuMCBmYWlscyB0byBjb21waWxlIHdpdGg6Cgou
Li4KCmxpYnRvb2w6IGxpbms6IC91c3IvYmluL2djYyAtTzIgCi1JL2hvbWUvZHJhZ29uL3NyYy9m
dC9mdGNvbW11bml0eS1UWFQvb3V0cHV0L2J1aWxkL3Jvb3Rmcy9wZXItcGFja2FnZS9ob3N0LXRp
ZmYvaG9zdC9pbmNsdWRlIAotV2FsbCAtVyAtV2wsLXJwYXRoIAotV2wsL2hvbWUvZHJhZ29uL3Ny
Yy9mdC9mdGNvbW11bml0eS1UWFQvb3V0cHV0L2J1aWxkL3Jvb3Rmcy9wZXItcGFja2FnZS9ob3N0
LXRpZmYvaG9zdC9saWIgCi1vIHRpZmZjcCB0aWZmY3AubyAKLUwvaG9tZS9kcmFnb24vc3JjL2Z0
L2Z0Y29tbXVuaXR5LVRYVC9vdXRwdXQvYnVpbGQvcm9vdGZzL3Blci1wYWNrYWdlL2hvc3QtdGlm
Zi9ob3N0L2xpYiAKLi4vbGlidGlmZi8ubGlicy9saWJ0aWZmLnNvIC4uL3BvcnQvLmxpYnMvbGli
cG9ydC5hIC1sTGVyYyAtbGpiaWcgLWxtIAotV2wsLXJwYXRoIAotV2wsL2hvbWUvZHJhZ29uL3Ny
Yy9mdC9mdGNvbW11bml0eS1UWFQvb3V0cHV0L2J1aWxkL3Jvb3Rmcy9idWlsZC9ob3N0LXRpZmYt
NC42LjAvbGlidGlmZi8ubGlicyAKLVdsLC1ycGF0aCAKLVdsLC9ob21lL2RyYWdvbi9zcmMvZnQv
ZnRjb21tdW5pdHktVFhUL291dHB1dC9idWlsZC9yb290ZnMvcGVyLXBhY2thZ2UvaG9zdC10aWZm
L2hvc3QvbGliCi91c3IvYmluL2xkOiAuLi9saWJ0aWZmLy5saWJzL2xpYnRpZmYuc286IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gCmBkZWZsYXRlSW5pdF8nCi91c3IvYmluL2xkOiAuLi9saWJ0aWZm
Ly5saWJzL2xpYnRpZmYuc286IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRlZmxhdGUnCi91c3Iv
YmluL2xkOiAuLi9saWJ0aWZmLy5saWJzL2xpYnRpZmYuc286IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gCmBkZWZsYXRlRW5kJwovdXNyL2Jpbi9sZDogLi4vbGlidGlmZi8ubGlicy9saWJ0aWZmLnNv
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbmZsYXRlJwouLi4KCgpJdCBzZWVtcyB0aGF0IHRo
ZSBmb2xsb3dpbmcgZGlmZiBmaXhlcyB0aGUgcHJvYmxlbSwgYnV0IEkgZ3Vlc3MgdGhhdCB0aGUg
CkhPU1RfVElGRl9DT05GX09QVFMgd2VyZSBhZGRlZCBpbiA5MWIxNmYgZm9yIGEgcmVhc29uIGFu
ZCB0aGF0IHRoZSAKcHJvYmxlbSBpcyBhIGRpZmZlcmVudC4KCi0tLSBhL3BhY2thZ2UvdGlmZi90
aWZmLm1rCisrKyBiL3BhY2thZ2UvdGlmZi90aWZmLm1rCkBAIC0yMyw3ICsyMyw2IEBAIFRJRkZf
REVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCgogwqBIT1NUX1RJRkZfQ09ORl9PUFRTID0gXAog
wqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLWN4eCBcCi3CoMKgwqDCoMKgwqAgLS1kaXNhYmxlLXps
aWIgXAogwqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLWxpYmRlZmxhdGUgXAogwqDCoMKgwqDCoMKg
wqAgLS1kaXNhYmxlLWx6bWEgXAogwqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLWpwZWcgXAoKQ291
bGQgc29tZW9uZSBhZHZpc2Ugd2hhdCB0byBkbz8KClJhbGYKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
