Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E168C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DCF340733;
	Sun, 18 May 2025 11:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8owjchJdSCY; Sun, 18 May 2025 11:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A83406F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A83406F1;
	Sun, 18 May 2025 11:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 213771BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06BB240643
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YfZEziAr4Ab for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAA7D406F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAA7D406F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAA7D406F1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:55:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63854A4C1077;
 Sun, 18 May 2025 13:55:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51560)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGcby-0000000008Y-2A73;
 Sun, 18 May 2025 11:55:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Sun, 18 May 2025 13:55:15 +0200
Message-Id: <20250518115519.3649662-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747569323;
 bh=bNuE+SdfJQu65iyXI/u1TwVtI7z+AEmbV5chH29JchQ=;
 h=From:To:Cc:Subject:Date:From;
 b=V922XKp/X9ROwnP8jnYw4bjLSOLru21PIw0QEsgJPPPxNp1hJanQ0BomCrc7slHLf
 zCnWjgL5E4DxNRvvmxVSCqTlem8GEbYWKNKoRSXoqUYkQJ55YOXwPa8cFe3KehbWlO
 Sc7a/Up2JL2LyJzkEwDT9rB+oI88l2Y4wVH4Y+8VFV2Lzae/7v30tF3Fr3HUveenIR
 fiqcj9Hl+Ja7WHtZzReKJBFWqjc/g1sgYSW8EfshmYTzFymm4UtRPU6XIzytcu00Io
 VAtug3B5DygtEd96qo2aV+LigazUAjAWRZiMAmCDGJRzT53kKZT2flFt9vwP/3qbys
 NeDSYaKUOgi5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=V922XKp/
Subject: [Buildroot] [PATCH v2 1/5] support/testing: TestClangCompilerRT:
 Add a kernel fragment for 48 bits virtual adress
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Add a kernel fragment to enable
CONFIG_ARM64_VA_BITS_48 for the AARCH64 QEMU platform in the
clang compiler -rt runtime test.

Without this setting, this sanitize-based test fails with clang-20
due to insufficient virtual adress space.

"This might potentially affect ARM platforms with 39-bit address space." from [1]

[1] https://github.com/llvm/llvm-project/commit/a588cfe37ea36ec4fae35a233a13d3557fba86e9

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 support/testing/tests/package/test_clang.py                  | 5 ++++-
 .../tests/package/test_clang/linux-arm64-va48.fragment       | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/package/test_clang/linux-arm64-va48.fragment

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index f36faa059a..a9794a49fa 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -7,8 +7,10 @@ FUZZ_TIMEOUT = 120
 
 class TestClangCompilerRT(infra.basetest.BRTest):
     br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
+    # Without this option the test fails due to insufficient address space for 64-bit allocator
+    va48_fragment = infra.filepath("tests/package/test_clang/linux-arm64-va48.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -17,6 +19,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{va48_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_COMPILER_RT=y
         BR2_PACKAGE_LLVM=y
diff --git a/support/testing/tests/package/test_clang/linux-arm64-va48.fragment b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
new file mode 100644
index 0000000000..1bafe6e581
--- /dev/null
+++ b/support/testing/tests/package/test_clang/linux-arm64-va48.fragment
@@ -0,0 +1 @@
+CONFIG_ARM64_VA_BITS_48=y
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
