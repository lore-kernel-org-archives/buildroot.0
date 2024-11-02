Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0045E67807
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 17:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 770DA412DC;
	Sat,  2 Nov 2024 17:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRf8khsYD5CS; Sat,  2 Nov 2024 17:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8562941177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8562941177;
	Sat,  2 Nov 2024 17:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A8D112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CB7740C87
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8r-R3hg9iZIH for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 17:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E9A24109D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9A24109D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E9A24109D
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 17:01:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so24928445e9.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 10:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730566891; x=1731171691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mS4Ix4p82vciwBycZN1lNbt+cvlT08TUJ+UM6I3l6Os=;
 b=H0R1KNFcwKXv16thHMd5UponUlmh5JQHoaPJl435aVZSgCoHm1zSYajL5k5l/e6shi
 meDQk55otC5IhWMXV8AsVq0c/160dOQdRt5KrkXemMpopQqeCzL4YaEIpyU6QwNZH1IN
 5m2b7IikuwRrg4bueUZLmuQP0k/06noUgyaNLpaamoiUYmo81GRXRfLQXGUSUCbQDQtL
 xZkilM7VYP1Cq7JZtWYaCogy2BQRdbHTjz7zyFouk4oDvHC/OFLoK2WGomNc0gV+O7yN
 YCrFHsMNEZN/EFM+3/xhQBrqUYrsFa/ZPp/8gnEkN1INj2NPwjOhcF2mbTe2+M5yVZ7Z
 HCjg==
X-Gm-Message-State: AOJu0Yxg4r9x4IR1PreK62MLeXRj6n14IYVS93N7raV5ARSVuyUZz9CC
 rZlio7ghS3cnagERAbP3AawpdnVUVBwTNYFzI2hgDWzRTDUaqKyPDE9lSdb+SbPFIKK7jjefPOD
 f
X-Google-Smtp-Source: AGHT+IEf2ca1YWxcecBaqPTv22hbCi5CMGi/JXWJLFMIYS2MME7cD4nVa2NtImwEPKMBJlnz3zqIBA==
X-Received: by 2002:a05:600c:1c28:b0:431:55af:a22f with SMTP id
 5b1f17b1804b1-4327b6f950fmr95190955e9.13.1730566890895; 
 Sat, 02 Nov 2024 10:01:30 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9207d4sm128357885e9.20.2024.11.02.10.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 10:01:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  2 Nov 2024 18:01:28 +0100
Message-ID: <20241102170128.532820-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730566891; x=1731171691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mS4Ix4p82vciwBycZN1lNbt+cvlT08TUJ+UM6I3l6Os=;
 b=u1a3xRoJi1wnGjdIpA3vliOQ9qCaEuJMuEBxbtEAhPxoO0Hyx3XbohNIn9Oe+EpLm+
 qcm2RN++k9oVSEjJSC/8UQyEXmAE1/TNhiVkM/xCmrkVV1Orlt54puL1tLDIBtDPEdGJ
 nSjwCbJvEMYqayIbCageHZXHCvNHeQkWJ/kL4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=u1a3xRoJ
Subject: [Buildroot] [PATCH] support/testing: TestPythonPy3Incremental:
 update expected string
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since python-incremental 24.7.0, there is no longer a dot before an rc
specifier [1].

Update TestPythonPy3Incremental expected result to
"[package, version 1.2.3rc4]".

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642

[1] https://github.com/twisted/incremental/commit/d482dfff3f1c18eed69372937958c3f2481f6252

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/sample_python_incremental.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_incremental.py b/support/testing/tests/package/sample_python_incremental.py
index efab8b2067..b6e2aa803c 100644
--- a/support/testing/tests/package/sample_python_incremental.py
+++ b/support/testing/tests/package/sample_python_incremental.py
@@ -1,3 +1,3 @@
 import incremental
 v = incremental.Version("package", 1, 2, 3, release_candidate=4)
-assert(str(v) == "[package, version 1.2.3.rc4]")
+assert(str(v) == "[package, version 1.2.3rc4]")
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
