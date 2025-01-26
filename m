Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A41C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB528083E;
	Sun, 26 Jan 2025 11:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiPf0cx9i5yr; Sun, 26 Jan 2025 11:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED60280E64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED60280E64;
	Sun, 26 Jan 2025 11:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F72941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C495E607DF
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7EkPus-ZeOe for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F86260793
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F86260793
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F86260793
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:34:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D3FD760003;
 Sun, 26 Jan 2025 11:34:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jan 2025 12:34:35 +0100
Message-ID: <20250126113436.4166164-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737891278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=l8SDOdSFMFXHgl2gqp7GAon5Iz4pbIAJDQ94mEQIovI=;
 b=P/3mHE4DtvTfsR/TOdGvyrNsG8/ShqrmiOyPjITxfYzcE5kfsCRyLX8nh37gFGP52rxQGZ
 Mg0GCT9/ptxgRdWBRBn9m2xFteViUNlCXFl9qNQr2mZ5HI1gM0GUQXOkZIi0n3zTbn1nAB
 yhsK4hfphJIE7ex9+2HzbXl57erBaJc2L2a7GiIM5CQ7Nv36mqE2z9EKMQ/a7D0GROGF3q
 xsa78amXANmjW8y8r/VRrL17nAwEIeA2UDtLMVgiUK0fDx7crcjiQEXOFWvRypJXgkqWrt
 ZpneMzi6cliMI5cVgHJuvA02FmkfiMjB2u0TvJsc3xMeHLUYVrlGioTj9z2SlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P/3mHE4D
Subject: [Buildroot] [PATCH]
 support/testing/tests/toolchain/test_external_synopsys.py: drop tests
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Synopsys external toolchain has been disabled in commit
11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8, causing the test cases
testing this toolchain to fail. Let's drop those tests for now, they
can always be re-added later on.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697531
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697528
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697524
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697519
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697517
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892697516

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_synopsys.py | 91 -------------------
 1 file changed, 91 deletions(-)
 delete mode 100644 support/testing/tests/toolchain/test_external_synopsys.py

diff --git a/support/testing/tests/toolchain/test_external_synopsys.py b/support/testing/tests/toolchain/test_external_synopsys.py
deleted file mode 100644
index 19ed9f67b0..0000000000
--- a/support/testing/tests/toolchain/test_external_synopsys.py
+++ /dev/null
@@ -1,91 +0,0 @@
-from tests.toolchain.test_external import TestExternalToolchain
-
-
-class TestExternalToolchainSynopsysArc700LE(TestExternalToolchain):
-    config = """
-        BR2_arcle=y
-        BR2_arc770d=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arc-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainSynopsysArc700BE(TestExternalToolchain):
-    config = """
-        BR2_arceb=y
-        BR2_arc770d=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arceb-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainSynopsysArcHSGlibcLE(TestExternalToolchain):
-    config = """
-        BR2_arcle=y
-        BR2_archs38_full=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arc-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainSynopsysArcHSGlibcBE(TestExternalToolchain):
-    config = """
-        BR2_arceb=y
-        BR2_archs38_full=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arceb-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainSynopsysArcHSuClibcLE(TestExternalToolchain):
-    config = """
-        BR2_arcle=y
-        BR2_archs38_full=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arc-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainSynopsysArcHSuClibcBE(TestExternalToolchain):
-    config = """
-        BR2_arceb=y
-        BR2_archs38_full=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
-        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "arceb-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
