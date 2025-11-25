Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694ECD0EE24
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C690411AA;
	Tue, 25 Nov 2025 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJOAUG1-N3LZ; Tue, 25 Nov 2025 20:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79F584119A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79F584119A;
	Tue, 25 Nov 2025 20:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E666F1A6
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC967404DF
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXEu2r8mOoNr for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B8134003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B8134003D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B8134003D
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:34:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2559C19F5A5;
 Tue, 25 Nov 2025 21:34:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Nov 2025 21:34:04 +0100
MIME-Version: 1.0
Date: Tue, 25 Nov 2025 21:34:04 +0100
To: =?UTF-8?Q?Andreas_K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>
Cc: buildroot@buildroot.org, Rudi Heitbaum <rudi@heitbaum.com>
In-Reply-To: <20251028150616.338995-1-kaessens@sra.uni-hannover.de>
References: <51b5e540-d659-43a7-b45e-4d5b972cfc64@smile.fr>
 <20251028150616.338995-1-kaessens@sra.uni-hannover.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <b9ec3243863d80fbc1c23f3b7d1da611@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764102846;
 bh=Z/Zaqp/Uzlo2S9VQW7Hf4HR9PX3H+rXhVDcZbIz3QR8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lUzplNhfbBXVqvMLlOgBU4TvUrPXIlO8ixn9lgBHLEb35Wr48gFSEWkC1pH1++Uns
 PzVNdsOjkkks9oSfXCPzSnLWzKSS07vC5b6iHY1tRpD/cNW6RKegVzQkytuZQSQ1fj
 76NARCOgg3b2HzvBI5plDAXJQopum45q0SK9nP0kCnO/KCindluAwKrwt3jwwH73Fe
 zXWDbzUBlUwsYeuppYISxHEVJqp4JfQpBHmfebbz5uIdPWjOlgjzigrxI2uUT2Yrvs
 UMp12MQc07Ir8PEJHG5o54IEthxyi2fILeQecILeOJfZCJ6hukWNqhLpSGmJ4YsoJ+
 Czc8K8ZOlaSmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lUzplNhf
Subject: Re: [Buildroot] [PATCH v2] package/yajl: fix cmake 4 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMTAvMjAyNSAxNjowNiwgQW5kcmVhcyBLw6Rzc2VucyB3cm90ZToKPiBGaXhlcyBkZXBy
ZWNhdGVkIENNYWtlIG9wdGlvbnMuCj4gCj4gT3JpZ2luYWwgcGF0Y2ggYnkgUnVkaSBIZWl0YmF1
bSwgcmViYXNlZCBhbmQgYXBwbGllcyB3aXRoIGZ1enogMC4KPiAKPiBDQzogUnVkaSBIZWl0YmF1
bSA8cnVkaUBoZWl0YmF1bS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLw6Rzc2VucyA8
a2Flc3NlbnNAc3JhLnVuaS1oYW5ub3Zlci5kZT4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
