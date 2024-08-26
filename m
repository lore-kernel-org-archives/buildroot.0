Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A001C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017DC60017;
	Mon, 26 Aug 2024 16:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhHRztBJs5xr; Mon, 26 Aug 2024 16:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1F8960586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F8960586;
	Mon, 26 Aug 2024 16:49:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27ED91BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 218FC400F6
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEO5JtJvt5c2 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:49:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED5D400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED5D400E4
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D89864B4; Mon, 26 Aug 2024 16:49:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:45:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff6a4f27b4a8475c49fe4514d23c7a23b38e671b
X-Git-Newrev: 8c30fe396646ab462e7252f0f30f3100d1437651
X-Patchwork-Hint: ignore
Message-Id: <20240826164902.E5D89864B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: add which
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c30fe396646ab462e7252f0f30f3100d1437651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_which.py | 53 +++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2b64ee5c6..07dafd5c4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1985,6 +1985,7 @@ F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
new file mode 100644
index 0000000000..38f528aa7f
--- /dev/null
+++ b/support/testing/tests/package/test_which.py
@@ -0,0 +1,53 @@
+import os
+
+import infra.basetest
+
+
+class TestWhich(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_WHICH=y
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
+        # We check the program can run. This also checks we are using
+        # the actual GNU which, since the BusyBox implementation does
+        # not accept this option.
+        self.assertRunOk("which --version")
+
+        # We check the primary usage is working.
+        out, ret = self.emulator.run("which sh")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "/bin/sh")
+
+        alias_name = "buildoot_test_alias"
+
+        # We check "which" returns an error when the program is not
+        # found.
+        _, ret = self.emulator.run(f"which {alias_name}")
+        self.assertNotEqual(ret, 0)
+
+        # We define a shell alias.
+        alias_cmd = "/bin/true"
+        alias_def = f"{alias_name}='{alias_cmd}'"
+        self.assertRunOk(f"alias {alias_def}")
+
+        # We check our alias definition actually works, just by
+        # invoking it (since it's aliased to "true").
+        self.assertRunOk(alias_name)
+
+        # We check "which" is able to read aliases from the shell.
+        cmd = f"alias | which -i {alias_name}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], alias_def)
+        self.assertEqual(out[1].strip(), alias_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
