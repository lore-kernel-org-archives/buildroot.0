Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CACA0FE1
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 12:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D627440120;
	Fri, 30 Aug 2024 12:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SWXF__vQ0KK; Fri, 30 Aug 2024 12:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F69F4045A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F69F4045A;
	Fri, 30 Aug 2024 12:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCCA1BF410
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388814045A
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 12:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CctSZvm8KKqz for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254B540120
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 254B540120
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BA8882751; Fri, 30 Aug 2024 12:24:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 14:09:21 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d6079d7a4b41df82864e9d60a0b72968479c693f
X-Git-Newrev: 842401fca0cd2c4dc6865da553a8141ac9968284
X-Patchwork-Hint: ignore
Message-Id: <20240830122447.1BA8882751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add nmap
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=842401fca0cd2c4dc6865da553a8141ac9968284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5510d2890fc628bf08805f83e3430d759c15a8ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_nmap.py | 42 ++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9fdd7b1c..a54d973018 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1846,6 +1846,7 @@ F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_nmap.py
 F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
diff --git a/support/testing/tests/package/test_nmap.py b/support/testing/tests/package/test_nmap.py
new file mode 100644
index 0000000000..92b085ece9
--- /dev/null
+++ b/support/testing/tests/package/test_nmap.py
@@ -0,0 +1,42 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNmap(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NMAP=y
+        BR2_PACKAGE_NMAP_NCAT=y
+        BR2_PACKAGE_NMAP_NMAP=y
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
+        # Check the program can execute.
+        self.assertRunOk("nmap --version")
+
+        # We open few ports, using the nmap netcat "nc" commands.
+        ports = [21, 23, 25, 80]
+        for port in ports:
+            cmd = f"nc -l -p {port} </dev/null &>/dev/null &"
+            self.assertRunOk(cmd)
+
+        time.sleep(1 * self.timeout_multiplier)
+
+        # We run a local port scan. We should see in the output the
+        # ports we previously opened.
+        out, ret = self.emulator.run("nmap -n -sS 127.0.0.1", timeout=20)
+        self.assertEqual(ret, 0)
+        nmap_out = "\n".join(out)
+        for port in ports:
+            self.assertRegex(nmap_out, f"{port}/tcp *open")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
