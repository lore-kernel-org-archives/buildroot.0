Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06EFC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 22:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8719060B97;
	Mon, 10 Feb 2025 22:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txXlaIBZNXK7; Mon, 10 Feb 2025 22:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D9860C00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D9860C00;
	Mon, 10 Feb 2025 22:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 174C16C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F2D7600CB
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4UYfosG3MDp for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 22:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4258260B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4258260B97
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4258260B97
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 22:20:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso25980035e9.3
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 14:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739226043; x=1739830843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpT1Tns2qWYuPgLzVx7JjFG0p9Wa+d6KJtDtDLGHvLE=;
 b=Yn21QkVb9eMS3c11dcyo92aU6GIjk1lk3f6U2kCZNDNwiFEjGAjddvBmv7YA8R++D3
 8DhnQLrcpse7y9d0v1zXeIMv1cHVs+FDMaixWHhoMfCm7PXmf8KPjR8pRZ31zR8R9OuK
 oqFnsLkzJ9Gkx4ksmm98sai+SlPsJpXN7dJ48z5O6fGdRyl8oUXOXAVKQJgTmArQCwld
 +8zHPq/19bMz+CGqrtIonkwgOHK8v66t9RSgvn2I3Tg/BMLQ1oAk8XDARqd87G8Zn3VS
 tLeUBWHexS8s8l5VF8r3jvmLagRsSlzuMAbuFvluMn8D5+jHjfya3X8sGxFXz+Hs+4UM
 ssBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9VYyb6T5HqHVSDKNqErihA5D1mPPkJpmNkr+cd4UdjN3n6FGi/5J5a7Ke2Zkn3m8z9+kK75LbVZ0=@buildroot.org
X-Gm-Message-State: AOJu0Ywmxf9ea9Iwc/z5Jo9Bysv73AnBwNxk4u+B9x4OlRtGmghHAvAw
 RGckXqahoSw1rAFZkRR/RSmlLZG+AAP0tdXUq6uq7HYetDa6yd93pMOSPTNtrDg28dsFGd+n+XR
 o
X-Gm-Gg: ASbGncuJUdNEZFDf+zl1U79QauQr0CnrQxg9c+ahn9Gj6VaeV4p5AMOSBK6W7/9L2/S
 Ql4BwBZK3DmAtoxgIw10djUSUSPpR6gPf3re8nhTuzhACmIRRV3TeRRF5cIH14h0ilw0IMqMkd/
 bEGobJHSXt/yS5Zx4Uh1dt5WU0QSkIiu45CoTB8zMKtPwKF3I5kJ6eIhIlrv0+3FWVXrZQf18st
 cOannVEM+BatK/Ac5doOyDFvlhOjOZL+eoUFLVM0c0Dgd8WmrUHL/1Sz4RzpJ65Z/maWd1UPc+A
 +XRRhFs+XdYEQnWyGzhhlPYNltjEFQRXjAMAxadwpRVw3+7DXVxwryGCSfO5OY/C919o3eRgHfD
 8wk8GkuLsjmTNWIBzPq44+yoPvhmzdvhV9IWabkzH0uCv/EebUso=
X-Google-Smtp-Source: AGHT+IE1l99ZC6t17OPjuVP5EQjFaZUWXNvheOOChxkze6lIKsUwfHtwbzRYgpIe4EgOvcy6BgSsxA==
X-Received: by 2002:a5d:64e4:0:b0:38d:d2ea:9579 with SMTP id
 ffacd0b85a97d-38dd2ea96fbmr8604583f8f.46.1739226043268; 
 Mon, 10 Feb 2025 14:20:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394dc1bed2sm1420785e9.0.2025.02.10.14.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 14:20:43 -0800 (PST)
Message-ID: <a7a995dd-9c05-4673-84a1-f843d16ce384@smile.fr>
Date: Mon, 10 Feb 2025 23:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250210200516.25615-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250210200516.25615-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739226043; x=1739830843; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zpT1Tns2qWYuPgLzVx7JjFG0p9Wa+d6KJtDtDLGHvLE=;
 b=zjYmqpj1rsLI32MJZc/1pIrJBClv+S+Fv7FfvEPVLV8TDw6pUu8oQQkeOvGQVQelV+
 yqG1gbypgSIGOvx3IgS7OU+u/kQ4wrSya02AR7n0IXRenjkGhxc2V9YwbeMbfK2QQEYL
 iSYAvSWvWnmt1b8vA8MVi5q9hHT8T88nHvFf8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=zjYmqpj1
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.01.00
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

SGVsbG8gSnVsaWVuLAoKTGUgMTAvMDIvMjAyNSDDoCAyMTowNSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBTZWUgcmVsZWFzZSBhbm5vdW5jZToKPiBodHRwczovL2xpc3RzLnVidW50dS5j
b20vYXJjaGl2ZXMvZnd0cy1kZXZlbC8yMDI1LUphbnVhcnkvMDEzOTU0Lmh0bWwKPiAKPiBUaGlz
IGNvbW1pdCBhbHNvIHVwZGF0ZXMgdGhlIGxpY2Vuc2UgaGFzaCwgZHVlIHRvIHllYXIgdXBkYXRl
IGluOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9md3RzL2Z3dHMvY29tbWl0L2I2YmQ4NWZjOGRhMTRj
MTI3OWRlMTg2ZWIxMmI3ZTU4ZWNmNzgxMmQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAtLS0KPiBQYXRjaCBydW50aW1lIHRlc3RlZCBpbjoKPiBodHRwczov
L2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vam9icy85MDg1NTc5NzY2Cj4gLS0tCj4g
IHBhY2thZ2UvZnd0cy9md3RzLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9md3RzL2Z3dHMubWsg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnd0cy9md3RzLmhhc2ggYi9wYWNrYWdlL2Z3
dHMvZnd0cy5oYXNoCj4gaW5kZXggMGU5MTNiM2FlOC4uOTdiMTNiM2RiMCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2Z3dHMvZnd0cy5oYXNoCj4gKysrIGIvcGFja2FnZS9md3RzL2Z3dHMuaGFzaAo+
IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEhhc2ggZnJvbTogaHR0cHM6Ly9md3RzLnVidW50dS5jb20v
cmVsZWFzZS9TSEEyNTZTVU1TCj4gLXNoYTI1NiAgMDlkZGU2OWM2Y2Q4ZTMzMTc3YzM3ZTA2YTk3
NjNmN2Q3ODI3MWFkNDBlOTJmMjY2MTU3YjczOWNmYWM4ZDE4NSAgZnd0cy1WMjQuMTEuMDAudGFy
Lmd6Cj4gK3NoYTI1NiAgYzhiYmY2MmY0YmQ4MGYxN2JiNzY4YmFiMzg2M2VlOTNlMTk1YjIwNDdk
MTA2MzdhM2QwM2ZlMjA4NjI5MWJkNyAgZnd0cy1WMjUuMDEuMDAudGFyLmd6Cj4gIAo+ICAjIEhh
c2ggZm9yIGxpY2Vuc2UgZmlsZQo+IC1zaGEyNTYgIDNjZDJjNWQxMmYwMjRmZjJhYTIwM2UzN2Q3
ZTk3MmM0ZDVhYjdiZjFhNjVlM2UwOWFlYmNjZjcxZTY0YjUyNWIgIGRlYmlhbi9jb3B5cmlnaHQK
PiArc2hhMjU2ICA3N2E1ZjBlYTQ4ZTUzZWU4ZDY3YWVjYzc3NTljZjQ2OGJjZDM0MGMxY2FjYTcx
MWVkNDMwN2I0NzdhOTNmYjQ3ICBkZWJpYW4vY29weXJpZ2h0Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZnd0cy9md3RzLm1rIGIvcGFja2FnZS9md3RzL2Z3dHMubWsKPiBpbmRleCBmZGVkMWU2OTZi
Li40MTBjZTA2M2FhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZnd0cy9md3RzLm1rCj4gKysrIGIv
cGFja2FnZS9md3RzL2Z3dHMubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ICAKPiAtRldUU19WRVJTSU9OID0gMjQuMTEuMDAKPiArRldUU19WRVJT
SU9OID0gMjUuMDEuMDAKPiAgRldUU19TT1VSQ0UgPSBmd3RzLVYkKEZXVFNfVkVSU0lPTikudGFy
Lmd6Cj4gIEZXVFNfU0lURSA9IGh0dHBzOi8vZnd0cy51YnVudHUuY29tL3JlbGVhc2UKPiAgRldU
U19TVFJJUF9DT01QT05FTlRTID0gMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
