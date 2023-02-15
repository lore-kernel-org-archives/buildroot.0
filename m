Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C351EC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E6147014A;
	Tue, 21 Feb 2023 02:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6147014A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hlZ9Raom2_M; Tue, 21 Feb 2023 02:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD607024D;
	Tue, 21 Feb 2023 02:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD607024D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8701BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 888D87003E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 888D87003E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJjTmaWJzbIw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 609606FE60
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 609606FE60
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DC4181979; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:17:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8c41d4836999fa691c5952bd476182bf93647e7c
X-Git-Newrev: 9c3e7014105eb69db7d9c9f662ab0a5054f35797
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.5DC4181979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-marshmallow:
 new package
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
Content-Type: multipart/mixed; boundary="===============2937033619666579634=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2937033619666579634==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9c3e7014105eb69db7d9c9f662ab0a5054f35797
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

marshmallow is a dependency of to-be-added python-flask-smorest.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-marshmallow/Config.in               |  8 ++++++++
 package/python-marshmallow/python-marshmallow.hash |  6 ++++++
 package/python-marshmallow/python-marshmallow.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7335e70d15..2b05714e9c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1967,6 +1967,7 @@ F:	package/zic/
 
 N:	Martin Hundebøll <martin@geanix.com>
 F:	package/python-apispec/
+F:	package/python-marshmallow/
 F:	package/python-webargs/
 
 N:	Martin Kepplinger <martink@posteo.de>
diff --git a/package/Config.in b/package/Config.in
index 747fac54bf..ece35f12c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1129,6 +1129,7 @@ menu "External python modules"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
+	source "package/python-marshmallow/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
diff --git a/package/python-marshmallow/Config.in b/package/python-marshmallow/Config.in
new file mode 100644
index 0000000000..cc1b42f465
--- /dev/null
+++ b/package/python-marshmallow/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MARSHMALLOW
+	bool "python-marshmallow"
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	help
+	  A lightweight library for converting complex datatypes to
+	  and from native Python datatypes.
+
+	  https://github.com/marshmallow-code/marshmallow
diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
new file mode 100644
index 0000000000..dc277d16e5
--- /dev/null
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/marshmallow/json
+md5  3cf5c42917509a199c3105466435c425  marshmallow-3.19.0.tar.gz
+sha256  90032c0fd650ce94b6ec6dc8dfeb0e3ff50c144586462c389b81a07205bedb78  marshmallow-3.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  759dc79c383ad79340c6e41f712e80407fe0d2cb3cbaad1ed98aa9c3e28a602c  LICENSE
+sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
new file mode 100644
index 0000000000..6427296508
--- /dev/null
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-marshmallow
+#
+################################################################################
+
+PYTHON_MARSHMALLOW_VERSION = 3.19.0
+PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/5e/59/dd465e5ab0ccb879c410f88c75189a19fd437b12cd9a03b31579aef58709
+PYTHON_MARSHMALLOW_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_LICENSE = MIT
+PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============2937033619666579634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2937033619666579634==--
