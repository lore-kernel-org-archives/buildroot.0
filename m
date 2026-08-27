Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC9FC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D814A60830;
	Thu, 27 Aug 2026 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7OvjXaVtovb; Thu, 27 Aug 2026 21:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864928;
	bh=cXgJeateAwZkjqABQFGws0eG54aPWzB/rsMPn3sAqpk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mSdtKhOQhB/8Hw4lxcxTIkajJrDePyqpUBlFu7XF8NNe0nA2J9+cGQOcgFXqYowio
	 V9NErJQ3ob233aJxjyTENGdfacd2PcqUiqmUrkK90T+dKfMS42XPYgApVQYfurexh2
	 +f/EzxYwyiUd3xDp4P2B1pUpQSleRoBaqxEPsTo+UAdF3yaRGS29bLZq6K9izc6EMf
	 iVsEWe18+97TC59ATwtWKT1DVcreu3y9zMnbdoYP7fKFwoLfJspR9k4vUMX/bUm2wo
	 x97wvNYGXxzGymYRnDzDj6ZA9rt8WILT7US6nVzjkdmMpcEIYzKQrcUO+aLISGqqJ8
	 5kGzsK3A4kfog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60898607E6;
	Thu, 27 Aug 2026 21:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B75FA386
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D47A80EEC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIPkuIXoQvV1 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00BD780EEB
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5218E920D9; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:49:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79554a4520f3d3c07c3ddf12e6c64669b5a9cc8a
X-Git-Newrev: bd4ac802e406d6544fb0726398f275a4949782c3
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.5218E920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fs: new cramfs runtime
 test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd4ac802e406d6544fb0726398f275a4949782c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 support/testing/tests/fs/test_cramfs.py            | 42 ++++++++++++++++++++++
 .../tests/fs/test_cramfs/linux-cramfs.fragment     |  1 +
 3 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..7b0ff1ff86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1856,6 +1856,8 @@ F:	support/testing/tests/boot/test_optee_os.py
 F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/fs/test_btrfs.py
 F:	support/testing/tests/fs/test_btrfs/
+F:	support/testing/tests/fs/test_cramfs.py
+F:	support/testing/tests/fs/test_cramfs/
 F:	support/testing/tests/fs/test_erofs.py
 F:	support/testing/tests/fs/test_erofs/
 F:	support/testing/tests/fs/test_xfs.py
diff --git a/support/testing/tests/fs/test_cramfs.py b/support/testing/tests/fs/test_cramfs.py
new file mode 100644
index 0000000000..8beb27f4ab
--- /dev/null
+++ b/support/testing/tests/fs/test_cramfs.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestCramfs(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/fs/test_cramfs/linux-cramfs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_CRAMFS=y
+        BR2_TARGET_ROOTFS_CRAMFS=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.cramfs")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check our root filesystem is in cramfs format.
+        cmd = "mount | grep '/dev/root on / type cramfs'"
+        self.assertRunOk(cmd)
+
+        # We run cramfsck on the filesystem.
+        self.assertRunOk("cramfsck -v /dev/vda")
diff --git a/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
new file mode 100644
index 0000000000..91bc54bed3
--- /dev/null
+++ b/support/testing/tests/fs/test_cramfs/linux-cramfs.fragment
@@ -0,0 +1 @@
+CONFIG_CRAMFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
