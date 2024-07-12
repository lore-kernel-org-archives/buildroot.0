Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E6CC3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7B3541A53;
	Fri, 12 Jul 2024 14:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mg7f-PvCkxw; Fri, 12 Jul 2024 14:39:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CDA141A1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDA141A1C;
	Fri, 12 Jul 2024 14:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACB501BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7ADD6132A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 828M_kNNTaI1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0B8961327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B8961327
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCFB085FCD; Fri, 12 Jul 2024 14:39:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:38:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c06715849224e8fa140d685e146cc614f895606
X-Git-Newrev: 3ba6f800fdc2435d09aca215ef2e8aefb3165bff
X-Patchwork-Hint: ignore
Message-Id: <20240712143952.BCFB085FCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add mosquitto runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ba6f800fdc2435d09aca215ef2e8aefb3165bff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_mosquitto.py | 38 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7d2129d45..aeae27eb46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1871,6 +1871,7 @@ F:	support/testing/tests/package/test_mdadm.py
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
