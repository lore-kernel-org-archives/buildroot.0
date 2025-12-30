Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C48BEE4998
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A304F407BE;
	Tue, 30 Dec 2025 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyfpyavR_EnT; Tue, 30 Dec 2025 19:57:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B536407FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767124648;
	bh=k2HF8etPfJIVEJh7kPiY/bQsyWYf4IxiW2YIEG+UykY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bRAtloW26HcxC9Rp7AsX8MEC4zGC4CFFyBKBjlvfGDfKXqxm2L7UKWv0Gk6oFK7RL
	 IYGoTizd9nAIM07jwijO9vfeFUejFd22RHOaCetOVQBzA3Z+I9mgcPnUQ5XhVWYn5n
	 8g3GnpTi+sR3uyPbBAGG0mNoLKpUZa3wYcB2ToLQifbtM4PPzo3cSx2/jwaROL30Jk
	 fIj9eXnVw2RZ+W7RTXXxhRLWvFDQfy5YY/sNr5YqXgdMg79tk1hVEZCFKZTXTnw+zd
	 UsyKvOFXjWG7Wg8sCY/NwKxPJcN70AwOuqAqWcnUSgc1cDQhoeyl2ysJMEbGFPtpHk
	 gXyVcTxzQgBWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B536407FD;
	Tue, 30 Dec 2025 19:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 137C5D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0491460AFB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8jOA6CHIIz1 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 19:57:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD7C60861
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD7C60861
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 19:57:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C02287C84; Tue, 30 Dec 2025 19:57:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 20:56:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b8892e900aadbdac61d530739b11af407462540
X-Git-Newrev: 8f1b4a0cf484bb5817572deefb9280418540e771
X-Patchwork-Hint: ignore
Message-Id: <20251230195726.2C02287C84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add rasdaemon test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f1b4a0cf484bb5817572deefb9280418540e771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rasdaemon was added in previous patch.

Add a test_rasdaemon that allows to test it.
Test is done on x86. It first checks the daemon's version, then mounts
debugfs and finally ensures that the init script allows to
start/restart/stop the daemon.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/test_rasdaemon.py    | 47 ++++++++++++++++++++++
 .../package/test_rasdaemon/linux-debugfs.fragment  |  8 ++++
 3 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e8706d159..d88c7899e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -346,6 +346,7 @@ F:	package/uhubctl/
 
 N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
 F:	package/rasdaemon/
+F:	support/testing/tests/package/test_rasdaemon.py
 
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
new file mode 100644
index 0000000000..ec29f1785b
--- /dev/null
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestRasdaemon(infra.basetest.BRTest):
+    config = f"""
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_LINUX_KERNEL=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.59"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_rasdaemon/linux-debugfs.fragment")}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_RASDAEMON=y
+        BR2_PACKAGE_RASDAEMON_AER=y
+        BR2_PACKAGE_LIBTRACEEVENT=y
+        BR2_PACKAGE_SQLITE=y
+        BR2_PACKAGE_PCIUTILS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+                arch="x86_64",
+                kernel=kernel,
+                kernel_cmdline=["console=ttyS0"],
+                options=["-cpu", "Nehalem",  "-initrd", cpio_file],
+        )
+        self.emulator.login()
+
+        self.assertRunOk("/usr/sbin/rasdaemon --version")
+        self.assertRunOk("mount -t debugfs nodev /sys/kernel/debug")
+        self.assertRunOk("/etc/init.d/S95rasdaemon start")
+        self.assertRunOk("pidof /usr/sbin/rasdaemon")
+        self.assertRunOk("/etc/init.d/S95rasdaemon restart")
+        self.assertRunOk("pidof /usr/sbin/rasdaemon")
+        self.assertRunOk("/etc/init.d/S95rasdaemon stop")
+        _, ret = self.emulator.run("pidof /usr/sbin/rasdaemon")
+        self.assertNotEqual(ret, 0)
diff --git a/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment b/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment
new file mode 100644
index 0000000000..a334bc3731
--- /dev/null
+++ b/support/testing/tests/package/test_rasdaemon/linux-debugfs.fragment
@@ -0,0 +1,8 @@
+CONFIG_DEBUG_FS=y
+CONFIG_FTRACE=y
+CONFIG_USER_EVENTS=y
+CONFIG_TRACE_EVENT_INJECT=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_MEMORY_FAILURE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
