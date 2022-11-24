Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3088BC47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF45060C01;
	Mon,  5 Dec 2022 12:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF45060C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVVu0xr9OoER; Mon,  5 Dec 2022 12:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA6F60BD9;
	Mon,  5 Dec 2022 12:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA6F60BD9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1DD41BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8478A416AB
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8478A416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thndF1PL0geZ for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB37F4167C
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB37F4167C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ABEC85BA3; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:30:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 338375d88de1baae5e3a178813f53334a891656b
X-Git-Newrev: 4eb1dde125f2cc253b839fb833904b366f9d06c3
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.9ABEC85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4eb1dde125f2cc253b839fb833904b366f9d06c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-pyspnego/Config.in            |  8 ++++++++
 package/python-pyspnego/python-pyspnego.hash |  6 ++++++
 package/python-pyspnego/python-pyspnego.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7ad7e2d487..eafc5ae5ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1212,6 +1212,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
+	source "package/python-pyspnego/Config.in"
 	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytest/Config.in"
diff --git a/package/python-pyspnego/Config.in b/package/python-pyspnego/Config.in
new file mode 100644
index 0000000000..7533b725ec
--- /dev/null
+++ b/package/python-pyspnego/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYSPNEGO
+	bool "python-pyspnego"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	help
+	  Windows Negotiate Authentication Client and Server.
+
+	  https://github.com/jborean93/pyspnego
diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
new file mode 100644
index 0000000000..400e380b5d
--- /dev/null
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pyspnego/json
+md5  67114f5e59c6d5b45fe2b38c128c2140  pyspnego-0.6.3.tar.gz
+sha256  6060a0e683171090adcf92c9d319ddd334f15117fa199a703d8c9bd094d9f6c0  pyspnego-0.6.3.tar.gz
+
+# Locally computed
+sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
new file mode 100644
index 0000000000..0910c57b7d
--- /dev/null
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyspnego
+#
+################################################################################
+
+PYTHON_PYSPNEGO_VERSION = 0.6.3
+PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/ba/13/7b4e7dcff1eb24a13e0a631a4b49eab361678e4490d691c03253ae736da4
+PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
+PYTHON_PYSPNEGO_LICENSE = MIT
+PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
