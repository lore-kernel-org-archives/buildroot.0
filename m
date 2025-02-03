Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F277CC02196
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B529941450;
	Mon,  3 Feb 2025 17:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsXfkkyhqIwc; Mon,  3 Feb 2025 17:46:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE60F41463
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE60F41463;
	Mon,  3 Feb 2025 17:46:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 250C5185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14B0F81FFE
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZerC-2YwCQ1 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:46:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7965581FEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7965581FEB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7965581FEB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:46:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1253519F593;
 Mon,  3 Feb 2025 18:46:11 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:34602])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 18:46:11 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 18:46:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?=C3=89tienne_Carri=C3=A8re?=
 <etienne.carriere@foss.st.com>
In-Reply-To: <20250129125410.250820-2-vincent.stehle@arm.com>
References: <20250129125410.250820-1-vincent.stehle@arm.com>
 <20250129125410.250820-2-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4b0f0b0ac56b74f1a105c665305e3547@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738604774;
 bh=IVET1i3v205n2MgixsTXaa9koCkn9psao1cF1d3kN8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qt2C5G9rHPqUROgjd1UF+sRMzqbC6GSm2hjXLnyWA4NF9pdDhhtylOeQWmCX1iK1W
 x0KsvmkUoGaujtbwcIwXWYx3D8ZkJ5rSd99dXmWKENd41bxeKz46WMHWlndjwtFQpn
 N7OyeoZM2ngCnZyYwod04203HsavDkqIj/NuRKbs2CuqYqPwdJMjAC0HvNZ0Ow7NXY
 O4v6pbOYh+1BY0bSiBfvnanmu5evgR0Id82tSUewahQiHrco0LweNjNdc8QP/hL1Qp
 T1B/S614+cMkJs2bm0s7jsT82jMyxyfs1yMJiwfoZc2gpkxa/Yv4XVhZlImWPCQATJ
 mZk+JLrhnxNhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qt2C5G9r
Subject: Re: [Buildroot] [PATCH 1/3] package/optee-client: add option to use
 same version as optee-os
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

T24gMjkvMDEvMjAyNSAxMzo1NCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdlIGNhbiBzZWxl
Y3QgYSBjdXN0b20gb2ZmaWNpYWwgdmVyc2lvbiBmb3IgdGhlIG9wdGVlLW9zIHBhY2thZ2U7IGFk
ZCAKPiBhbgo+IG9wdGlvbiB0byBzZWxlY3QgdGhlIHNhbWUgdmVyc2lvbiBmb3Igb3B0ZWUtY2xp
ZW50LCB0byBlYXNpbHkga2VlcCB0aGVtCj4gc3luY2hyb25pemVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogw4l0aWVu
bmUgQ2FycmnDqHJlIDxldGllbm5lLmNhcnJpZXJlQGZvc3Muc3QuY29tPgoKU2VyaWVzIGFwcGxp
ZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
