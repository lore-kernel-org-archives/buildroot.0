Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5680EC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C7C4246C;
	Sat, 23 Jul 2022 19:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C7C4246C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZJ7oeQDqCZ9; Sat, 23 Jul 2022 19:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BA84244D;
	Sat, 23 Jul 2022 19:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BA84244D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 401681BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0EE4041C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0EE4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsdooo0wYSzu for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C60840354
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C60840354
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BBADB84B36; Sat, 23 Jul 2022 19:02:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:15:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33d953588f94603cb79f408308e4ded2a6ddd447
X-Git-Newrev: 475b7dbd66903a75618fad8467e96c16406b32a3
X-Patchwork-Hint: ignore
Message-Id: <20220723190228.BBADB84B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyrsistent: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=475b7dbd66903a75618fad8467e96c16406b32a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-pyrsistent/Config.in              |  6 ++++++
 package/python-pyrsistent/python-pyrsistent.hash |  5 +++++
 package/python-pyrsistent/python-pyrsistent.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e19b84b6bf..f13ba4d58f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1184,6 +1184,7 @@ menu "External python modules"
 	source "package/python-pyqt5/Config.in"
 	source "package/python-pyratemp/Config.in"
 	source "package/python-pyroute2/Config.in"
+	source "package/python-pyrsistent/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysftp/Config.in"
 	source "package/python-pysmb/Config.in"
diff --git a/package/python-pyrsistent/Config.in b/package/python-pyrsistent/Config.in
new file mode 100644
index 0000000000..49f97a00d9
--- /dev/null
+++ b/package/python-pyrsistent/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYRSISTENT
+	bool "python-pyrsistent"
+	help
+	  Persistent/Functional/Immutable data structures.
+
+	  http://github.com/tobgu/pyrsistent/
diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
new file mode 100644
index 0000000000..70d1cc6fa2
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyrsistent/json
+md5  cef3da08455664bf917dcf8cd00d49a4  pyrsistent-0.18.1.tar.gz
+sha256  d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96  pyrsistent-0.18.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
new file mode 100644
index 0000000000..27ec41028f
--- /dev/null
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyrsistent
+#
+################################################################################
+
+PYTHON_PYRSISTENT_VERSION = 0.18.1
+PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/42/ac/455fdc7294acc4d4154b904e80d964cc9aae75b087bbf486be04df9f2abd
+PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
+PYTHON_PYRSISTENT_LICENSE = MIT
+PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
