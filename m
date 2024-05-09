Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC6C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C9E60688;
	Thu,  9 May 2024 20:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYtm_45i3o_E; Thu,  9 May 2024 20:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD38606DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD38606DC;
	Thu,  9 May 2024 20:32:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C16851BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA04983FB3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elxn3Z0fy1Tk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE3883F90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE3883F90
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:32:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A471886DCB; Thu,  9 May 2024 20:32:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:31:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1c4d6c884c8aa871cc27166f33feecd1002b3e8
X-Git-Newrev: b9c09bd3c4cb8b6e2e104f3ca2de3c82ce1147fa
X-Patchwork-Hint: ignore
Message-Id: <20240509203200.A471886DCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpmath: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9c09bd3c4cb8b6e2e104f3ca2de3c82ce1147fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpmath is a free (BSD licensed) Python library for real and
complex floating-point arithmetic with arbitrary precision.

https://mpmath.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  2 ++
 package/Config.in                                     |  1 +
 package/python-mpmath/Config.in                       |  7 +++++++
 package/python-mpmath/python-mpmath.hash              |  3 +++
 package/python-mpmath/python-mpmath.mk                | 14 ++++++++++++++
 support/testing/tests/package/sample_python_mpmath.py | 16 ++++++++++++++++
 support/testing/tests/package/test_python_mpmath.py   | 12 ++++++++++++
 7 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f020231bb..4af539e3f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1781,6 +1781,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
+F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acl.py
@@ -1874,6 +1875,7 @@ F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
 F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_ml_dtypes.py
+F:	support/testing/tests/package/test_python_mpmath.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index deb5d5e10f..e72055f220 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ menu "External python modules"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
 	source "package/python-mpd2/Config.in"
+	source "package/python-mpmath/Config.in"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
diff --git a/package/python-mpmath/Config.in b/package/python-mpmath/Config.in
new file mode 100644
index 0000000000..497b7d2ae3
--- /dev/null
+++ b/package/python-mpmath/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MPMATH
+	bool "python-mpmath"
+	help
+	  mpmath is a free (BSD licensed) Python library for real and
+	  complex floating-point arithmetic with arbitrary precision.
+
+	  https://mpmath.org/
diff --git a/package/python-mpmath/python-mpmath.hash b/package/python-mpmath/python-mpmath.hash
new file mode 100644
index 0000000000..1b263c925f
--- /dev/null
+++ b/package/python-mpmath/python-mpmath.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  7a28eb2a9774d00c7bc92411c19a89209d5da7c4c9a9e227be8330a23a25b91f  mpmath-1.3.0.tar.gz
+sha256  c26cae81da4508e5e249985777a33821f183223ebb74d7f8cfbf90fe7eef2fb7  LICENSE
diff --git a/package/python-mpmath/python-mpmath.mk b/package/python-mpmath/python-mpmath.mk
new file mode 100644
index 0000000000..caa6492961
--- /dev/null
+++ b/package/python-mpmath/python-mpmath.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-mpmath
+#
+################################################################################
+
+PYTHON_MPMATH_VERSION = 1.3.0
+PYTHON_MPMATH_SOURCE = mpmath-$(PYTHON_MPMATH_VERSION).tar.gz
+PYTHON_MPMATH_SITE = https://mpmath.org/files
+PYTHON_MPMATH_SETUP_TYPE = setuptools
+PYTHON_MPMATH_LICENSE = BSD-3-Clause
+PYTHON_MPMATH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_mpmath.py b/support/testing/tests/package/sample_python_mpmath.py
new file mode 100644
index 0000000000..5e3d9ad1c2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mpmath.py
@@ -0,0 +1,16 @@
+#! /usr/bin/env python3
+
+# Test inspired from example published on the project page:
+# https://mpmath.org/
+
+from mpmath import mp
+
+mp.dps = 50
+
+result = mp.quad(lambda x: mp.exp(-x**2), [-mp.inf, mp.inf]) ** 2
+
+# Pi digits can be cross-checked here:
+# https://www.angio.net/pi/digits.html
+expected_result = "3.1415926535897932384626433832795028841971693993751"
+
+assert str(result) == expected_result
diff --git a/support/testing/tests/package/test_python_mpmath.py b/support/testing/tests/package/test_python_mpmath.py
new file mode 100644
index 0000000000..c20c910fbe
--- /dev/null
+++ b/support/testing/tests/package/test_python_mpmath.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MpMath(TestPythonPackageBase):
+    __test__ = True
+
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MPMATH=y
+        """
+    sample_scripts = ["tests/package/sample_python_mpmath.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
