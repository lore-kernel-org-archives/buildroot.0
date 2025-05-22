Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B123C54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E40DB60E11;
	Thu, 22 May 2025 20:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fCGboWHIGwx; Thu, 22 May 2025 20:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29F4E60D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F4E60D58;
	Thu, 22 May 2025 20:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A19CE106
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 934F083E4F
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAhVqgLi4XWv for <buildroot@buildroot.org>;
 Thu, 22 May 2025 20:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A631983E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A631983E51
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A631983E51
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:53:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6E55613F861;
 Thu, 22 May 2025 22:53:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 May 2025 22:53:52 +0200
MIME-Version: 1.0
Date: Thu, 22 May 2025 22:53:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250520114139.9114-1-flavio.tapajos@newtesc.com.br>
References: <20250520114139.9114-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.10
Message-ID: <a472eeef20168b78f4d8b5543f8034e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747947235;
 bh=B1n7gMu/POHEOPVMSIYUI+ndP8GTrncVeMkETZy51B0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A32CMAL17kbgc1tyQg8Sd8ZrFbWKKloj7WWSnOR6LEI+brUKt1zG+SBHxps4trLwY
 0Z3jNMpRzSOUek1HPVad0C6K2IdgFsgniURnuTayI0TTutAQ3LRU+pcjRsGzSRzJlx
 e16EsDMKqZAcp9Aqba2cRBuRDCUTnLjWu5LvYXQ57/igP2GMZgcaYEZ2JQni3PK2cM
 OjhX1H5JIqm0DVucSbr4/oQAVG0zxXZ+x2cow5xYxxaRr+ufLA5AhMeMqzpZXgFS0m
 5ZoEQFWXe5tcdbXnociqinsWNDqvZoHRdHrJfmfz2h1OpENezYum8kNAW40BSFL5Pg
 EI4ivqNF5wC5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A32CMAL1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.41
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

T24gMjAvMDUvMjAyNSAxMzo0MSwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBGb3IgY2hhbmdl
IGxvZywgc2VlOgo+IGh0dHBzOi8vZG9jcy5zcWxhbGNoZW15Lm9yZy9lbi8yMC9jaGFuZ2Vsb2cv
Y2hhbmdlbG9nXzIwLmh0bWwjY2hhbmdlLTIuMC40MQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgoKQXBwbGllZCB0byBu
ZXh0LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
