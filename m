Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CBECD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 21:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3166F6F873;
	Sun, 17 May 2026 21:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUk_u1ga0hZH; Sun, 17 May 2026 21:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AAD06078C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779054725;
	bh=iS15Eodf+sa9IspZnSTF3RGY79+Ebmt4D/j5W8YGEiU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hE2+JDXSeCF/DhYr/poVix4stZRo5pBKBNAuuaDwdOYFnetFNufTq+qjYhxrrHHg6
	 Fm3574xrHZanOdwnIDpCJmF6TfCE1LnqRb5vOIIGC7EXdV1FHS9rTN7giIxRleAZT+
	 oB6Eu4kjhByAvq4NSe4b9bqTAnF4jYqsXL4yVvUXi4Eqpf37XKKmvqdk+0uIgGYabM
	 pmf99BBgoVDzt88+XKm8MyB11xMY1i4xWgD8xGSSGCSGLbJX6TYsBV2yh/M8x+uxFC
	 JT1gEDxCr2a1OPoJghGQ5CxserLOPJ73wiMx4Gb19Nxf2Sltwno+DOkAYupB9qAQJ/
	 m3+6NJLIwiWUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AAD06078C;
	Sun, 17 May 2026 21:52:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A080282
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B23842886
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pt8PTcoZKtRf for <buildroot@buildroot.org>;
 Sun, 17 May 2026 21:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3958041D7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3958041D7A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3958041D7A
 for <buildroot@buildroot.org>; Sun, 17 May 2026 21:52:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso8883275e9.0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 14:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779054721; x=1779659521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQZcmQENSAwnlKJjiRhSims/LxLPoe2v1qcsnhqttLc=;
 b=FCx7gGaGwacFRK/Gu7/NvNnGK7Ou+vs8v9IfHlWzOVj2iB8UqpCTli9sMrmcDF+GwS
 66wYGpce1RCCaQJQsVZDtstmfGh30a8NV2ZeVFkihFhCfUZVKluJlnvUxnZCnlUe8go/
 Wvy9SeFwnjbl9F/FQjFQ+fPH0xVAbjWrFPQOZmbE9OifYnRSSapLMQPZH/1uMhOzG9Mn
 PrZnxc/itP650JggaX/5L5Ra5IOWZsUkWubD1kBmD4bdofU+BW+7InF0eP9y7na2tTD9
 fgHZnoG/mZWdQmmM/KF+l46IZlkv5xOS2Fog9sAFPkjZHJ8JglUHOq4RANeJqTXQOw9+
 fFQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zoHyHofpYOz9/X5Ln5K+DXCoRvvOeskqVhNOk5HuuEhhEXMyKooyd3X72krOSBhEXTeQEX3wwZXU=@buildroot.org
X-Gm-Message-State: AOJu0YyT9bhRVTtILi2dfAbpF04vj9lieFQcekL49PRA36BflFLQlpGl
 vdIGNx0upo6adLKlmqTSraIbUYot6PQl7tUczRSIrPIr6PztXnfr8+8GiKo2TDIFoJM=
X-Gm-Gg: Acq92OHOVLd9yvGw48+jzGeoAVMMIJcIyU3o+0Aufzgc2k4etDlbIpU3nLsqnxrltuo
 nJY1HKpB7C+kYpyuMSAeZIjg0WPBPWa6VrIXWsPkxrIOsgc4OXiilhX2C20Ud8+v3TAxlAZfvJh
 tZKGiQuRqQ/2Wu2MqzX+soYB/vLY6r6cYVBEmBRKrqoRXSS88h9hxAcT6gi8MssAYIsPnlRIvXW
 V42gVgxq+Hc9tB83K+Cxk4SQoKg71GCNZbLPa4woZEQdulvLYk8PlNmj/TK5lXEux/Fa3aKm3YV
 5kvL9utc5Vjc1A5qo3D+/TN0g5q2CNOaIIHMXCxU6QpAUxaqYJGKpCK06kh0PO/6xOCf57kiwOL
 knD6rDa0Z77MeXtHI5iUcIbMjBywP/vWYIMCRXu9MsBOuDDne7b82x/OWaigkIsrTQazvCFMJDe
 LCj7gdpEcli+5QzNyI1blxe0WVqb6Uct1sTmXA7G9ng3Okgy9yIdy8uTBDWocAZth/OIUrF6vHG
 vhY2B/r6mj6XHr7gQdEJWY10vHVbjXhwb+Jy+JWVUikSCagPSXhkT6HxFgDz/NfIQ==
X-Received: by 2002:a05:600c:4e46:b0:48a:75b9:5e07 with SMTP id
 5b1f17b1804b1-48fe60d576dmr199370495e9.11.1779054721113; 
 Sun, 17 May 2026 14:52:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767cb9sm31079072f8f.2.2026.05.17.14.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 14:52:00 -0700 (PDT)
Message-ID: <547f7df3-2621-42df-9e65-48d0c2c4f6fe@smile.fr>
Date: Sun, 17 May 2026 23:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260516190812.60992-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260516190812.60992-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779054721; x=1779659521; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hQZcmQENSAwnlKJjiRhSims/LxLPoe2v1qcsnhqttLc=;
 b=mCp5saaQ56JYrkg5wz8BPZNKh0r7o0wix9lHUiRLlgMv8CNfxB79JfLT3bM035Nvzt
 oSgTxkt4DfofN8hmync2u6HUmbVPVR7IRRBU63jPbgYqa3ir0ozivUe/ado0Imq2ne8l
 YtM/LD3hP/5ALWXWAGz/o61EpVLjuiTQ7CAYU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mCp5saaQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fwts: bump to version
 26.03.00
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNi8wNS8yMDI2IMOgIDIxOjA4LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFNlZSByZWxlYXNlIGFubm91bmNlczoKPiAyNi4wMS4wMDogaHR0cHM6
Ly9saXN0cy51YnVudHUuY29tL2FyY2hpdmVzL2Z3dHMtZGV2ZWwvMjAyNi1KYW51YXJ5LzAxNDEy
OS5odG1sCj4gMjYuMDMuMDA6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9hcmNoaXZlcy9md3Rz
LWRldmVsLzIwMjYtTWFyY2gvMDE0MTcxLmh0bWwKPiAKPiBUaGUgd2Vic2l0ZSBbMV0gaXMgbm8g
bG9uZ2VyIHdvcmtpbmcuIFRoaXMgY29tbWl0IHVwZGF0ZXMgRldUU19TSVRFCj4gdG8gdXNlIEdp
dGh1YiBbMl0sIHdoaWNoIGlzIG5vdyB0aGUgcHJpbWFyeSBkb3dubG9hZCBzaXRlIGluIHRoZQo+
IHJlbGVhc2UgYW5ub3VuY2UuCj4gCj4gVGhpcyBjb21taXQgYWxzbyByZXdyb3RlIHRoZSBwYWNr
YWdlIHBhdGNoICh0byBhZGQgYSBuZXcKPiAtLWRpc2FibGUtd2Vycm9yIGNvbmZpZ3VyZSBvcHRp
b24pLCB3aGljaCB3YXMgcHJvcG9zZWQgdXBzdHJlYW0uCj4gVGhpcyBuZXcgb3B0aW9uIGlzIGFk
ZGVkIGluIEZXVFNfQ09ORl9PUFRTLiBXaXRoIHRoaXMgcGF0Y2ggbm93Cj4gcHJvcG9zZWQgdXBz
dHJlYW0sIHRoZSBjb3JyZXNwb25kaW5nIC5jaGVja3BhY2thZ2VpZ25vcmUgZW50cnkKPiBpcyBh
bHNvIHJlbW92ZWQuCj4gCj4gVGhlIGxpY2Vuc2UgaGFzaCBpcyBhbHNvIHVwZGF0ZWQsIGFmdGVy
IGEgeWVhciB1cGRhdGUgaW4gWzNdLgo+IAo+IFRoZSBmd3RzIGVmaV9ydW50aW1lIGtlcm5lbCBt
b2R1bGUgaGFzIGJlZW4gcmVtb3ZlZCB1cHN0cmVhbSwKPiBpbiBjb21taXQgWzRdLiBJdCBpcyBy
ZXBsYWNlZCBieSB0aGUgS2VybmVsIGRyaXZlciBlZmlfdGVzdCwgcHJlc2VudAo+IHNpbmNlIEtl
cm5lbCB2NC45LCBpbnRyb2R1Y2VkIGluIGNvbW1pdCBbNV0uIFRoaXMgY29tbWl0IHJlbW92ZXMg
dGhlCj4gb3B0aW9uIGFuZCB1cGRhdGVzIHRoZSBydW50aW1lIHRlc3QgYWNjb3JkaW5nbHkuIEEg
bm90ZSBpcyBhZGRlZCBpbiB0aGUKPiBDb25maWcuaW4gcGFja2FnZSBoZWxwLgo+IAo+IEZpeGVz
Ogo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84NTkzOTBkYmQyYTFk
N2IzYmY0MzU4OGE0NjFhMmZmN2RjNjZmOTJiLwo+IAo+IFsxXSBodHRwczovL2Z3dHMudWJ1bnR1
LmNvbS8KPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2Z3dHMvZnd0cwo+IFszXSBodHRwczovL2dp
dGh1Yi5jb20vZnd0cy9md3RzL2NvbW1pdC9iM2NkNjRlNjFkNTA5NTZmZTQ5OGIwOWUyMmQ1ZDEz
ZTZiYmU0YTVjCj4gWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9md3RzL2Z3dHMvY29tbWl0LzZkNTJh
NjIxNjk0YmU5YWIzYjgzYTQ0YTQ0OTcwMDIwNWI0OGM1OTgKPiBbNV0gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQv
P2lkPWZmNjMwMWRhYmMzY2EyMGFiOGY1MGY4ZDAyNTJhYzA1ZGE2MTBkODkKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQoKWy4uLl0KCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZnd0cy9md3RzLm1rIGIvcGFja2FnZS9md3RzL2Z3dHMubWsKPiBp
bmRleCBjZGJmMWMwMzY2Li5hZGFiNmVlYTE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZnd0cy9m
d3RzLm1rCj4gKysrIGIvcGFja2FnZS9md3RzL2Z3dHMubWsKPiBAQCAtNCwxMiArNCwxMyBAQAo+
ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1GV1RTX1ZFUlNJT04gPSAyNS4x
MS4wMAo+ICtGV1RTX1ZFUlNJT04gPSAyNi4wMy4wMAo+ICBGV1RTX1NPVVJDRSA9IGZ3dHMtViQo
RldUU19WRVJTSU9OKS50YXIuZ3oKPiAtRldUU19TSVRFID0gaHR0cHM6Ly9md3RzLnVidW50dS5j
b20vcmVsZWFzZQo+ICtGV1RTX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vZnd0cy9md3RzL3Jl
bGVhc2VzL2Rvd25sb2FkL1YkKEZXVFNfVkVSU0lPTikKPiAgRldUU19MSUNFTlNFID0gR1BMLTIu
MCwgTEdQTC0yLjEsIEN1c3RvbQo+ICBGV1RTX0xJQ0VOU0VfRklMRVMgPSBkZWJpYW4vY29weXJp
Z2h0CgpJIGFkZGVkIGEgY29tbWVudCBhYm92ZSBGV1RTX0FVVE9SRUNPTkYgc2luY2Ugd2UgdXNl
IHRvIGFkZCBhIGNvbW1lbnQgdG8KcmVtZW1iZXIgd2h5IHdlIHNldCAiQVVUT1JFQ09ORiA9IFlF
UyIKCj4gIEZXVFNfQVVUT1JFQ09ORiA9IFlFUwoKQXBwbGllZCB0byBtYXN0ZXIuIFRoYW5rcy4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICtGV1RTX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS13ZXJy
b3IKPiAgRldUU19ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LXBrZ2Nv
bmYgbGliZ2xpYjIgbGliYnNkIFwKPiAgCSQoaWYgJChCUjJfUEFDS0FHRV9CQVNIX0NPTVBMRVRJ
T04pLGJhc2gtY29tcGxldGlvbikgXAo+ICAJJChpZiAkKEJSMl9QQUNLQUdFX0RUQyksZHRjKQo+
IEBAIC0xOCw5ICsxOSw0IEBAIGlmZXEgKCQoQlIyX09QVElNSVpFXzApLHkpCj4gIEZXVFNfQ09O
Rl9FTlYgPSBDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykgLU8xIgo+ICBlbmRpZgo+ICAKPiAtaWZl
cSAoJChCUjJfUEFDS0FHRV9GV1RTX0VGSV9SVU5USU1FX01PRFVMRSkseSkKPiAtRldUU19NT0RV
TEVfU1VCRElSUyA9IGVmaV9ydW50aW1lCj4gLSQoZXZhbCAkKGtlcm5lbC1tb2R1bGUpKQo+IC1l
bmRpZgo+IC0KPiAgJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
