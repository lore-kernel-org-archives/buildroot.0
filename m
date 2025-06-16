Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D49C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1668132E;
	Mon, 16 Jun 2025 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLRXhq4L-wjq; Mon, 16 Jun 2025 21:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA54A8130A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA54A8130A;
	Mon, 16 Jun 2025 21:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B70C151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815D48130A
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_jD0i2-byr1 for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 21:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B76548130F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76548130F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B76548130F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 21:10:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4EA1AB0053D;
 Mon, 16 Jun 2025 23:09:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Jun 2025 23:09:56 +0200
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 23:09:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org
In-Reply-To: <20250616203446.369468-1-flavio.tapajos@newtesc.com.br>
References: <20250616203446.369468-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.11
Message-ID: <a67558c203bd7b19f3eab2bfe1f782cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750108198;
 bh=/6Wr1uXRtrj5zRZVtRg6NFN1VqXLM6KESClhfE7wMu0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6LCqfOz2ZtKPglTS5WpK0SPMXv4KDjDAs9hDkEEVfS9cgfCWDCwyda+iNiD/feTK
 L43IUJ4NWyfy7rBODg/c/7gnQ8FoOCjjVuXLvRcSYfKgzQfa0w06dnkLe4qhIxxMLN
 QV5XtYcluhccwijPQcW/6lWg0BrSbVBB3+2yrd82JNJiZH29bevpHoBZLjT/qC3GN6
 ElFiVRfOQqwOZAlID19hscUdlG4sK0OL1LQzaruGu5ra7COQ5q1rNMfbOucBDjz49P
 BgdlKeZxqXAVp3XrtnqUnpkqWZ34ob4xcRlB6BqdCMwSZNTI/p31e10aT+nHiENytc
 AFSu0skvoPvMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C6LCqfOz
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to
 8.2506.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

T24gMTYvMDYvMjAyNSAyMjozNCwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBSZWxlYXNlIGFu
bm91bmNlOgo+IGh0dHBzOi8vd3d3LmFkaXNjb24uY29tL3JzeXNsb2cvcnN5c2xvZy04LTI1MDYt
MC1yZWxlYXNlZC8KPiAKPiBDaGFuZ2Vsb2c6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3JzeXNsb2cv
cnN5c2xvZy9ibG9iL3Y4LjI1MDYuMC9DaGFuZ2VMb2cKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGbMOh
dmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
