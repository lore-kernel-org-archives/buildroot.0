Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9066BC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7702970872;
	Mon, 19 May 2025 10:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1ETvEUMl_-0; Mon, 19 May 2025 10:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBE77085F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACBE77085F;
	Mon, 19 May 2025 10:54:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0483DE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3189F41245
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vExT31D3uM5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95A0640DB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A0640DB2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89F2282A2E; Mon, 19 May 2025 10:39:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:26:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b910646a86c81c0e9969a2c80b43055494b68401
X-Git-Newrev: a9b0e551afa04c347761d0b9459a106f2c9b8e5e
X-Patchwork-Hint: ignore
Message-Id: <20250519103954.89F2282A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new hyperfine
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9b0e551afa04c347761d0b9459a106f2c9b8e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_hyperfine.py | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dfe0eaa02..6608b30f16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1921,6 +1921,7 @@ F:	support/testing/tests/package/test_gstreamer1.py
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_hyperfine.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
diff --git a/support/testing/tests/package/test_hyperfine.py b/support/testing/tests/package/test_hyperfine.py
new file mode 100644
index 0000000000..4db62c7116
--- /dev/null
+++ b/support/testing/tests/package/test_hyperfine.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestHyperfine(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HYPERFINE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("hyperfine --version")
+
+        test_cmd = "sleep 0.1"
+        cmd = f"hyperfine --style basic --runs 10 '{test_cmd}'"
+        self.assertRunOk(cmd, timeout=15)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
