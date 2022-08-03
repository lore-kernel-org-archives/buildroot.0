Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A145CC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550088148B;
	Wed,  3 Aug 2022 19:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 550088148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrbgQqvolapO; Wed,  3 Aug 2022 19:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F9AF813CA;
	Wed,  3 Aug 2022 19:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F9AF813CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334891BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B775813CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B775813CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3YwjPsaPyl4 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:54:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E886813C6
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 19:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E886813C6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5E80086DB2; Wed,  3 Aug 2022 19:40:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 21:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e27ef7658265a62e74bf9f0e66e5e5432f453f6a
X-Git-Newrev: c05caa755723737e91ffd57e736298cb19c9c87f
X-Patchwork-Hint: ignore
Message-Id: <20220803194000.5E80086DB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-construct: new package
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
Content-Type: multipart/mixed; boundary="===============2160204549046090877=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2160204549046090877==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c05caa755723737e91ffd57e736298cb19c9c87f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

construct is a Python library for declarative serialization/
deserialization of structured binary data.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  5 +++++
 package/Config.in                                        |  1 +
 package/python-construct/Config.in                       |  7 +++++++
 package/python-construct/python-construct.hash           |  5 +++++
 package/python-construct/python-construct.mk             | 14 ++++++++++++++
 support/testing/tests/package/sample_python_construct.py | 16 ++++++++++++++++
 support/testing/tests/package/test_python_construct.py   | 12 ++++++++++++
 7 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e2d7fc3b04..a8b53f41da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1925,6 +1925,11 @@ F:	package/tslib/
 F:	package/x11r7/xdriver_xf86-input-tslib/
 F:	package/x11vnc/
 
+N:	Martin Povišer <povik+lin@cutebit.org>
+F:	package/python-construct/
+F:	support/testing/tests/package/sample_python_construct.py
+F:	support/testing/tests/package/test_python_construct.py
+
 N:	Masahiro Yamada <yamada.masahiro@socionext.com>
 F:	board/arm/foundation-v8/
 F:	configs/arm_foundationv8_defconfig
diff --git a/package/Config.in b/package/Config.in
index d593277e80..96c54ca672 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -991,6 +991,7 @@ menu "External python modules"
 	source "package/python-colorzero/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
+	source "package/python-construct/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-construct/Config.in b/package/python-construct/Config.in
new file mode 100644
index 0000000000..f70c8dc631
--- /dev/null
+++ b/package/python-construct/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CONSTRUCT
+	bool "python-construct"
+	help
+	  A powerful declarative symmetric parser/builder for binary
+	  data.
+
+	  https://construct.readthedocs.io/
diff --git a/package/python-construct/python-construct.hash b/package/python-construct/python-construct.hash
new file mode 100644
index 0000000000..f406d6739b
--- /dev/null
+++ b/package/python-construct/python-construct.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/project/construct
+md5  e426d3dd1566066e4ef1a03fe474dec0  construct-2.10.68.tar.gz
+sha256  7b2a3fd8e5f597a5aa1d614c3bd516fa065db01704c72a1efaaeec6ef23d8b45  construct-2.10.68.tar.gz
+# Locally computed sha256 checksums
+sha256  1552d70acfd0d3fe464ce13d30113ddc6fe4bac21e52212acc98509e3cc1a8f4  LICENSE
diff --git a/package/python-construct/python-construct.mk b/package/python-construct/python-construct.mk
new file mode 100644
index 0000000000..3b0bb56106
--- /dev/null
+++ b/package/python-construct/python-construct.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-construct
+#
+################################################################################
+
+PYTHON_CONSTRUCT_VERSION = 2.10.68
+PYTHON_CONSTRUCT_SOURCE = construct-$(PYTHON_CONSTRUCT_VERSION).tar.gz
+PYTHON_CONSTRUCT_SITE = https://files.pythonhosted.org/packages/e0/b7/a4a032e94bcfdff481f2e6fecd472794d9da09f474a2185ed33b2c7cad64
+PYTHON_CONSTRUCT_SETUP_TYPE = setuptools
+PYTHON_CONSTRUCT_LICENSE = MIT
+PYTHON_CONSTRUCT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_construct.py b/support/testing/tests/package/sample_python_construct.py
new file mode 100644
index 0000000000..551b559761
--- /dev/null
+++ b/support/testing/tests/package/sample_python_construct.py
@@ -0,0 +1,16 @@
+# Inspired from https://construct.readthedocs.io/en/latest/intro.html#example
+import construct
+
+format = construct.Struct(
+    "signature" / construct.Const(b"BMP"),
+    "width" / construct.Int8ub,
+    "height" / construct.Int8ub,
+    "pixels" / construct.Array(construct.this.width * construct.this.height, construct.Byte),
+)
+a = format.build(dict(width=3,height=2,pixels=[7,8,9,11,12,13]))
+assert(a == b'BMP\x03\x02\x07\x08\t\x0b\x0c\r')
+b = format.parse(b'BMP\x03\x02\x07\x08\t\x0b\x0c\r')
+assert(b.signature == b'BMP')
+assert(b.width == 3)
+assert(b.height == 2)
+assert(b.pixels == [7, 8, 9, 11, 12, 13])
diff --git a/support/testing/tests/package/test_python_construct.py b/support/testing/tests/package/test_python_construct.py
new file mode 100644
index 0000000000..3c51dc31bb
--- /dev/null
+++ b/support/testing/tests/package/test_python_construct.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Construct(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CONSTRUCT=y
+        """
+    sample_scripts = ["tests/package/sample_python_construct.py"]
+    timeout = 10

--===============2160204549046090877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2160204549046090877==--
