Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2DFC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D960C40B28;
	Mon, 16 Sep 2024 11:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olrkTGqx3d3z; Mon, 16 Sep 2024 11:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E283140B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E283140B38;
	Mon, 16 Sep 2024 11:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 554851BF95A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51AB480E9E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NG7hJ6WvQEr for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5C980E3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5C980E3F
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55ED48386D; Mon, 16 Sep 2024 11:30:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:19:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb0b46508790dbad7439add0698f317c6d17f1d6
X-Git-Newrev: 4c74afbcaabbe4ecd59d1af556c11f1352a6ac4a
X-Patchwork-Hint: ignore
Message-Id: <20240916113022.55ED48386D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-sdbus
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
Content-Type: multipart/mixed; boundary="===============6603310063288408253=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6603310063288408253==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c74afbcaabbe4ecd59d1af556c11f1352a6ac4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_sdbus.py | 13 +++++++++++++
 support/testing/tests/package/test_python_sdbus.py   | 12 ++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 58d365ce8e..4b0bde095f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2764,10 +2764,12 @@ F:	support/testing/tests/package/sample_python_jmespath.py
 F:	support/testing/tests/package/sample_python_pymupdf.py
 F:	support/testing/tests/package/sample_python_rsa.py
 F:	support/testing/tests/package/sample_python_s3transfer.py
+F:	support/testing/tests/package/sample_python_sdbus.py
 F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_pymupdf.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
+F:	support/testing/tests/package/test_python_sdbus.py
 
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/nvidia-persistenced/
diff --git a/support/testing/tests/package/sample_python_sdbus.py b/support/testing/tests/package/sample_python_sdbus.py
new file mode 100644
index 0000000000..68131cede5
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sdbus.py
@@ -0,0 +1,13 @@
+#!/usr/bin/env python3
+
+import sdbus
+from sdbus_block.dbus_daemon import FreedesktopDbus
+
+s = FreedesktopDbus(sdbus.sd_bus_open_system())
+
+props = s.properties_get_all_dict()
+
+print(props)
+
+# Check for a randomly chosen interface:
+assert 'org.freedesktop.DBus.Monitoring' in props['interfaces']
diff --git a/support/testing/tests/package/test_python_sdbus.py b/support/testing/tests/package/test_python_sdbus.py
new file mode 100644
index 0000000000..7163bbeed1
--- /dev/null
+++ b/support/testing/tests/package/test_python_sdbus.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Sdbus(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_PYTHON_SDBUS=y
+        """
+    sample_scripts = ["tests/package/sample_python_sdbus.py"]

--===============6603310063288408253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6603310063288408253==--
