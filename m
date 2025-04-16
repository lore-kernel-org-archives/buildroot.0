Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3489EC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053276F551;
	Wed, 16 Apr 2025 20:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZlHO5rLVqDl; Wed, 16 Apr 2025 20:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED536F722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED536F722;
	Wed, 16 Apr 2025 20:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C331920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D9474100B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ChX9wk5vB01 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A2A340716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2A340716
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A2A340716
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 235921C05C0; Wed, 16 Apr 2025 22:54:42 +0200 (CEST)
Message-ID: <1484014d-2d61-4a28-8e80-ed5ca20de301@rnout.be>
Date: Wed, 16 Apr 2025 22:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250323190602.3336195-1-bernd@kuhls.net>
 <20250323190602.3336195-3-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250323190602.3336195-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836882; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qXLzqlGfLXUNomvLucQfLB558BHeJYI24VRIYidx1Ks=;
 b=jSRKR70j1p3zFLwaTNVP5x1n116UyqoDTxodCSkthnwF3+jdxrrnvq3LEnKcfvdMoIX199
 NIMXc+rGQyt3ZZRRD0M3aYEx98VxFaqFvYGY9TnxwFImrAv4YDYad9ZkomnFCRtl9vbjQB
 hpe8GTY1f8LeVUcFXjp50b4J1Mnk34RZ9lMb+VkAvstQ4ZmCI8rQVdEEpyURQkNa/bErvG
 O3dF9cjF0pN4Hrew6njb0jmSnM7QATiaHtQQYB/dCdHX02GvFcAKoKXBK8hS5uI1JAmPIg
 ybTO2h8HWpxZ5tT7R9l4pNNBcA/OFBkvh+9tqUNY0OTAAV0B0Qu8ZA1QTy9Djg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/intel-mediadriver: bump version to
 25.1.4
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAzLzIwMjUgMjA6MDYsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngs
IHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvaW50ZWwt
bWVkaWFkcml2ZXIvaW50ZWwtbWVkaWFkcml2ZXIuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2UvaW50
ZWwtbWVkaWFkcml2ZXIvaW50ZWwtbWVkaWFkcml2ZXIubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvaW50ZWwtbWVkaWFkcml2ZXIvaW50ZWwtbWVkaWFkcml2ZXIuaGFzaCBiL3BhY2th
Z2UvaW50ZWwtbWVkaWFkcml2ZXIvaW50ZWwtbWVkaWFkcml2ZXIuaGFzaAo+IGluZGV4IDBiZTdj
MGJmNmQuLjhiOGYxNTdmOGQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9pbnRlbC1tZWRpYWRyaXZl
ci9pbnRlbC1tZWRpYWRyaXZlci5oYXNoCj4gKysrIGIvcGFja2FnZS9pbnRlbC1tZWRpYWRyaXZl
ci9pbnRlbC1tZWRpYWRyaXZlci5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICAjIExvY2FsbHkg
Y29tcHV0ZWQKPiAtc2hhMjU2ICAzNWY2NDViM2RhMTUyYTcwM2Y1MjA3MWIxMjVlYTNlMGIxOTNm
ZTNiMWQ2YTIwYWFkMzEzYjNjMzNhNTkzMTI4ICBpbnRlbC1tZWRpYS0yNS4xLjMudGFyLmd6Cj4g
K3NoYTI1NiAgNjMzOWJiYTMxNjgxMDJmNWE2MDhmNDQ3MDc2YzllZmIyYTgxOTRlODQ3YTlkYWMy
MTlmYmMxMzMyNDE5MmE3NiAgaW50ZWwtbWVkaWEtMjUuMS40LnRhci5nego+ICAgc2hhMjU2ICA3
NDk3OWQ1YWFlZTc4YjhkYTgyZTNhYWZkNDE1YTIxNmI2MTMxZGZmZjZkOTVkNjkzMDkyN2M4YTRl
M2JkZWQzICBMSUNFTlNFLm1kCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW50ZWwtbWVkaWFkcml2
ZXIvaW50ZWwtbWVkaWFkcml2ZXIubWsgYi9wYWNrYWdlL2ludGVsLW1lZGlhZHJpdmVyL2ludGVs
LW1lZGlhZHJpdmVyLm1rCj4gaW5kZXggMTQ2NmU5Yjk4Ni4uYTU0YjU1OWUzZiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2ludGVsLW1lZGlhZHJpdmVyL2ludGVsLW1lZGlhZHJpdmVyLm1rCj4gKysr
IGIvcGFja2FnZS9pbnRlbC1tZWRpYWRyaXZlci9pbnRlbC1tZWRpYWRyaXZlci5tawo+IEBAIC02
LDcgKzYsNyBAQAo+ICAgCj4gICAjIGJhc2VkIG9uIGh0dHBzOi8vc29mdHdhcmUuaW50ZWwuY29t
L2VuLXVzL2FydGljbGVzL2J1aWxkLWFuZC1kZWJ1Zy1vcGVuLXNvdXJjZS1tZWRpYS1zdGFjawo+
ICAgCj4gLUlOVEVMX01FRElBRFJJVkVSX1ZFUlNJT04gPSAyNS4xLjMKPiArSU5URUxfTUVESUFE
UklWRVJfVkVSU0lPTiA9IDI1LjEuNAo+ICAgSU5URUxfTUVESUFEUklWRVJfU0lURSA9IGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9tZWRpYS1kcml2ZXIvYXJjaGl2ZQo+ICAgSU5URUxfTUVESUFE
UklWRVJfU09VUkNFPSBpbnRlbC1tZWRpYS0kKElOVEVMX01FRElBRFJJVkVSX1ZFUlNJT04pLnRh
ci5nego+ICAgSU5URUxfTUVESUFEUklWRVJfTElDRU5TRSA9IE1JVCwgQlNELTMtQ2xhdXNlCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
