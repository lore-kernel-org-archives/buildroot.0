Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20499D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A904060E;
	Thu, 11 Dec 2025 19:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hn1i6xrHB3v; Thu, 11 Dec 2025 19:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F519404EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481476;
	bh=U2aMzJEqHJjGp/GuqFTYFI7wtqh0RT6E2iujKOfkajk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fb5D0pEezXL9jlZ0qXIQIQxHNYbVeUjXe3iPL355+kcJD/MAOfIg7y9QpZ7AMKuRK
	 4pGbO/UPkNKJfcp3PSEmnDJI8w9Q00Ht28/lKqMkHMNY1sj787fF1SWwpD6RqeOGRW
	 SQdVGSa9gk/XSJXP1xIfs27JG0oz+8lAV+dulO0TpDlSGrCddKv1q7eSNvbFL6ED8S
	 VPfbzMvRrssm1/zK91hNI4lspJB5DoiOVF4kwLDcTNPyB1ka8HBK18229nA1WKJ3wc
	 MBF4uMMOSrXks6AXvU5/NrnmR1y8b0K+mb2vfJZ4fAAESg2vqnE84q2CVZyHx1Sm6q
	 lNtp3icHyv5XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F519404EC;
	Thu, 11 Dec 2025 19:31:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C752C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19B1B8375B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTt-6ZI6IzdF for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F7408317B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F7408317B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F7408317B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F00D3B97A082; Thu, 11 Dec 2025 20:31:11 +0100 (CET)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:59 +0100
Message-ID: <20251211193059.1099492-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206-libdbi_typo-v1-1-07d8e40b2242@bootlin.com>
References: <20251206-libdbi_typo-v1-1-07d8e40b2242@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3+IWjl9bHoRbGe7Zf8wZJJiTYSQUtrU2q2ec2xoLKIY=;
 b=VI/f9L3lLYJM8tdiX4FuAgpvVhDtj85G96h0hH3blhgdWoLFv+cqb4RhGLAHSoOilRDE5p
 d8Aqqvwbu9P9YWvMquDCzDINxQtxOKPogfLOJpyTjHUj8mIQujDop/ZqN8tZMlBDsCEUT0
 yWRLHAFECuMgMOp+mXkouo0pVPnxt7zFfL9E/MiZBCB9kMrbGxoKEgwJ0DCa514v2sLK+E
 JGyW487AUbhtrKhhwapBK/c3I2KV5OyUtpTA0BxlfSciWhQ658PfmWoXG+jfuX3aJR/izr
 t24OtBru7fZ+EsQ2XcDoFblOQOSs4brV68qdz3PONY9GursUIOC22c0uMQ+4eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VI/f9L3l
Subject: Re: [Buildroot] [PATCH] package/libdbi: fix small typo in Config.in
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBicm93c2luZyB0aGUgYXZhaWxhYmxlIERhdGFiYXNlIHBhY2th
Z2VzLCBsaWJkYmkgYXBwZWFycyBpbiB0aGUKPiBtZW51Y29uZmlnIGFzICJsaWRiaSIuCj4gCj4g
Rml4IHRoZSBtZW51Y29uZmlnIGVudHJ5IGJ5IHVwZGF0aW5nIHRoZSByZWxldmFudCBib29sZWFu
IG5hbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54IGFuZCAyMDI1LjA4LnguIFRoYW5r
cwoKPiAtLS0KPiAgcGFja2FnZS9saWJkYmkvQ29uZmlnLmluIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJkYmkvQ29uZmlnLmluIGIvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCj4gaW5kZXgg
MTNhYzM0NGY4Mjg0Li5kOWExMzE2MzExYzEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJkYmkv
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCj4gQEAgLTEsNSArMSw1
IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJEQkkKPiAtCWJvb2wgImxpZGJpIgo+ICsJYm9v
bCAibGliZGJpIgo+ICAJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCj4gIAloZWxwCj4gIAkg
IGxpYmRiaSBpbXBsZW1lbnRzIGEgZGF0YWJhc2UtaW5kZXBlbmRlbnQgYWJzdHJhY3Rpb24gbGF5
ZXIKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogZDRhOTk4ZjBmYTFmYTQyZDg5ZGJkMTlkMTBjNmMy
ZWU3OWQzZTFhYgo+IGNoYW5nZS1pZDogMjAyNTEyMDYtbGliZGJpX3R5cG8tYjRiZGUzNmY5ODIz
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tIAo+IEFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29t
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
