Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811BEC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BAE84066A;
	Sun, 24 Mar 2024 15:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BqTaip8DeBM; Sun, 24 Mar 2024 15:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69D740774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69D740774;
	Sun, 24 Mar 2024 15:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63CE01BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2789460725
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqS_FjteeIsS for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFBC560759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFBC560759
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF3783B5F; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:05:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9efeb7e91440c20aea6cb0e07027081dbba4604d
X-Git-Newrev: 2bf3dc5b84cf9586406d1ff6aa87860eb28d037a
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.DBF3783B5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add iptables runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bf3dc5b84cf9586406d1ff6aa87860eb28d037a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_iptables.py | 78 ++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd44..328c654fae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1797,6 +1797,7 @@ F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iozone.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_iptables.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
new file mode 100644
index 0000000000..ee57b31558
--- /dev/null
+++ b/support/testing/tests/package/test_iptables.py
@@ -0,0 +1,78 @@
+import os
+
+import infra.basetest
+
+
+class TestIptables(infra.basetest.BRTest):
+    # The iptables package has _LINUX_CONFIG_FIXUPS, so we cannot use
+    # the runtime test pre-built Kernel. We need to compile a Kernel
+    # to make sure it will include the required configuration.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_IPTABLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("iptables --version")
+
+        # We delete all rules in all chains. We also set default
+        # policies to ACCEPT for INPUT and OUPUT chains. This should
+        # already be the case (default Kernel config). This makes sure
+        # this test starts from a known state and also those common
+        # command invocations works.
+        self.assertRunOk("iptables --flush")
+        self.assertRunOk("iptables --policy INPUT ACCEPT")
+        self.assertRunOk("iptables --policy OUTPUT ACCEPT")
+
+        # We add a filter rule to drop all the ICMP protocol to the
+        # IPv4 destination 127.0.0.2, in the INPUT chain. This should
+        # block all pings (icmp echo-requests).
+        cmd = "iptables --append INPUT"
+        cmd += " --protocol icmp --destination 127.0.0.2 --jump DROP"
+        self.assertRunOk(cmd)
+
+        # We check we can list rules.
+        self.assertRunOk("iptables --list")
+
+        # A ping to 127.0.0.1 is expected to work, because it's not
+        # matching our rule. We expect 3 replies (-c), with 0.5s
+        # internal (-i), and set a maximum timeout of 2s.
+        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+
+        # A ping to 127.0.0.2 is expected to fail, because our rule is
+        # supposed to drop it.
+        ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # We delete our only rule #1 in the INPUT chain.
+        self.assertRunOk("iptables --delete INPUT 1")
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
