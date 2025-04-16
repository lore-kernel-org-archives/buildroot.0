Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242BC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1113282105;
	Wed, 16 Apr 2025 21:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G90ahZm45fC7; Wed, 16 Apr 2025 21:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C723B8208A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C723B8208A;
	Wed, 16 Apr 2025 21:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C79159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E67F740A87
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQOVNDPm3CXu for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:30:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58C04400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C04400BD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C04400BD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 485EF1C0083; Wed, 16 Apr 2025 23:30:44 +0200 (CEST)
Message-ID: <507c1627-42eb-43d7-8f0b-c2c2a43ba28a@rnout.be>
Date: Wed, 16 Apr 2025 23:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
References: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
 <20250406-fix_zxing-v2-1-0bce0e835a60@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20250406-fix_zxing-v2-1-0bce0e835a60@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QA6AZxMMyc1LQEVeaLhZ+thf8XPBLo1/m3BaQmYdw+s=;
 b=D7AvCrbdZUpSJ3XkhkJZY8YHwEFSz7ANZRC//KFYm9q3aC5r1Jg52++P3ffyQSOV3l19OX
 RbCFtv07Qw01AI5H472KhaEHuRtYbt+WR6QqY5jQq6GiF5dlJsUCGLBiVBdT8csrwMWjsQ
 1DQMrMpk54356/gk8FFKQyZ1FM8fVFiJRU3jf3hJBvK7V4PS1lCGxNqMjkYQmbgYQh9eP1
 Rr4T3OvoC5AZHriAzXRXo5h4Vfb8BVEo8n6DdXS7GgaM2/hXKdQA+ddLgsY7Ok4ScCz039
 LCpG5XS7LNM5KzOUhpI9gEWggaEbc3SeEW6Hhj6hBD2VNietrtcYd7WXg501hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v2 01/11] package/gstreamer1/gstreamer1:
 bump version to 1.24.11
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

Ck9uIDA2LzA0LzIwMjUgMDI6NDgsIFRob21hcyBCb25uZWZpbGxlIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxl
QGJvb3RsaW4uY29tPgoKIMKgU2VyaWVzIGFwcGxpZWQgdG8gMjAyNS4wMi54LgoKIMKgSXQncyBh
IG1ham9yIHZlcnNpb24gYnVtcCwgYnV0IDIwMjUuMDIgc2hvdWxkIGhhdmUgdXBkYXRlZCB0byB0
aGlzIHZlcnNpb24gCmFscmVhZHkgYmVjYXVzZSAxLjIyIHdhcyBhbHJlYWR5IEVPTCBhdCB0aGUg
dGltZSBpdCB3YXMgcmVsZWFzZWQuLi4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4g
ICBwYWNrYWdlL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxLmhhc2ggfCA0ICsrLS0K
PiAgIHBhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEubWsgICB8IDIgKy0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEuaGFz
aCBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEuaGFzaAo+IGluZGV4
IDQ0NWYxYzE1ZjQ4YTczODkxZmY2ODFlNmVmMDI2MWQ1MjE3OTJkZDkuLjdjYzk5MmE1Y2I0Nzdi
NDg5MzljMjg3ZWY0NzU4NjU4MGQxYjE4NzkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nc3RyZWFt
ZXIxL2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5oYXNoCj4gKysrIGIvcGFja2FnZS9nc3RyZWFtZXIx
L2dzdHJlYW1lcjEvZ3N0cmVhbWVyMS5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gLSMgRnJvbSBo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdHJlYW1lci9nc3RyZWFtZXIt
MS4yMi4xMi50YXIueHouc2hhMjU2c3VtCj4gLXNoYTI1NiAgYWMzNTJmM2QwMmNhYTY3ZjNiMTY5
ZGFhOWFhNzhiMDRkZWEwZmMwOGE3MjdkZTczY2IyOGQ4OWJkNTRjNmY2MSAgZ3N0cmVhbWVyLTEu
MjIuMTIudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjL2dzdHJlYW1lci9nc3RyZWFtZXItMS4yNC4xMS50YXIueHouc2hhMjU2c3VtCj4gK3NoYTI1
NiAgMDkzYTM3OTYwMmEyNTBkNWNkMzNiODhlNzIzNzU3YzgwMTk4MzE3ZWZkZTMzODkzZWRmM2M4
N2I2ZTUzYjkwNyAgZ3N0cmVhbWVyLTEuMjQuMTEudGFyLnh6Cj4gICBzaGEyNTYgIGFkMmVlYzUx
OWViZDRiNWRmODZlYTg0ZGZmMjRhZTNiZmEyZWRlYTg0NmE3MDNiNTg5MDJkZDIyMWFlMzc1ZGIg
IENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEvZ3N0
cmVhbWVyMS5tayBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEubWsK
PiBpbmRleCAxNTc3OTk0MjQ4YTViOWM1N2U1MDFhYmUzMDMxZjhiOThmMzcyZjBlLi5lMDYzMDli
ZWI0YmY4ZWY1ZjhiY2QzM2E3MTVjZmI0NjczYzRiYTNkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Z3N0cmVhbWVyMS9nc3RyZWFtZXIxL2dzdHJlYW1lcjEubWsKPiArKysgYi9wYWNrYWdlL2dzdHJl
YW1lcjEvZ3N0cmVhbWVyMS9nc3RyZWFtZXIxLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4g
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUdTVFJFQU1FUjFfVkVSU0lPTiA9IDEu
MjIuMTIKPiArR1NUUkVBTUVSMV9WRVJTSU9OID0gMS4yNC4xMQo+ICAgR1NUUkVBTUVSMV9TT1VS
Q0UgPSBnc3RyZWFtZXItJChHU1RSRUFNRVIxX1ZFUlNJT04pLnRhci54ego+ICAgR1NUUkVBTUVS
MV9TSVRFID0gaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIK
PiAgIEdTVFJFQU1FUjFfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
