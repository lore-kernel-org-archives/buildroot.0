Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0365C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C5840883;
	Sun, 12 Mar 2023 21:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C5840883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gz5oeuanFU8Z; Sun, 12 Mar 2023 21:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1389A40298;
	Sun, 12 Mar 2023 21:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1389A40298
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A00C31BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E2081345
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E2081345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMzRMsXi4nYs for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:32:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFF42812FD
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFF42812FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E47686FEB; Sun, 12 Mar 2023 21:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 22:30:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f50259d6a0c0e8ba2149aea04c7dc98fe4707abb
X-Git-Newrev: 30e96518cd7255048bcac024c20e203f51c377d4
X-Patchwork-Hint: ignore
Message-Id: <20230312213225.9E47686FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_stress_ng.py: new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30e96518cd7255048bcac024c20e203f51c377d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_stress_ng.py | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff26021d1d..e28b46967c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1736,6 +1736,7 @@ F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
 
diff --git a/support/testing/tests/package/test_stress_ng.py b/support/testing/tests/package/test_stress_ng.py
new file mode 100644
index 0000000000..12fd6ec9e6
--- /dev/null
+++ b/support/testing/tests/package/test_stress_ng.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestStressNG(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_STRESS_NG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("stress-ng --version")
+        self.assertRunOk("stress-ng --cpu 1 --timeout 3")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
