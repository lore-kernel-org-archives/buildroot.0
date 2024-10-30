Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD4D5CCB5
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 14:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA0D60ACD;
	Wed, 30 Oct 2024 14:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ebKPmN8OZAB; Wed, 30 Oct 2024 14:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED4EF60ADC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED4EF60ADC;
	Wed, 30 Oct 2024 14:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 704605E4F
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E43360ADD
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CYk2Ncly-Gq for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 14:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AEE560ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AEE560ACD
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AEE560ACD
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:59:32 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-290c69be014so1631963fac.3
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 07:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730300371; x=1730905171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4isNcPbyD+Sy/lBNSJLmrVNWy8lMeIi9uRhNQqoGSE8=;
 b=CgpW7LxP/RYlkF7pRd0aI7OGhkNHVFRiSrJfHF4J6CayHnzePcZ6BvtqDCebeHRziz
 +Io4/9OeIc0YouGhde/7LGFLTiPuZ2zVyyRHa3uxuagJHtYDbydt/gowXYDpxiis5cuI
 qC0HG3HQr1S7Q2gK2fZPnu4Ekm8u10ftbGaJxVfym8OSzrXTuWqQp3XBvCm6K9mnkFHB
 GOxtl7B/P36o41XQbYCxVFvG1TNEWere/tDY5F1lKO0xBOXVlwKnp3Uul3lQa6FJ8emr
 T91fARrz+8NNHjiz5S98ptNZFDvrejUQgkiN2nZUBsJm2yykUDLzjkV2nlkPPBhzqcNy
 VqEA==
X-Gm-Message-State: AOJu0Yz9kTWjC8ka0z99maQeRxYJ8cy9xJN8Xslvp0UkfAJmKcvuvNxX
 Z3/WLp5VLH23WuWuFxmAJUaa73cSYvice8v4AUOFr/9yHVHnfk1cKVAchsYW
X-Google-Smtp-Source: AGHT+IGEGlJ3f1WGerWGncZGvjA9PRBNPEnl9qFHy6cFFo1j7k25QKREHTYwL5tAhOwVdZtvYAlYqg==
X-Received: by 2002:a05:6871:452:b0:277:da52:777 with SMTP id
 586e51a60fabf-29051b6b5e1mr14143709fac.11.1730300371273; 
 Wed, 30 Oct 2024 07:59:31 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7edc8495cabsm9354686a12.0.2024.10.30.07.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 07:59:30 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 22:59:04 +0800
Message-ID: <20241030145910.2523465-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030145910.2523465-1-fancp2007@gmail.com>
References: <20241030134339.2482614-1-fancp2007@gmail.com>
 <20241030145910.2523465-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730300371; x=1730905171; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4isNcPbyD+Sy/lBNSJLmrVNWy8lMeIi9uRhNQqoGSE8=;
 b=DUI7a/5/z21ioPSdond87/P6j+pRzmdWmyv7Hma+zIzW/EGQlzIkWxnDiYyKuIdOZO
 wvBSi/1vqvtyiA2CEt37Ycz8wzkR3rOozl516TLU5aW/Czk6ViqHUPIm8t5RHlqa3r4u
 bchZ8nWxE5OM2DLiMPc7JrQcvx0JE8qlW6Ubm/aZEAglalTrmzt7E6qnUiWPHcXbZaL3
 BDlCGr+oe3w8XE4EnzNUnORo0yAq0hjnhXSd5RMFQu7hotLJcFsWbdhR1DEdVT7NvNYw
 Oj096W+a82uHauKPQaXPHdY60rtUW1ftMbAhI5MUnZrWaqgyOKl52PphogvgOlUk4euS
 qSrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DUI7a/5/
Subject: [Buildroot] [PATCH v5 2/2] package/python-pgcopy: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgoKLS0tCkNoYW5n
ZXMgdjEgLT4gdjI6CiAgLSBhZGQgbWlzc2luZyBjb25maWcgbWVudSBlbnRyeSBpbiBDb25maWcu
aW4KCkNoYW5nZXMgdjIgLT4gdjM6CiAgLSBmaXggaGVscCB0ZXh0IGluZGVudCBpbiBDb25maWcu
aW4KCkNoYW5nZXMgdjMgLT4gdjQ6CiAgLSBhZGQgbWlzc2luZyBkZXBlbmRlbmNpZXMgaW4gdGhl
IENvbmZpZy5pbiBmaWxlCiAgLSBhZGQgYSBjb21tZW50IGZvciB0aGUgaG9vayBQWVRIT05fUEdD
T1BZX0NMRUFOX1BZMl9TQ1JJUFQKICAtIHJlbW92ZSB0aGUgcHJlIGNvbmZpZ3VyZSBob29rIFBZ
VEhPTl9QR0NPUFlfQ1JFQVRFX1NFVFVQX0NGRwoKQ2hhbmdlcyB2NCAtPiB2NToKICAtIHJlbW92
ZSB0aGUgcG9zdGdyZXNxbCBkZXBlbmRlbmN5LCBweXRob24tcHN5Y29wZzIgaGFzIHNlbGVjdCBp
dAotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysK
IHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdl
L3B5dGhvbi1wZ2NvcHkvQ29uZmlnLmluICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysr
KysKIHBhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdjb3B5Lmhhc2ggfCAgNSArKysrKwog
cGFja2FnZS9weXRob24tcGdjb3B5L3B5dGhvbi1wZ2NvcHkubWsgICB8IDIxICsrKysrKysrKysr
KysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9weXRob24tcGdjb3B5L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdjb3B5Lmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9uLXBnY29weS5tawoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDc2ZjE1ZjcwOGEuLmY3Y2ZiZjNhZDUg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjkyMyw2ICsyOTIz
LDkgQEAgRjoJcGFja2FnZS9scnppcC8KIE46CVNhbSBWb3NzIDxzYW0udm9zc0BnbWFpbC5jb20+
CiBGOglwYWNrYWdlL3JpcGdyZXAvCiAKK046CVNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNv
bT4KK0Y6CXBhY2thZ2UvcHl0aG9uLXBnY29weS8KKwogTjoJU8OpYmFzdGllbiBTenltYW5za2kg
PHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgogRjoJYm9hcmQvYXJtYWRldXMvCiBG
Ogljb25maWdzL2FybWFkZXVzKgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNr
YWdlL0NvbmZpZy5pbgppbmRleCBiMWU5OTlhNjNiLi5lZGE4NzdiY2UzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMTI1OSw2ICsxMjU5
LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5
dGhvbi1wYXRodmFsaWRhdGUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tcGVy
aXBoZXJ5L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXBleHBlY3QvQ29uZmln
LmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tcGdjb3B5L0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvcHl0aG9uLXBpY2tsZXNoYXJlL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
cHl0aG9uLXBpZXhpZi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1waWdwaW8v
Q29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcGdjb3B5L0NvbmZpZy5pbiBi
L3BhY2thZ2UvcHl0aG9uLXBnY29weS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uNDI0ODYwODk5ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0
aG9uLXBnY29weS9Db25maWcuaW4KQEAgLTAsMCArMSwyMCBAQAorY29uZmlnIEJSMl9QQUNLQUdF
X1BZVEhPTl9QR0NPUFkKKwlib29sICJweXRob24tcGdjb3B5IgorCWRlcGVuZHMgb24gQlIyX1VT
RV9NTVUgIyBweXRob24tcHN5Y29wZzIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBweXRo
b24tcHN5Y29wZzIKKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBweXRob24tcHN5Y29w
ZzIKKwlkZXBlbmRzIG9uICFCUjJfT1BUSU1JWkVfRkFTVCAjIHB5dGhvbi1wc3ljb3BnMgorCXNl
bGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFNZQ09QRzIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlU
SE9OX1BZVFoKKwloZWxwCisJICBVc2UgcGdjb3B5IGZvciBmYXN0IGRhdGEgbG9hZGluZyBpbnRv
IFBvc3RncmVTUUwgd2l0aAorCSAgYmluYXJ5IGNvcHkuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9hbHRhdXJvZy9wZ2NvcHkKKworY29tbWVudCAicHl0aG9uLXBnY29weSBuZWVkcyBhIHRvb2xj
aGFpbiB3LyBkeW5hbWljIGxpYnJhcnksIHdjaGFyIgorCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUK
KwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8fCAhQlIyX1VTRV9XQ0hBUgorCitjb21tZW50
ICJweXRob24tcGdjb3B5IGNhbid0IGJlIGJ1aWx0IHdpdGggT3B0aW1pemUgZm9yIGZhc3QiCisJ
ZGVwZW5kcyBvbiBCUjJfT1BUSU1JWkVfRkFTVApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
cGdjb3B5L3B5dGhvbi1wZ2NvcHkuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24t
cGdjb3B5Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOWZhNzk5
MDg3NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdj
b3B5Lmhhc2gKQEAgLTAsMCArMSw1IEBACisjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBp
Lm9yZy9weXBpL3BnY29weS9qc29uCittZDUgIGJiNzk0MGVkODIxZjU0ZjMyNzA1YzQ2MmY3NTgy
NDU4ICBwZ2NvcHktMS42LjAudGFyLmd6CitzaGEyNTYgIDBkYTkyMzVlZWE0ZWU5Y2ViNGY1MmI5
NzUyM2JjODlkYjlhNmY4ZTgwZjg5N2I0OTIxNGU4MTRlYTEzZDA0YjAgIHBnY29weS0xLjYuMC50
YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIDk2OTE5
MTQyOGNiMDcyOWU2ODk0NjhiZGNkMTUyMjkxYTRlMTY4ODc1NzU1Yzk3NzQ1Y2QyZGY2ZGU1NTIw
YzEgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9u
LXBnY29weS5tayBiL3BhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdjb3B5Lm1rCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjM3NmY4NjQ5YTkKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvcHl0aG9uLXBnY29weS5tawpAQCAtMCwwICsx
LDIxIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBweXRob24tcGdjb3B5CisjCisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05fUEdDT1BZX1ZFUlNJT04gPSAxLjYuMAor
UFlUSE9OX1BHQ09QWV9TT1VSQ0UgPSBwZ2NvcHktJChQWVRIT05fUEdDT1BZX1ZFUlNJT04pLnRh
ci5negorUFlUSE9OX1BHQ09QWV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzL2IwLzdkL2E1YzgzM2Y5MjFiMjBjZGIxZTg1MzhlNzJhNjA2NWJjYzY3YmJiMjcw
ZmE3YTM1ZTk4ZjJkMzk3Y2UwYworUFlUSE9OX1BHQ09QWV9TRVRVUF9UWVBFID0gc2V0dXB0b29s
cworUFlUSE9OX1BHQ09QWV9MSUNFTlNFID0gTUlUCitQWVRIT05fUEdDT1BZX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFLnR4dAorUFlUSE9OX1BHQ09QWV9ERVBFTkRFTkNJRVMgPSBweXRob24tcHN5
Y29wZzIgcHl0aG9uLXB5dHoKKworIyBSZW1vdmUgdGhlIGZpbGUgb25seSBmb3IgUHl0aG9uIDIs
IGl0IHdpbGwgY2F1c2UgY29tcGlsYXRpb24gZXJyb3JzCitkZWZpbmUgUFlUSE9OX1BHQ09QWV9D
TEVBTl9QWTJfU0NSSVBUCisJJChSTSkgJChARCkvcGdjb3B5L2Vycm9ycy9weTIucHkKK2VuZGVm
CitQWVRIT05fUEdDT1BZX1BPU1RfRVhUUkFDVF9IT09LUyArPSBQWVRIT05fUEdDT1BZX0NMRUFO
X1BZMl9TQ1JJUFQKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
