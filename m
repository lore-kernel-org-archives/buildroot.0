Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552FDC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED10F821DA;
	Sat,  4 Nov 2023 22:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED10F821DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TM4E2GLwQQn; Sat,  4 Nov 2023 22:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1567C821D8;
	Sat,  4 Nov 2023 22:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1567C821D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05071BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86FD9821D7
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86FD9821D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K00_S7IR3ihO for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:14:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0F82821D6
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F82821D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B7A1867B0; Sat,  4 Nov 2023 22:14:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 23:09:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deb0b8e2b2309f744faf649cccf9e1fa4a68ca16
X-Git-Newrev: c8ff8d41c06f6b1cbc5cf8702a516411084ead16
X-Patchwork-Hint: ignore
Message-Id: <20231104221404.9B7A1867B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysensors: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8ff8d41c06f6b1cbc5cf8702a516411084ead16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pysensors 0.0.4 from https://pypi.org/project/PySensors/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-pysensors/Config.in             |  9 +++++++++
 package/python-pysensors/python-pysensors.hash |  3 +++
 package/python-pysensors/python-pysensors.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1bb99319c..d096ab0449 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -525,6 +525,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
 F:	package/vmtouch/
diff --git a/package/Config.in b/package/Config.in
index 9da39c2159..a0d5339b0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1252,6 +1252,7 @@ menu "External python modules"
 	source "package/python-pyroute2/Config.in"
 	source "package/python-pyrsistent/Config.in"
 	source "package/python-pysendfile/Config.in"
+	source "package/python-pysensors/Config.in"
 	source "package/python-pysftp/Config.in"
 	source "package/python-pysmb/Config.in"
 	source "package/python-pysmi/Config.in"
diff --git a/package/python-pysensors/Config.in b/package/python-pysensors/Config.in
new file mode 100644
index 0000000000..f8e056506b
--- /dev/null
+++ b/package/python-pysensors/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYSENSORS
+	bool "python-pysensors"
+	select BR2_PACKAGE_LM_SENSORS
+	help
+	  Python bindings for libsensors.so from the lm-sensors project
+	  via ctypes. Supports API version 4, i.e. libsensors version
+	  3.x.
+
+	  https://pypi.org/project/PySensors
diff --git a/package/python-pysensors/python-pysensors.hash b/package/python-pysensors/python-pysensors.hash
new file mode 100644
index 0000000000..b98c08602d
--- /dev/null
+++ b/package/python-pysensors/python-pysensors.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/PySensors/json
+md5  af5ca440297b45bd440d32a7c8341c0f  PySensors-0.0.4.tar.gz
+sha256  beb0def410d29ee46fe196a7811124772abf84cbe3a0d8b01d80b81fba31dae5  PySensors-0.0.4.tar.gz
diff --git a/package/python-pysensors/python-pysensors.mk b/package/python-pysensors/python-pysensors.mk
new file mode 100644
index 0000000000..b38c47f0c8
--- /dev/null
+++ b/package/python-pysensors/python-pysensors.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pysensors
+#
+################################################################################
+
+PYTHON_PYSENSORS_VERSION = 0.0.4
+PYTHON_PYSENSORS_SOURCE = PySensors-$(PYTHON_PYSENSORS_VERSION).tar.gz
+PYTHON_PYSENSORS_SITE = https://files.pythonhosted.org/packages/76/31/d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5
+PYTHON_PYSENSORS_SETUP_TYPE = setuptools
+PYTHON_PYSENSORS_LICENSE = LGPL-2.1
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
