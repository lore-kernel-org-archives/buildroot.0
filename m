Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE994C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9364008D;
	Fri, 28 Feb 2025 16:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5n5HFtz7bMXq; Fri, 28 Feb 2025 16:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F8A4F8F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4F8A4F8F5;
	Fri, 28 Feb 2025 16:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 116FC711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3263E42968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gx9Vq0gkn2j for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7489042498
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7489042498
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F9B685E77; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 13:57:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 354fa0985430b3b30107ba3f6f9d926d4fa8b3c3
X-Git-Newrev: b005eb5bb5907a1010441d653e2ea3ec13ce3a92
X-Patchwork-Hint: ignore
Message-Id: <20250228162944.6F9B685E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-asyncclick: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b005eb5bb5907a1010441d653e2ea3ec13ce3a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                |  1 +
 package/python-asyncclick/Config.in              |  7 +++++++
 package/python-asyncclick/python-asyncclick.hash |  5 +++++
 package/python-asyncclick/python-asyncclick.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index feb4840a7d..06472aa972 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1013,6 +1013,7 @@ menu "External python modules"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
+	source "package/python-asyncclick/Config.in"
 	source "package/python-asyncssh/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-augeas/Config.in"
diff --git a/package/python-asyncclick/Config.in b/package/python-asyncclick/Config.in
new file mode 100644
index 0000000000..9264245213
--- /dev/null
+++ b/package/python-asyncclick/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASYNCCLICK
+	bool "python-asyncclick"
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
+	help
+	  Composable command line interface toolkit, async version.
+
+	  https://palletsprojects.com/p/click/
diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
new file mode 100644
index 0000000000..59f00893e5
--- /dev/null
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asyncclick/json
+md5  542e83089a55129ca2fe7ccdbc65ba77  asyncclick-8.1.7.2.tar.gz
+sha256  219ea0f29ccdc1bb4ff43bcab7ce0769ac6d48a04f997b43ec6bee99a222daa0  asyncclick-8.1.7.2.tar.gz
+# Locally computed sha256 checksums
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
new file mode 100644
index 0000000000..946325e496
--- /dev/null
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-asyncclick
+#
+################################################################################
+
+PYTHON_ASYNCCLICK_VERSION = 8.1.7.2
+PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/5e/bf/59d836c3433d7aa07f76c2b95c4eb763195ea8a5d7f9ad3311ed30c2af61
+PYTHON_ASYNCCLICK_SETUP_TYPE = setuptools
+PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
+PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.rst
+PYTHON_ASYNCCLICK_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
