Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55B8EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7631B41B71;
	Wed, 14 Jun 2023 11:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7631B41B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyQgEbQmiOw2; Wed, 14 Jun 2023 11:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FDC41B1B;
	Wed, 14 Jun 2023 11:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FDC41B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02FCB1BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE4AD832EB
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4AD832EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOBRwbllhzvN for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1F08204D
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1F08204D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B805283628; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 12:25:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cc7beaea3d51ccf117189c83dec1aeba7ef488ea
X-Git-Newrev: bd2261081f789ea07706c9ee0046320d30434d7b
X-Patchwork-Hint: ignore
Message-Id: <20230614115309.B805283628@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-executing:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd2261081f789ea07706c9ee0046320d30434d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 91b7bd01eca709c0bd7fa94c147f82082f054c94)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-executing/Config.in             |  7 +++++++
 package/python-executing/python-executing.hash |  5 +++++
 package/python-executing/python-executing.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4da083d35f..3a9c6a1440 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1050,6 +1050,7 @@ menu "External python modules"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
 	source "package/python-esptool/Config.in"
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
