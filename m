Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4B1CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 09:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F4570496;
	Fri, 20 Oct 2023 09:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F4570496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evZww5pc3-p9; Fri, 20 Oct 2023 09:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF2870492;
	Fri, 20 Oct 2023 09:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BF2870492
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0BA1BF861
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 09:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F08670495
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 09:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F08670495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Elix3WqnxQUe for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 09:10:00 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B24160A8D
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 09:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B24160A8D
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9b507b00so454796f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 02:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697792998; x=1698397798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bOCcZ7vcNapnw9cz7NBwPq2ds/g6VZOKtbUMHeJVJP0=;
 b=GlkL8hs87qWy/her7w4Sqa5jXNp1dyHYJDoRRa8fFDn+W5uQ8Owcu5BPN8tw10LuZk
 6QUfKYki5ZMZcr7d4kMgy0+OISTxIzC/eus36+lDxhE4Ek/R1ZKAJ+iati8Dn7hSsqxl
 AyIblG7AlOfOEPY3up9/smX9Hx/+JhA5o+vOjH1bT/D0byzgV6LvETiVTrGM3hU+bSue
 r0YadYjmEugqUgxMF1pu1bDISz/5emtDtQb1REV1DwEzvWuXUWIp8QJ9Y3/4qFHyWxiD
 0522QjAdgLeXScZPujiScCcD10/zDkBNdQYTGr7PZfsEPVttPrkkwChBNi6nUVrUAiEk
 j5cQ==
X-Gm-Message-State: AOJu0YxIDKNgyRCHdsvMgFag1TIpevfwX8AcjZlpsWQo9HGN53dWnvr8
 UkwzHAbQI7npzHAfi8tXDY6kSYetbqbfXMr7iLl3cg==
X-Google-Smtp-Source: AGHT+IF+7+XJhNyKIWvfYF4C7rhKS86/QuojqSXp1HTbqMjMjTvwojWz2T/BTz60IqD7ZwkwyPcpbg==
X-Received: by 2002:a5d:698e:0:b0:32d:a54a:f57c with SMTP id
 g14-20020a5d698e000000b0032da54af57cmr983247wru.25.1697792997791; 
 Fri, 20 Oct 2023 02:09:57 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 t8-20020adff048000000b0032dc2110d01sm1249895wro.61.2023.10.20.02.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 02:09:57 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 11:09:49 +0200
Message-ID: <20231020090949.2839604-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697792998; x=1698397798; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bOCcZ7vcNapnw9cz7NBwPq2ds/g6VZOKtbUMHeJVJP0=;
 b=b4b6d/zIMk7MI7XQLov4J76+sh6I8c7NDio71EDyFCEqCKIDYfHakChFe+JT07XquF
 3rI7U4omU+clI9Fvv6Ql3nAKoYpjgrNPj2yLJBBIwwZAH0X75NbidSEHe4TESGFcFKPN
 BUTthBoY7AHNUhrNFXT7R0enlrdmsNJdBxQtA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=b4b6d/zI
Subject: [Buildroot] [PATCH 1/1] package/libxmlrpc: bump version to 1.60.00
 (code/advanced@r3162)
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCiBw
YWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbGlieG1scnBj
L2xpYnhtbHJwYy5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxy
cGMuaGFzaCBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5oYXNoCmluZGV4IDY2NWVlMzE4
MzYuLmNhZDRkMGUzNzkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5o
YXNoCisrKyBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5oYXNoCkBAIC0xLDMgKzEsMyBA
QAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDYyNmUzNjI5NWY0M2IzMjAwODJiYzdiZGQ5
NjFiNDZmMzlmYmUyNzE5NTM1YjVhNDE3OTc1YThlNTBjOGY3ZjMgIGxpYnhtbHJwYy1yMzExOS1i
cjMudGFyLmd6CitzaGEyNTYgIGFjNWY1ZTgzYzZmZWFhNTI3NmZkMDYxMGIwNTVjNmU1ZDM1MDA4
OTcwNGI2MGMxN2Q1YWYzMGFmYjA4NTA2YzUgIGxpYnhtbHJwYy1yMzE2Mi1icjMudGFyLmd6CiBz
aGEyNTYgIGRiN2E2ZDNmMTg3YjIxOGMzNTM0MDEwYTgzNDI0YzZiY2RlZjg4ZTZhMGI2YjFhYTNh
ODc2MjIzOGJkNjQyZTYgIGRvYy9DT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnhtbHJw
Yy9saWJ4bWxycGMubWsgYi9wYWNrYWdlL2xpYnhtbHJwYy9saWJ4bWxycGMubWsKaW5kZXggYzFi
MGVhZThlZS4uMmQzZWU2NjA1MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ4bWxycGMvbGlieG1s
cnBjLm1rCisrKyBiL3BhY2thZ2UvbGlieG1scnBjL2xpYnhtbHJwYy5tawpAQCAtNCw4ICs0LDgg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLSMgMS41OC4wMiAoY29kZS9hZHZhbmNl
ZEByMzExOSkKLUxJQlhNTFJQQ19WRVJTSU9OID0gcjMxMTkKKyMgMS42MC4wMCAoY29kZS9hZHZh
bmNlZEByMzE2MikKK0xJQlhNTFJQQ19WRVJTSU9OID0gcjMxNjIKIExJQlhNTFJQQ19TSVRFID0g
aHR0cHM6Ly9zdm4uY29kZS5zZi5uZXQvcC94bWxycGMtYy9jb2RlL2FkdmFuY2VkCiBMSUJYTUxS
UENfU0lURV9NRVRIT0QgPSBzdm4KIExJQlhNTFJQQ19MSUNFTlNFID0gQlNELTMtQ2xhdXNlICh4
bWwtcnBjIG1haW4gY29kZSBhbmQgYWJ5c3Mgd2ViIHNlcnZlciksIEJTRCBsaWtlIChsaWIvZXhw
YXQpLCBQeXRob24gMS41LjIgbGljZW5zZSAocGFydHMgb2YgeG1scnBjX2Jhc2U2NC5jKQotLSAK
Mi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
