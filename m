Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515ADC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 18:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01002401CA;
	Wed, 23 Apr 2025 18:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbOpH5ILlemF; Wed, 23 Apr 2025 18:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B5E41296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B5E41296;
	Wed, 23 Apr 2025 18:46:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48DE419F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A87680C29
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxb6gfk8WdDI for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 18:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EB5D80C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EB5D80C1D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EB5D80C1D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7897E5FFC0;
 Wed, 23 Apr 2025 20:46:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 20:46:37 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 20:46:37 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250423132539.836773-1-raphael.melotte@mind.be>
References: <20250423132539.836773-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <24211f86f115d02fd350918191b509ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745433998;
 bh=qSDqBsmcAVXT5c38d3kB0GKNwhyhdkWSogGObAxekTc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ctSITovJXVaxXGjRuPmNyxe+GNXQl/mIXlKg7S2GJM81/mMjjH4K1wlv+j0fBN/rV
 q7SOzfbj9l8a6wBf3bmLNmsISpHZ5Y/dnvK5qKJxA9QYyjbrf/qEiYvUQXUMeqgFn3
 k33uROM0a0BnSPcNBKAFQ5HqEUSJ1QQqwEcDTwo6OlPJ9ZPwTmaE9lpD+WF4Tgir/F
 7GTiL/zwSJcF7rcth4DAlrV/n+CWqlo5AJBKTSNSYLGr/B4M6fjmzM1OCGyGOiU1aH
 nx6Qsd+Taw3ktZnSrjYZDxndSUGRHURbPuf6ELqUMRrd0srBgUn7KQtoWCf68PjHyu
 dq3KsQvyJnr1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ctSITovJ
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Jugurtha BELKALEM
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

T24gMjMvMDQvMjAyNSAxNToyNSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBKdWd1cnRoYSdzIGVtYWlsIGFkZHJlc3MgaXMgYm91bmRpbmc6Cj4gCj4gIDU1MCA1LjEu
MSBUaGUgZW1haWwgYWNjb3VudCB0aGF0IHlvdSB0cmllZCB0byByZWFjaCBkb2VzIG5vdCBleGlz
dC4gCj4gUGxlYXNlIHRyeSBkb3VibGUtY2hlY2tpbmcgdGhlIHJlY2lwaWVudCdzIGVtYWlsIGFk
ZHJlc3MgZm9yIHR5cG9zIG9yIAo+IHVubmVjZXNzYXJ5IHNwYWNlcy4KPiAKPiBSZW1vdmUgaXQg
ZnJvbSB0aGUgREVWRUxPUEVSUyBmaWxlIHNvIHRoYXQgdXRpbHMvZ2V0LWRldmVsb3BlcnMKPiBk
b2Vzbid0IHNlbmQgZW1haWxzIHRvIG5vbi1leGlzdGVudCBhZGRyZXNzZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
