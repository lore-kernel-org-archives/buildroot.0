Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9E1C369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023656065D;
	Wed, 16 Apr 2025 21:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aolniEi4X2cF; Wed, 16 Apr 2025 21:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9DB607A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9DB607A2;
	Wed, 16 Apr 2025 21:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C51C159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A98581EE9
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNmPVNl-h7Bm for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FA7581C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA7581C46
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FA7581C46
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3507A1C00C0; Wed, 16 Apr 2025 23:17:17 +0200 (CEST)
Message-ID: <03434213-93ae-4630-a5a7-99b017bf9066@rnout.be>
Date: Wed, 16 Apr 2025 23:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250327182940.944174-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20250327182940.944174-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=riKfJ03B5hmnOdL8/7n8NtUC7XT+SNH+cHwtBeBVbxk=;
 b=a1Z16QJrtd1JAFmp/i7RsujYgB82Q9qkd+zY9GcG3/SYOuyM6b8xxijnKJi8ohgadgYHcz
 wStiHatB2lZvLW5yV14PMC27TU8HvWTfewvXgEy4nKuUnYpWB7N7oIGOomyo5qiUxqnR2C
 2hpFoSp52eZIV46KpxhoTU9gZjqt7YNe6/IqKIAjlEzIX3MHcBUNDHkYUnBIn+Sf3i/DRL
 7lZdwkF0WAGxbxiPu88NvtevhGbuKA7RuiGH6PNAE1I2UC+2huT1W9uAcMbM01cRKjQRji
 62PO7khZs7uTbu/DZmqePS8mKu9A++8VGzwncuEue8hZgIGbgx4DMEr1klWRXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/exim: security bump version to
 4.98.2
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

Ck9uIDI3LzAzLzIwMjUgMTk6MjksIEJlcm5kIEt1aGxzIHdyb3RlOgo+IEZpeGVzIENWRS0yMDI1
LTMwMjMyOgo+IGh0dHBzOi8vbGlzdHMuZXhpbS5vcmcvbHVya2VyL21lc3NhZ2UvMjAyNTAzMjYu
MTQwMTA1LjZiOTc1NTViLmVuLmh0bWwKPiBodHRwczovL2V4aW0ub3JnL3N0YXRpYy9kb2Mvc2Vj
dXJpdHkvQ1ZFLTIwMjUtMzAyMzIudHh0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8
YmVybmRAa3VobHMubmV0PgoKIMKgQXBwbGllZCB0b8KgMjAyNS4wMi54LCAyMDI0LjExLnggYW5k
IDIwMjQuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFj
a2FnZS9leGltL2V4aW0uaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9leGltL2V4aW0ubWsgICB8
IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhpbS9leGltLmhhc2ggYi9wYWNrYWdlL2V4aW0v
ZXhpbS5oYXNoCj4gaW5kZXggZWJhNzNlMjY3Zi4uMGRkNWFjNDdhZSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2V4aW0vZXhpbS5oYXNoCj4gKysrIGIvcGFja2FnZS9leGltL2V4aW0uaGFzaAo+IEBA
IC0xLDYgKzEsNiBAQAo+ICAgIyBGcm9tIGh0dHBzOi8vZnRwLmV4aW0ub3JnL3B1Yi9leGltL2V4
aW00LzAwLXNoYTI1NnN1bXMudHh0Cj4gLXNoYTI1NiAgZDg1OGI3NWFkMmNjNmJmNzFjOTA3MWJh
MjZhNTViM2VhOWFkZDI2NjA3YmQ4MzJkZjNjYjU0ZjgyMjIxYzJjZSAgZXhpbS00Ljk4LjEudGFy
Lnh6Cj4gK3NoYTI1NiAgODhiOGU4YTY3YzFkYjZjYzBiMWQxNDgxNjFhYTM2ZTY2MmY0Y2EyZmVm
MjVkNWI2ZjM2OTRkNDkwZTQyZGNhZSAgZXhpbS00Ljk4LjIudGFyLnh6Cj4gICAjIEZyb20gaHR0
cHM6Ly9mdHAuZXhpbS5vcmcvcHViL2V4aW0vZXhpbTQvMDAtc2hhNTEyc3Vtcy50eHQKPiAtc2hh
NTEyICA4ZjgwOTk5YTQxZWQ0MGU4NmVlMTZlZWE1Y2ZkNzY1ZTJmMTY0ZWExNDlmNDBlZWI0MTBm
ZDAyZmNmMzVjMjMzMTdkYzY5NTQwZWZlMzM2ZTllMGZhZTkzMGIxY2M2NzcxZTAxODBkZDcwZjEz
MTQ1MzFjZGIxMzk3NDBjNzQ0ZSAgZXhpbS00Ljk4LjEudGFyLnh6Cj4gK3NoYTUxMiAgYWFhNGNm
YzhhZWU5MDgxOGM2ZDFjMmZkMGNmNjRiODI2NjhkMWEzNDNmNDYyZjY3OGIzOGIyYjc5ZTEwYTQ2
NzI0MGYyZTgxNzg2ZWVjNzcwNWVlYzM1OThkMjM2ODZhNzQ0MzdjNTBiNjg1MDJmMjlmZjY3Nzg4
MzkzYzgxMmEgIGV4aW0tNC45OC4yLnRhci54ego+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAg
IHNoYTI1NiAgNDkyNDBkYjUyN2I3ZTU1YjMxMmE0NmZjNTk3OTRmZGU1ZGQwMDY0MjJlNDIyMjU3
ZjRmMDU3YmZkMjdiM2M4ZiAgTElDRU5DRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2V4aW0vZXhp
bS5tayBiL3BhY2thZ2UvZXhpbS9leGltLm1rCj4gaW5kZXggNTEzNWQwMjU3NC4uOWVjYWUwZDAz
OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2V4aW0vZXhpbS5tawo+ICsrKyBiL3BhY2thZ2UvZXhp
bS9leGltLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAgCj4gLUVYSU1fVkVSU0lPTiA9IDQuOTguMQo+ICtFWElNX1ZFUlNJT04gPSA0Ljk4
LjIKPiAgIEVYSU1fU09VUkNFID0gZXhpbS0kKEVYSU1fVkVSU0lPTikudGFyLnh6Cj4gICBFWElN
X1NJVEUgPSBodHRwczovL2Z0cC5leGltLm9yZy9wdWIvZXhpbS9leGltNAo+ICAgRVhJTV9MSUNF
TlNFID0gR1BMLTIuMCsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
