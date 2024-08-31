Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF706CD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A738B6076C;
	Sat, 31 Aug 2024 13:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1MaoU1WnCLw; Sat, 31 Aug 2024 13:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E1260772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E1260772;
	Sat, 31 Aug 2024 13:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCF161BF867
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A797D40390
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M72Kq7lqo4QM for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61660400AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61660400AE
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D5F8665E; Sat, 31 Aug 2024 13:58:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 12:08:58 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d2777c335a3534a4771120af793d4216a6cb7b22
X-Git-Newrev: 59f3f3222c014cec46b68c153ac92d7c5c03cf07
X-Patchwork-Hint: ignore
Message-Id: <20240831135812.58D5F8665E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add
 iproute2 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=59f3f3222c014cec46b68c153ac92d7c5c03cf07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 91738f5093f80eeda8637b9a73636539d6937475)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_iproute2.py | 77 ++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 043e558652..9a97df47e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1841,6 +1841,7 @@ F:	support/testing/tests/package/test_hwloc.py
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
