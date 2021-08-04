Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AB6C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:35:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B8561002
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62B8561002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3928D4066E;
	Wed,  4 Aug 2021 20:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmHYuyr0MQ3x; Wed,  4 Aug 2021 20:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE7340606;
	Wed,  4 Aug 2021 20:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD39B1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C5F5608D0
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMzVIZA19OXK for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A66F360620
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A03008B75E; Wed,  4 Aug 2021 20:35:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:27:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 908072116163561ce8b1803a1c32ad88b75bcaeb
X-Git-Newrev: 58c99c957b002a9d6fa7de8df24c87df379c9faf
X-Patchwork-Hint: ignore
Message-Id: <20210804203537.A03008B75E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-rsa: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2622770703719908114=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2622770703719908114==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=58c99c957b002a9d6fa7de8df24c87df379c9faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============2622770703719908114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2622770703719908114==--
