Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503EAC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3CE3417A6;
	Wed,  1 May 2024 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FS_KIhaSkIF; Wed,  1 May 2024 20:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C6FB4178B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C6FB4178B;
	Wed,  1 May 2024 20:46:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3CF1BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E99EC81EE2
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-PJnRLgukAA for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CB088193E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB088193E
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15FF9864D4; Wed,  1 May 2024 20:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:06:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d9a3f1a32e743fd5bb267442be98b4e0a2d0e14
X-Git-Newrev: 6317f6c9a4107d3409530b653c5900bff17ffb6e
X-Patchwork-Hint: ignore
Message-Id: <20240501204617.15FF9864D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add iperf runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6317f6c9a4107d3409530b653c5900bff17ffb6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_iperf.py | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c132b61f2a..6bfad23442 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1799,6 +1799,7 @@ F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
+F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
diff --git a/support/testing/tests/package/test_iperf.py b/support/testing/tests/package/test_iperf.py
new file mode 100644
index 0000000000..31f04d9896
--- /dev/null
+++ b/support/testing/tests/package/test_iperf.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestIperf(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPERF=y
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
+        self.assertRunOk("iperf --version")
+        self.assertRunOk("iperf -s -D")
+        self.assertRunOk("iperf -c 127.0.0.1 -t 3")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
