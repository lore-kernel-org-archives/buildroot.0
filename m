Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203ABC36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9977581396;
	Tue, 25 Mar 2025 18:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRuHXFfXQcva; Tue, 25 Mar 2025 18:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25798133A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25798133A;
	Tue, 25 Mar 2025 18:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 375A3C0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 298E24026A
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9r5CFK7ARHYW for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675584028F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 675584028F
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:50:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD5C82D9E; Tue, 25 Mar 2025 18:50:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 19:34:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6abdf5591f6c20dad9e7464e8b8b0eddc19c5964
X-Git-Newrev: 24efb23a1074b920fe32763ae455a4694410eb6e
X-Patchwork-Hint: ignore
Message-Id: <20250325185037.4FD5C82D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add git runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=24efb23a1074b920fe32763ae455a4694410eb6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_git.py | 57 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c080608bcf..44f7684c97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1900,6 +1900,7 @@ F:	support/testing/tests/package/test_fwts.py
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
