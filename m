Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E4C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D1E26FB76;
	Tue, 21 Feb 2023 01:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D1E26FB76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAzJFQwiMi4Q; Tue, 21 Feb 2023 01:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78FDE700C3;
	Tue, 21 Feb 2023 01:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78FDE700C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 375251BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB536FFE9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DB536FFE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nmvmUYJdjss7 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 441566FE5F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441566FE5F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 428C5828C8; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 13:41:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 433ce2966f787248d5b8a62c46634e2f86250f8e
X-Git-Newrev: 9aaef2a07780a200512ccadb2381c559c4ffd8e6
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.428C5828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-spake2: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aaef2a07780a200512ccadb2381c559c4ffd8e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SPAKE2 password-authenticated key exchange (in pure python).

This library implements the SPAKE2 password-authenticated key
exchange ("PAKE") algorithm. This allows two parties, who share a
weak password, to safely derive a strong shared secret (and
therefore build an encrypted+authenticated channel).

https://github.com/warner/python-spake2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-spake2/Config.in                    | 13 +++++++++++++
 package/python-spake2/python-spake2.hash           |  5 +++++
 package/python-spake2/python-spake2.mk             | 14 ++++++++++++++
 .../testing/tests/package/sample_python_spake2.py  | 22 ++++++++++++++++++++++
 .../testing/tests/package/test_python_spake2.py    | 11 +++++++++++
 7 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 69e73636be..a631c32405 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1695,6 +1695,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-pyalsa/
+F:	package/python-spake2/
 F:	package/rdma-core/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
@@ -1703,6 +1704,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
@@ -1713,6 +1715,7 @@ F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_z3.py
diff --git a/package/Config.in b/package/Config.in
index b28949500e..ec7a6483f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1290,6 +1290,7 @@ menu "External python modules"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
 	source "package/python-soupsieve/Config.in"
+	source "package/python-spake2/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
diff --git a/package/python-spake2/Config.in b/package/python-spake2/Config.in
new file mode 100644
index 0000000000..1c2e3a49af
--- /dev/null
+++ b/package/python-spake2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_SPAKE2
+	bool "python-spake2"
+	select BR2_PACKAGE_PYTHON_HKDF # runtime
+	help
+	  SPAKE2 password-authenticated key exchange (in pure python).
+
+	  This library implements the SPAKE2 password-authenticated
+	  key exchange ("PAKE") algorithm. This allows two parties,
+	  who share a weak password, to safely derive a strong shared
+	  secret (and therefore build an encrypted+authenticated
+	  channel).
+
+	  https://github.com/warner/python-spake2
diff --git a/package/python-spake2/python-spake2.hash b/package/python-spake2/python-spake2.hash
new file mode 100644
index 0000000000..30052b1b36
--- /dev/null
+++ b/package/python-spake2/python-spake2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/spake2/json
+md5  0155bad518bb49c39994fe0b7d9fb32c  spake2-0.8.tar.gz
+sha256  c17a614b29ee4126206e22181f70a406c618d3c6c62ca6d6779bce95e9c926f4  spake2-0.8.tar.gz
+# Locally computed sha256 checksums
+sha256  2a8a1200c3a2769d1815727f3b4439bd800f3bc88163118a36ff30b007d30031  LICENSE
diff --git a/package/python-spake2/python-spake2.mk b/package/python-spake2/python-spake2.mk
new file mode 100644
index 0000000000..99ce7dae13
--- /dev/null
+++ b/package/python-spake2/python-spake2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-spake2
+#
+################################################################################
+
+PYTHON_SPAKE2_VERSION = 0.8
+PYTHON_SPAKE2_SOURCE = spake2-$(PYTHON_SPAKE2_VERSION).tar.gz
+PYTHON_SPAKE2_SITE = https://files.pythonhosted.org/packages/60/0b/bb5eca8e18c38a10b1c207bbe6103df091e5cf7b3e5fdc0efbcad7b85b60
+PYTHON_SPAKE2_SETUP_TYPE = setuptools
+PYTHON_SPAKE2_LICENSE = MIT
+PYTHON_SPAKE2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_spake2.py b/support/testing/tests/package/sample_python_spake2.py
new file mode 100644
index 0000000000..49dd914ca8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_spake2.py
@@ -0,0 +1,22 @@
+from binascii import hexlify
+
+from spake2 import SPAKE2_A, SPAKE2_B
+
+
+shared_password = b"This Is The Password!"
+
+alice = SPAKE2_A(shared_password)
+alice_msg = alice.start()
+
+bob = SPAKE2_B(shared_password)
+bob_msg = bob.start()
+
+# Alice and Bob exchange their messages...
+
+alice_key = alice.finish(bob_msg)
+bob_key = bob.finish(alice_msg)
+
+print("alice_key:", hexlify(alice_key))
+print("  bob_key:", hexlify(bob_key))
+
+assert alice_key == bob_key
diff --git a/support/testing/tests/package/test_python_spake2.py b/support/testing/tests/package/test_python_spake2.py
new file mode 100644
index 0000000000..fb47a0802c
--- /dev/null
+++ b/support/testing/tests/package/test_python_spake2.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Spake2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SPAKE2=y
+        """
+    sample_scripts = ["tests/package/sample_python_spake2.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
