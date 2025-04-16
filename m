Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543EBC369CA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C79880E91;
	Wed, 16 Apr 2025 21:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id he-qcBgPQ0C7; Wed, 16 Apr 2025 21:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D9281011
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D9281011;
	Wed, 16 Apr 2025 21:48:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13A8320E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6231881EEB
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAOGGWu55pN3 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93191820EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93191820EC
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9025F83C3D; Wed, 16 Apr 2025 21:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 13:36:29 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: e2fdc0e9dce1eb0cf2d01610ed4d4d942963a3e0
X-Git-Newrev: 42ae1e26557ea291bf230cb878920ab3e5f566d4
X-Patchwork-Hint: ignore
Message-Id: <20250416214823.9025F83C3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/testing: add git
 runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42ae1e26557ea291bf230cb878920ab3e5f566d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 24efb23a1074b920fe32763ae455a4694410eb6e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_git.py | 57 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 556cefa0bf..1f4a335e33 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1885,6 +1885,7 @@ F:	support/testing/tests/package/test_fwts.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_ghostscript.py
 F:	support/testing/tests/package/test_ghostscript/
+F:	support/testing/tests/package/test_git.py
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
 F:	support/testing/tests/package/test_gnupg2.py
diff --git a/support/testing/tests/package/test_git.py b/support/testing/tests/package/test_git.py
new file mode 100644
index 0000000000..878c4c8092
--- /dev/null
+++ b/support/testing/tests/package/test_git.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestGit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_GIT=y
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
+        self.assertRunOk("git --version")
+
+        # Initialize some git global configuration.
+        git_cfg = [
+            ("user.name", "Build Root"),
+            ("user.email", "build.root@localhost.localdomain"),
+            ("color.ui", "false"),
+            ("init.defaultBranch", "master"),
+            ("core.pager", "")
+        ]
+        for cfg_name, cfg_value in git_cfg:
+            cmd = f"git config --global {cfg_name} '{cfg_value}'"
+            self.assertRunOk(cmd)
+
+        # Run a sequence of few git commands.
+        commands = [
+            "mkdir workdir",
+            "cd workdir",
+            "git init",
+            "echo 'Hello World' > file.txt",
+            "git add file.txt",
+            "git commit -as -m 'Initial commit'",
+            "git checkout -b my_branch",
+            "sed -i 's/World/Buildroot/g' file.txt",
+            "git status",
+            "git commit -as -m 'Replace World by Buildroot'",
+            "git format-patch -M -n -s -o patches master",
+            "ls -al patches/*.patch",
+            "git checkout -b another_branch master",
+            "git am patches/*.patch",
+            "git diff --exit-code my_branch another_branch",
+            "git tag -a -m 'Tagged v1.0' v1.0",
+            "git log"
+        ]
+        for cmd in commands:
+            self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
