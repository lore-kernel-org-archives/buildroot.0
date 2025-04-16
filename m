Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FFC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3068760A51;
	Wed, 16 Apr 2025 21:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogyVocvxClGp; Wed, 16 Apr 2025 21:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4074760A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4074760A7B;
	Wed, 16 Apr 2025 21:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 473A811B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 582CC40033
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MsWtvsVYhH8 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30C2A40208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C2A40208
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30C2A40208
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A00A1C05C0; Wed, 16 Apr 2025 23:31:58 +0200 (CEST)
Message-ID: <b24670bf-6270-4459-a6e5-b83dc13535ea@rnout.be>
Date: Wed, 16 Apr 2025 23:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250408094158.3725214-1-lazzer@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250408094158.3725214-1-lazzer@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0ThmC9WTGbj7TB5s2rRg/MqGyyIKzIReQvhVYkWh10E=;
 b=G95L3J2dd7tl5rnoZtGlXLDXbyX6t1h9eo4xvUUZPMTeLkHTo09wfdaJvsjZ/EhXnD6RwT
 v8Q3zX1xfL8NgGRKIc7kvLprbTiNEVibEbQIW9qyZXvFDxOFClI5YCOW/7a36kbiHdWz8R
 7V3PJzwc7h/vL7zgKjw8iJ5ODv9MuquosEwFSfWVhWEC3wxd5Y0b7vhWeDokFIx7YCAcgb
 YfL39C4S5EikOb7ysQNHnJ3i591nzZPPFaLuN4S58cqT+Lip/RELBl55oVWrvo+N6Z0iLJ
 a32lGF/uUJOIa2yHBJaOfghGUW04IwP/bhSTBWDqnHyBBW+bEJgnUoZRzI+RbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 6.14
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

Ck9uIDA4LzA0LzIwMjUgMTE6NDEsIE1hdHRpYXMgV2Fsc3Ryw7ZtIHdyb3RlOgo+IENoYW5nZWxv
ZzoKPiBodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvZXRodG9vbC9l
dGh0b29sLmdpdC90cmVlL05FV1M/aD12Ni4xNAo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBX
YWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhh
bmtzLgoKIMKgQ29udGFpbnMgZml4ZXMgYW5kIHRoZSBDTEkgQVBJIGhhc24ndCBjaGFuZ2VkLgoK
CiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvZXRodG9vbC9ldGh0b29s
Lmhhc2ggfCAzICsrLQo+ICAgcGFja2FnZS9ldGh0b29sL2V0aHRvb2wubWsgICB8IDIgKy0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLmhhc2ggYi9wYWNrYWdlL2V0aHRvb2wv
ZXRodG9vbC5oYXNoCj4gaW5kZXggNmZjMGMxM2QzYi4uOTVjYzE0YzQ5MCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2V0aHRvb2wvZXRodG9vbC5oYXNoCj4gKysrIGIvcGFja2FnZS9ldGh0b29sL2V0
aHRvb2wuaGFzaAo+IEBAIC0xLDUgKzEsNiBAQAo+ICAgIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvZXRodG9vbC9zaGEyNTZzdW1zLmFzYwo+IC1zaGEy
NTYgIDhkOTFmNWM3MmFlM2YyNWI3ZTg4ZDQ3ODEyNzlkY2IzMjBmNzFlMzAwNTg5MTQzNzBiMWM1
NzRjOTZiMzEyMDIgIGV0aHRvb2wtNi4xMS50YXIueHoKPiArc2hhMjU2ICA5MzM4YmIwMGU0OTI4
NzhkM2JiZTNjZDI4OTRlNjBkYjM1ODEzNjM0YzIwOGRiMGIyMGY1YzdlZTg0ZGE2OWIxICBldGh0
b29sLTYuMTQudGFyLnh6Cj4gKwo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgIHNoYTI1NiAg
ODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIx
Yjg4MDY0MyAgQ09QWUlORwo+ICAgc2hhMjU2ICA1ZDYzMjkzNDM5NmY5MGM4MmRmZWJlM2M5NTEy
NjQ4YmJiNjMzM2I0MDYxMTNkMGNkMzMxYjBlMGFhMmQzNGExICBMSUNFTlNFCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZXRodG9vbC9ldGh0b29sLm1rIGIvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wu
bWsKPiBpbmRleCBmYzA2MjJjMDRhLi42NTRmYzQwMWI3IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
ZXRodG9vbC9ldGh0b29sLm1rCj4gKysrIGIvcGFja2FnZS9ldGh0b29sL2V0aHRvb2wubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAt
RVRIVE9PTF9WRVJTSU9OID0gNi4xMQo+ICtFVEhUT09MX1ZFUlNJT04gPSA2LjE0Cj4gICBFVEhU
T09MX1NPVVJDRSA9IGV0aHRvb2wtJChFVEhUT09MX1ZFUlNJT04pLnRhci54ego+ICAgRVRIVE9P
TF9TSVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvc29mdHdhcmUvbmV0d29yay9ldGh0b29sCj4g
ICBFVEhUT09MX0xJQ0VOU0UgPSBHUEwtMi4wCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
