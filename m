Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA4DCCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1EBD843AA;
	Thu, 30 Oct 2025 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiOGWRfkfJhf; Thu, 30 Oct 2025 21:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19CA843AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19CA843AC;
	Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A03CD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87FFE40E0E
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iqk74Q5_-fj8 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB982401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB982401C2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7EBD82AEC; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9468f1c099221461abaf5ab152788e692119b8dd
X-Git-Newrev: d03cfe515bf3ef9519bbf03dfb9a58a3e843f27c
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.A7EBD82AEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crccheck: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d03cfe515bf3ef9519bbf03dfb9a58a3e843f27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new host only package for the crccheck Python
module, which is a dependency of Snagboot.

Homepage on PyPi: https://pypi.org/project/crccheck/

This commit also adds a very basic test case that allows to verify
that the Python module can be imported and that some minimal
functionality works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                            |  2 ++
 package/python-crccheck/python-crccheck.hash          |  4 ++++
 package/python-crccheck/python-crccheck.mk            | 15 +++++++++++++++
 support/testing/tests/package/test_python_crccheck.py | 10 ++++++++++
 4 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 337b2c7ba3..29aa132a78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3255,6 +3255,7 @@ F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
 F:	package/python3/
 F:	package/python-augeas/
+F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-qrcode/
@@ -3284,6 +3285,7 @@ F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_nodejs.py
 F:	support/testing/tests/package/test_python_augeas.py
+F:	support/testing/tests/package/test_python_crccheck.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
diff --git a/package/python-crccheck/python-crccheck.hash b/package/python-crccheck/python-crccheck.hash
new file mode 100644
index 0000000000..3fb58a7299
--- /dev/null
+++ b/package/python-crccheck/python-crccheck.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/project/crccheck/#crccheck-1.3.1.tar.gz
+sha256  1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a  crccheck-1.3.1.tar.gz
+# Locally calculated
+sha256  1237ab8ea60caa782d77d9d2ac0cdccd765475e3848b0b91b5751d3f299e9d31  LICENSE.txt
diff --git a/package/python-crccheck/python-crccheck.mk b/package/python-crccheck/python-crccheck.mk
new file mode 100644
index 0000000000..32c1341d32
--- /dev/null
+++ b/package/python-crccheck/python-crccheck.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-crccheck
+#
+################################################################################
+
+PYTHON_CRCCHECK_VERSION = 1.3.1
+PYTHON_CRCCHECK_SOURCE = crccheck-$(PYTHON_CRCCHECK_VERSION).tar.gz
+PYTHON_CRCCHECK_SITE = https://files.pythonhosted.org/packages/3c/d1/a943f4f1ca899917cc3fe1cb89d59348edd1b407503e4b02608e8d6b421e
+PYTHON_CRCCHECK_LICENSE = MIT
+PYTHON_CRCCHECK_LICENSE_FILES = LICENSE.txt
+PYTHON_CRCCHECK_SETUP_TYPE = setuptools
+HOST_PYTHON_CRCCHECK_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_crccheck.py b/support/testing/tests/package/test_python_crccheck.py
new file mode 100644
index 0000000000..d51bdc7c9f
--- /dev/null
+++ b/support/testing/tests/package/test_python_crccheck.py
@@ -0,0 +1,10 @@
+import infra.basetest
+
+
+class TestHostPythonCrccheck(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-crccheck"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-c", "import crccheck; print(crccheck.crc.Crc32.calc(bytearray.fromhex('DEADBEEF')))"]
+        res = infra.run_cmd_on_host(self.builddir, cmd)
+        self.assertEqual(res.strip(), "2090640218")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
