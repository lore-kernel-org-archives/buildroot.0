Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C575D3B7DB
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 17:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689CA40927;
	Sat,  6 Dec 2025 17:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koDu-eL4MGE0; Sat,  6 Dec 2025 17:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43F3408E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765043978;
	bh=zhyV71oFEQ0jYFHy6t9gtdzK14g4nBrGAyJHESF3tgM=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=SX/CVk1rwC4qS48vTpGBYnwmTezvo8YAV9uOOfjgAAEe6LT3ePwB5lwYDT7LJK3s1
	 zpVLhPEUzCx3h9eXdRl29aMefAfXBWymovCKMYAjKYLvhO+IxgVacmMNCBtvfFzbyD
	 hH1V0iP56ApxdVub7FgbjAjdpEVZiC8NjwLsKPvYwH9hP+imHXpRqVyCDAGyg5EoEZ
	 yKLwACX0X1WkcVfbakTFrwEftnvjG8fXXOXo/yzNTkY/5XNJqbqciNhp0EC0keiLjC
	 AzqvoNBe4/nE9iRmDFgtkiT/8Wkc1QAXFvzWuAZx5YmCMrby1CXao2rAGZW5Gq8KWp
	 eZ6bXmrOPymJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43F3408E1;
	Sat,  6 Dec 2025 17:59:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 656571A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 17:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 474C160653
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 17:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3pbnTASyGY1 for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 17:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47A51605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A51605A5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47A51605A5
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 17:59:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 20F181A1FBF
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 17:59:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA5BF606AC;
 Sat,  6 Dec 2025 17:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E21D102F1956; Sat,  6 Dec 2025 18:59:28 +0100 (CET)
Date: Sat, 06 Dec 2025 18:59:22 +0100
MIME-Version: 1.0
Message-Id: <20251206-libdbi_typo-v1-1-07d8e40b2242@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPluNGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwMz3ZzMpJSkzPiSyoJ83SSTpJRUY7M0SwsjYyWgjoKi1LTMCrBp0bG
 1tQDbzvZGXQAAAA==
X-Change-ID: 20251206-libdbi_typo-b4bde36f9823
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765043972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=+19CGSHweurOdqJvCfdJ9j0h84+XJdSMAZ1nKwQBR7U=;
 b=TJnsx5hknkFKwiSxTBTS9J7tVet13YNm5iFv+xEkONJrzc0O27eWXTmqudQWQTXIJmKR3R
 F6HqGEoru9hdq8gPKvtkdnAkh5ZSPu/dVNTZWT6RPKeOe7jJ4ydOG+ttREIMIQpmJnOqc8
 WCWZr/rAshCz4ywNm5gbCNyzyc2GMhoBOvTRCCNae/ZnvEOM0D5JUqNa208fuyHJa4+H3w
 vh7guvZKoJ4Hm4MvE9+JVRBtICqRlOe6r/2asQc2jYZD2/N/PGrfcWv/rGFUwa/lDVzX/9
 +LP9/zIdI/BpUNJN3vaARFZoDQe/QmXKatgBY7eMo+TroKgpwPjsAOwGpha6LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TJnsx5hk
Subject: [Buildroot] [PATCH] package/libdbi: fix small typo in Config.in
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBicm93c2luZyB0aGUgYXZhaWxhYmxlIERhdGFiYXNlIHBhY2thZ2VzLCBsaWJkYmkgYXBw
ZWFycyBpbiB0aGUKbWVudWNvbmZpZyBhcyAibGlkYmkiLgoKRml4IHRoZSBtZW51Y29uZmlnIGVu
dHJ5IGJ5IHVwZGF0aW5nIHRoZSByZWxldmFudCBib29sZWFuIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIHBhY2th
Z2UvbGliZGJpL0NvbmZpZy5pbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZGJpL0NvbmZpZy5pbiBi
L3BhY2thZ2UvbGliZGJpL0NvbmZpZy5pbgppbmRleCAxM2FjMzQ0ZjgyODQuLmQ5YTEzMTYzMTFj
MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbGli
ZGJpL0NvbmZpZy5pbgpAQCAtMSw1ICsxLDUgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJEQkkK
LQlib29sICJsaWRiaSIKKwlib29sICJsaWJkYmkiCiAJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19M
SUJTCiAJaGVscAogCSAgbGliZGJpIGltcGxlbWVudHMgYSBkYXRhYmFzZS1pbmRlcGVuZGVudCBh
YnN0cmFjdGlvbiBsYXllcgoKLS0tCmJhc2UtY29tbWl0OiBkNGE5OThmMGZhMWZhNDJkODlkYmQx
OWQxMGM2YzJlZTc5ZDNlMWFiCmNoYW5nZS1pZDogMjAyNTEyMDYtbGliZGJpX3R5cG8tYjRiZGUz
NmY5ODIzCgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
