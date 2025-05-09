Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82201C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69FCB61741;
	Mon, 19 May 2025 10:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdrthPgFG3B4; Mon, 19 May 2025 10:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F240D70BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F240D70BB2;
	Mon, 19 May 2025 10:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DAEB193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80ED4145A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdJF4IuBFzUY for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C85940C40
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C85940C40
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88CAF82A2E; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 May 2025 19:01:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 02de34989560b40a963fa13dddfb4714470fec25
X-Git-Newrev: 7c65b4484e1ed414496488cf8eb4fe967b10c087
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.88CAF82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyproj: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c65b4484e1ed414496488cf8eb4fe967b10c087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Provides cartographic projections in Python
https://pyproj4.github.io/pyproj/stable/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
[Julien:
 - reword commit title
 - add test files in DEVELOPERS entries
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                           |  3 +++
 package/Config.in                                    |  1 +
 package/python-pyproj/Config.in                      |  9 +++++++++
 package/python-pyproj/python-pyproj.hash             |  5 +++++
 package/python-pyproj/python-pyproj.mk               | 20 ++++++++++++++++++++
 .../testing/tests/package/sample_python_pyproj.py    |  5 +++++
 support/testing/tests/package/test_python_pyproj.py  | 11 +++++++++++
 7 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 36bf42da32..7f01b46c70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,6 +729,9 @@ F:	package/python-aniso8601/
 F:	package/python-cachelib/
 F:	package/python-flask-caching/
 F:	package/python-flask-restx/
+F:	package/python-pyproj/
+F:	support/testing/tests/package/sample_python_pyproj.py
+F:	support/testing/tests/package/test_python_pyproj.py
 
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 9e4b0ea167..a9074ac405 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1332,6 +1332,7 @@ menu "External python modules"
 	source "package/python-pyphen/Config.in"
 	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
+	source "package/python-pyproj/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyqt5-sip/Config.in"
diff --git a/package/python-pyproj/Config.in b/package/python-pyproj/Config.in
new file mode 100644
index 0000000000..ee829d71c5
--- /dev/null
+++ b/package/python-pyproj/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYPROJ
+	bool "python-pyproj"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PROJ # runtime
+	help
+	  Python interface to PROJ (cartographic projections and
+	  coordinate transformations library).
+
+	  https://github.com/pyproj4/pyproj
diff --git a/package/python-pyproj/python-pyproj.hash b/package/python-pyproj/python-pyproj.hash
new file mode 100644
index 0000000000..6d9d4d2a20
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproj/json
+md5  ad62b11249d8e62879778190a3e3ef8c  pyproj-3.7.1.tar.gz
+sha256  60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47  pyproj-3.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  a652687151814d4c4715445912fcb49e7e58f5b248d47a1a88b859a8815e0822  LICENSE
diff --git a/package/python-pyproj/python-pyproj.mk b/package/python-pyproj/python-pyproj.mk
new file mode 100644
index 0000000000..e2e0fada5b
--- /dev/null
+++ b/package/python-pyproj/python-pyproj.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-pyproj
+#
+################################################################################
+
+PYTHON_PYPROJ_VERSION = 3.7.1
+PYTHON_PYPROJ_SOURCE = pyproj-$(PYTHON_PYPROJ_VERSION).tar.gz
+PYTHON_PYPROJ_SITE = https://files.pythonhosted.org/packages/67/10/a8480ea27ea4bbe896c168808854d00f2a9b49f95c0319ddcbba693c8a90
+PYTHON_PYPROJ_SETUP_TYPE = setuptools
+PYTHON_PYPROJ_LICENSE = MIT
+PYTHON_PYPROJ_LICENSE_FILES = LICENSE
+PYTHON_PYPROJ_DEPENDENCIES = host-python-cython proj
+PYTHON_PYPROJ_ENV = \
+	PROJ_DIR=$(HOST_DIR)/bin/ \
+	PROJ_INCDIR=$(HOST_DIR)/include/ \
+	PROJ_LIBDIR=$(TARGET_DIR)/usr/lib/ \
+	PROJ_VERSION=$(PROJ_VERSION)
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_pyproj.py b/support/testing/tests/package/sample_python_pyproj.py
new file mode 100644
index 0000000000..f814f8d2df
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyproj.py
@@ -0,0 +1,5 @@
+from pyproj import CRS
+
+# WGS 84 - World Geodetic System 1984, used in GPS
+crs_4326 = CRS.from_epsg(4326)
+assert crs_4326.name == "WGS 84"
diff --git a/support/testing/tests/package/test_python_pyproj.py b/support/testing/tests/package/test_python_pyproj.py
new file mode 100644
index 0000000000..2044d517c2
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyproj.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pyproj(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYPROJ=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyproj.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
