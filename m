Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1F1C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB74606AF;
	Wed, 16 Apr 2025 21:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flwvs4IiIFUq; Wed, 16 Apr 2025 21:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0188260617
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0188260617;
	Wed, 16 Apr 2025 21:11:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E8911B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64BAD60605
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x41xBhlAdca for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2722561075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2722561075
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2722561075
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 48FA81C00C0; Wed, 16 Apr 2025 23:11:36 +0200 (CEST)
Message-ID: <97938012-4996-428e-a936-c8f8d8574be9@rnout.be>
Date: Wed, 16 Apr 2025 23:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Z-Jt72xEQmLTB_n0@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <Z-Jt72xEQmLTB_n0@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837896; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NSIb3JpW3qqCD2xYE0SC5DCADX0QICziO/qwEEI9XlY=;
 b=YPShUChqxtprhdWfxusKJqD0U7ri8mIgGBJEIliwZdLsZTgTQuvykX7Z9bqBfNca0DJlx8
 SFWK12L+BTcH9Qx6lXbwgTmGzD0HlxzYm+LD2CTUgCvV9BDm89R8DReJNVMCLG3i8FN90/
 kYhW+XRIZWdBkZbWa3Rhy1Efcsa2L5Pre5Awx2UzGC49HpVaFr0xVcZv9o3gAfyoFokOyT
 RIQsatGepQCasz4qALcEalmniKrd896sRq6aj8xnQFnGqoT/JrRRjP4OLuAO5kd7c1Damv
 Wc2eVG2qR+ve+SwWfJZ3/OU+faVX4M+VuKVmtJth2IOAiYeGzovizAOR3rgOWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.2
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

Ck9uIDI1LzAzLzIwMjUgMDk6NDgsIFdhbGRlbWFyIEJyb2Rrb3JiIHdyb3RlOgo+IFNlZSBoZXJl
IGZvciBhIGNoYW5nZWxvZzoKPiBodHRwczovL2dpdGh1Yi5jb20vcnVieS9ydWJ5L3JlbGVhc2Vz
L3RhZy92M180XzIKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3Bl
bmFkay5vcmc+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywK
IMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9ydWJ5L3J1YnkuaGFzaCB8IDQgKystLQo+ICAg
cGFja2FnZS9ydWJ5L3J1YnkubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnVieS9y
dWJ5Lmhhc2ggYi9wYWNrYWdlL3J1YnkvcnVieS5oYXNoCj4gaW5kZXggYmUzZTM4MGE1NS4uMmM1
MjNhOWIzYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3J1YnkvcnVieS5oYXNoCj4gKysrIGIvcGFj
a2FnZS9ydWJ5L3J1YnkuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIGh0dHBzOi8vd3d3LnJ1
YnktbGFuZy5vcmcvZW4vbmV3cy8yMDI0LzEyLzI1L3J1YnktMy00LTEtcmVsZWFzZWQvCj4gLXNo
YTUxMiAgOGQyZTM0MTE3Njk2ZjlkZWJmNDYzYWUxZWVkMjg4ZmRiYjVjMWExMmUzMjgwMGU5MDFi
NjkyMThlM2I3MzAyYTAwNjYwNTIwNzdlMmViY2E4NTFlM2E2MzUyOTYxOTliZDVhMTA0MzdlZWEx
ZDZmNzg3ZjY5YTc3YmI4NjU2ODAgIHJ1YnktMy40LjEudGFyLnh6Cj4gKyMgaHR0cHM6Ly93d3cu
cnVieS1sYW5nLm9yZy9lbi9uZXdzLzIwMjUvMDIvMTQvcnVieS0zLTQtMi1yZWxlYXNlZC8KPiAr
c2hhNTEyICBjYjhiNTAyM2JjZTMxNjM5MzcxNjU0OGM1ZjBhNDRjN2QwMjQwNzI0ZmY3OWI5OTU1
MTc2NDEyNjZhZjMwYmVkYzZmNDAyYzFjOGZhMjczNjhlYTYwN2UyYWE2ZDM2YmJiMjAxZTAwYzZl
OWRkMmE4MGQ4Mzc0MzFkMzIzNDNiNSAgcnVieS0zLjQuMi50YXIueHoKPiAgIAo+ICAgIyBMaWNl
bnNlIGZpbGVzLCBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgIHNoYTI1NiAgMzk5MTdmNDUzNDI4Y2Jh
MWYxMDU0YzZhMTk3M2Y3NDU5OWEzMGI4ZDkyZTc1MmRhOTRlMjA1YTIxM2VmOGY5MiAgTEVHQUwK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydWJ5L3J1YnkubWsgYi9wYWNrYWdlL3J1YnkvcnVieS5t
awo+IGluZGV4IGJlMWIzOGFlNTkuLjg5MWZkNzhkNGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9y
dWJ5L3J1YnkubWsKPiArKysgYi9wYWNrYWdlL3J1YnkvcnVieS5tawo+IEBAIC01LDcgKzUsNyBA
QAo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+ICAgUlVCWV9WRVJTSU9OX01BSk9S
ID0gMy40Cj4gLVJVQllfVkVSU0lPTiA9ICQoUlVCWV9WRVJTSU9OX01BSk9SKS4xCj4gK1JVQllf
VkVSU0lPTiA9ICQoUlVCWV9WRVJTSU9OX01BSk9SKS4yCj4gICBSVUJZX1ZFUlNJT05fRVhUID0g
My40LjAKPiAgIFJVQllfU0lURSA9IGh0dHA6Ly9jYWNoZS5ydWJ5LWxhbmcub3JnL3B1Yi9ydWJ5
LyQoUlVCWV9WRVJTSU9OX01BSk9SKQo+ICAgUlVCWV9TT1VSQ0UgPSBydWJ5LSQoUlVCWV9WRVJT
SU9OKS50YXIueHoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
