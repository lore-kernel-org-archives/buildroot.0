Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1955C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A2A40D32;
	Wed, 19 Feb 2025 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEliwxPV4-Ae; Wed, 19 Feb 2025 21:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D4B40D36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D4B40D36;
	Wed, 19 Feb 2025 21:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE85194
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E259640347
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D75GI_Zr-IhO for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 21:38:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1873B4017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1873B4017A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1873B4017A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9D06619F57E;
 Wed, 19 Feb 2025 22:38:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Feb 2025 22:38:44 +0100
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 22:38:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <20250219092711.32256-1-vincent.stehle@laposte.net>
References: <20250219082442.30082-1-vincent.stehle@laposte.net>
 <20250219092711.32256-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <0e285d80c9dd61c71f7823bc21224e44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740001127;
 bh=871cio4NuFPbSbnR1jTqNvtWRSuv9oYP7YVHbOoX5k4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gHiN0ViqyyLsFEUcByd6V561COahTVKJx/GJ+LjNUdsJGeifu0ri2T3oTG2FoIL7Z
 72r+duS6zHtuxSmHX/HzabTLjuc0zchyFJxSwrSVea+1VesckTyF6dTQWEFrQ1mvqm
 T27lkNCI8o72ntVTuzFqSWXgFpPGdU/6Ce/SZrVdxklnlbC9EQ9OgmITBh+p3q7qAs
 jx3SZlz2Y/xyZzwsdztFOeIVqZQxypI8aOFB1tf+RPZjX4nw0PC8324iZofPXY/ebI
 sA6gXYIosCZskmRYRTJ088lEQcNqeibnI+uoe8L/wrjBhzHsOFaduqEe4BZAdedEja
 6dyiaIgC7emrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gHiN0Viq
Subject: Re: [Buildroot] [PATCH v2] configs/arm_foundationv8: bump to Linux
 6.12 and model 11.27
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

T24gMTkvMDIvMjAyNSAxMDoyNywgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gLSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni4xMi4xNSwgdXBkYXRlIHRoZSBoYXNoIGZpbGUg
YW5kIGFkZCB0aGUKPiAgIGRlcGVuZGVuY3kgb24gaG9zdC1weXRob24zLgo+IC0gQnVtcCB0aGUg
RlZQIGluIHRoZSByZWFkbWUgdG8gdmVyc2lvbiAxMS4yNyBidWlsZCAxOS4KPiAKPiBXaGlsZSBh
dCBpdDoKPiAtIFJld29yayB0aGUgcmVhZG1lIGEgYml0IHdpdGggZXhwbGljaXQgYnVpbGQgaW5z
dHJ1Y3Rpb25zLCBhZGQgYSBsaW5rCj4gICB0byB0aGUgbW9kZWwgYmluYXJpZXMgcnVubmluZyBv
biBBQXJjaDY0IGhvc3QgYW5kIHVwZGF0ZSB0aGUgbW9kZWwKPiAgIGNvbW1hbmQgbGluZSB0byBz
cGVjaWZ5IEFybSB2OC4wIChhcyB3ZSBhcmUgYnVpbGRpbmcgZm9yIENvcnRleC1BNTMpLgo+IC0g
VHVybiBvbiBoYXNoZXMgdmVyaWZpY2F0aW9uIGFuZCB1cGRhdGUgLmNoZWNrcGFja2FnZWlnbm9y
ZQo+ICAgYWNjb3JkaW5nbHkuCj4gLSBBZGQgbXlzZWxmIGFzIGNvLWRldmVsb3BlciBmb3IgdGhp
cyBkZWZjb25maWcuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhp
cm9Ac29jaW9uZXh0LmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
