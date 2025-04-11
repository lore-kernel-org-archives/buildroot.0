Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAA8C369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E35116F666;
	Fri, 11 Apr 2025 10:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjEuxZMlv7Ll; Fri, 11 Apr 2025 10:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57786F610
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57786F610;
	Fri, 11 Apr 2025 10:41:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02903138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCFEA40337
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Z6QtoM4gEhz for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF55403FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DF55403FB
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18BC8842A0; Fri, 11 Apr 2025 10:41:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:40:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c4670e879e9a83057b2f6c6b7355b8e8c6228c40
X-Git-Newrev: 2662b84407a85c1d194826b59b416634f772f5f5
X-Patchwork-Hint: ignore
Message-Id: <20250411104148.18BC8842A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add git
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2662b84407a85c1d194826b59b416634f772f5f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 24efb23a1074b920fe32763ae455a4694410eb6e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_git.py | 57 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc7b445064..7948ac48a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1773,6 +1773,7 @@ F:	support/testing/tests/package/test_fwts.py
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
