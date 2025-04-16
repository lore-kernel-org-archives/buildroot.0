Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EB3C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B81660A51;
	Wed, 16 Apr 2025 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8ozVmXUtsaj; Wed, 16 Apr 2025 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998CD60B94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998CD60B94;
	Wed, 16 Apr 2025 21:32:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C593159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02906607AD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vq6n0RZz8_tN for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9F5F60B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F5F60B94
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9F5F60B94
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C25BC1C00DD; Wed, 16 Apr 2025 23:32:18 +0200 (CEST)
Message-ID: <ec56bccb-423a-4043-845b-84942553c4ba@rnout.be>
Date: Wed, 16 Apr 2025 23:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
References: <20250407191908.260835-1-giulio.benetti@benettiengineering.com>
 <20250407191908.260835-2-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
In-Reply-To: <20250407191908.260835-2-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744839138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=47A47FgOYy2GiT5amU/ze+LvQ3q0Lz7M3orrCSeOk24=;
 b=T6vUrUedalWdcsCyBaCkRpSHrDFiMKmSbo+YqQk9BmXZIDHS+6OqOuA1yPkVA9gNo3dQZX
 NatmgD50PfnyOuVlw/UNhpgqlVEWa0oftoad4ITW4T38hqXYuOZ55bunEPhJtMkKKD0v8j
 eSiqXECt0dZhEf9Dty+wwlDFwNMmztwOwZi8oLR1Tmvn8Iq9znGlsY+bcwzuYR9GBA+j+a
 8wr+mg7iyha/L3hPwehmETFjJaPV75hBcOlXdvZwJ5cvybgafFA5z8Vi66L2Gs51oOApr4
 EV3fkLxxcbNNDPGcrWroIJC30uWQ5/xgcIcxNh82EpkA6NP2nLyeX5C87q/nHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.3
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

Ck9uIDA3LzA0LzIwMjUgMjE6MTksIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29t
PgoKIMKgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91
dAoKPiAtLS0KPiAgIHBhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5oYXNoIHwgNCArKy0tCj4g
ICBwYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5oYXNoIGIvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0
aWxzLmhhc2gKPiBpbmRleCBmZjNmMDM3OTlkLi5hZjVmYzhiZDczIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5oYXNoCj4gKysrIGIvcGFja2FnZS9uZnMtdXRpbHMv
bmZzLXV0aWxzLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL25mcy11dGlscy8yLjguMi9zaGEyNTZzdW1zLmFzYwo+
IC1zaGEyNTYgIGEzOWJiZWE3NmFjMGFiOWU2ZTg2OTljYWYzYzMwOGI2YjMxMGMyMGQ0NThlOGZh
ODYwNjE5NmQzNThlN2ZiMTUgIG5mcy11dGlscy0yLjguMi50YXIueHoKPiArIyBGcm9tIGh0dHBz
Oi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL25mcy11dGlscy8yLjguMy9zaGEyNTZz
dW1zLmFzYwo+ICtzaGEyNTYgIDExZTdjNTg0N2E4NDIzYTcyOTMxYzg2NWJkOTI5NmU3ZmQ1NmZm
MjcwYTc5NWE4NDkxODM5MDA5NjE3MTE3MjUgIG5mcy11dGlscy0yLjguMy50YXIueHoKPiAgICMg
TG9jYWxseSBjb21wdXRlZAo+ICAgc2hhMjU2ICA1NzY1NDBhYmY1ZTk1MDI5YWQ0YWQ5MGUzMjA3
MTM4NWE1ZTk1YjJjMzA3MDhjNzA2MTE2ZjNlYjg3YjlhM2RlICBDT1BZSU5HCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tayBiL3BhY2thZ2UvbmZzLXV0aWxzL25m
cy11dGlscy5tawo+IGluZGV4IDYwZTljMjY2OTUuLjBhZjAyNTRkM2YgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9uZnMtdXRpbHMv
bmZzLXV0aWxzLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwo+ICAgCj4gLU5GU19VVElMU19WRVJTSU9OID0gMi44LjIKPiArTkZTX1VUSUxTX1ZF
UlNJT04gPSAyLjguMwo+ICAgTkZTX1VUSUxTX1NPVVJDRSA9IG5mcy11dGlscy0kKE5GU19VVElM
U19WRVJTSU9OKS50YXIueHoKPiAgIE5GU19VVElMU19TSVRFID0gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9wdWIvbGludXgvdXRpbHMvbmZzLXV0aWxzLyQoTkZTX1VUSUxTX1ZFUlNJT04pCj4gICBO
RlNfVVRJTFNfTElDRU5TRSA9IEdQTC0yLjArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
