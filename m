Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1D7C369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447E860755;
	Tue, 22 Apr 2025 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMh635MjAH_B; Tue, 22 Apr 2025 18:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E9F60E97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E9F60E97;
	Tue, 22 Apr 2025 18:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB05919F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B141140259
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deZQn8vQkFyA for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 18:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0CC540177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0CC540177
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0CC540177
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:52:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9CA73780371;
 Tue, 22 Apr 2025 20:52:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 20:52:56 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 20:52:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4_=D0=AE=D1=80=D1=8C?=
 =?UTF-8?Q?=D0=B5=D0=B2_=28Leonid_Yuriev=29?= <leo@yuriev.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250422112734.313858-1-leo@yuriev.ru>
References: <20250422112734.313858-1-leo@yuriev.ru>
User-Agent: Webmail Free/1.6.10
Message-ID: <111f47757cae419f10366087f9341e9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745347977;
 bh=pCJ7jYz8cUGeIgEY7gunFLqAw7NTAiv8jExoZ5k4fOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ppWPj6qMM/lm8dP6ndDceYStLcyyRItrDtoCr0bIQ5WXh2E+QG9xLh05GwGYpNPgz
 hdJi90VMT1q6ZAmJlreRswwt9nw4x+MLam+PE2Fu8bSyMFn1qgC66YzXYjuWzcX1mH
 6+sCT1RDufPbZg21KY1zL44lS7m864D80jpsIAramGK8BNeUINZsqdjyMmzNLgihMG
 PTAGxBGPMU5P91IPUOprPDi9WSg/P5C7lbShlmGS5YwDEkDyRTG/KOBF9AeeoxRYwW
 M6f0PRBWjfW56+Gnvf0UGw10zUH9kU5iaQ4VbfQtV8S322jzymppMH9Y2Px4kif8J3
 8ybRs3zhS+bpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ppWPj6qM
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.6
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

T24gMjIvMDQvMjAyNSAxMzoyNywg0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgd3JvdGU6Cj4gVGhp
cyByZWxlYXNlIGNhbGxlZCAi0JHRg9C30LjQvdCwIiAoRWxkZXJiZXJyeSkgb2YgdGhlIHN0YWJs
ZSBsaWJtZGJ4IGJyYW5jaC4KPiAKPiBQbGVhc2UgdmlzaXQgaHR0cHM6Ly9saWJtZGJ4LmRxZGtm
YS5ydSBmb3IgbW9yZSBpbmZvcm1hdGlvbiwgY2hhbmdlbG9nLAo+IGNyZWRpdHMgYW5kIGFja25v
d2xlZGdtZW50cywgZG9jdW1lbnRhdGlvbiwgQysrIEFQSSBkZXNjcmlwdGlvbiBhbmQKPiBsaW5r
cyB0byB0aGUgb3JpZ2luYWwgZ2l0IHJlcG8gd2l0aCB0aGUgc291cmNlIGNvZGUuIFF1ZXN0aW9u
cywgCj4gZmVlZGJhY2sKPiBhbmQgc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUgdG8gdGhlIFRlbGVn
cmFtJyBncm91cCAKPiBodHRwczovL3QubWUvbGlibWRieC4KPiAKPiBTaW5jZSAwLjEzLnggbGli
bWRieCBpcyBsaWNlbnNlZCB1bmRlciB0aGUgQXBhY2hlIDIuMCBMaWNlbnNlLgo+IEZvciBub3Rl
cyBhYm91dCB0aGUgbGljZW5zZSBjaGFuZ2UsIHBsZWFzZSByZWZlciB0byB0aGUgQ09QWVJJR0hU
IGZpbGUKPiB3aXRoaW4gb3JpZ2luYWwgbGlibWRieCBzb3VyY2UgY29kZSByZXBvc2l0b3J5Cj4g
aHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4Cj4gCj4gU2lnbmVkLW9m
Zi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2
LnJ1PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
