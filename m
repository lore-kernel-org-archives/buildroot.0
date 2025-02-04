Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F34C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E09A4079D;
	Tue,  4 Feb 2025 08:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i96cyA9Weca1; Tue,  4 Feb 2025 08:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396C0407A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396C0407A0;
	Tue,  4 Feb 2025 08:39:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41412185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300376072C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFj_EzUg_ZtQ for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.45.107;
 helo=5.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB10A6067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB10A6067E
Received: from 5.mo550.mail-out.ovh.net (5.mo550.mail-out.ovh.net
 [178.33.45.107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB10A6067E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:39:12 +0000 (UTC)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.51])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4YnGxT3tCtz1YGW
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:39:09 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cvdx9 (unknown [10.110.96.223])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 276901FE9F;
 Tue,  4 Feb 2025 08:39:09 +0000 (UTC)
Received: from armadeus.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-cvdx9 with ESMTPSA
 id /YSzNyzSoWf3NwAAyvB2Jw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 04 Feb 2025 08:39:09 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 04 Feb 2025 09:38:52 +0100
MIME-Version: 1.0
Message-Id: <20250204-usbutils-libiconv-v1-1-231fe27db48c@armadeus.com>
X-B4-Tracking: v=1; b=H4sIABvSoWcC/x3MQQqAIBBA0avErBPMkKKrRIu0sQZCw0kJwrsnL
 d/i/xcYIyHD1LwQMRNT8BVd24A9Vr+joK0alFRaKtmLxCbddLI4yZANPgutndnUMIwWHdTuiuj
 o+Z/zUsoHqKNen2MAAAA=
X-Change-ID: 20250203-usbutils-libiconv-55fbd2778cef
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 15144761124306414453
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeetjeefvdegvedukeefkedvleeftdehveekueffteffuddtuefhvdeiudekfeegueenucffohhmrghinhepsghuihhlughrohhothdrnhgvthenucfkphepuddvjedrtddrtddruddpuddtledrkeelrddvfedvrdehhedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=SswCCJ4xLRRg9A9cewqrWZYjtimc1X9ze5g95B1myvM=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738658349; v=1;
 b=kDtKHZNUtkIhq3JfChgHUHnCZ5BEm0HWKI4xuXA+x8xpnNUOO5s8hUpcZdoDIBnV4CuoduWn
 ch/lPLON4ltEMcEczdEFu5qwwU3vjoLIowkJuchi72PBVOctj4vl2Am8i/GgbTj/Lb884gVTCob
 EI3bDFh/DIV19el4lyWp6dE+3af4pD6jruldwx1ZmguQ3EH7Y2BfPRcfthSZl6R27p1YptDb6G4
 KtjHSufTEWW/5Qw0FwXZs8ebm7M5UhSFIgI1ReXAiJ80C+6m6K8HcxhNr3Oqq2Eqqs0o065RuyM
 MrJ0R3KxnvHVv++fQhUqnBaMvkavBEhBPI9TNN7ExuNBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=kDtKHZNU
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003bcae94bb-3b81-4f1e-955b-a71b3e6d05bc,
 4737E9D519EB4FB7C7382537C238276C7098ED2F)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] package/usbutils: select libiconv if needed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aWNvbnYuaCBpcyBhbHdheXMgaW5jbHVkZWQgYnkgdXNibWlzYy5jIHNvIHNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJJQ09OVgppZiAhQlIyX0VOQUJMRV9MT0NBTEUKCkZpeGVzOgogaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZDdkL2Q3ZGVkYjc1NDgwNDI0MmQwMjBkMWEwZDM0
ZGQ5NWM3YzEwNzQ3MTAvLwogaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
YmNhL2JjYTE0Y2U0ZmUwNWYwODdlMWQ4ODIxNjcwYmEzMTY1ZTk4MjBhN2YvLwogaHR0cDovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNjY1LzY2NWMwNjRiZjI4YTMyNWE4YmM0ZDlm
ZTE2ZjQ1M2JlNDg0NzJlNTcvLwogaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3Vs
dHMvYjU0L2I1NDNhMzcxMzk0OTU3MWIwNGRiZDljOTRmMDYzZmEwYTE4Njc2NWIvLwogaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNmVhLzZlYTZjZGU5MWMyYzZjNDlmNTZh
MDhmMzdmZWYwYzEzNGVkYTQwYTAvLwoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5z
a2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvdXNidXRp
bHMvQ29uZmlnLmluICAgfCAxICsKIHBhY2thZ2UvdXNidXRpbHMvdXNidXRpbHMubWsgfCA1ICsr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvdXNidXRpbHMvQ29uZmlnLmluIGIvcGFja2FnZS91c2J1dGlscy9Db25maWcuaW4KaW5kZXgg
YTM4ZWIyZjJlNTA0NDYzMzRlMzI2ZDQ3YjllZWRiZTI1MDIzNzAwYy4uN2U3MDI5YmJmZWM2YzZh
Y2MyYjU5MmM5MTU2ZWQyM2RlMjViYjMzMCAxMDA2NDQKLS0tIGEvcGFja2FnZS91c2J1dGlscy9D
b25maWcuaW4KKysrIGIvcGFja2FnZS91c2J1dGlscy9Db25maWcuaW4KQEAgLTMsNiArMyw3IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9VU0JVVElMUwogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEUyAjIGxpYnVzYgogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfNF85ICMgbGlidXNiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfVURFViAjIG5lZWRz
IGh3ZGIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUNPTlYgaWYgIUJSMl9FTkFCTEVfTE9DQUxF
CiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlVTQgogCWhlbHAKIAkgIFVTQiBlbnVtZXJhdGlvbiB1
dGlsaXRpZXMKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXNidXRpbHMvdXNidXRpbHMubWsgYi9wYWNr
YWdlL3VzYnV0aWxzL3VzYnV0aWxzLm1rCmluZGV4IDQ4MzAxZmJiOWZkMWQyYjJkMjNkMDcxYmZi
NjE5M2IxNmVhNzQ5YzMuLjEwOTM5ODEzNjA4YzJjNzliOTU4YzZkNGQ3YTBmNmYwZjIwYTc2MjUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdXNidXRpbHMvdXNidXRpbHMubWsKKysrIGIvcGFja2FnZS91
c2J1dGlscy91c2J1dGlscy5tawpAQCAtMTEsNiArMTEsMTEgQEAgVVNCVVRJTFNfREVQRU5ERU5D
SUVTID0gaG9zdC1wa2djb25mIGxpYnVzYiB1ZGV2CiBVU0JVVElMU19MSUNFTlNFID0gR1BMLTIu
MCsgKHV0aWxzKSBHUEwtMi4wIG9yIEdQTC0zLjAgKGxzdXNiLnB5KQogVVNCVVRJTFNfTElDRU5T
RV9GSUxFUyA9IExJQ0VOU0VTL0dQTC0yLjAtb25seS50eHQgTElDRU5TRVMvR1BMLTMuMC1vbmx5
LnR4dAogCitpZmVxICgkKEJSMl9QQUNLQUdFX0xJQklDT05WKSx5KQorVVNCVVRJTFNfREVQRU5E
RU5DSUVTICs9IGxpYmljb252CitVU0JVVElMU19MREZMQUdTICs9IC1saWNvbnYKK2VuZGlmCisK
ICMgTmljZSBsc3VzYi5weSBzY3JpcHQgb25seSBpZiB0aGVyZSdzIHB5dGhvbiAzLngKIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfUFlUSE9OMyksKQogZGVmaW5lIFVTQlVUSUxTX1JFTU9WRV9QWVRIT04K
Ci0tLQpiYXNlLWNvbW1pdDogYjAzMDk4NjQ1Zjc0NzMzODlmODc4ZmRmNjEwZGVmNzllMzcxY2Y0
NQpjaGFuZ2UtaWQ6IDIwMjUwMjAzLXVzYnV0aWxzLWxpYmljb252LTU1ZmJkMjc3OGNlZgoKQmVz
dCByZWdhcmRzLAotLSAKU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lA
YXJtYWRldXMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
