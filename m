Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA35C7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6B180748;
	Fri, 20 Jun 2025 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7h2TXcMRT-o; Fri, 20 Jun 2025 16:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F2A80763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F2A80763;
	Fri, 20 Jun 2025 16:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F15C8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A47B40152
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-dzbiGB0Pe3 for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9761C40121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9761C40121
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9761C40121
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E621C13F89A;
 Fri, 20 Jun 2025 18:37:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:37:42 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:37:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250619212824.896332-1-salvador.joseluis@gmail.com>
References: <20250619212824.896332-1-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <73415c46cd02ecb59849618b2f925705@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437464;
 bh=j/98plAFCAGHAOb0D212C6j2oc38dRshTH1Xz+UKylE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M9I9uqbDWALMABGla1HRA8NOW1DUMeUj0nwkkpu3iiK4aR5K98ylqTgd0MbJJIwTm
 xJv4NRWcTqcKILL9v3UcVRdqEyt1GA4nFySOF8KekVUMCy0NRrckAXFwpznXOw8tk8
 46g0YiyOLHflNA1WpBhA4R/3Vz/3FZk61IrXH8hkGKUUEX58o+9etY4y6vnh+LgE4u
 /iz02SAGoiMK6C1i1EcphqVqpdKXJ0KV7kreP3yCaVIcIVk7KQWjzTxPF3sbNtFyMG
 Za6uBeDlTGZsBXS5SluBjtmlAEUc2TEjrYEOmTHjNuecrLY+QjvgIrJab1L8xHf9ih
 fWuaeUMi93hIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M9I9uqbD
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.3
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

T24gMTkvMDYvMjAyNSAyMzoyOCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IFJl
bW92ZWQgYmFja3BvcnRlZCBwYXRjaDoKPiAtIDAwMDEtZml4LVNfSUZNVC11bmRlY2xhcmVkLWF0
LXN0YXR4X2MucGF0Y2gKPiAKPiBGb3IgcmVsZWFzZSBub3RlLCBzZWU6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL3RhZy96ZnMtMi4zLjMKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNv
bT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
