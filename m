Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AE7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88EAA400D2;
	Mon, 22 Jul 2024 12:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqrA-qcQxmNI; Mon, 22 Jul 2024 12:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 214F540177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 214F540177;
	Mon, 22 Jul 2024 12:28:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE94B1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A0A80F55
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYmpJF2S3TOh for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0750180F14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0750180F14
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:28:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2BB587021; Mon, 22 Jul 2024 12:28:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:28:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1e812e739d0de9554c4e8a62fbc8743746b4aa7
X-Git-Newrev: 91738f5093f80eeda8637b9a73636539d6937475
X-Patchwork-Hint: ignore
Message-Id: <20240722122839.F2BB587021@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add iproute2 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=91738f5093f80eeda8637b9a73636539d6937475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_iproute2.py | 77 ++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 60f6b740c7..65dc7e6bdd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1878,6 +1878,7 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
new file mode 100644
index 0000000000..91d9006e23
--- /dev/null
+++ b/support/testing/tests/package/test_iproute2.py
@@ -0,0 +1,77 @@
+import os
+
+import infra.basetest
+
+
+class TestIpRoute2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPROUTE2=y
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
+        # Check the program can execute. This also check we are
+        # actually using the version from the iproute2 package, rather
+        # than the BusyBox version (which does not understand this
+        # option).
+        self.assertRunOk("ip -Version")
+
+        # We run simple invocations of iproute2 tools.
+        self.assertRunOk("ifstat")
+        self.assertRunOk("ip link show dev lo")
+
+        # Buildroot is supposed to have setup the loopback "lo"
+        # interface. We should be able to ping any address in
+        # the 127.0.0.0/8 subnet.
+        addrs = ["127.0.0.1", "127.0.1.2", "127.1.2.3"]
+        ping_cmd = "ping -c 3 -i 0.2"
+        for addr in addrs:
+            self.assertRunOk(f"{ping_cmd} {addr}")
+
+        # We now change this 127.0.0.1/8 to a /16.
+        self.assertRunOk("ip addr del 127.0.0.1/8 dev lo")
+        self.assertRunOk("ip addr add 127.0.0.1/16 dev lo")
+
+        # The IPs in the 127.0.0.0/16 subnet are still supposed to
+        # ping...
+        addrs = ["127.0.0.1", "127.0.1.2"]
+        for addr in addrs:
+            self.assertRunOk(f"{ping_cmd} {addr}")
+        # ...but the IP outside is supposed to fail.
+        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
+        self.assertNotEqual(ret, 0)
+
+        # We add a prohibited route.
+        self.assertRunOk("ip route add prohibit 127.0.1.0/24")
+
+        # Now, only 127.0.0.1 is supposed to ping...
+        self.assertRunOk(f"{ping_cmd} 127.0.0.1")
+        # ...while the other IPs expected to fail.
+        addrs = ["127.0.1.2", "127.1.2.3"]
+        for addr in addrs:
+            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
+            self.assertNotEqual(ret, 0)
+
+        # We should be able to see our prohibited route.
+        out, ret = self.emulator.run("ip route list")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), "prohibit 127.0.1.0/24")
+
+        # We create a new network namespace, and create a new shell
+        # process in it.
+        self.assertRunOk("ip netns add br-test")
+        self.assertRunOk("ip netns exec br-test /bin/sh")
+
+        # Since we are in a new namespace, we should no longer see the
+        # prohibited route. The route list output should be empty.
+        out, ret = self.emulator.run("ip route list")
+        self.assertEqual(ret, 0)
+        self.assertEqual(len(out), 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
