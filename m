Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7A4D6E2A4
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 10:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9632F845AF;
	Thu, 21 Nov 2024 10:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzAOHRkTCbSg; Thu, 21 Nov 2024 10:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86594845AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86594845AB;
	Thu, 21 Nov 2024 10:26:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8829FE11
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 10:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF0A4047E
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 10:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHtfxDlHvrVI for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 10:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FF6403D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96FF6403D1
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 10:26:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EC9C86544; Thu, 21 Nov 2024 10:26:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Nov 2024 10:55:15 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 17555734e88938afae7d0a332b17d04e384d4397
X-Git-Newrev: ebd4fe2723521582c0ff6b5f53a98c66b6b3ea61
X-Patchwork-Hint: ignore
Message-Id: <20241121102641.8EC9C86544@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 audit runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebd4fe2723521582c0ff6b5f53a98c66b6b3ea61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This test was suggested by Thomas, in:
https://lists.buildroot.org/pipermail/buildroot/2024-October/766091.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60e0817ebec2a76a0c65b038092245642b31d52f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_audit.py | 91 +++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index badb72007b..8c0d53e6d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1750,6 +1750,7 @@ F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_attr.py
+F:	support/testing/tests/package/test_audit.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
new file mode 100644
index 0000000000..f68a4b6831
--- /dev/null
+++ b/support/testing/tests/package/test_audit.py
@@ -0,0 +1,91 @@
+import os
+
+import infra.basetest
+
+
+class TestAudit(infra.basetest.BRTest):
+    # This test needs a Kernel with the audit support (the builtin
+    # test Kernel does not have this support). Since the audit support
+    # enabled by default, a kernel fragment is not required.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_AUDIT=y
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
+        # We check the program can run by showing its version. This
+        # invocation also checks the Kernel has the audit support
+        # enabled.
+        self.assertRunOk("auditctl -v")
+
+        # We define a normal user name for this test.
+        user = "audit-test"
+
+        # Audit rule inspired from auditctl manual page examples.
+
+        # We add an audit rule logging write access on the
+        # system password file.
+        cmd = "auditctl -a always,exit -F path=/etc/shadow -F perm=wa"
+        self.assertRunOk(cmd)
+
+        # We do a read-only access on this file, as the root user.
+        self.assertRunOk("cat /etc/shadow")
+
+        # We check our previous read-only access did NOT generated an
+        # event record.
+        ausearch_cmd = "ausearch --format text"
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        open_shadow_str = "acting as root, successfully opened-file /etc/shadow"
+        self.assertNotIn(open_shadow_str, "\n".join(out))
+
+        # We create a normal user. This will modify the shadow password file.
+        cmd = f"adduser -D -h /tmp -H -s /bin/sh {user}"
+        self.assertRunOk(cmd)
+
+        # We are now expecting an event record of this modification.
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(open_shadow_str, "\n".join(out))
+
+        # We add a new audit rule, recording failed open of the system
+        # password file.
+        cmd = "auditctl -a always,exit -S openat -F success=0 -F path=/etc/shadow"
+        self.assertRunOk(cmd)
+
+        # We attempt to read the system password file as our new
+        # normal user. This command is expected to fail (as only root
+        # can root is supposed to read this file).
+        cmd = f"su - {user} -c 'cat /etc/shadow'"
+        _, ret = self.emulator.run(cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Our last failed read attempt is supposed to have generated
+        # an event. We check we can see it in the log.
+        out, ret = self.emulator.run(ausearch_cmd)
+        self.assertEqual(ret, 0)
+        evt_str = f"acting as {user}, unsuccessfully opened-file /etc/shadow"
+        self.assertIn(evt_str, "\n".join(out))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
