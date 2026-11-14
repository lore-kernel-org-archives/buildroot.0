Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B33606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=No1Y0po2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CC8606E3;
	Sat, 14 Nov 2026 22:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go5syV-vnTlx; Sat, 14 Nov 2026 22:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B239606CA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794694935;
	b=ry6M+o0AnFI9/0GRx8rU5vhnnBA1bRC89R3jUhlpSZnI1ueG1eM2bRMubE/pl7PRmxI3
	 4Zj5x7HrTIF8WiD2iTUv5EX/32NbJEnMSGnADEzhfrD9IdYYMtx0Jt9HZ6M4hZ/3urMdS
	 hcdisRAVeweAykZxO9Z7DFXzKqjFxexHJfFfA9c0MnoOlNVkWAJIgRjRKPN5+ojqxUghJ
	 2jM+BmF5xT2zxaK3Sf7apcHX1edskm1MC6rZyFFQAov8p04Pe08r6d1iEY+wObOn/JMfg
	 ZYsrST/w7jpWDmJxr0OkO92GFhrT6GR5WcIdafD0ExODP7roZZlKlKR1ajVaKCN1fWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794694935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KT9yxeV4p+Okb9Vjzz5j6pH3Rxn8cgdzCjoFrWmaJCg=;
	b=MHvan7srx7MKj1+32jUDGtN14IN1lhvnxIQh0HVpGmrUAKFxm81wlFvN4D4Vho3/vGbY
	 oyY4M00V7QgpXnWZFElGTrRt8GNworYzwPq+bGUj5JSrq4MDL3SBPksZ3/YqzL2jtg34N
	 sIFETwr+gdVHvvFZ6y41ruovUfo6F9MBn+boDLdEH7SVObPVoplJtIhHF1wV8HGx85bS8
	 sP6c2I2Bto8uDJVJjfIEU8+NKJPfNcjVSkBil/TdvCy7DtMwN3rHOMXMvvUFPwpu6F3Y+
	 9XjxLrAlAltqhgzbc2SiwgH/OB7neB6R2w9gDiHw9le8OJvgp4VVIlM0filJgc3yLdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794694935;
	bh=KT9yxeV4p+Okb9Vjzz5j6pH3Rxn8cgdzCjoFrWmaJCg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=No1Y0po2f1ebEw+6mbwhC/4DveTIPaZetqamjwTEgjnN/5ItQczjq3xMWhgWqHkqK
	 Kfxd1rvKyxsElMBItYwZxT2Qdu+ONNe/UCNrlq48gUxk7XAC0uhcXtTiiyhIJCQL8l
	 UXSiFEGSjvTw0yFeUC8pbdBHdogCEh+vjZC8brsCxBXdk3z+xbETp7iv1bLD4Qd/Jq
	 Qja2JQmNAo4WMPphJ/mTEApMd+chCFO8VRXFnOzJRrUUxIL5JMnytaE+8mMmUeHWeF
	 WpJgvv+fKNmdKNmYBI8F5HcjpNLNwR4Oz4Wnx9oacELuTcWdzB1tLUKXe6jmeh8Gyf
	 XVFF69gukzKKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B239606CA;
	Sat, 14 Nov 2026 22:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7C6628C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D475D407E9
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3yTCHsT3nkR for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 22:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22B80407D9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22B80407D9
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 22:22:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 59B945FFB4;
 Sat, 14 Nov 2026 23:22:07 +0100 (CET)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 14 Nov 2026 23:21:55 +0100
Message-ID: <20261114222155.1450949-3-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114222155.1450949-1-ju.o@free.fr>
References: <20261114222155.1450949-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] support/testing: test_systemd: remove
 unneeded NO_COLOR=1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Colors are now globally disabled for all runtime tests.
It is no longer needed to do it in tests, so this commit
removes this NO_COLOR=1.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/init/test_systemd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 1112d5e269..35d5031d86 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -32,7 +32,7 @@ class InitSystemSystemdBase(InitSystemBase):
         self.check_init("/lib/systemd/systemd")
 
         # Test there is no tainted flag.
-        output, ret = self.emulator.run("NO_COLOR=1 systemctl --no-pager status")
+        output, ret = self.emulator.run("systemctl --no-pager status")
         self.assertEqual(ret, 0, f"'systemctl status' failed with exit code {ret}, with:\n{output}")
         try:
             # 'support-ended' tainted flag is only set based on the
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
