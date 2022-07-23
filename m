Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34635C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D259341669;
	Sat, 23 Jul 2022 17:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D259341669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCckuRikhJaw; Sat, 23 Jul 2022 17:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE4D740515;
	Sat, 23 Jul 2022 17:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE4D740515
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B60A21BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF4740515
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF4740515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxMRM7i33RmN for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:50:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D614A4049F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D614A4049F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 845168227D; Sat, 23 Jul 2022 17:36:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:50:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c8d95256024c82e788c1cc734fe2b2819d67313
X-Git-Newrev: 3a79b2f9d40aa082f14bed45db2c3d77a21f66ab
X-Patchwork-Hint: ignore
Message-Id: <20220723173646.845168227D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lark: new package
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
Content-Type: multipart/mixed; boundary="===============4318373792803725293=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4318373792803725293==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3a79b2f9d40aa082f14bed45db2c3d77a21f66ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-lark/Config.in        |  7 +++++++
 package/python-lark/python-lark.hash |  5 +++++
 package/python-lark/python-lark.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28d85d7370..62053c4b64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1556,6 +1556,7 @@ F:	package/alfred/
 F:	package/bmx7/
 F:	package/python-aexpect/
 F:	package/python-alembic/
+F:	package/python-lark/
 F:	package/softhsm2/
 F:	support/testing/tests/package/sample_python_aexpect.py
 F:	support/testing/tests/package/test_python_aexpect.py
diff --git a/package/Config.in b/package/Config.in
index 433b62eae3..75a756ba6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1081,6 +1081,7 @@ menu "External python modules"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-kiwisolver/Config.in"
+	source "package/python-lark/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
diff --git a/package/python-lark/Config.in b/package/python-lark/Config.in
new file mode 100644
index 0000000000..1f45690f8d
--- /dev/null
+++ b/package/python-lark/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LARK
+	bool "python-lark"
+	help
+	  Lark is a parsing toolkit for Python, built with a focus
+	  on ergonomics, performance and modularity.
+
+	  https://github.com/lark-parser/lark
diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
new file mode 100644
index 0000000000..3773c00f7c
--- /dev/null
+++ b/package/python-lark/python-lark.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/lark/json
+md5  fd3ca96a8d9d67798508470032921078  lark-1.1.2.tar.gz
+sha256  7a8d0c07d663da9391d7faee1bf1d7df4998c47ca43a593cbef5c7566acd057a  lark-1.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  6e83ad8e0de51690a53eac02dd2b6188dfd7949053be56fba5b651140d27ee57  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
new file mode 100644
index 0000000000..52c249552e
--- /dev/null
+++ b/package/python-lark/python-lark.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-lark
+#
+################################################################################
+
+PYTHON_LARK_VERSION = 1.1.2
+PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/a3/c5/11d0a086590b207ad1b6c9ba6e019f8290652f3d703cdb002d72e220dd99
+PYTHON_LARK_SETUP_TYPE = setuptools
+PYTHON_LARK_LICENSE = MIT
+PYTHON_LARK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============4318373792803725293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4318373792803725293==--
