Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F439C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB51860F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB51860F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C8B40167;
	Sat,  4 Sep 2021 18:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xp6aZREcBR4t; Sat,  4 Sep 2021 18:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 756EF401E3;
	Sat,  4 Sep 2021 18:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEAD1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A48181D24
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTJPxdve4qd7 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50D5081D46
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1A5D28834C; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 908072116163561ce8b1803a1c32ad88b75bcaeb
X-Git-Newrev: 58c99c957b002a9d6fa7de8df24c87df379c9faf
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.1A5D28834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rsa: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1643556618018071185=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============1643556618018071185==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=58c99c957b002a9d6fa7de8df24c87df379c9faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python-RSA is a pure-Python RSA implementation.

Signed-off-by: Raphaël Mélotte <raphael.melotte@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-rsa/Config.in                       | 11 +++++++++++
 package/python-rsa/python-rsa.hash                 |  5 +++++
 package/python-rsa/python-rsa.mk                   | 14 ++++++++++++++
 support/testing/tests/package/sample_python_rsa.py |  2 ++
 support/testing/tests/package/test_python_rsa.py   | 11 +++++++++++
 7 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c663628b6..8bf15686a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2281,7 +2281,10 @@ F:	package/python-boto3/
 F:	package/python-botocore/
 F:	package/python-jmespath/
 F:	package/python-pymupdf/
+F:	package/python-rsa/
 F:	package/python-s3transfer/
+F:	support/testing/tests/package/sample_python_rsa.py
+F:	support/testing/tests/package/test_python_rsa.py
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/Config.in b/package/Config.in
index 046c04e994..1b9a960bf7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1184,6 +1184,7 @@ menu "External python modules"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
+	source "package/python-rsa/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
diff --git a/package/python-rsa/Config.in b/package/python-rsa/Config.in
new file mode 100644
index 0000000000..bc9ec2feab
--- /dev/null
+++ b/package/python-rsa/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_RSA
+	bool "python-rsa"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	help
+	  Python-RSA is a pure-Python RSA implementation. It supports
+	  encryption and decryption, signing and verifying signatures,
+	  and key generation according to PKCS\#1 version 1.5. It can
+	  be used as a Python library as well as on the command line.
+
+	  https://stuvel.eu/rsa
diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
new file mode 100644
index 0000000000..9fbbf0ac88
--- /dev/null
+++ b/package/python-rsa/python-rsa.hash
@@ -0,0 +1,5 @@
+# From https://pypi.org/project/rsa/
+sha256  9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9  rsa-4.7.2.tar.gz
+
+# Locally computed
+sha256	073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
new file mode 100644
index 0000000000..eaa47e8037
--- /dev/null
+++ b/package/python-rsa/python-rsa.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rsa
+#
+################################################################################
+
+PYTHON_RSA_VERSION = 4.7.2
+PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/db/b5/475c45a58650b0580421746504b680cd2db4e81bc941e94ca53785250269
+PYTHON_RSA_SETUP_TYPE = setuptools
+PYTHON_RSA_LICENSE = Apache-2.0
+PYTHON_RSA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_rsa.py b/support/testing/tests/package/sample_python_rsa.py
new file mode 100644
index 0000000000..6f246f4d62
--- /dev/null
+++ b/support/testing/tests/package/sample_python_rsa.py
@@ -0,0 +1,2 @@
+import rsa
+(pubkey, privkey) = rsa.newkeys(512)
diff --git a/support/testing/tests/package/test_python_rsa.py b/support/testing/tests/package/test_python_rsa.py
new file mode 100644
index 0000000000..e63d63e1de
--- /dev/null
+++ b/support/testing/tests/package/test_python_rsa.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3RSA(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_RSA=y
+        """
+    sample_scripts = ["tests/package/sample_python_rsa.py"]

--===============1643556618018071185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1643556618018071185==--
