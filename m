Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC500C636D6
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD9060B13;
	Mon,  6 Feb 2023 15:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD9060B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4Is47fvHnQt; Mon,  6 Feb 2023 15:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A1E60B14;
	Mon,  6 Feb 2023 15:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A1E60B14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24CA51BF955
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F307981496
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F307981496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5G940QWJwY6 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2706F8149A
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2706F8149A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1600183CA2; Mon,  6 Feb 2023 15:30:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 16:30:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa7d11a2ad984930eb8e8830c44cbabebdcf8568
X-Git-Newrev: 71c132494062055bf07c23617a56f0b705dbe93b
X-Patchwork-Hint: ignore
Message-Id: <20230206153040.1600183CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-h11: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=71c132494062055bf07c23617a56f0b705dbe93b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-h11/Config.in       |  7 +++++++
 package/python-h11/python-h11.hash |  5 +++++
 package/python-h11/python-h11.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6597225ac3..4c2352b617 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1380,6 +1380,7 @@ F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
+F:	package/python-h11/
 F:	package/python-hatchling/
 F:	package/python-hatch-fancy-pypi-readme/
 F:	package/python-hatch-vcs/
diff --git a/package/Config.in b/package/Config.in
index 7817b51fc2..b6211f1102 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ menu "External python modules"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hpack/Config.in"
diff --git a/package/python-h11/Config.in b/package/python-h11/Config.in
new file mode 100644
index 0000000000..736620d782
--- /dev/null
+++ b/package/python-h11/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_H11
+	bool "python-h11"
+	help
+	  A pure-Python, bring-your-own-I/O implementation of
+	  HTTP/1.1.
+
+	  https://github.com/python-hyper/h11
diff --git a/package/python-h11/python-h11.hash b/package/python-h11/python-h11.hash
new file mode 100644
index 0000000000..0c65a11d00
--- /dev/null
+++ b/package/python-h11/python-h11.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/h11/json
+md5  84c33fc0aa1f868928114c4d02c43dc2  h11-0.14.0.tar.gz
+sha256  8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d  h11-0.14.0.tar.gz
+# Locally computed sha256 checksums
+sha256  37db5bb85926db28a427a25867f10b1232003aea1be69ccb851138adb8e6f361  LICENSE.txt
diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
new file mode 100644
index 0000000000..d7dca5244b
--- /dev/null
+++ b/package/python-h11/python-h11.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-h11
+#
+################################################################################
+
+PYTHON_H11_VERSION = 0.14.0
+PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
+PYTHON_H11_SITE = https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03
+PYTHON_H11_SETUP_TYPE = setuptools
+PYTHON_H11_LICENSE = MIT
+PYTHON_H11_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
