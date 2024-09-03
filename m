Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E43E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4BA84AB1;
	Fri,  6 Sep 2024 20:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9_txDOIdIMd; Fri,  6 Sep 2024 20:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7BA81EA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7BA81EA6;
	Fri,  6 Sep 2024 20:06:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB5AD1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE78B408DD
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAEBCR_Ma6qU for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7AD40A7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC7AD40A7A
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6770869F2; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:14:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f79a555b8d3f9c9fafdd89132cc2472d95cefeb
X-Git-Newrev: ad99ad8e8a284c635a87452de573a8700025ec9f
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.A6770869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/toolchain/test_external_synopsys.py: new test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad99ad8e8a284c635a87452de573a8700025ec9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test the 6 combinations of Synopsys toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 .../tests/toolchain/test_external_synopsys.py      | 91 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 46fd9c3a48..ed64906fc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3209,6 +3209,7 @@ F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
+F:	support/testing/tests/toolchain/test_external_synopsys.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/toolchain/test_external_synopsys.py b/support/testing/tests/toolchain/test_external_synopsys.py
new file mode 100644
index 0000000000..19ed9f67b0
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external_synopsys.py
@@ -0,0 +1,91 @@
+from tests.toolchain.test_external import TestExternalToolchain
+
+
+class TestExternalToolchainSynopsysArc700LE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_arc770d=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArc700BE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_arc770d=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSGlibcLE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSGlibcBE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSuClibcLE(TestExternalToolchain):
+    config = """
+        BR2_arcle=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arc-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainSynopsysArcHSuClibcBE(TestExternalToolchain):
+    config = """
+        BR2_arceb=y
+        BR2_archs38_full=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y
+        BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "arceb-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
