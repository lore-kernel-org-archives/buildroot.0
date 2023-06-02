Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3682C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D4842708;
	Fri,  2 Jun 2023 19:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D4842708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLxNf_4lWKQF; Fri,  2 Jun 2023 19:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0E342853;
	Fri,  2 Jun 2023 19:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0E342853
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B16D61BF97F
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9668842746
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9668842746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbKynar65XmI for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794D2426F6
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794D2426F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 649A486BB6; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:40:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 239dd7dcbda1b2c86a29491158fa089e06efca33
X-Git-Newrev: 91b7bd01eca709c0bd7fa94c147f82082f054c94
X-Patchwork-Hint: ignore
Message-Id: <20230602194659.649A486BB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-executing: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=91b7bd01eca709c0bd7fa94c147f82082f054c94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-executing/Config.in             |  7 +++++++
 package/python-executing/python-executing.hash |  5 +++++
 package/python-executing/python-executing.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0cf2f3998c..82aa348455 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
 	source "package/python-evdev/Config.in"
+	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
diff --git a/package/python-executing/Config.in b/package/python-executing/Config.in
new file mode 100644
index 0000000000..e1f8f8efdf
--- /dev/null
+++ b/package/python-executing/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_EXECUTING
+	bool "python-executing"
+	help
+	  Get the currently executing AST node of a frame, and other
+	  information.
+
+	  https://github.com/alexmojaki/executing
diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
new file mode 100644
index 0000000000..40fd43b5fd
--- /dev/null
+++ b/package/python-executing/python-executing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/executing/json
+md5  e6fa9a6abf00555ccc8a6b3524729238  executing-1.2.0.tar.gz
+sha256  19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107  executing-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
new file mode 100644
index 0000000000..4c968323ea
--- /dev/null
+++ b/package/python-executing/python-executing.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-executing
+#
+################################################################################
+
+PYTHON_EXECUTING_VERSION = 1.2.0
+PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/8f/ac/89ff37d8594b0eef176b7cec742ac868fef853b8e18df0309e3def9f480b
+PYTHON_EXECUTING_SETUP_TYPE = setuptools
+PYTHON_EXECUTING_LICENSE = MIT
+PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
+
+PYTHON_EXECUTING_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
