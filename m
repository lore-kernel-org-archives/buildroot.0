Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529FC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 22:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D214340AF8;
	Sat, 31 May 2025 22:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuhTc4Trmljb; Sat, 31 May 2025 22:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 213DA40AC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 213DA40AC2;
	Sat, 31 May 2025 22:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA47235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1DBE608E0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGvbcfx6EJCn for <buildroot@buildroot.org>;
 Sat, 31 May 2025 22:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F416607A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F416607A9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F416607A9
 for <buildroot@buildroot.org>; Sat, 31 May 2025 22:41:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 20C4260128;
 Sun,  1 Jun 2025 00:40:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 00:40:59 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 00:40:59 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20250303161557.571619-2-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-2-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <74b0c96032c6a0a87b16c6cc3b7f5d5a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748731261;
 bh=vjcoVzYxbOVPx2lT+3eAEsLpkpqxWUvw4u3sS4x4nf0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h9TyiuVyrPw3VP/+uEq1lrgLQZJoKQt5gdPqzZIpUEJzwtL5fzdDW/xt+gZ1+D3gY
 Z1VsB9DYEbC0ymDYe9kWazzQ87YIA6wPjk2WlGIae8LADYISkGqvBc8UKCEgzmo9D3
 Br7akxcIIf1s8wczVZsCH5+zdvV1yacl/ZJ5nLgL6w9Kc138PqNe3IEV/+UnZujEVm
 7i9ZT9mnAV1iWS4qPRl2Yp1qdXUAFcuX/7/PKMjAgIYB0qNbchQbjPF2xO6HGzqyW0
 x24ridGXUgURMANRoeU5W0EuvKt86BDJHq5jlb4KxB175U4/RDo94Vp+jxNGzLi8Zk
 3R2T+l9N0UzSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h9TyiuVy
Subject: Re: [Buildroot] [PATCH v4 1/6] testing: drop unneeded vga/vnc
 stanzas from QEMU invocation
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

T24gMDMvMDMvMjAyNSAxNzoxNSwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSBhYXJjaDY0IHZp
cnQgcGxhdGZvcm0gZG9lc24ndCBoYXZlIGFueSBkZWZhdWx0IFZHQSBkZXZpY2VzIHNvIHdlCj4g
ZG9uJ3QgbmVlZCB0byBjb25maWd1cmUgdGhlbSBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
