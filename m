Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F74C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2119660A7E;
	Mon, 25 Mar 2024 23:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zfdk4ZOv7bU0; Mon, 25 Mar 2024 23:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43AFA60A69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43AFA60A69;
	Mon, 25 Mar 2024 23:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCF7F1BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08BE34044F
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWshT1LB9IWl for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0158740C1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0158740C1F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F217184117; Mon, 25 Mar 2024 23:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 00:05:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c51e0f4aec80ea71d812ff9956dc8214e7efdb7e
X-Git-Newrev: a92e7c3cec351ed2d79192c08abb341130b34c81
X-Patchwork-Hint: ignore
Message-Id: <20240325234447.F217184117@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_flutter.py: use flutter-markdown-example
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

commit: https://git.buildroot.net/buildroot/commit/?id=a92e7c3cec351ed2d79192c08abb341130b34c81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The maintainers of the flutter-gallery package archived the project as of
February 16, 2024. In addition, the flutter-gallery package is incompatible
with Flutter 3.19.x. Because of these problems, using the flutter-gallery
package as the testing application for Flutter is no longer reasonable nor
maintainable.

However, it is reasonable to use the flutter-markdown-example package from
flutter-packages, as it is a first-party application updated regularly and
often automatically, ensuring compatibility with the latest versions of
Flutter.

  - Switch the package used for Flutter testing from flutter-gallery to
    flutter-markdown-example

  - Rename flutter-gallery.service to flutter-markdown-example.service

  - Change /usr/share/flutter/gallery/release/ to
    /usr/share/flutter/flutter_markdown_example/release/

  - Run `systemctl is-active flutter-markdown-example` instead of
   `systemctl is-active flutter-gallery`

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_flutter.py                 |  5 +++--
 .../system/multi-user.target.wants/flutter-gallery.service    |  1 -
 .../multi-user.target.wants/flutter-markdown-example.service  |  1 +
 .../overlay/usr/lib/systemd/system/flutter-gallery.service    | 11 -----------
 .../usr/lib/systemd/system/flutter-markdown-example.service   | 11 +++++++++++
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
index a3e98a43e5..3a150a69e1 100644
--- a/support/testing/tests/package/test_flutter.py
+++ b/support/testing/tests/package/test_flutter.py
@@ -25,7 +25,8 @@ class TestFlutter(infra.basetest.BRTest):
         BR2_PACKAGE_FLUTTER_PI=y
         BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
         BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
-        BR2_PACKAGE_FLUTTER_GALLERY=y
+        BR2_PACKAGE_FLUTTER_PACKAGES=y
+        BR2_PACKAGE_FLUTTER_MARKDOWN_EXAMPLE=y
         BR2_PACKAGE_FLUTTER_ENGINE=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
@@ -48,7 +49,7 @@ class TestFlutter(infra.basetest.BRTest):
                      "-vnc", "none",
                      "-drive", f"file={img},if=virtio,format=raw"])
         self.emulator.login()
-        cmd = "systemctl is-active flutter-gallery"
+        cmd = "systemctl is-active flutter-markdown-example"
         output, exit_code = self.emulator.run(cmd, 10)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], "active")
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
deleted file mode 120000
index 40993fb16c..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
+++ /dev/null
@@ -1 +0,0 @@
-../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
new file mode 120000
index 0000000000..83e731ba2d
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-markdown-example.service
@@ -0,0 +1 @@
+../../../../usr/lib/systemd/system/flutter-markdown-example.service
\ No newline at end of file
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
deleted file mode 100644
index 88a2bcbf0b..0000000000
--- a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=flutter-gallery daemon
-After=dbus.service systemd-udevd.service
-
-[Service]
-ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
-Restart=always
-KillMode=process
-
-[Install]
-WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
new file mode 100644
index 0000000000..2a64b88c2d
--- /dev/null
+++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-markdown-example.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=flutter-markdown-example daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/flutter_markdown_example/release/
+Restart=always
+KillMode=process
+
+[Install]
+WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
