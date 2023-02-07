Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA10C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4798480F79;
	Tue,  7 Feb 2023 13:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4798480F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXcMcZ6JBQA6; Tue,  7 Feb 2023 13:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73EE980F4C;
	Tue,  7 Feb 2023 13:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EE980F4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E190F1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC40A405FD
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC40A405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgR5EdS4Eq56 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB9A140516
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB9A140516
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA9AB84151; Tue,  7 Feb 2023 13:25:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:01:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 037dbe64d861e3d5580ecac608bd278afc9bbcc6
X-Git-Newrev: 4e23807372370974a307b3c70ef9d77964a149ce
X-Patchwork-Hint: ignore
Message-Id: <20230207132558.CA9AB84151@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_magic_wormhole.py: new runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e23807372370974a307b3c70ef9d77964a149ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../tests/package/test_python_magic_wormhole.py    | 62 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5776d6d7a5..8dde37bd67 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1717,6 +1717,7 @@ F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
new file mode 100644
index 0000000000..d6541a2480
--- /dev/null
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -0,0 +1,62 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MagicWormhole(TestPythonPackageBase):
+    __test__ = True
+    # Need to use a different toolchain than the default due to
+    # python-cryptography using Rust (not available with uclibc)
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER=y
+        BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_TRANSIT_RELAY=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    timeout = 60
+
+    def twistd_cmd(self, command):
+        s = "twistd"
+        s += " --pidfile=/tmp/{}.pid".format(command)
+        s += " --logfile=/tmp/{}.log".format(command)
+        s += " {}".format(command)
+
+        return s
+
+    def test_run(self):
+        code = "123-hello-buildroot"
+        text = "Hello Buildroot!"
+
+        relay_url = "ws://localhost:4000/v1"
+        transit_helper = "tcp:localhost:4001"
+
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5", kernel="builtin",
+                           options=["-initrd", img])
+
+        self.emulator.login()
+
+        cmd = self.twistd_cmd("wormhole-mailbox")
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = self.twistd_cmd("transitrelay")
+        self.assertRunOk(cmd, timeout=30)
+
+        wormhole_cmd = "wormhole --relay-url={} --transit-helper={}".format(
+            relay_url, transit_helper)
+
+        cmd = wormhole_cmd + " send --code={} --text=\"{}\" & ".format(code, text)
+        cmd += "sleep 25"
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = wormhole_cmd + " receive {}".format(code)
+        output, exit_code = self.emulator.run(cmd, timeout=35)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], text)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
