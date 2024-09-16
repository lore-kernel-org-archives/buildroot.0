Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079CBC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C59440B31;
	Mon, 16 Sep 2024 11:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-nM74tZ-wkH; Mon, 16 Sep 2024 11:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF9B840B2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF9B840B2A;
	Mon, 16 Sep 2024 11:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 503D71BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BABF60A8C
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wraMhZIj0Ie2 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8540760610
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8540760610
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71ACC838E1; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:28:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00514d75e0d14e57e5ae30a64cae52887a0f97e6
X-Git-Newrev: 2223d81bd8f80e814c97623b9d5a2e851367244f
X-Patchwork-Hint: ignore
Message-Id: <20240916113022.71ACC838E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-sdbus-networkmanager
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
Content-Type: multipart/mixed; boundary="===============3764518059284814417=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3764518059284814417==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2223d81bd8f80e814c97623b9d5a2e851367244f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                           |  2 ++
 .../package/sample_python_sdbus_networkmanager.py    | 20 ++++++++++++++++++++
 .../package/test_python_sdbus_networkmanager.py      | 15 +++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 57e59f907b..ea4ee3377f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2766,11 +2766,13 @@ F:	support/testing/tests/package/sample_python_pymupdf.py
 F:	support/testing/tests/package/sample_python_rsa.py
 F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/sample_python_sdbus.py
+F:	support/testing/tests/package/sample_python_sdbus_networkmanager.py
 F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_pymupdf.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 F:	support/testing/tests/package/test_python_sdbus.py
+F:	support/testing/tests/package/test_python_sdbus_networkmanager.py
 
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/nvidia-persistenced/
diff --git a/support/testing/tests/package/sample_python_sdbus_networkmanager.py b/support/testing/tests/package/sample_python_sdbus_networkmanager.py
new file mode 100644
index 0000000000..e15b63ce70
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus_networkmanager.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python3
+
+import sdbus
+
+from sdbus_block.networkmanager import (
+    DeviceType,
+    NetworkManager,
+    NetworkDeviceGeneric
+)
+
+sdbus.set_default_bus(sdbus.sd_bus_open_system())
+
+nm = NetworkManager()
+devices = [NetworkDeviceGeneric(d) for d in nm.get_devices()]
+
+print([d.interface for d in devices])
+
+assert devices
+# Check that we found at least the loopback interface:
+assert [dev for dev in devices if dev.device_type == DeviceType.LOOPBACK]
diff --git a/support/testing/tests/package/test_python_sdbus_networkmanager.py b/support/testing/tests/package/test_python_sdbus_networkmanager.py
new file mode 100644
index 0000000000..a3961ec54f
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus_networkmanager.py
@@ -0,0 +1,15 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_NETWORK_MANAGER=y
+        BR2_PACKAGE_PYTHON_SDBUS_NETWORKMANAGER=y
+        """
+    sample_scripts = ["tests/package/sample_python_sdbus_networkmanager.py"]
+
+    timeout = 30

--===============3764518059284814417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3764518059284814417==--
