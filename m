Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41331C27C6E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 08:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682FD81F08;
	Mon, 17 Jun 2024 08:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay8wmWWRdHTN; Mon, 17 Jun 2024 08:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378A381F33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 378A381F33;
	Mon, 17 Jun 2024 08:03:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59EB01BF2AB
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 08:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C9160883
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 08:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABM1NtPlkuyx for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 08:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 602786087B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602786087B
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 602786087B
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 08:03:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52c8342af5eso4349414e87.3
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 01:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718611400; x=1719216200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9PqMC5RBc/8rHgii44xuV48kBBQKux6VFHYZVPYWPUs=;
 b=OTE9OfQ0f+cMjx/MbLuB97i6cpBazC9zPHKUXLCs7K37B/bjxVDH1lhskig5IS4YpG
 yQ185XQwAePiMKw+U0PofqzC9U3fnsnPFkH3Fk8NzPeSgCM+Gb0fiUgmH1W7sMxNPBs1
 JctX0uj5atQPy5Y36WDeVO6o4I3aXCadkw0NAM8kPeYA2vCkRvBGNrMFUQDrWbWWGkka
 aIznB2luKwR/FZgKTbcGkViBO+vaVQxlcCbnC7aFkLwti9viSBK+BqfYexqj12wvu462
 Cdm58Vu0ZuBxQJkD5ueH00ZJQAai5cVPxc/IUYJDX1obGoGR0zY6mPs6bl0R873tuFwT
 RN7g==
X-Gm-Message-State: AOJu0YxjoBddoo8fbwjceIl1UtZxCG5xBJTP5W89R7erWIvU7dJ6rsdz
 j/0ddhRgD7nmPKRFeZCAgjeJJeuUds6BIjD/GvdjScRcVkqDO3n/222ANEoUUPkebmFebDhijYA
 cr3Y=
X-Google-Smtp-Source: AGHT+IHdkwqzbixg9Gx+mUJuMNL3OTX2Bb5l3QmsOeHImSLmTGIUru7qON4DntMJ7OqhCh3Rp9UGmw==
X-Received: by 2002:a05:6512:ad2:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-52ca6e55dfbmr6082601e87.14.1718611398591; 
 Mon, 17 Jun 2024 01:03:18 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104c17sm11234918f8f.106.2024.06.17.01.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 01:03:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 10:03:09 +0200
Message-Id: <20240617080310.2433521-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718611400; x=1719216200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9PqMC5RBc/8rHgii44xuV48kBBQKux6VFHYZVPYWPUs=;
 b=DIw9EkumDbzNGcXN0FUtNk6NtlyhQjLRVJu0As2mWIn8Csyj2NsvrtoJ+A3MxAjZSp
 xG5r0BnUKtRCZQ4doCE/iGmS1QW+pH017KL550l4bu0IR51ohQhH3JaKNj1TOPNAuHB5
 OoIwiIG5arGVg9k6jCrBArGuTc9iRg4gVWnblvtTwhw/k7ydTuYhqkINlY2IlPutzEea
 TDyvw+NQrCzYmFfKIMzAx6qeNZvFdQZqaaSGwSGIO5Izh98HhBttcOhNBemO0VBAP2Po
 qXqvaMAU0IrbM9gpX72NLYxgbvGFFMuCia6zPG+CXyLFMlX+x3cfimd0OjhBIw3WnpBh
 jbTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DIw9Ekum
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix compiling with headers
 < 4.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Norbert Lange <nolange79@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gY29tbWl0IDM2MGE3Y2Q3MzhhODUwNjdiYTYwYjAyOWNhODhlYjdjODc0YmZlNGYgKCJwYWNr
YWdlL3N5c3RlbWQ6CmJ1bXAgbGludXgtaGVhZGVycyBkZXBlbmRlbmN5IHRvIDQuMTQiKSwgdGhl
IGhlYWRlcnMgcmVxdWlyZW1lbnRzIHdlcmUKYnVtcGVkIHRvIDQuMTQgYmVjYXVzZSBvZiBuZXcg
YnVpbGQgZmFpbHVyZXMgZHVlIHRvCkxPT1BfU0VUX0JMT0NLX1NJWkUuCgpFdmVuIHRob3VnaCBz
eXN0ZW1kIGRvZXMgbm90IHJlY29tbWVuZCB1c2luZyBpdCB3aXRoIGhlYWRlcnMgPAo0LjE1IChz
ZWUgWzFdKSwgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gYnVpbGQgaXQgYW5kIHVzZSBzb21lIG9m
IGl0cwpmZWF0dXJlcyAoYWZ0ZXIgZml4aW5nIHRoZSBidWlsZCBmYWlsdXJlKS4KCk5vdGUgdGhh
dCB0aGlzIHdhcyBidWlsZC10ZXN0ZWQgd2l0aCA0LjQgaGVhZGVycyBvbmx5LCBhbmQgbm90IGFs
bCB0aGUKd2F5IGJhY2sgdG8gMy4xNSAod2hpY2ggaXMgdGhlIHZlcnNpb24gcmVxdWlyZW1lbnQg
dGhhdCB3YXMgdXNlZApiZWZvcmUgMzYwYTdjZDczOGE4NTA2N2JhNjBiMDI5Y2E4OGViN2M4NzRi
ZmU0ZikuCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi9tYWlu
L1JFQURNRQoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0
ZUBtaW5kLmJlPgotLS0KIC4uLmdfbG9vcC5oLWZpeC1taXNzaW5nLUxPT1BfU0VUX0JMT0NLXy5w
YXRjaCB8IDQwICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICB8ICA3ICsrLS0KIHN5c3RlbS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2ICstLQogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3lzdGVt
ZC8wMDAxLXNyYy1iYXNpYy1taXNzaW5nX2xvb3AuaC1maXgtbWlzc2luZy1MT09QX1NFVF9CTE9D
S18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvMDAwMS1zcmMtYmFzaWMtbWlz
c2luZ19sb29wLmgtZml4LW1pc3NpbmctTE9PUF9TRVRfQkxPQ0tfLnBhdGNoIGIvcGFja2FnZS9z
eXN0ZW1kLzAwMDEtc3JjLWJhc2ljLW1pc3NpbmdfbG9vcC5oLWZpeC1taXNzaW5nLUxPT1BfU0VU
X0JMT0NLXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42MDcy
YjFiZTdiCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zeXN0ZW1kLzAwMDEtc3JjLWJhc2lj
LW1pc3NpbmdfbG9vcC5oLWZpeC1taXNzaW5nLUxPT1BfU0VUX0JMT0NLXy5wYXRjaApAQCAtMCww
ICsxLDQwIEBACitGcm9tIDFiMjA1YWE5YjE1ZjA0YzUxMGY3NmYzNTc0NzI2ZjYxNTlmMDgyOTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiA9P1VURi04P3E/UmFwaGE9QzM9QUJsPTIw
TT1DMz1BOWxvdHRlPz0gPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgorRGF0ZTogRnJpLCAxNCBK
dW4gMjAyNCAxNDozNzoyOSArMDIwMAorU3ViamVjdDogW1BBVENIXSBzcmMvYmFzaWMvbWlzc2lu
Z19sb29wLmg6IGZpeCBtaXNzaW5nIExPT1BfU0VUX0JMT0NLX1NJWkUKK01JTUUtVmVyc2lvbjog
MS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKKworQnVpbGRzIHdpdGgga2VybmVscyBoZWFkZXJzIDwgNC4x
NCBmYWlsIHdpdGg6CisKKy4uL3NyYy9zaGFyZWQvbG9vcC11dGlsLmM6IEluIGZ1bmN0aW9uIOKA
mGxvb3BfY29uZmlndXJlX2ZhbGxiYWNr4oCZOgorLi4vc3JjL3NoYXJlZC9sb29wLXV0aWwuYzoy
Mzc6MzE6IGVycm9yOiDigJhMT09QX1NFVF9CTE9DS19TSVpF4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmExPT1BfU0VUX0RJUkVDVF9J
T+KAmT8KKyAgICAgICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBMT09QX1NFVF9CTE9DS19TSVpF
LCAodW5zaWduZWQgbG9uZykgYy0+YmxvY2tfc2l6ZSkgPCAwKQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBMT09QX1NFVF9ESVJFQ1RfSU8KKworRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzMzMzQxCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5j
b20vc3lzdGVtZC9zeXN0ZW1kL3B1bGwvMzMzNDIKKworU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgorLS0tCisgc3JjL2Jhc2ljL21pc3Np
bmdfbG9vcC5oIHwgNCArKysrCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQorCitk
aWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL21pc3NpbmdfbG9vcC5oIGIvc3JjL2Jhc2ljL21pc3Npbmdf
bG9vcC5oCitpbmRleCBiODg1MDFkNzhiLi5mODNhMTRjOTE0IDEwMDY0NAorLS0tIGEvc3JjL2Jh
c2ljL21pc3NpbmdfbG9vcC5oCisrKysgYi9zcmMvYmFzaWMvbWlzc2luZ19sb29wLmgKK0BAIC0y
OSwzICsyOSw3IEBAIGFzc2VydF9jYyhMT09QX1NFVF9ESVJFQ1RfSU8gPT0gMHg0QzA4KTsKKyAj
aWZuZGVmIExPT1BfU0VUX1NUQVRVU19TRVRUQUJMRV9GTEFHUworICMgIGRlZmluZSBMT09QX1NF
VF9TVEFUVVNfU0VUVEFCTEVfRkxBR1MgKExPX0ZMQUdTX0FVVE9DTEVBUiB8IExPX0ZMQUdTX1BB
UlRTQ0FOKQorICNlbmRpZgorKworKyNpZm5kZWYgTE9PUF9TRVRfQkxPQ0tfU0laRQorKyMgIGRl
ZmluZSBMT09QX1NFVF9CTE9DS19TSVpFIDB4NEMwOQorKyNlbmRpZgorLS0gCisyLjQ1LjEKKwpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbiBiL3BhY2thZ2Uvc3lzdGVtZC9D
b25maWcuaW4KaW5kZXggYTk0ZTliNzNiOC4uODJjMGUzMDQ3NCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9zeXN0ZW1kL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCkBAIC0y
Miw3ICsyMiw3IEBAIG1lbnVjb25maWcgQlIyX1BBQ0tBR0VfU1lTVEVNRAogCWRlcGVuZHMgb24g
IUJSMl9TVEFUSUNfTElCUyAjIGttb2QKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19H
TElCQwogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1NQCi0JZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNF8xNCAjIExPT1BfU0VUX0JMT0NLX1NJWkUKKwlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzE1CiAJZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF81CiAJZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0Nf
QVRfTEVBU1RfNSAjIGhvc3Qtc3lzdGVtZAogCXNlbGVjdCBCUjJfUEFDS0FHRV9IQVNfVURFVgpA
QCAtMjM5LDYgKzIzOSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9TWVNURU1EX0hPTUVECiAJZGVw
ZW5kcyBvbiBCUjJfVVNFX01NVSAjIGNyeXB0c2V0dXAgLT4gbHZtMgogCWRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUyAjIGNyeXB0c2V0dXAgLT4gbHZtMgogCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IQVNfU1lOQ180ICMgY3J5cHRzZXR1cCAtPiBqc29uLWMKKwlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzEyICMgZnNjcnlwdF9rZXkKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfQ1JZUFRTRVRVUAogCXNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCiAJc2VsZWN0
IEJSMl9QQUNLQUdFX09QRU5TU0xfRk9SQ0VfTElCT1BFTlNTTApAQCAtMjQ5LDExICsyNTAsMTEg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1NZU1RFTURfSE9NRUQKIAogCSAgaHR0cHM6Ly93d3cuZnJl
ZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3N5c3RlbWQvbWFuL3N5c3RlbWQtaG9tZWQuc2VydmljZS5o
dG1sCiAKLWNvbW1lbnQgImhvbWVkIHN1cHBvcnQgbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFk
cywgZHluYW1pYyBsaWJyYXJ5IgorY29tbWVudCAiaG9tZWQgc3VwcG9ydCBuZWVkcyBhIHRvb2xj
aGFpbiB3LyB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnksIGtlcm5lbCBoZWFkZXJzID49IDQuMTIi
CiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNf
U1lOQ180CiAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBcCi0JCUJS
Ml9TVEFUSUNfTElCUworCQlCUjJfU1RBVElDX0xJQlMgfHwgIUJSMl9UT09MQ0hBSU5fSEVBREVS
U19BVF9MRUFTVF80XzEyCiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9TWVNURU1EX0hPU1ROQU1FRAog
CWJvb2wgImVuYWJsZSBob3N0bmFtZSBkYWVtb24iCmRpZmYgLS1naXQgYS9zeXN0ZW0vQ29uZmln
LmluIGIvc3lzdGVtL0NvbmZpZy5pbgppbmRleCAzZmIxN2VkMWM2Li5iYzBjNmViNmJjIDEwMDY0
NAotLS0gYS9zeXN0ZW0vQ29uZmlnLmluCisrKyBiL3N5c3RlbS9Db25maWcuaW4KQEAgLTEyNSwx
OSArMTI1LDE5IEBAIGNvbmZpZyBCUjJfSU5JVF9TWVNURU1ECiAJZGVwZW5kcyBvbiBCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NTUAogCWRl
cGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwotCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTQKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVB
REVSU19BVF9MRUFTVF8zXzE1CiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFT
VF81CiAJZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfNQogCXNlbGVjdCBCUjJfUk9P
VEZTX01FUkdFRF9VU1IKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1lTVEVNRAogCXNlbGVjdCBCUjJf
UEFDS0FHRV9TS0VMRVRPTl9JTklUX1NZU1RFTUQgaWYgQlIyX1JPT1RGU19TS0VMRVRPTl9ERUZB
VUxUCiAKLWNvbW1lbnQgInN5c3RlbWQgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gU1NQLCBo
ZWFkZXJzID49IDQuMTQsIGhvc3QgYW5kIHRhcmdldCBnY2MgPj0gNSIKK2NvbW1lbnQgInN5c3Rl
bWQgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gU1NQLCBoZWFkZXJzID49IDMuMTUsIGhvc3Qg
YW5kIHRhcmdldCBnY2MgPj0gNSIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NZU1RFTURfQVJD
SF9TVVBQT1JUUwogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBlbmRzIG9uICFCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMgfHwgXAogCQkhQlIyX1RPT0xDSEFJTl9IQVNfU1NQIHx8IFwKLQkJ
IUJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF80XzE0IHx8IFwKKwkJIUJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF8zXzE1IHx8IFwKIAkJIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xF
QVNUXzUgfHwgXAogCQkhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzUKIAotLSAKMi4zNy4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
