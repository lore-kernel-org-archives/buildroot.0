Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0D684973;
	Fri, 28 Feb 2025 17:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqD_O-vFO_Qq; Fri, 28 Feb 2025 17:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E7285827
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E7285827;
	Fri, 28 Feb 2025 17:06:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFC768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B944D42EBC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be7CBfl9pDgp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 395A5424F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 395A5424F4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300C582581; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 17:58:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a941bef9f92fc6c4c0b23714bb934133e659ec51
X-Git-Newrev: e3d74c76eef1155d4040dae2d51662bfc0e3e0fc
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.300C582581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e3d74c76eef1155d4040dae2d51662bfc0e3e0fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
[Julien: remove the DEVELOPERS entry]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 -
 .../tests/toolchain/test_external_synopsys.py      | 91 ----------------------
 2 files changed, 92 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff069b9c40..fde9360ad6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3220,7 +3220,6 @@ F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
-F:	support/testing/tests/toolchain/test_external_synopsys.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
