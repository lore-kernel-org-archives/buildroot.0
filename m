Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77032CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 13:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E02B60E84;
	Thu, 14 May 2026 13:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTtMU5Bspq3j; Thu, 14 May 2026 13:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801C060E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778764403;
	bh=YCbj8WiD9EgmakP9hxwfvx7RXtgOwXtEOhiSsGFXYM8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BwRK3Npxp8L9aL5d+0OQtSv2a2LNPAT21vjzPM36YYIH/ZRvlrGFm3jJrJ0OhhGtO
	 tvLY0XsvhBEcfwiOFa6mo80YqdiBGpNfkT87nJ5rFlyGJDNtNk5GJg+8jE2G41H5E4
	 z9r2QDCus5EnqRYy+8/tylT4R4mjSJoYhMdlStB1Mccw/9rKhFsuMNTkXVQBUFsyxc
	 aLa+xNO5JmOo/D7CS5j1UhEqjsemr/wid9u17PRURNTTRvPVLHP7i0W4E6w2s3wWDZ
	 Hg/W9taIl6+Wo8plnLT2STlcUjB7/Q0TkwoWeV8sJiTVFYYi/N0eTbHxEIaVfVni1l
	 cDxGHCwbN8mBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 801C060E81;
	Thu, 14 May 2026 13:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7054336F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6201C60E81
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgNiQKtOkcXi for <buildroot@buildroot.org>;
 Thu, 14 May 2026 13:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A99F60E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A99F60E7D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A99F60E7D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 13:13:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 966DEB00572;
 Thu, 14 May 2026 15:13:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 15:13:15 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 15:13:15 +0200
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20260513113637.3924259-1-lazzer@gmail.com>
References: <20260513113637.3924259-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <8c2d1e99e77c71356349e73c83b78ffa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778764397;
 bh=1n17ltLdg/xqGtjV9QsYV7zH9ECwIZttQUgj/SFGK/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bbmgfHmhKbzKkuIJXcE4P4SySkmOdWZmIUFrWtDATInW1gWC8YYX9cKUdaRHiaMbL
 mot8OeJ4WbzAp5ouhUWw/2GuTshouR/vP9GriXWV++7XvZosh1x0tuVH4i+vNC66xD
 0eneQZvgABpgM4HJ56OMV5cNVa+11xOLgtKXTil1Ab9zAbX4sstrhL4r0UZz274nfT
 YYXVAKlRIH0AC5ntjwsQyHQV47LS0oaRC/lLKyVB6MhXrsjThPgqpPV6uUI9LKTJbn
 TOiHDcuzBoFWhRkaoxz1wlpcj2NAlzAgat364Ey1Qc1uc8XSu2/47K0P2Un6ssABZK
 o01dU6I9jojVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bbmgfHmh
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: Bump version to 10.5.4
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

T24gMTMvMDUvMjAyNiAxMzozNiwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6ClsuLi5dCj4gU2ln
bmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+CgpBcHBsaWVk
IHRvIG5leHQsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
