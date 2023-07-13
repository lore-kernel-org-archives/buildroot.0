Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF2C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6DD4179A;
	Thu, 13 Jul 2023 20:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6DD4179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZH5i97fqnex; Thu, 13 Jul 2023 20:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0E77417CA;
	Thu, 13 Jul 2023 20:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0E77417CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23A2B1BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 108E642149
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 108E642149
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOI_let_J_8S for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7568D42145
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7568D42145
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 639B586FCA; Thu, 13 Jul 2023 20:24:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 22:23:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d07ba0f28c3668b20ca92406951b0bf92dd542e
X-Git-Newrev: fc2031e635c83a60c3f51c1cd264c52c80ca9f3d
X-Patchwork-Hint: ignore
Message-Id: <20230713202406.639B586FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-blinker: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc2031e635c83a60c3f51c1cd264c52c80ca9f3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-blinker/Config.in           |  6 ++++++
 package/python-blinker/python-blinker.hash |  5 +++++
 package/python-blinker/python-blinker.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..c3c5a7022d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2336,6 +2336,7 @@ F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
+F:	package/python-blinker/
 F:	package/qt5/qt5speech/
 F:	package/speechd/
 
diff --git a/package/Config.in b/package/Config.in
index e6ed56a811..c8ed49d773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "External python modules"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
+	source "package/python-blinker/Config.in"
 	source "package/python-bluezero/Config.in"
 	source "package/python-boto3/Config.in"
 	source "package/python-botocore/Config.in"
diff --git a/package/python-blinker/Config.in b/package/python-blinker/Config.in
new file mode 100644
index 0000000000..3540ca7452
--- /dev/null
+++ b/package/python-blinker/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BLINKER
+	bool "python-blinker"
+	help
+	  Fast, simple object-to-object and broadcast signaling.
+
+	  https://blinker.readthedocs.io
diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
new file mode 100644
index 0000000000..28416d9fe2
--- /dev/null
+++ b/package/python-blinker/python-blinker.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/blinker/json
+md5  1c7375d100a67ba368d9cde0ab2d8cfa  blinker-1.6.2.tar.gz
+sha256  4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213  blinker-1.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
new file mode 100644
index 0000000000..6af0f811cb
--- /dev/null
+++ b/package/python-blinker/python-blinker.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-blinker
+#
+################################################################################
+
+PYTHON_BLINKER_VERSION = 1.6.2
+PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/e8/f9/a05287f3d5c54d20f51a235ace01f50620984bc7ca5ceee781dc645211c5
+PYTHON_BLINKER_SETUP_TYPE = setuptools
+PYTHON_BLINKER_LICENSE = MIT
+PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
