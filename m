Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF4C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B704A4FB2E;
	Fri, 28 Feb 2025 17:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPT3IMjeCM1R; Fri, 28 Feb 2025 17:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B85FD4F656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B85FD4F656;
	Fri, 28 Feb 2025 17:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0F268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82C4242CF5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voAdqhUPQxWH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E99A42503
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E99A42503
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A68385FAE; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 03df6d1a261613366deaa8ebb335d4fbcb73bad4
X-Git-Newrev: 3ea79058c077961c8f3b7c8c25f4545400622313
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.1A68385FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing/tests: new
 NetworkManager/GOI test
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
Content-Type: multipart/mixed; boundary="===============2520040462375455209=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2520040462375455209==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3ea79058c077961c8f3b7c8c25f4545400622313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This test is inspired from the details provided by Fiona Klute's cover
letter for a GOI/glib bump series at:

  https://lore.kernel.org/buildroot/20250120211707.2381182-1-fiona.klute@gmx.de/

Which itself uses the example code at:

  https://networkmanager.dev/docs/developers/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../package/sample_python_networkmanager_goi.py    | 26 ++++++++++++++++++++++
 .../package/test_python_networkmanager_goi.py      | 24 ++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2da5d178b2..af605b388e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1103,6 +1103,8 @@ F:	package/python-dunamai/
 F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
+F:	support/testing/tests/package/sample_python_networkmanager_goi.py
+F:	support/testing/tests/package/test_python_networkmanager_goi.py
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
diff --git a/support/testing/tests/package/sample_python_networkmanager_goi.py b/support/testing/tests/package/sample_python_networkmanager_goi.py
new file mode 100644
index 0000000000..240e8437fd
--- /dev/null
+++ b/support/testing/tests/package/sample_python_networkmanager_goi.py
@@ -0,0 +1,26 @@
+#!/usr/bin/env python3
+
+# This script is from https://networkmanager.dev/docs/developers/
+
+import gi
+gi.require_version("NM", "1.0")
+from gi.repository import NM  # noqa: E402
+
+
+def print_values(setting, key, value, flags, data):
+    print("     {}.{}: {}".format(setting.get_name(), key, value))
+
+
+# Create the client object. This automatically loads all the D-Bus
+# tree and creates in-memory objects for connections, devices, access
+# points, etc.
+client = NM.Client.new(None)
+
+# Obtain a list of connection profiles ...
+connections = client.get_connections()
+
+# ... and print their properties
+for c in connections:
+    print("{}:".format(c.get_id()))
+    c.for_each_setting_value(print_values, None)
+    print("\n")
diff --git a/support/testing/tests/package/test_python_networkmanager_goi.py b/support/testing/tests/package/test_python_networkmanager_goi.py
new file mode 100644
index 0000000000..e755569fc1
--- /dev/null
+++ b/support/testing/tests/package/test_python_networkmanager_goi.py
@@ -0,0 +1,24 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3NetworkmanagerGoi(TestPythonPackageBase):
+    __test__ = True
+    # Can't use TestPythonPackageBase.config because we need headers
+    # >= 4.20 for network-manager, so we have to use the bleeding-edge
+    # toolchain.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GOBJECT=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_NETWORK_MANAGER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_networkmanager_goi.py"]
+
+    timeout = 30

--===============2520040462375455209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2520040462375455209==--
