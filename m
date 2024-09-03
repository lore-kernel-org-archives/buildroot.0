Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5513DCD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ECA1607FA;
	Tue,  3 Sep 2024 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoZ94L9aHvx1; Tue,  3 Sep 2024 20:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8EEA60857
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8EEA60857;
	Tue,  3 Sep 2024 20:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 824E81BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2DD60680
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u43Nzg0vY4KN for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87FEF6072A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87FEF6072A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7538186C53; Tue,  3 Sep 2024 20:16:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:14:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4baaf0730581c0f4c31659f8fe69c0e1fb8c3e8e
X-Git-Newrev: 0f79a555b8d3f9c9fafdd89132cc2472d95cefeb
X-Patchwork-Hint: ignore
Message-Id: <20240903201636.7538186C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/toolchain/test_external_arm.py: new test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f79a555b8d3f9c9fafdd89132cc2472d95cefeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Test the 3 ARM toolchains: ARM, AArch64 and AArch64 BE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 .../testing/tests/toolchain/test_external_arm.py   | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 570f4ff115..46fd9c3a48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3208,6 +3208,7 @@ F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
+F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/toolchain/test_external_arm.py b/support/testing/tests/toolchain/test_external_arm.py
new file mode 100644
index 0000000000..1f8e5b4e56
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external_arm.py
@@ -0,0 +1,41 @@
+from tests.toolchain.test_external import TestExternalToolchain
+
+
+class TestExternalToolchainArmArm(TestExternalToolchain):
+    config = """
+        BR2_arm=y
+        BR2_cortex_a8=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_ARM=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arm-none-linux-gnueabihf"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainArmAarch64(TestExternalToolchain):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "aarch64-none-linux-gnu"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainArmAarch64Be(TestExternalToolchain):
+    config = """
+        BR2_aarch64_be=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "aarch64_be-none-linux-gnu"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
