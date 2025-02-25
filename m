Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BC9C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 13:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32AB60F72;
	Tue, 25 Feb 2025 13:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlZYlB7BFgXP; Tue, 25 Feb 2025 13:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1F560F6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1F560F6C;
	Tue, 25 Feb 2025 13:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ADE72DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FF4860F6C
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsMiwuzvoXcp for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 13:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB63E60812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB63E60812
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB63E60812
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 13:46:29 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D28E32C80169;
 Tue, 25 Feb 2025 14:46:26 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 25 Feb 2025 14:46:25 +0100
Message-ID: <20250225134626.1483376-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1740491187; bh=jnuztrPc08HOd+Mr9Cm1tUflQaAGlUOvXx0+lgSA55k=;
 h=From:To:Cc:Subject:Date;
 b=MxQ/F7HyuI1Z6I3ZN90jF4PpLT0acdfIk6nl0JcqqBkCHMEs0u6HlvdEgduKzfAc2
 D8zu/oOLoHzZctW/0LxrbR5CzrTN0iq845+BF8xEMYbduNTVcSAZm84USrLY80HNpw
 MxkHUMWuzbEjLSbmlhAuzrgND61PvALqGWSiVEjPjyldoTqAe7a7F1B+rxqluk133w
 nI9h958yCib9FA4EwVmaNDYQbvFr8rxDou8H+yxzO8DB8cyzYsSddEaUr0lmot5CYK
 qMI9c+5Hrzk7EjDzMIBHVqU2LYSbKeJJXRpRkH7fAYw10fhfOmBSRTDmlcdHLf3jVp
 862XUr/m/3uaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=MxQ/F7Hy
Subject: [Buildroot] [PATCH] package/python-tzlocal: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/python-tzlocal/Config.in                   |  5 +++++
 package/python-tzlocal/python-tzlocal.hash         |  5 +++++
 package/python-tzlocal/python-tzlocal.mk           | 14 ++++++++++++++
 .../testing/tests/package/sample_python_tzlocal.py |  5 +++++
 .../testing/tests/package/test_python_tzlocal.py   | 14 ++++++++++++++
 7 files changed, 46 insertions(+)
 create mode 100644 package/python-tzlocal/Config.in
 create mode 100644 package/python-tzlocal/python-tzlocal.hash
 create mode 100644 package/python-tzlocal/python-tzlocal.mk
 create mode 100644 support/testing/tests/package/sample_python_tzlocal.py
 create mode 100644 support/testing/tests/package/test_python_tzlocal.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 61b531f424..b9b59d92e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2260,9 +2260,11 @@ F:	package/picotool/
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
index bd3a00abc3..d42aeb548c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1450,6 +1450,7 @@ menu "External python modules"
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
