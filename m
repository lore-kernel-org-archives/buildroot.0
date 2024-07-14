Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC45BC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 22:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 810C9404C4;
	Sun, 14 Jul 2024 22:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsqCWuJyfxfn; Sun, 14 Jul 2024 22:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC3440444
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DC3440444;
	Sun, 14 Jul 2024 22:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56441BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15BB80D34
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku0cbQK3WsEX for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 22:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FFAC80D1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FFAC80D1B
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 22:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5562386ACC; Sun, 14 Jul 2024 22:14:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 00:12:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c85e291d40a88c318bf38b8f32793e2069c1039d
X-Git-Newrev: 2da40a2fd7a0007ff1a51bc957980f516746a6ad
X-Patchwork-Hint: ignore
Message-Id: <20240714221423.5562386ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add attr runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=2da40a2fd7a0007ff1a51bc957980f516746a6ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_attr.py | 75 ++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9539b60724..2650fb7f48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1822,6 +1822,7 @@ F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
+F:	support/testing/tests/package/test_attr.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_bcc.py
 F:	support/testing/tests/package/test_bcc/
diff --git a/support/testing/tests/package/test_attr.py b/support/testing/tests/package/test_attr.py
new file mode 100644
index 0000000000..1b43f7daf6
--- /dev/null
+++ b/support/testing/tests/package/test_attr.py
@@ -0,0 +1,75 @@
+import os
+
+
+import infra.basetest
+
+
+class TestAttr(infra.basetest.BRTest):
+    # Note: this test uses extended attributes (xattr). We use a ext4
+    # rootfs (which fully supports xattrs). Note that tmpfs has
+    # partial support of xattrs, and cpio initrd has not.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ATTR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk_file = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           kernel_cmdline=["rootwait", "root=/dev/sda"],
+                           options=["-drive", f"file={disk_file},if=scsi,format=raw"])
+        self.emulator.login()
+
+        # Check the programs can execute.
+        self.assertRunOk("getfattr --version")
+        self.assertRunOk("setfattr --version")
+
+        test_file = "/root/file.txt"
+        attr_name = "buildroot"
+        attr_value = "is-great"
+
+        # Create a test file.
+        self.assertRunOk(f"echo 'Hello Buildroot!' > {test_file}")
+
+        # Set an extended attribute.
+        cmd = f"setfattr -n user.{attr_name} -v {attr_value} {test_file}"
+        self.assertRunOk(cmd)
+
+        # Read back the attribute value. We add an extra "echo" to add
+        # a new line. getfattr --only-values prints raw attribute
+        # values and lack of a new line.
+        cmd = "getfattr"
+        cmd += f" -n user.{attr_name} --absolute-names --only-values"
+        cmd += f" {test_file} && echo"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], attr_value)
+
+        # We read back the attribute value again, but with the "attr"
+        # command this time.
+        cmd = f"attr -q -g {attr_name} {test_file} && echo"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], attr_value)
+
+        # List extended attributes with "attr", and check we see our
+        # test attribute.
+        cmd = f"attr -l {test_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(attr_name, "\n".join(out))
+
+        # Remove the test attribute with setfattr.
+        cmd = f"setfattr -x user.{attr_name} {test_file}"
+        self.assertRunOk(cmd)
+
+        # We check the test attribute is no longer listed by the attr
+        # command.
+        cmd = f"attr -l {test_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertNotIn(attr_name, "\n".join(out))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
