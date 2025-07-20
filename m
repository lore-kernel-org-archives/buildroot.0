Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2480C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 11:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC117614CB;
	Sun, 20 Jul 2025 11:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXci6lippoe4; Sun, 20 Jul 2025 11:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1C9614AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1C9614AF;
	Sun, 20 Jul 2025 11:41:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7641B22F
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68A4F40985
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7WWH5i6ImI5 for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8447409B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8447409B4
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 972CC81600; Sun, 20 Jul 2025 11:41:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:32:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0f094b067eb679503ee3b87b22ab42c0423ab8d
X-Git-Newrev: 205dfb943a3eb40df191d854b8f86bd78e348aa6
X-Patchwork-Hint: ignore
Message-Id: <20250720114114.972CC81600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crc: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=205dfb943a3eb40df191d854b8f86bd78e348aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 support/testing/tests/package/sample_python_crc.py |  7 +++++++
 support/testing/tests/package/test_python_crc.py   | 11 +++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59c6635025..186fd7331c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2301,6 +2301,7 @@ F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
 F:	package/python-waitress/
+F:	support/testing/tests/package/test_python_crc.py
 F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
@@ -2309,6 +2310,7 @@ F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/sample_python_crc.py
 F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
diff --git a/support/testing/tests/package/sample_python_crc.py b/support/testing/tests/package/sample_python_crc.py
new file mode 100644
index 0000000000..0090df11f2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_crc.py
@@ -0,0 +1,7 @@
+from crc import Calculator, Crc8
+
+expected = 0xBC
+data = bytes([0, 1, 2, 3, 4, 5])
+calculator = Calculator(Crc8.CCITT)
+
+assert expected == calculator.checksum(data)
diff --git a/support/testing/tests/package/test_python_crc.py b/support/testing/tests/package/test_python_crc.py
new file mode 100644
index 0000000000..0b36580a44
--- /dev/null
+++ b/support/testing/tests/package/test_python_crc.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Crc(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRC=y
+        """
+    sample_scripts = ["tests/package/sample_python_crc.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
