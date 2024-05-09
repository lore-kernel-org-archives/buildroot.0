Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E8460EC6;
	Thu,  9 May 2024 20:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeNJaPW6XVES; Thu,  9 May 2024 20:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77237612A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77237612A7;
	Thu,  9 May 2024 20:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9C951BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3602612A7
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dldx3OF3PKQw for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EC6460EC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC6460EC6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AB1A86D76; Thu,  9 May 2024 20:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:17:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4432b0879022a611a0e23374a287191001ba4a7c
X-Git-Newrev: f6542cf10b80a0e44d1301ab7ef9a78c6f24e1d0
X-Patchwork-Hint: ignore
Message-Id: <20240509201804.0AB1A86D76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-hid test
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6542cf10b80a0e44d1301ab7ef9a78c6f24e1d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/sample_python_hid.py |  3 +++
 support/testing/tests/package/test_python_hid.py   | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ebeae1af1..0f020231bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2520,6 +2520,7 @@ F:	package/triggerhappy/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
+F:	support/testing/tests/package/test_python_hid.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
diff --git a/support/testing/tests/package/sample_python_hid.py b/support/testing/tests/package/sample_python_hid.py
new file mode 100644
index 0000000000..a581d7b7cb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_hid.py
@@ -0,0 +1,3 @@
+import hid
+
+hid.enumerate()
diff --git a/support/testing/tests/package/test_python_hid.py b/support/testing/tests/package/test_python_hid.py
new file mode 100644
index 0000000000..b7a280b766
--- /dev/null
+++ b/support/testing/tests/package/test_python_hid.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonHid(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_HID=y
+        BR2_PACKAGE_HIDAPI=y
+        """
+    sample_scripts = ["tests/package/sample_python_hid.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
