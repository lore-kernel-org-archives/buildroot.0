Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8CC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473BA4086D;
	Tue,  6 Feb 2024 21:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-JEfCo1EOBk; Tue,  6 Feb 2024 21:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380D84086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380D84086E;
	Tue,  6 Feb 2024 21:49:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9E01BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68857612D4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImJInBHTvhkJ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8362C60AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8362C60AF1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B2AB8740E; Tue,  6 Feb 2024 21:49:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 22:49:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f622944bc88a895601955d5ce13a2b7015e54232
X-Git-Newrev: 26b7e0f2824e6df7d865ffae8ff2ec17fd58a9e8
X-Patchwork-Hint: ignore
Message-Id: <20240206214927.6B2AB8740E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new acl runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=26b7e0f2824e6df7d865ffae8ff2ec17fd58a9e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_acl.py | 87 +++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dffbbf4605..4d916ff6a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1762,6 +1762,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
new file mode 100644
index 0000000000..e4827c7bec
--- /dev/null
+++ b/support/testing/tests/package/test_acl.py
@@ -0,0 +1,87 @@
+import os
+
+import infra.basetest
+
+
+class TestAcl(infra.basetest.BRTest):
+    # Note: this test requires a Kernel with a filesystem on /tmp
+    # supporting ACLs. This is the case for the basetest reference
+    # config. Kernel has CONFIG_TMPFS_POSIX_ACL=y, and /tmp is tmpfs
+    # in the default Buildroot config.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ACL=y
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
+        # Check the programs can execute.
+        self.assertRunOk("getfacl --version")
+        self.assertRunOk("setfacl --version")
+
+        # Constants used in this test.
+        test_user = "acltest"
+        test_data = "Hello Buildroot!"
+        test_file = "/tmp/file.txt"
+
+        # Create a test user:
+        # -D    don't set a password
+        # -h    set home directory
+        # -H    don't create home directory
+        # -s    set shell to /bin/sh
+        self.assertRunOk(f"adduser -D -h /tmp -H -s /bin/sh {test_user}")
+
+        # Create a test file, and make sure the owner is "root" with
+        # standard Unix permissions to read/write only for the owner.
+        self.assertRunOk(f"echo '{test_data}' > {test_file}")
+        self.assertRunOk(f"chown root:root {test_file}")
+        self.assertRunOk(f"chmod 0600 {test_file}")
+
+        # Check we have no ACL for the test user.
+        getacl_cmd = f"getfacl -c -p {test_file}"
+        out, ret = self.emulator.run(getacl_cmd)
+        self.assertEqual(ret, 0)
+        self.assertNotIn(f"user:{test_user}:", "\n".join(out))
+
+        # Reading the file as the test user is expected to fail.
+        test_read_cmd = f"su - {test_user} -c 'cat {test_file}'"
+        _, ret = self.emulator.run(test_read_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # We add a special read ACL for the test user.
+        cmd = f"setfacl -m u:{test_user}:r {test_file}"
+        self.assertRunOk(cmd)
+
+        # Check we now have an ACL entry for the test user.
+        out, ret = self.emulator.run(getacl_cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn(f"user:{test_user}:", "\n".join(out))
+
+        # Reading the file as the test user is now expected to
+        # succeed.
+        out, ret = self.emulator.run(test_read_cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], test_data)
+
+        # Attempting to write to the file as the test user is expected
+        # to fail (since we put an ACL only for reading).
+        cmd = f"su - {test_user} -c 'echo WriteTest > {test_file}'"
+        _, ret = self.emulator.run(cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Remove all ACLs. This could have been done with the command
+        # "setfacl -b". Instead, we use the "chacl -B" command which
+        # is doing the same. The reason is to slightly improve the
+        # coverage of this test, by including an execution of "chacl".
+        self.assertRunOk(f"chacl -B {test_file}")
+
+        # Reading the file as the test user is expected to fail again.
+        _, ret = self.emulator.run(test_read_cmd)
+        self.assertNotEqual(ret, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
