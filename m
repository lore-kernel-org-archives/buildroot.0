Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D2AC77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC3F4285D;
	Fri,  2 Jun 2023 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC3F4285D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8M4Dn7kcNWxI; Fri,  2 Jun 2023 19:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A194284F;
	Fri,  2 Jun 2023 19:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A194284F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40EDE1BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26476616B6
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26476616B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfGEMUPLFzpg for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94511616B1
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94511616B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 833C186BBC; Fri,  2 Jun 2023 19:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa5c233c36bcc8fd51c84f7776c1b3a2875a3d98
X-Git-Newrev: a1c55ea6dd4e7b93e4720206fc1ea390933ef675
X-Patchwork-Hint: ignore
Message-Id: <20230602194659.833C186BBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-stack-data: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1c55ea6dd4e7b93e4720206fc1ea390933ef675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                |  1 +
 package/python-stack-data/Config.in              | 10 ++++++++++
 package/python-stack-data/python-stack-data.hash |  5 +++++
 package/python-stack-data/python-stack-data.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bc78acebda..ad438667d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ menu "External python modules"
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
