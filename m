Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD2ACCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C07843E8;
	Fri, 10 Oct 2025 12:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9h-qbhHrlff; Fri, 10 Oct 2025 12:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 109FC843D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109FC843D4;
	Fri, 10 Oct 2025 12:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19267119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15F75402AA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9yd5r9mHZ-o for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 378D640155
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378D640155
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 378D640155
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:05:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 87913780516;
 Fri, 10 Oct 2025 14:05:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 14:05:37 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 14:05:37 +0200
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251009193114.1950801-1-flavio.tapajos@newtesc.com.br>
References: <20251009193114.1950801-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f2c99900ac176a69db03ce1b482dd5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760097939;
 bh=69uhoZbaPyxGlMZkhAalOLZH/LTaosvthRaLKiv93N8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E7x0rzzLoH1wXUQNXsegKeahAHfnJIOhh0DlBSGzpHtS8mzQLRcHEUanosYRISsnY
 BQZLVI2fc/Jw+WEUvakjKHUOF50O8ma3bAeDzP/5G3Ii2CoYioG0NmVeyz6W9aAgN8
 KkqjvM4ojz/kMoDMVO8JhOApJdqUzzBKet6/y8PlVIb8pUGetmoeaK5p1MxHJITBGm
 verxjgW+1QBAKodMLJh2OxZmzrawMyOi52k+37JyVPEOeItuvp0KM7R+CZbX7jb2Xz
 Re0ZkL0UO/BT2m6jzj1dbwmszNExSOnC0UntEx8T+KU1AdaCgxaJ0krw3fPxJE5tqS
 hD0qz8Iyy11qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=E7x0rzzL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.0.43
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

T24gMDkvMTAvMjAyNSAyMTozMSwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBGb3IgY2hhbmdl
IGxvZywgc2VlOgo+IGh0dHBzOi8vZG9jcy5zcWxhbGNoZW15Lm9yZy9lbi8yMC9jaGFuZ2Vsb2cv
Y2hhbmdlbG9nXzIwLmh0bWwjY2hhbmdlLTIuMC40Mgo+IGh0dHBzOi8vZG9jcy5zcWxhbGNoZW15
Lm9yZy9lbi8yMC9jaGFuZ2Vsb2cvY2hhbmdlbG9nXzIwLmh0bWwjY2hhbmdlLTIuMC40Mwo+IAo+
IFNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2Mu
Y29tLmJyPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
