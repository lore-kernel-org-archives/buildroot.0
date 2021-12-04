Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D096C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A9080D12;
	Mon,  6 Dec 2021 18:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxljOIsxHQ5v; Mon,  6 Dec 2021 18:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A252280CFD;
	Mon,  6 Dec 2021 18:43:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED20D1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603D841C46
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWuFSLKgTy7h for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D1341C35
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5105381503; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:18:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e7eb3ce3d1b3338d5b7d105be688485b9a6aa2d
X-Git-Newrev: 3f5f8abd415fbe1fadc8d1358179af684a08f29c
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.5105381503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyphen: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f5f8abd415fbe1fadc8d1358179af684a08f29c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pyphen/Config.in          |  7 +++++++
 package/python-pyphen/python-pyphen.hash |  8 ++++++++
 package/python-pyphen/python-pyphen.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19a2b0986f..35218fecfd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1265,6 +1265,7 @@ F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
 F:	package/python-pycares/
+F:	package/python-pyphen/
 F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
diff --git a/package/Config.in b/package/Config.in
index ed17bd3b5d..d5107f3be2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1161,6 +1161,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
+	source "package/python-pyphen/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
diff --git a/package/python-pyphen/Config.in b/package/python-pyphen/Config.in
new file mode 100644
index 0000000000..30ccafcda4
--- /dev/null
+++ b/package/python-pyphen/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYPHEN
+	bool "python-pyphen"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Pure Python module to hyphenate text.
+
+	  https://www.courtbouillon.org/pyphen
diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
new file mode 100644
index 0000000000..75ee909351
--- /dev/null
+++ b/package/python-pyphen/python-pyphen.hash
@@ -0,0 +1,8 @@
+# md5, sha256 from https://pypi.org/pypi/Pyphen/json
+md5  f8ec095e4fe30dc2b518a918788b33ed  pyphen-0.11.0.tar.gz
+sha256  e2c3ed82c3a04317df5102addafe89652b0876bc6c6265f5dd4c3efaf02315e8  pyphen-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
+sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LGPL
+sha256  ad192a67649aa23ac9681939840f4f241643a98da9cd8aec8de28c3b8c6ee854  COPYING.MPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
new file mode 100644
index 0000000000..80f67c77c7
--- /dev/null
+++ b/package/python-pyphen/python-pyphen.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyphen
+#
+################################################################################
+
+PYTHON_PYPHEN_VERSION = 0.11.0
+PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/f8/af869a4983c1b3159945479510260985714265d48baf27d61f72b1ec8cbf
+PYTHON_PYPHEN_SETUP_TYPE = distutils
+PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
+PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
