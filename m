Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE462C36018
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB3B781EB9;
	Wed,  2 Apr 2025 19:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zHeuDAmiu_K; Wed,  2 Apr 2025 19:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17658222C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E17658222C;
	Wed,  2 Apr 2025 19:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AA611F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969BB60A6C
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2KG1Cv7DN5Q for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 877F76104A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877F76104A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 877F76104A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACD2F1C108D; Wed,  2 Apr 2025 21:26:13 +0200 (CEST)
Message-ID: <875e78ea-3a2d-43ca-a3b2-0ce53b599a0d@rnout.be>
Date: Wed, 2 Apr 2025 21:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Z7eHWbet74QuCfJr@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Z7eHWbet74QuCfJr@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1743621973; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/9VlaWpvZTwDcdLcIw44R4xH1oaD2KoefMJUWvfBrwY=;
 b=GL5XPScKSgmKS3WrNU6FovQ1sgd8j4F0NrDjz7jbJlavVfKe8ccbkEWmjXGSROpfHcNQu8
 X6dj+QwslTZ0jbFNVxD/FagVlcQUK11xSWR8gf6uSlTxxJ1zWGFgu3XlLDdsg6r4bDf3tr
 g7Nel7DXiJz4axiCnsCvF8s8hW/6EwTm1V2uWVCqYn0xVr6I12kexIacV+qNnRTbqd6Ks2
 x1HRh4A5+H6nMi9HBYltrGWoGxPzUI8n05ndTp0idGLS6lYE1RogvxunyQGTuMa2+cfl9j
 FsV0VtZCGLsduL2r+v08xM5Q+GjaO4kaxgvWv7xwv1kSHAxfTyZcwdKf7bbi9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libpjsip: update to 2.15.1
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

Ck9uIDIwLzAyLzIwMjUgMjA6NDksIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+IEZvciBhIGNo
YW5nZWxvZyBzZWUgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vcGpzaXAvcGpwcm9qZWN0L3Jl
bGVhc2VzL3RhZy8yLjE1LjEKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3
YnhAb3BlbmFkay5vcmc+CgogwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKIMKgUmVnYXJk
cywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5oYXNoIHwg
MiArLQo+ICAgcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5tayAgIHwgMiArLQo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5oYXNoIGIvcGFja2FnZS9saWJwanNpcC9saWJw
anNpcC5oYXNoCj4gaW5kZXggZDcyZTEwOTBlMy4uZTg1ZDFmNDdiNCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYnBqc2lwL2xpYnBqc2lwLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYnBqc2lwL2xp
YnBqc2lwLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjb21wdXRlZAo+IC1z
aGEyNTYgIDU4MDVjMTE3MWFjYWI0YWY5Njg0ZDdhZDA5NmRjYjkyZjcxZmM0MjgwOTg1MjE0NGU5
N2UxNDEzNDY4Yzk5ODEgIHBqcHJvamVjdC0yLjE0LnRhci5nego+ICtzaGEyNTYgIDhmM2JkOTlj
YWYwMDNmOTZlZDgwMzhiOGEzNjAzMWViOWQ4Y2Q5ZWFlYTFlYWZmN2UwMWMyZWVmNmJkNTU3MDYg
IHBqcHJvamVjdC0yLjE1LjEudGFyLmd6Cj4gICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJj
ZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJwanNpcC9saWJwanNpcC5tayBiL3BhY2thZ2UvbGlicGpz
aXAvbGlicGpzaXAubWsKPiBpbmRleCA4MTY5ZTBkY2VlLi42OWIzYzFjZmZjIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbGlicGpzaXAvbGlicGpzaXAubWsKPiArKysgYi9wYWNrYWdlL2xpYnBqc2lw
L2xpYnBqc2lwLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAgCj4gLUxJQlBKU0lQX1ZFUlNJT04gPSAyLjE0Cj4gK0xJQlBKU0lQX1ZFUlNJ
T04gPSAyLjE1LjEKPiAgIExJQlBKU0lQX1NPVVJDRSA9IHBqcHJvamVjdC0kKExJQlBKU0lQX1ZF
UlNJT04pLnRhci5nego+ICAgTElCUEpTSVBfU0lURSA9ICQoY2FsbCBnaXRodWIscGpzaXAscGpw
cm9qZWN0LCQoTElCUEpTSVBfVkVSU0lPTikpCj4gICAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
