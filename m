Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DAEC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4106176D;
	Wed, 16 Apr 2025 21:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TB01MZM7zzw; Wed, 16 Apr 2025 21:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6DE61263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6DE61263;
	Wed, 16 Apr 2025 21:06:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A8E0920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4023F40E5E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfvsOKOFa8eJ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE01841334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE01841334
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE01841334
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:05:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6A2A1C00C0; Wed, 16 Apr 2025 23:05:54 +0200 (CEST)
Message-ID: <3e1e049a-f515-477f-8fb4-332d8c05b8e3@rnout.be>
Date: Wed, 16 Apr 2025 23:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20250324071254.173452-1-fido_max@inbox.ru>
Content-Language: en-GB
In-Reply-To: <20250324071254.173452-1-fido_max@inbox.ru>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837554; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=modeP8GfT6tzcqiJz+TOEIJ8cxaEa7bKHw5CoLKyC14=;
 b=SLj2EUpjfUoh7BH18PvXvfmhg6iKEbgyDfTuWr5utF+8nxiVplnFROylUHBbOqlFeTk0UW
 V3nbpsqlmJmztAxeen0hndNgEfS335WaEqmoKAbp9Ol6vl5nU5Ab+3xp7gR8vYqsDtUKuy
 O/ym3tEoIloZA7MsT4jIM8aNLBMUm9iX0nFAoPWC4CvU2YCaDIVJ0a/9TsE6Kdx3+tcvEu
 xU6kTc/kjnaQHesj/QSsQA9rt7JeWaSek90lwCpf95Pt/zqvQN74L4aXABSrf8VtIryM8v
 eqxG7QnyGsG0BL8dN4sPc8fb0oe5H69ZZv5b1FWcTzD5NyDp2dpdcx6Pa1TsQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.13.1
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

Ck9uIDI0LzAzLzIwMjUgMDg6MTIsIE1heGltIEtvY2hldGtvdiB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IENoYW5nZWxvZzogaHR0cHM6Ly9naXRodWIuY29tL2xpYmdlb3MvZ2Vvcy9yZWxlYXNlcy90
YWcvMy4xMy4xCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbSBLb2NoZXRrb3YgPGZpZG9fbWF4QGlu
Ym94LnJ1PgoKIMKgQXBwbGllZCB0b8KgMjAyNS4wMi54IGFuZCAyMDI0LjExLngsIHRoYW5rcy4K
CiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbGliZ2Vvcy9saWJnZW9z
Lmhhc2ggfCAyICstCj4gICBwYWNrYWdlL2xpYmdlb3MvbGliZ2Vvcy5tayAgIHwgMiArLQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJnZW9zL2xpYmdlb3MuaGFzaCBiL3BhY2thZ2UvbGliZ2Vvcy9s
aWJnZW9zLmhhc2gKPiBpbmRleCAzNmY0N2NkNTIzLi5mNDA0YjI2N2UyIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvbGliZ2Vvcy9saWJnZW9zLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmdlb3MvbGli
Z2Vvcy5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1z
aGEyNTYgIDQ3ZWM4M2ZmMzM0ZDY3MmI5ZTQ0MjY2OTVmMTVkYTZlNjM2ODI0NDIxNDk3MWZhYmYz
ODZmZjhlZjZkZjM5ZTQgIGdlb3MtMy4xMy4wLnRhci5iejIKPiArc2hhMjU2ICBkZjJjNTA1MDMy
OTVmMzI1ZTdjOGQ3Yjc4M2FjYThiYTQ3NzM5MTljZGU5ODQxOTM4NTBjZjllMzYxZGZkMjhjICBn
ZW9zLTMuMTMuMS50YXIuYnoyCj4gICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0
MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJnZW9zL2xpYmdlb3MubWsgYi9wYWNrYWdlL2xpYmdlb3MvbGliZ2Vv
cy5tawo+IGluZGV4IGJlYjJjMDc3YzQuLjQ3NWE1NGY3OWYgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saWJnZW9zL2xpYmdlb3MubWsKPiArKysgYi9wYWNrYWdlL2xpYmdlb3MvbGliZ2Vvcy5tawo+
IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+
IC1MSUJHRU9TX1ZFUlNJT04gPSAzLjEzLjAKPiArTElCR0VPU19WRVJTSU9OID0gMy4xMy4xCj4g
ICBMSUJHRU9TX1NJVEUgPSBodHRwOi8vZG93bmxvYWQub3NnZW8ub3JnL2dlb3MKPiAgIExJQkdF
T1NfU09VUkNFID0gZ2Vvcy0kKExJQkdFT1NfVkVSU0lPTikudGFyLmJ6Mgo+ICAgTElCR0VPU19M
SUNFTlNFID0gTEdQTC0yLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
