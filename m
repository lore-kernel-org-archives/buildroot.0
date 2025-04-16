Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FDDC369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 659E461025;
	Wed, 16 Apr 2025 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDuVgKAvQyZS; Wed, 16 Apr 2025 20:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9510E6F57B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9510E6F57B;
	Wed, 16 Apr 2025 20:56:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 042C9920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE62982039
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNGUhj_h2Ray for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33E7D812DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E7D812DB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33E7D812DB
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:56:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57FF01C1026; Wed, 16 Apr 2025 22:56:29 +0200 (CEST)
Message-ID: <10f42730-e75e-4959-9b03-313731f11bbf@rnout.be>
Date: Wed, 16 Apr 2025 22:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Damien Le Moal <dlemoal@kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Niklas Cassel <cassel@kernel.org>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
 <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
Content-Language: en-GB
In-Reply-To: <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cMYhGeI4YA/wEr9zAC/YWWR/SD7xSzLxK0NgKDFAlsk=;
 b=hk0Sjte7OwAtPVmJFkerxW0CkubEBknsfmASM2Z8Kdmm4bO+qkYx6GwGxoggXXhnqyTdSa
 /+o0E6pJZsOI6eqm9/6mrI695XEGrCf4Mtw3NfIAk7iIbAGItHRztdhKHh0DQ+p8urgEoY
 B8TwQiTWzSQrxZ5pQX3C70Ub+xRTYVJEtSSkH8zS4VygXvi4GtVGpgzoKHiytAxlodZ//1
 i9CyMsDkR3wuDcqACZL8SDJK7G18fEJ/VQPqvD/30cHYlLoNzUMahAMb6uoKYIqJhK2r0r
 Uc1JBQSQgTcVqy+pcsDxB/PIgnlDGDJViDr0W8RgEDe3cfZieY4RW0EqKr7UvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-tools: selftests: Add
 path containing BPF binary to _BIN_ARCH_EXCLUDE
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

Ck9uIDE4LzAyLzIwMjUgMTE6NDgsIE5pa2xhcyBDYXNzZWwgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBOaWtsYXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4KPgo+IEVuYWJsaW5nIEJS
Ml9QQUNLQUdFX0xJTlVYX1RPT0xTX1NFTEZURVNUUyAob24gcm9jazViX2RlZmNvbmZpZywKPiB3
aGljaCB1c2VzIGtlcm5lbCA2LjEyIGF0IHRoZSB0aW1lIG9mIHdyaXRpbmcpLCByZXN1bHRzIGlu
Ogo+Cj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ici9vdXRwdXQvYnVpbGQvbGludXgt
ZW5kcG9pbnQtdGVzdC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cycKPiBFUlJPUjogYXJjaGl0ZWN0
dXJlIGZvciAiL3Vzci9saWIva3NlbGZ0ZXN0cy90Yy10ZXN0aW5nL2FjdGlvbi1lYnBmIiBpcyAi
TGludXggQlBGIiwgc2hvdWxkIGJlICJBQXJjaDY0Igo+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ct
Z2VuZXJpYy5tazo0MDI6IC9ici9vdXRwdXQvYnVpbGQvbGludXgtdG9vbHMvLnN0YW1wX2luc3Rh
bGxlZF0gRXJyb3IgMQo+Cj4gVG8gc29sdmUgdGhpcywgYWRkIC91c3IvbGliL2tzZWxmdGVzdHMv
dGMtdGVzdGluZy8gdG8KPiBMSU5VWF9UT09MU19CSU5fQVJDSF9FWENMVURFLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmlrbGFzIENhc3NlbCA8Y2Fzc2VsQGtlcm5lbC5vcmc+CgogwqBBcHBsaWVkIHRv
wqAyMDI1LjAyLngsIDIwMjQuMTEueCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRz
LAogwqBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtc2Vs
ZnRlc3RzLm1rLmluIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtc2VsZnRlc3Rz
Lm1rLmluIGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXNlbGZ0ZXN0cy5tay5pbgo+
IGluZGV4IDBiY2M0N2FmMGEuLmRiN2U0ZmExYTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saW51
eC10b29scy9saW51eC10b29sLXNlbGZ0ZXN0cy5tay5pbgo+ICsrKyBiL3BhY2thZ2UvbGludXgt
dG9vbHMvbGludXgtdG9vbC1zZWxmdGVzdHMubWsuaW4KPiBAQCAtMjYsNiArMjYsOSBAQCBTRUxG
VEVTVFNfTUFLRV9GTEFHUyA9IFwKPiAgIAlBUkNIPSQoU0VMRlRFU1RTX0FSQ0gpIFwKPiAgIAlL
SERSX0RJUj0kKExJTlVYX0RJUikvdXNyL2luY2x1ZGUKPiAgIAo+ICtMSU5VWF9UT09MU19CSU5f
QVJDSF9FWENMVURFICs9IFwKPiArCS91c3IvbGliL2tzZWxmdGVzdHMvdGMtdGVzdGluZy8KPiAr
Cj4gICAjIE8gbXVzdCBiZSByZWRlZmluZWQgaGVyZSB0byBvdmVyd3JpdGUgdGhlIG9uZSB1c2Vk
IGJ5IEJ1aWxkcm9vdCBmb3IKPiAgICMgb3V0IG9mIHRyZWUgYnVpbGQuIFdlIGJ1aWxkIHRoZSBz
ZWxmdGVzdHMgaW4gJChMSU5VWF9ESVIpL3Rvb2xzL3NlbGZ0ZXN0cyBhbmQKPiAgICMgbm90IGp1
c3QgJChMSU5VWF9ESVIpIHNvIHRoYXQgaXQgaXNuJ3QgYnVpbHQgaW4gdGhlIHJvb3QgZGlyZWN0
b3J5IG9mIHRoZSBrZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
