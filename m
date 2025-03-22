Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CE7C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 15:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FBB81ED6;
	Sat, 22 Mar 2025 15:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acCaGO_tMCcI; Sat, 22 Mar 2025 15:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6B681EE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6B681EE3;
	Sat, 22 Mar 2025 15:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B63C11A0
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 950406085F
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEmJGfz4xEsi for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 15:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0A7D60847
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0A7D60847
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 15:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D5BB88278; Sat, 22 Mar 2025 15:35:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 16:25:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf4f2f858d13aa8be1fc3d3215df66e64e7b57e6
X-Git-Newrev: 6ca1ee306a3dc46430e80b7c2eb9689bdc1fbf1b
X-Patchwork-Hint: ignore
Message-Id: <20250322153556.8D5BB88278@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tzlocal: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ca1ee306a3dc46430e80b7c2eb9689bdc1fbf1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                             |  2 ++
 package/Config.in                                      |  1 +
 package/python-tzlocal/Config.in                       |  5 +++++
 package/python-tzlocal/python-tzlocal.hash             |  5 +++++
 package/python-tzlocal/python-tzlocal.mk               | 14 ++++++++++++++
 support/testing/tests/package/sample_python_tzlocal.py |  5 +++++
 support/testing/tests/package/test_python_tzlocal.py   | 14 ++++++++++++++
 7 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a0e0183257..c080608bcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2268,9 +2268,11 @@ F:	package/picotool/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
+F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
+F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
diff --git a/package/Config.in b/package/Config.in
index 60b375e674..d8751fc19f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1453,6 +1453,7 @@ menu "External python modules"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
+	source "package/python-tzlocal/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-uhid/Config.in"
diff --git a/package/python-tzlocal/Config.in b/package/python-tzlocal/Config.in
new file mode 100644
index 0000000000..6a2959325e
--- /dev/null
+++ b/package/python-tzlocal/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PYTHON_TZLOCAL
+	bool "python-tzlocal"
+	help
+	  A Python module that tries to figure out what your
+	  local timezone is.
diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
new file mode 100644
index 0000000000..dce19103a5
--- /dev/null
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tzlocal/json
+md5  9d8d4c12b047d5d45e6eb72bb95fd90e  tzlocal-5.3.tar.gz
+sha256  2fafbfc07e9d8b49ade18f898d6bcd37ae88ce3ad6486842a2e4f03af68323d2  tzlocal-5.3.tar.gz
+# Locally computed sha256 checksums
+sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
new file mode 100644
index 0000000000..c616974f64
--- /dev/null
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tzlocal
+#
+################################################################################
+
+PYTHON_TZLOCAL_VERSION = 5.3
+PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/33/cc/11360404b20a6340b9b4ed39a3338c4af47bc63f87f6cea94dbcbde07029
+PYTHON_TZLOCAL_SETUP_TYPE = setuptools
+PYTHON_TZLOCAL_LICENSE = MIT
+PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_tzlocal.py b/support/testing/tests/package/sample_python_tzlocal.py
new file mode 100644
index 0000000000..9aeb431c64
--- /dev/null
+++ b/support/testing/tests/package/sample_python_tzlocal.py
@@ -0,0 +1,5 @@
+from tzlocal import get_localzone
+from zoneinfo import ZoneInfo
+
+tz = get_localzone()
+assert tz == ZoneInfo(key='posix/Europe/Berlin')
diff --git a/support/testing/tests/package/test_python_tzlocal.py b/support/testing/tests/package/test_python_tzlocal.py
new file mode 100644
index 0000000000..d7dac361bf
--- /dev/null
+++ b/support/testing/tests/package/test_python_tzlocal.py
@@ -0,0 +1,14 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3TZLocal(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_TARGET_TZ_INFO=y
+        BR2_TARGET_LOCALTIME="Europe/Berlin"
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TZLOCAL=y
+        """
+    sample_scripts = ["tests/package/sample_python_tzlocal.py"]
+    timeout = 10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
