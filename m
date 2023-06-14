Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863B6EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 211FF402F0;
	Wed, 14 Jun 2023 11:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 211FF402F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVJaGzXFazFb; Wed, 14 Jun 2023 11:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C869741C0A;
	Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C869741C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E95181BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0C59415A3
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C59415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIYy4CDFUyDo for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7F141584
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7F141584
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D909F83666; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 12:26:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 776a6e293f338bdfd2beb4b424f5d34762250d91
X-Git-Newrev: 0d1bc9caa92f792ab6f83645acd261bd65deb6de
X-Patchwork-Hint: ignore
Message-Id: <20230614115309.D909F83666@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/python-stack-data: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d1bc9caa92f792ab6f83645acd261bd65deb6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a1c55ea6dd4e7b93e4720206fc1ea390933ef675)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |  1 +
 package/python-stack-data/Config.in              | 10 ++++++++++
 package/python-stack-data/python-stack-data.hash |  5 +++++
 package/python-stack-data/python-stack-data.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a452699a47..e9e8d93d6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1308,6 +1308,7 @@ menu "External python modules"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
 	source "package/python-sqlparse/Config.in"
+	source "package/python-stack-data/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-stack-data/Config.in b/package/python-stack-data/Config.in
new file mode 100644
index 0000000000..508eb9cf13
--- /dev/null
+++ b/package/python-stack-data/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_STACK_DATA
+	bool "python-stack-data"
+	select BR2_PACKAGE_PYTHON_ASTTOKENS # runtime
+	select BR2_PACKAGE_PYTHON_EXECUTING # runtime
+	select BR2_PACKAGE_PYTHON_PURE_EVAL # runtime
+	help
+	  Extract data from python stack frames and tracebacks
+	  for informative displays.
+
+	  http://github.com/alexmojaki/stack_data
diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
new file mode 100644
index 0000000000..6decd3ca8e
--- /dev/null
+++ b/package/python-stack-data/python-stack-data.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/stack_data/json
+md5  bf86c3c81a0158e1e7f3979da5a0033b  stack_data-0.6.2.tar.gz
+sha256  32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815  stack_data-0.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
new file mode 100644
index 0000000000..494ce8f454
--- /dev/null
+++ b/package/python-stack-data/python-stack-data.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-stack-data
+#
+################################################################################
+
+PYTHON_STACK_DATA_VERSION = 0.6.2
+PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
+PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
+PYTHON_STACK_DATA_SETUP_TYPE = setuptools
+PYTHON_STACK_DATA_LICENSE = MIT
+PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
