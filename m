Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8F9C021BC
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 18:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A236058B;
	Mon, 24 Feb 2025 18:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c06TOjKBvq02; Mon, 24 Feb 2025 18:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9E260B94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9E260B94;
	Mon, 24 Feb 2025 18:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60FCC2DDF
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44147403F9
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9ZtDcEdYoYM for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 18:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 247AE403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 247AE403E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 247AE403E4
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 18:20:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2579813F8E2;
 Mon, 24 Feb 2025 19:20:14 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Feb 2025 19:20:14 +0100
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 19:20:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20250224125433.2768708-1-fiona.klute@gmx.de>
References: <20250224125433.2768708-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <6ed34e4269cfe4a3e1a05f98ccb4fdc8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740421217;
 bh=b/XQZX70+lnRyE9+PddBt7tTVLHd/G6R1sp8zfNW4rA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jaEJHijzDxnW4wrCxs1ToIqnc3pi2L/l3HEMSw2/qAuUvHE4KwfjPbqUVZXmU9vYn
 oMjER1iKEAIIaoW2/LZ7iGx5wa4eXRvNFYH2MBB2uWufcmhDS9Z1cMC+VppDm85has
 iDajwc0dS8zHS2x9C/Ly/nUwX6bnctouGYvSb4M0+jLNnaq2I0IaNOHGfuTgzdWzKJ
 gTiSDrJLVbrX9VL4SbKAobebseZBn7XIqyUGBj/Bpdz1ekO0o9Ok7Rh6ln7845c30t
 rP37uNgC+odM9dQH2KpFgJUwnacS52QEzMKznelrV1HOwA+DcMuQiBFJwouLnFon2S
 CKNsZKm7oSRig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jaEJHijz
Subject: Re: [Buildroot] [PATCH v4 1/1] package/wlr-randr: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjQvMDIvMjAyNSAxMzo1NCwgRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBG
cm9tOiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+Cj4gCj4gVXRpbGl0eSB0byBtYW5hZ2Ugb3V0cHV0cyBvZiBhIFdheWxhbmQgY29tcG9zaXRv
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6
eW1hbnNraUBhcm1hZGV1cy5jb20+Cj4gW0Zpb25hOgo+ICAgLSBmaXggYnVpbGQgd2l0aCB1Q2xp
YmMKPiAgIC0gdXBkYXRlIHRvIDAuNS4wIHdpdGggbW92ZSB0byBnaXRsYWIuZnJlZWRlc2t0b3Au
b3JnCj4gXQo+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVA
Z214LmRlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
