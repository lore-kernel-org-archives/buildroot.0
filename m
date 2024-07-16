Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA23FC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 10:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B50405C6;
	Tue, 16 Jul 2024 10:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsMYb1vW4FcY; Tue, 16 Jul 2024 10:28:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB21405CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EB21405CF;
	Tue, 16 Jul 2024 10:28:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 626881BF59C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 10:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E8A0813F2
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD_E7UgFWjZs for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 10:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1457B81400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1457B81400
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1457B81400
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:28:12 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D345A2C80261
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:28:09 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 12:28:08 +0200
Message-Id: <20240716102809.1704624-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721125689; bh=vDwripqRzyxMcYcdBfCFdt1QTqfbztwbJ2lApD/Cn/o=;
 h=From:To:Subject:Date;
 b=RBigoG+N9PSID1VlblzXqVZcZgGPSQR8j/v4DTaJN++NJzxEKabw8JfssTRMAw7/d
 uN7JFq6/oIW3sloUon8uq/YHr9ceYUi5ePE+qsFEuSgW8J6YHTrUroenEYED8UJkvd
 3JAkj/V9TRSAXTurSTU5vp1/iOiq7fllIfWbiPW/aM8DNL3MIla4HExMKhKJxeUr1k
 Wt9CDvaJpT2TFKDWt8mYmbvFA+AQuMDJhYFbS+sOP2/+0XVimD4ahyR3EdqftPgRqd
 +RiIn7B6qNX3NxjBUgqnPcr2KYmzia6btPH1aKZ6sW1rNIHMu2PTAAsQ+vuDiFjw8k
 +awhgBOOmNzlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=RBigoG+N
Subject: [Buildroot] [PATCH] package/c-ares: bump to 1.32.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://c-ares.org/changelog.html#1_32_2

License hash changed due to whitespace changes:
https://github.com/c-ares/c-ares/commit/ce4c20afcbf9a05d36d02893e8ebb66726d8396c

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 9a2b69c731..e1cf9f657a 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b  c-ares-1.27.0.tar.gz
+sha256  072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061  c-ares-1.32.2.tar.gz
 
 # Hash for license file
-sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
+sha256  8a9994f85a8e531e1a3217ab7ba509787c6b93056aabe702137ce662db8321c2  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c2403b9c4c..4b7342cadb 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.27.0
-C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
+C_ARES_VERSION = 1.32.2
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.32.2
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
