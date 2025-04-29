Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788A4C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 19:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BEDB40354;
	Tue, 29 Apr 2025 19:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vkZXbhgIDffA; Tue, 29 Apr 2025 19:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AEE40328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AEE40328;
	Tue, 29 Apr 2025 19:46:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C235E4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1212E60EBE
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGiUv4ggGQ8f for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 19:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 466D160664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466D160664
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 466D160664
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:46:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DFDF219F576;
 Tue, 29 Apr 2025 21:46:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Apr 2025 21:46:41 +0200
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 21:46:41 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
In-Reply-To: <20250428210120.1501818-1-raphael.melotte@mind.be>
References: <20250428210120.1501818-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <036e310141fdeeb7349b623a4e9cd334@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745956004;
 bh=I+LiU4klgsZ7kN8uh5UbAGleq9+d1uFrM1QuStIdIdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zs7U/o3EmniGzTL0S07QGa49KnnQrNssdz+j+fRbFEq8B1RS4B2Ku5dtBaTl2b/pn
 u+hN0s6gbqCJcWufbcOII3mxERkFHLPBcHy6EWVqRv6+xc/cOJLDIesCXnM8T42A5G
 FZTKSL8Mb4VdbrKx7y46tXAIeqP/ck+eJWUad3cyd64OgmdzSw8mV5u5mJZ5f2qrBF
 ui8I9LCBd4yKxLrNLbQhbPWQfBIeNZbjUYeG+e21P+ufKeiNxXZCy3PbjVnCNYPVCv
 iOp8oBJPWReE0uwt5m8IW/TzPUxZbCKYmZfoh/cr5DU1k9xnoTmOG1RO3uyr/1Lzh/
 InVb0+rIkb7Qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Zs7U/o3E
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix typo in
 --disable help text
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

T24gMjgvMDQvMjAyNSAyMzowMSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBBbm5veWluZ2x5LCB1c2luZyAiLS1kaXNhYmxlIHdhcm5pbmciIGRvZXMgbm90IGRpc2Fi
bGUgdGhlIHdhcm5pbmdzCj4gY2hlY2tzLgo+IAo+IEl0IHR1cm5zIG91dCB0aGF0IHdlIGxvb2sg
Zm9yICJ3YXJuaW5ncyIgKGkuZS4gd2l0aCBhbiAncycpIHRvIGtub3cgaWYKPiB3ZSBzaG91bGQg
ZGlzYWJsZSB0aGUgd2FybmluZ3MgY2hlY2ssIHNvIHVwZGF0ZSB0aGUgaGVscCB0ZXh0Cj4gYWNj
b3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
