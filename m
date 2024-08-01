Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFFCC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 11:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4922660F3F;
	Thu,  1 Aug 2024 11:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QaHD2YoXoPV; Thu,  1 Aug 2024 11:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA2E60A61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA2E60A61;
	Thu,  1 Aug 2024 11:04:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2339E1BF403
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 11:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F80881E17
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 11:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RorSkMpHBDkR for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 11:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4093F81E13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4093F81E13
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 11:04:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BE1A83732; Thu,  1 Aug 2024 11:04:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 12:58:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: eb2004ef03a99a2f568475b8f8d58a6730a19cad
X-Git-Newrev: fd6e1c41b9f7bdda2f5c4f2aa73aa9a4406f586c
X-Patchwork-Hint: ignore
Message-Id: <20240801110400.2BE1A83732@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 mosquitto runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd6e1c41b9f7bdda2f5c4f2aa73aa9a4406f586c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ba6f800fdc2435d09aca215ef2e8aefb3165bff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_mosquitto.py | 38 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fcbaa5c31d..1c466967f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1828,6 +1828,7 @@ F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
 F:	support/testing/tests/package/test_micropython/
+F:	support/testing/tests/package/test_mosquitto.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_mtr.py
 F:	support/testing/tests/package/test_ncdu.py
diff --git a/support/testing/tests/package/test_mosquitto.py b/support/testing/tests/package/test_mosquitto.py
new file mode 100644
index 0000000000..ba10b30b00
--- /dev/null
+++ b/support/testing/tests/package/test_mosquitto.py
@@ -0,0 +1,38 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestMosquitto(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MOSQUITTO=y
+        BR2_PACKAGE_MOSQUITTO_BROKER=y
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
+        topic = "br-test-topic"
+        log = "mqtt.log"
+        msg = "Hello Buildroot!"
+
+        # We subscribe to a topic and write one message to a log file.
+        self.assertRunOk(f"mosquitto_sub -t {topic} -C 1 > {log} &")
+
+        time.sleep(1)
+
+        # We publish a message.
+        self.assertRunOk(f"mosquitto_pub -t {topic} -m '{msg}'")
+
+        # We check the log file contains our message.
+        out, ret = self.emulator.run(f"cat {log}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
