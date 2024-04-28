Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04F6C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82ACA606EC;
	Sun, 28 Apr 2024 18:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKGq9DTR5a8b; Sun, 28 Apr 2024 18:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E431E606C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E431E606C2;
	Sun, 28 Apr 2024 18:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 110EA1BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3C14016F
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plFcQne19bcN for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06C91401B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C91401B1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03A9086187; Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:22:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 517f032992158d8f3aaee7d68cb417adf3d8fac7
X-Git-Newrev: 4cc800617270b3f047fde5135c4dd0efb11ce6cb
X-Patchwork-Hint: ignore
Message-Id: <20240428182742.03A9086187@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add wine runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cc800617270b3f047fde5135c4dd0efb11ce6cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_wine.py | 88 ++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d10e3dbac..51a5cad167 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,7 @@ F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
new file mode 100644
index 0000000000..4e5b4a8b11
--- /dev/null
+++ b/support/testing/tests/package/test_wine.py
@@ -0,0 +1,88 @@
+import os
+
+import infra.basetest
+
+
+class TestWine(infra.basetest.BRTest):
+    # Wine depends on i386 architecture. The pre-build runtime test
+    # Kernel (for armv5) cannot be used. The config also uses a ext4
+    # rootfs due to the larger Wine footprint. We also enable NLS,
+    # which is required for cmd.exe shell to work.
+    config = \
+        """
+        BR2_i386=y
+        BR2_x86_pentium4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_WINE=y
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="i386",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyS0"],
+                           options=["-M", "pc", "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Check the program can run.
+        self.assertRunOk("wine --version")
+
+        # Remove the Wine directory to make this test idempotent. This
+        # is because we use a persistent storage. This is useful only
+        # when the run-tests script is used with the "-k" option.
+        self.assertRunOk("rm -rf ~/.wine")
+
+        # Wine usually prints lots of debug messages. We disable all
+        # logs for this test. For debugging, this line can be
+        # commented, or extra log can also be added. "WINEDEBUG=+all"
+        # enable all logs and generates a lot of messages.
+        # See: https://wiki.winehq.org/Debug_Channels
+        self.assertRunOk("export WINEDEBUG=-all")
+
+        # We force the initialization of the WINEPREFIX
+        # directory. This operation can take some time. This will make
+        # subsequent wine invocation execution time more stable.
+        self.assertRunOk("wineboot --init", timeout=45)
+
+        # We check we can list files in the Windows OS directory.
+        cmd = "wine cmd.exe /C 'DIR C:\\WINDOWS\\'"
+        self.assertRunOk(cmd, timeout=10)
+
+        # We check we can read a Windows OS specific environment
+        # variable. We use "assertIn" rather than "assertEqual"
+        # because the cmd.exe shell write extra control characters.
+        cmd = "wine cmd.exe /C 'ECHO %OS%'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Windows_NT", out[0])
+
+        # We check we can print an arbitrary string with the
+        # cmd.exe shell.
+        string = "Hello Buildroot !"
+        cmd = f"wine cmd.exe /C 'ECHO {string}'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn(string, out[0])
+
+        # We check the VER command reports a Windows OS version.
+        cmd = "wine cmd.exe /C 'VER'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Microsoft Windows", "\n".join(out))
+
+        # We run the ping.exe command.
+        self.assertRunOk("wine ping.exe 127.0.0.1", timeout=10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
