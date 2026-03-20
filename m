Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563AF483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E42840B7F;
	Mon, 23 Mar 2026 19:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDA_o6Px7I6Z; Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A0C40BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295245;
	bh=qR/o72P4fxABcnzf25XbhQ09eqDTYkTuYnVorhwQoTQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EMvVAlzYE7FmZxM+bNzQKuckTlinz3l2d7sA6dSxD84txc46K6bZ0KtujQdpmd5G5
	 1nZOGnLOCiMTQoqAHVLRpy8GgQg+47weG6Ak2I1DBkIRsp/updwaeeutErruh7Ijek
	 ec2C6PyXCOvtHVrCzn4hFP1zrsM3uHEBQKBBRHet7gbvIAJvaQKcnIOnNCvXft5LGC
	 c/6rRRlXFNXXbOxkrgWyeyqVhCItbqIYzaL6php6BFb/r2+l2cQ1t3MYgNTvVRHR2V
	 1zTb7/sLe9GrHYfVV/mLww5pfNKFtsQ6J4Xysh3XLJRnteDlvRAgdeDDE+B8WwyfRz
	 1Om26OlY7nKpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A0C40BC0;
	Mon, 23 Mar 2026 19:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F18FCF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B086078F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMhDRObpkFua for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BDD60828
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2BDD60828
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1713984C4E; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 863fafb6aafc9d7383f6fa1c7e3e39a3e609f018
X-Git-Newrev: a64a415ff6cc5ab92c86b62b2ab83b0b40e6882b
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.1713984C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_connman: new runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a64a415ff6cc5ab92c86b62b2ab83b0b40e6882b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e55952b17342ee7ae09cb73b862cd5572e0a00af)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_connman.py | 57 +++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9fbca8898..8ed693a5d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1826,6 +1826,7 @@ F:	support/testing/tests/package/test_btrfs_progs.py
 F:	support/testing/tests/package/test_btrfs_progs/
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
+F:	support/testing/tests/package/test_connman.py
 F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
new file mode 100644
index 0000000000..6fef95104c
--- /dev/null
+++ b/support/testing/tests/package/test_connman.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestConnMan(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_CONNMAN=y
+        BR2_PACKAGE_CONNMAN_CLIENT=y
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
+        # We check the program can execute.
+        self.assertRunOk("connmand --version")
+
+        # We query the connman state and expect it to be ready.
+        out, ret = self.emulator.run("connmanctl state")
+        out_str = "\n".join(out)
+        self.assertEqual(ret, 0)
+        self.assertIn("State = ready", out_str)
+
+        # We list the technologies and expect to see at least Ethernet
+        # because the emulator has one interface.
+        out, ret = self.emulator.run("connmanctl technologies")
+        out_str = "\n".join(out)
+        self.assertEqual(ret, 0)
+        self.assertIn("Type = ethernet", out_str)
+
+        # We ping the qemu user networking gateway. The startup
+        # scripts should have brought up the interface, so the ping
+        # is expected to succeed.
+        ping_cmd = "ping -c 3 -i 0.2 -W 2 10.0.2.2"
+        self.assertRunOk(ping_cmd)
+
+        # Now, we ask connman to disable Ethernet. It should stop the
+        # interface.
+        self.assertRunOk("connmanctl disable ethernet")
+
+        # If we try to ping again the qemu gateway,
+        # it should now fail.
+        _, ret = self.emulator.run(ping_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # We ask connman to re-enable Ethernet.
+        self.assertRunOk("connmanctl enable ethernet")
+
+        # We should be able to ping the qemu gateway again.
+        self.assertRunOk(ping_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
