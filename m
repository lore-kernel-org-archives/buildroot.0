Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2C1C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE008403AC;
	Sun, 22 Jun 2025 11:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id derkyfkYckp4; Sun, 22 Jun 2025 11:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC0EC40C70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC0EC40C70;
	Sun, 22 Jun 2025 11:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C75212C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8688146B
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmeS91hVuAGr for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7177E8186E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7177E8186E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7177E8186E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:46:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8FB3760134;
 Sun, 22 Jun 2025 13:46:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 13:46:07 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 13:46:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250618142825.758131-3-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
 <20250618142825.758131-3-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <6b41ba11c47b9641146af868afebbf4d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750592769;
 bh=xbbionkql5fXgSh6iV2KCNkAu5zLguIdtX+aEkgAozw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TteKN8+XihNcUTVied8/xm6eufmdB7o0SU80tpl1ArWsCRg3kj3u92Hk0zIlB4NC+
 efCepPRwU19FE09wShZH7Xn1CoTw4uecafR9QmIzt0wia7f4UeOty0uL+x3TsaqsiC
 aLFmvJs+SsAyBv56uhQ8g1ur7G7g7YDJHY0q1Hb2upTRNqmoCyYchyPoHkXtmf3DGh
 GllDq0daBGWb9XKZMSMUrIZih43VXaRoSVVJ+BVrXylQtLhssvsIRjMdapDYfsdIfc
 h6b5TWqfkX+8/7yOA+/G5f2+olKD+YGliCQEYBEEZ7jclLHlzSMFylq91slWjT4n1i
 21KFyN3ye1GsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TteKN8+X
Subject: Re: [Buildroot] [PATCH v7 2/4]
 package/vulkan-[headers|loader|tools]: bump to 1.4.317 release
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

T24gMTgvMDYvMjAyNSAxNjoyOCwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFVwZGF0ZSB0byB0aGUg
Y3VycmVudCByZWxlYXNlLiBXZSBub3cgbmVlZCB0aGUgcmVjZW50bHkgYWRkZWQKPiB2dWxrYW4t
c2RrIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSB2b2xrIGxvYWRlci4gVXBkYXRlIHRoZSBkZXBlbmRz
Cj4gY29tbWVudHMgYXBwcm9wcmlhdGVseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIG1hc3RlciwgdGhh
bmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
