Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDEEE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5630C60A9F;
	Wed,  8 Jan 2025 21:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEpz1HGjXBvM; Wed,  8 Jan 2025 21:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 755C760AA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 755C760AA2;
	Wed,  8 Jan 2025 21:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 873041FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6819E60AA2
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJEUarkUEO0s for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A018360A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A018360A9F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A018360A9F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:51:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 780DDB0051E;
 Wed,  8 Jan 2025 22:51:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44914])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 22:51:36 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 22:51:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?=C3=89tienne_Carri=C3=A8re?=
 <etienne.carriere@foss.st.com>
In-Reply-To: <20241220151531.59770-1-vincent.stehle@arm.com>
References: <20241220151531.59770-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b5403f615bdbba4f0571fdefc5d16849@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736373098;
 bh=GlNdwerHCiXd3X84yRhaLIAeEFAU09LQAiAOTGw+foM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B3hsSzilT8Yz+GGMOaPbPE+kf3WErLYJ3v5KV2hB7HuExTg/ApYU4aDYyPaJ/Q2FZ
 lsjiUdK1bmx1rtIJOPrQpn3TRKz/GfMUGi9/o6mKqDxL0AtZADKE2DL7AatA/mGB65
 mtJUGczgX8dHpk/ShKuYsY85Lit1g3dvUxivvTIU9PYyGdaexVDXiDZ+fgtz1+ckS4
 Cf3OnI4/2MOl6wrLxGVBJ9o2fWIU57CE4a6Qy5gYI7pQMRyaat8TbXgHeD39TwFB9O
 DC4f5yRchWvQIsG0K2huVg5wKmYhQWmj2fg6k4+M21eFotCpWne+q9OrmL92FRRjWi
 QACVobm4AGq/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B3hsSzil
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add custom version option
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

SGkgVmluY2VudCwgw4l0aWVubmUsCgpPbiAyMC8xMi8yMDI0IDE2OjE1LCBWaW5jZW50IFN0ZWhs
w6kgd3JvdGU6Cj4gQWRkIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbiwgdG8gZW5hYmxlIGVhc2lseSBz
cGVjaWZ5aW5nIGFuIG9mZmljaWFsIAo+IE9QLVRFRQo+IHZlcnNpb24gdG8gdXNlLgo+IFRoaXMg
aXMgc2ltaWxhciB0byB3aGF0IGlzIGRvbmUgaW4gb3RoZXIgcGFja2FnZXMsIHN1Y2ggYXMgbGlu
dXgsIHVib290IAo+IG9yCj4gYXJtLXRydXN0ZWQtZmlybXdhcmUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiDDiXRpZW5u
ZSBDYXJyacOocmUgPGV0aWVubmUuY2FycmllcmVAZm9zcy5zdC5jb20+CgpJIGFwcGxpZWQgdGhp
cyBwYXRjaCB0byBtYXN0ZXIsIHRoYW5rcy4KCkRvIHlvdSB0aGluayB0aGUgc2FtZSBsb2dpYyBz
aG91bGQgYWxzbyBiZSBhZGRlZCB0byB0aGUgb3B0ZWUtY2xpZW50LApvcHRlZS1leGFtcGxlcyBh
bmQgb3B0ZWUtdGVzdCBwYWNrYWdlcz8KCkkgY3VycmVudGx5IGJlbGlldmUgc28uCgpCZXN0IHJl
Z2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
