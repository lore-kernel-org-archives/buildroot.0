Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B323FC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851096F630;
	Wed, 16 Apr 2025 21:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eF3_-axnWvq0; Wed, 16 Apr 2025 21:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC3760A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDC3760A7B;
	Wed, 16 Apr 2025 21:26:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D8511B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB21940B23
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEV_wm2BB_Q0 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4CD54013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CD54013C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4CD54013C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B2AE1C00C0; Wed, 16 Apr 2025 23:26:28 +0200 (CEST)
Message-ID: <406bfeda-4d09-4537-ad4c-2011f3b0d843@rnout.be>
Date: Wed, 16 Apr 2025 23:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gilles.bardoux@sagemcom.com, buildroot@buildroot.org
References: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
Content-Language: en-GB
In-Reply-To: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838788; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r7keMIUuLNvbuY2gRXsgRFB/BjB4F8M+wNOKI2gvFOg=;
 b=Dk38qSsnoh5uH/dhg9REa1TwoX8rumSoAUx/dj7WzQu5m0Us7loS37b4ieSF/WDq7Ul7Bl
 HrGOIOHPFgIwt+BRhZ364wI1mVKy14x//vwhe2NxrnYGGGwxx1YTldDs69jiXeiBHtMM3T
 1YBZc7kuugBE5PMqRu/iZ346AoNZdIsGA7onnTBND59cJMfWdop0INgl/vCxrAOfDyYXGs
 g250S6rD+IB5zKOBy1jqJy/ci5F8vunKudwG6g8dV8A/1hnwnrGQRkl55RbMfUSllislef
 GT+D3vgJ3gKRcbP6kP5C5+LQb/sVNseSk5K7+9qNYwq/1RKe6S9bY3wNSGfA1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/python-twisted: fix cpe id vendor
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

Ck9uIDI0LzAzLzIwMjUgMTc6MjYsIEdpbGxlcyBCYXJkb3V4IHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gcGFja2FnZS9weXRob24tdHdpc3RlZDogZml4IGNwZSBpZCB2ZW5kb3IKPgo+IHR3aXN0ZWRt
YXRyaXggaXMgZGVwcmVjYXRlZCwgdHdpc3RlZCBpcyB0aGUgY3VycmVudCBjcGUgaWQgdmVuZG9y
IGZvciAKPiBweXRob24tdHdpc3RlZAo+Cj4gU2lnbmVkLW9mZi1ieTogR2lsbGVzIEJhcmRvdXgg
PGdpbGxlcy5iYXJkb3V4QHNhZ2VtY29tLmNvbT4KCiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwg
MjAyNC4xMS54IGFuZCAyMDI0LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoK
PiAtLS0KPiDCoHBhY2thZ2UvcHl0aG9uLXR3aXN0ZWQvcHl0aG9uLXR3aXN0ZWQubWsgfCAyICst
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi10d2lzdGVkL3B5dGhvbi10d2lzdGVkLm1rIAo+IGIv
cGFja2FnZS9weXRob24tdHdpc3RlZC9weXRob24tdHdpc3RlZC5tawo+IGluZGV4IDBmOTFmYTI0
NWMuLmI3MjE3ZGE2ZTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tdHdpc3RlZC9weXRo
b24tdHdpc3RlZC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXR3aXN0ZWQvcHl0aG9uLXR3aXN0
ZWQubWsKPiBAQCAtMTAsNyArMTAsNyBAQCBQWVRIT05fVFdJU1RFRF9TSVRFID0gCj4gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzc3LzFjL2UwN2FmMGRmMzEyMgo+IMKg
UFlUSE9OX1RXSVNURURfU0VUVVBfVFlQRSA9IGhhdGNoCj4gwqBQWVRIT05fVFdJU1RFRF9MSUNF
TlNFID0gTUlUCj4gwqBQWVRIT05fVFdJU1RFRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+IC1Q
WVRIT05fVFdJU1RFRF9DUEVfSURfVkVORE9SID0gdHdpc3RlZG1hdHJpeAo+ICtQWVRIT05fVFdJ
U1RFRF9DUEVfSURfVkVORE9SID0gdHdpc3RlZAo+IMKgUFlUSE9OX1RXSVNURURfQ1BFX0lEX1BS
T0RVQ1QgPSB0d2lzdGVkCj4gwqBQWVRIT05fVFdJU1RFRF9ERVBFTkRFTkNJRVMgPSBcCj4gwqDC
oMKgwqAgaG9zdC1weXRob24taGF0Y2gtZmFuY3ktcHlwaS1yZWFkbWUgXApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
