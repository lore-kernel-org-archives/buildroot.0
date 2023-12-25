Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AFEC47072
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2581F41608;
	Mon, 25 Dec 2023 10:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2581F41608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXIyxJOnnw2R; Mon, 25 Dec 2023 10:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5488041606;
	Mon, 25 Dec 2023 10:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5488041606
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4FD71BF2BE
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0BA4059E
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D0BA4059E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0nVyyGmzneL for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E18340193
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E18340193
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E8E82A70; Mon, 25 Dec 2023 10:12:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 11:11:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31c169f556d3bf644eae357f7b6781300d60f173
X-Git-Newrev: 8dc5506c76a555bd7eb2455407022b1287b9a821
X-Patchwork-Hint: ignore
Message-Id: <20231225101203.46E8E82A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-decouple: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dc5506c76a555bd7eb2455407022b1287b9a821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-decouple/Config.in            |  6 ++++++
 package/python-decouple/python-decouple.hash |  5 +++++
 package/python-decouple/python-decouple.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a7c653746e..c3aeb87f08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1056,6 +1056,7 @@ menu "External python modules"
 	source "package/python-dbus-fast/Config.in"
 	source "package/python-dbus-next/Config.in"
 	source "package/python-decorator/Config.in"
+	source "package/python-decouple/Config.in"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
diff --git a/package/python-decouple/Config.in b/package/python-decouple/Config.in
new file mode 100644
index 0000000000..528f43d0cb
--- /dev/null
+++ b/package/python-decouple/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DECOUPLE
+	bool "python-decouple"
+	help
+	  Strict separation of settings from code.
+
+	  http://github.com/henriquebastos/python-decouple/
diff --git a/package/python-decouple/python-decouple.hash b/package/python-decouple/python-decouple.hash
new file mode 100644
index 0000000000..cf1290c90e
--- /dev/null
+++ b/package/python-decouple/python-decouple.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-decouple/json
+md5  21b174a381d6bff5f4814018a4fd44cd  python-decouple-3.8.tar.gz
+sha256  ba6e2657d4f376ecc46f77a3a615e058d93ba5e465c01bbe57289bfb7cce680f  python-decouple-3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  4d6e3c2ef229ec3c1a486f52c9d76235e9eb7c94db8ec71a8bff0af60e4f0aa4  LICENSE
diff --git a/package/python-decouple/python-decouple.mk b/package/python-decouple/python-decouple.mk
new file mode 100644
index 0000000000..c0d0cdb909
--- /dev/null
+++ b/package/python-decouple/python-decouple.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-decouple
+#
+################################################################################
+
+PYTHON_DECOUPLE_VERSION = 3.8
+PYTHON_DECOUPLE_SITE = https://files.pythonhosted.org/packages/e1/97/373dcd5844ec0ea5893e13c39a2c67e7537987ad8de3842fe078db4582fa
+PYTHON_DECOUPLE_SETUP_TYPE = setuptools
+PYTHON_DECOUPLE_LICENSE = MIT
+PYTHON_DECOUPLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
