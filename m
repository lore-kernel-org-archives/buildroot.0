Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642A5C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31066809E7;
	Tue, 15 Apr 2025 17:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KgqMgrX7V95; Tue, 15 Apr 2025 17:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 717E380C2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 717E380C2D;
	Tue, 15 Apr 2025 17:23:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 455E8200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A5F660BA8
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx84vehpcfKi for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 244806062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244806062B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244806062B
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:23:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5AE4F60137;
 Tue, 15 Apr 2025 19:23:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:23:13 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:23:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Francis Laniel <flaniel@linux.microsoft.com>
In-Reply-To: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
References: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <51a49e9cb3753181d544641efbf14880@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744737796;
 bh=PFjFVebEzXT2Jgm6th0OiKiCBdHL26H5koiQ0n87kdc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZvhqkyDmoIh9EPUmu4WO2o09aj5WLWq2hwXHSk0ydR5qzRzPoWgR9N/yXiUVlCUSG
 ADVIuohpToaCZBoScjcetYj0vGdgPBqqRXtEIVoZ0y8/0zU5FeqcBg0bT38x5Pr3Lw
 ffOhlk53F812AwTS08/ZmV1p8u3rfilKs5nVZjB7aFv2pWXyo7PobMtQu2z27u+Pel
 xPS0E6Pj6Axs/cExGSQPFsZrR2tzUPDUs5Ir8VRBGW5A4BsRa6zPp7Yqs6YNjLmJqb
 KGn648StZfPDidaQHGE3f698Uo9vMakfomOQK7bnloEdr2kmQq9ifqQtLI4cDwQ6nh
 uBmbMtuXw6qfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZvhqkyDm
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.28
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

T24gMTUvMDQvMjAyNSAwOToxOSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gT24gaG9zdHMgd2l0aCBhIHJlY2VudCB2ZXJzaW9uIG9mIGNtYWtlIChlZzogNC4wLjApLCBi
dWlsZHMgaW52b2x2aW5nCj4gaG9zdC1wYWhvbGUgZmFpbCB3aXRoIHRoZSBmb2xsb3dpbmcgZXJy
b3I6Cj4gCj4gQ01ha2UgRGVwcmVjYXRpb24gV2FybmluZyBhdCBDTWFrZUxpc3RzLnR4dDoxIChj
bWFrZV9taW5pbXVtX3JlcXVpcmVkKToKPiAgIENvbXBhdGliaWxpdHkgd2l0aCBDTWFrZSA8IDMu
NSB3aWxsIGJlIHJlbW92ZWQgZnJvbSBhIGZ1dHVyZSB2ZXJzaW9uIAo+IG9mCj4gICBDTWFrZS4K
PiAKPiAgIFVwZGF0ZSB0aGUgVkVSU0lPTiBhcmd1bWVudCA8bWluPiB2YWx1ZSBvciB1c2UgYSAu
Li48bWF4PiBzdWZmaXggdG8gCj4gdGVsbAo+ICAgQ01ha2UgdGhhdCB0aGUgcHJvamVjdCBkb2Vz
IG5vdCBuZWVkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciAKPiB2ZXJzaW9ucy4KPiAKPiBUaGUg
aXNzdWUgaGFzIGFscmVhZHkgZml4ZWQgaW4gdGhlIHVwc3RyZWFtIHByb2plY3Qgd2l0aCBjb21t
aXQKPiAxMmNhMTEyODE5MTIgKCJDTWFrZUxpc3RzLnR4dDogUmVxdWlyZSBjbWFrZSAzLjUgb3Ig
aGlnaGVyIiksIHdoaWNoIGlzCj4gcGFydCBvZiB2ZXJzaW9uIDEuMjguCj4gCj4gVXBncmFkZSBw
YWhvbGUgdG8gZ2V0IHJpZCBvZiB0aGlzIGVycm9yLgo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9kZXZlbC9wYWhvbGUvcGFob2xlLmdpdC90cmVlL05FV1M/aD12MS4yOAo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKSSBhbHNvIGFkZGVkIGluIHRoZSBjb21t
aXQgbG9nIHlvdXIgZXhhbXBsZSBjb25maWcgd2hpY2gKcmVwcm9kdWNlcyB0aGUgaXNzdWUuCgpC
ZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
