Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4021C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2EF409C1;
	Sat, 17 May 2025 14:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-u7uVYdd6qu; Sat, 17 May 2025 14:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA3D409C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA3D409C2;
	Sat, 17 May 2025 14:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E31211DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C93A540F32
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKqP3OtHaCGc for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E81A404FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E81A404FC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E81A404FC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:05:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3A4A219F522;
 Sat, 17 May 2025 16:05:19 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 16:05:19 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 16:05:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250515060528.1355475-2-gael.portay+rtone@gmail.com>
References: <20250515060528.1355475-1-gael.portay+rtone@gmail.com>
 <20250515060528.1355475-2-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <12b7ab79c4cb9df0e59b7dc262798f2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747490723;
 bh=wwesKDFFXiIiMhnCN4yDV/1ZZavVaZCL3UdyMF4/+Rs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IzLnLizXovdcREOXvjlgzSW3fe8cCo0xA3seurAMCtsWEGozz+ZkasQ/mxQq2arKT
 xzr3odcpgvAhS5l0pVY+shX9mtvZKOABhiyMt9g7KsSqkAEcj2hXAtLRIBpzSPM7r9
 YG7/3J7ZeNgyna3GMZ5c2vQXlxmhhCYkx9yMq4D5vWGmB6d7IfLY0LfEAPmDpyqv+Y
 lauPN80k9TDJ8d9xG9YHULcD6wMcZPxFbi5Xk77sv23oBOwQ8iVp9F4rMSNsAhaRUt
 P8G9OEpbmLpfGdhgxqEgyvux1THjQi3B9ufmpfEl2CrfgmSb3iBq0gfbGjolsWUUJ2
 zA4KpjGXqG1Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IzLnLizX
Subject: Re: [Buildroot] [PATCH v2 1/2] Revert "package/mesa3d: Gallium VC4
 driver depends on NEON"
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

T24gMTUvMDUvMjAyNSAwODowNSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoZSBHYWxsaXVtIFZD
NCBkcml2ZXIgZG9lcyBub3QgcmVxdWlyZSBORU9OWzFdOyBHYWxsaXVtIFYzRCBkb2VzLiAKPiBB
bHNvLAo+IHRoZSBHYWxsaXVtIFZDNCBkcml2ZXIgc3VwcG9ydHMgdGhlIFJhc3BiZXJyeSBQaSBm
cm9tIDAgdG8gM1syXS4KPiAKPiAgICAgICAgIE1lc2HigJlzIFZDNCBncmFwaGljcyBkcml2ZXIg
c3VwcG9ydHMgbXVsdGlwbGUgaW1wbGVtZW50YXRpb25zIG9mCj4gICAgICAgICBCcm9hZGNvbeKA
mXMgVmlkZW9Db3JlIElWIEdQVS4gSXQgaXMgbm90YWJseSB1c2VkIGluIHRoZSAKPiBSYXNwYmVy
cnkKPiAgICAgICAgIFBpIDAgdGhyb3VnaCBSYXNwYmVycnkgUGkgMyBoYXJkd2FyZSwgYW5kIHRo
ZSBkcml2ZXIgaXMgCj4gaW5jbHVkZWQKPiAgICAgICAgIGFzIGFuIG9wdGlvbiBhcyBvZiB0aGUg
MjAxNi0wMi0wOSBSYXNwYmlhbiByZWxlYXNlIHVzaW5nCj4gICAgICAgICByYXNwaS1jb25maWcu
IE9uIG1vc3Qgb3RoZXIgZGlzdHJpYnV0aW9ucyBzdWNoIGFzIERlYmlhbiBvcgo+IAlGZWRvcmEs
IHlvdSBuZWVkIG5vIGNvbmZpZ3VyYXRpb24gdG8gZW5hYmxlIHRoZSBkcml2ZXIuCj4gCj4gVGhp
cyByZXZlcnRzIGNvbW1pdCBhNWNkYjU0ZWQ3OGIxMzZjODNkZDQ0YWViZmEyN2Y3MTVjZGE1ZWEz
LgpbLi4uXQo+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVA
Z21haWwuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
