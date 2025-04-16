Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851AFC369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CD761B26;
	Wed, 16 Apr 2025 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idwJPTbVLrJl; Wed, 16 Apr 2025 20:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1136F5B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1136F5B9;
	Wed, 16 Apr 2025 20:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 828EB6B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7453D40194
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id en78Sy_nL3OE for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF0D6400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF0D6400BD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF0D6400BD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:29:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9D119B0053E;
 Wed, 16 Apr 2025 22:29:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 22:29:48 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 22:29:48 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250415154905.1871596-1-gael.portay+rtone@gmail.com>
References: <20250415154905.1871596-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <483bf2cc83665cb253b76c3153ff1f7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744835391;
 bh=OgA9kVDItaFik9GdgCK18uPr68mT5hwou0wKoqw6ZO0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e+xi0ErAmRrg/O5rdPXGFt8op3c3OUjeCI5Apo03VS12436R0W363a4Z0ND8AAqSN
 3FakFhbvEXzWXM6ERzvW7ueW1Sgacyl1EMOAIbDp246rvGkz+trUa0bh6prdAD0ltU
 ArGG4raEACKTD1qLEClpq6lPcw/16suaKPO2VRGZpRp42tj5Cx8TPYAZbtypbY6IRy
 hWe8dnv1skQrDfJd4R1+frH5POeUIJeGnwmErrq7YEPObxo1RTxXJnz+17/dS7uhn9
 2B6wRgW3l3xkecF8L53oJipXrzfNMuJaxldn8wcv6lTKrf+ZAL9nc51PPJvfrJFopq
 mYf9KLVAWK0cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e+xi0ErA
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi5: install Raspberry
 Pi 500 device-tree blob
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

T24gMTUvMDQvMjAyNSAxNzo0OSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoaXMgaW5zdGFsbHMg
dGhlIGRldmljZS10cmVlIGJsb2IgZm9yIHRoZSBSYXNwYmVycnkgUGkgNTAwLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
