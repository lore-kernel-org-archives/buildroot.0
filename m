Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A2CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE2560E42;
	Sat, 18 Oct 2025 19:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuKfFFOehw2d; Sat, 18 Oct 2025 19:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7016660E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7016660E4E;
	Sat, 18 Oct 2025 19:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 052431CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB32640AD9
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id niqsXRNYm8sV for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E845340A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E845340A56
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E845340A56
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 047764E4116C;
 Sat, 18 Oct 2025 19:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD4746069D;
 Sat, 18 Oct 2025 19:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D586102F238D; 
 Sat, 18 Oct 2025 21:43:35 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 18 Oct 2025 21:43:01 +0200
Message-ID: <20251018194314.114284-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816619; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=X3EdhnOJ3nf87CM9pM3PTsoJ+DmXtrbzTKoIrBFYWYo=;
 b=WoZ0ZPeRkgHDTWNmuZ2J9CIiOriiyV9fdarFDS+BQgutqCiiNCCjN0KzSZqqC7p8quFJbJ
 kTp56bzt+wHdX/IXFuXmAmDLeSU4lpV/BNp76n+tdq7YddsJCZSRuTpae5o59u+LIsDH/j
 rrpFmRCinvbOx4eAKkKPnbCxS+0NvhMfJzVmBUJEH6rq+kd7ydTd3VnUplWZPsbZqdfcYN
 kH8nRQNeGJWvuTMnSrUqInuuWwkG9PQ8G2gEAicP1a1WuV/rDzpgOnnkZjdmLc2Knq33Pz
 N/AFTaeUPeMFiAUfDtaBjwGhqNDvcvyfBnb9+PM0r5CtYM6U83KnsOXvzssDXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WoZ0ZPeR
Subject: [Buildroot] [PATCH 03/11] package/python-crccheck: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, romain.gantois@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a new host only package for the crccheck Python
module, which is a dependency of Snagboot.

Homepage on PyPi: https://pypi.org/project/crccheck/

This commit also adds a very basic test case that allows to verify
that the Python module can be imported and that some minimal
functionality works.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                        |  2 ++
 package/python-crccheck/python-crccheck.hash      |  4 ++++
 package/python-crccheck/python-crccheck.mk        | 15 +++++++++++++++
 .../testing/tests/package/test_python_crccheck.py | 10 ++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-crccheck/python-crccheck.hash
 create mode 100644 package/python-crccheck/python-crccheck.mk
 create mode 100644 support/testing/tests/package/test_python_crccheck.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 69f22259e8..ec52defef8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3251,6 +3251,7 @@ F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
 F:	package/python3/
 F:	package/python-augeas/
+F:	package/python-crccheck/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-qrcode/
@@ -3280,6 +3281,7 @@ F:	support/testing/tests/package/sample_python_git.py
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
