Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1045C369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4CE60608;
	Wed, 16 Apr 2025 19:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bp2XIIXObhUv; Wed, 16 Apr 2025 19:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF46C60BFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF46C60BFB;
	Wed, 16 Apr 2025 19:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0FC5920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D534100B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wSuI3G9pwS7 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDE5D40B1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDE5D40B1B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDE5D40B1B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C29BB780502;
 Wed, 16 Apr 2025 21:20:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Apr 2025 21:20:38 +0200
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 21:20:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ca255da7b09355af2208152a37f635bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744831242;
 bh=RovHV3uGv9XcyTz++PmM9Tc6e8BRXjlpT3puqVMShlY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e5qSJy3VrkmKX7LmWS9rQiLvKT1AFeGXt9YeSgD6S6aPoBDztq0sTFMxpqnckNe4L
 Aw5+NXM8xNOK3JqFKagMz65f/yDSy/TALIir3rvL4Ev+IGpZ4R/iNYEYX3UI3FtOfI
 DEDYVZRVxp61EyjU3bomfX7TaPpzObsECQs+8IOzZyc2KGIc04JgIQ1GgrBX+dzWZw
 0Xm9QXRrTZGaCrz2/S0fSPqCshu7knE+x+lZ0ZfH4o2+MI/96a5cM088plbs86kNEx
 QDWeMfSh/E1qYPC7H5DWbmKpByfbI2dEhatz12SewOQoxFVwu4k+kvENpYljjdo2rg
 mWGtjK4cuRS3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=e5qSJy3V
Subject: Re: [Buildroot] [PATCH 1/6] board/raspberrypi/readme.txt: add note
 for bootcode.bin
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

T24gMTUvMDQvMjAyNSAxNzozMSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoZSBzZWNvbmQtc3Rh
Z2UgYm9vdGxvYWRlciBpcyBjb250YWluZWQgaW4gdGhlIG9uYm9hcmQgRUVQUk9NWzFdIHNpbmNl
Cj4gdGhlIFJhc3BiZXJyeSBQaSA0IChpLmUuIGZvciBwaTQsIHBpNDAwLCBjbTQsIGNtNHMgYW5k
IHBpNSkuCj4gCj4gVGhlcmVmb3JlLCB0aGUgZmlsZSBib290Y29kZS5iaW5bMl0gaXMgbmVlZGVk
IGZvciB0aGUgZm9ybWVyIFJhc3BiZXJyeQo+IFBpIG9ubHkgKGkuZS4gcGkxLCBwaTIsIHBpMywg
cGkwLCBwaTB3IGFuZCBwaXplcm8ydykuCj4gCj4gVGhpcyBhZGRzIGEgbm90ZSBwcmVjaXNpbmcg
dGhlIGZpbGUgYm9vdGNvZGUuYmluIGlzIHByZXNlbnQgZm9yIHRoZQo+IGZvcm1lciB2ZXJzaW9u
cyBvZiB0aGUgUmFzcGJlcnJ5IFBpLgo+IAo+IFsxXTogCj4gaHR0cHM6Ly93d3cucmFzcGJlcnJ5
cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL3Jhc3BiZXJyeS1waS5odG1sI3Jhc3BiZXJy
eS1waS1ib290LWVlcHJvbQo+IFsyXTogCj4gaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2Rv
Y3VtZW50YXRpb24vY29tcHV0ZXJzL2NvbmZpZ3VyYXRpb24uaHRtbCNib290Y29kZS1iaW4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNv
bT4KClNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
