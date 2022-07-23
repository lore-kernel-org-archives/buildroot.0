Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E0C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64FF74041C;
	Sat, 23 Jul 2022 19:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64FF74041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H49WI_rsBmsy; Sat, 23 Jul 2022 19:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AD1541686;
	Sat, 23 Jul 2022 19:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD1541686
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF3AD1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAB7A84BEA
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB7A84BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9zGXlpEdUin for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:19:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC3B484BE8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3B484BE8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 515FD84BBA; Sat, 23 Jul 2022 19:05:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:18:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 475b7dbd66903a75618fad8467e96c16406b32a3
X-Git-Newrev: 439404e7acb928524c409843b74cfc7726c49d38
X-Patchwork-Hint: ignore
Message-Id: <20220723190529.515FD84BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=439404e7acb928524c409843b74cfc7726c49d38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-pylibfdt/Config.in            |  6 ++++++
 package/python-pylibfdt/python-pylibfdt.hash |  6 ++++++
 package/python-pylibfdt/python-pylibfdt.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f13ba4d58f..477372e828 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1169,6 +1169,7 @@ menu "External python modules"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyjwt/Config.in"
+	source "package/python-pylibfdt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymodbus/Config.in"
diff --git a/package/python-pylibfdt/Config.in b/package/python-pylibfdt/Config.in
new file mode 100644
index 0000000000..8fc1cdb064
--- /dev/null
+++ b/package/python-pylibfdt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYLIBFDT
+	bool "python-pylibfdt"
+	help
+	  Python bindings for the Device Tree Compiler (dtc) toolchain.
+
+	  https://github.com/devicetree-org/pylibfdt
diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
new file mode 100644
index 0000000000..056fd3a62e
--- /dev/null
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.python.org/pypi/pylibfdt/json
+md5  5765c20ac6cde517d5b7218503ab707b  pylibfdt-1.6.1.tar.gz
+sha256  90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778  pylibfdt-1.6.1.tar.gz
+# Locally computed
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
new file mode 100644
index 0000000000..dc68de83b3
--- /dev/null
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pylibfdt
+#
+################################################################################
+
+PYTHON_PYLIBFDT_VERSION = 1.6.1
+PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/15/3c/40b1d6a1df9dbc9d9ba5700a47ad95ca1e984f18daf25ede0da5f67d0cf7
+PYTHON_PYLIBFDT_SETUP_TYPE = setuptools
+PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
+PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
+PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
