Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D382CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D11811CE;
	Tue, 23 Jul 2024 09:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGpD5CcjwrHo; Tue, 23 Jul 2024 09:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1B9C8110E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1B9C8110E;
	Tue, 23 Jul 2024 09:32:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5151BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A3340384
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5DMgWlLKXxg for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 566A54030F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 566A54030F
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 388E48738E; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:29:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0971cbddea49110619d73fec2b5d7b80184024f5
X-Git-Newrev: 591f6d108bbb3df288a473393abdab511b56b6dc
X-Patchwork-Hint: ignore
Message-Id: <20240723093232.388E48738E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-text: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=591f6d108bbb3df288a473393abdab511b56b6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-jaraco-text/Config.in               | 12 ++++++++++++
 package/python-jaraco-text/python-jaraco-text.hash |  5 +++++
 package/python-jaraco-text/python-jaraco-text.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dbe3c8a495..1e80912851 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1168,6 +1168,7 @@ menu "External python modules"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-context/Config.in"
 	source "package/python-jaraco-functools/Config.in"
+	source "package/python-jaraco-text/Config.in"
 	source "package/python-jc/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jeepney/Config.in"
diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
new file mode 100644
index 0000000000..5044ea3233
--- /dev/null
+++ b/package/python-jaraco-text/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_JARACO_TEXT
+	bool "python-jaraco-text"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-inflect -> python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
+	select BR2_PACKAGE_PYTHON_INFLECT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	help
+	  Module for text manipulation.
+
+	  https://github.com/jaraco/jaraco.text
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
new file mode 100644
index 0000000000..704e75d6be
--- /dev/null
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.text/json
+md5  9f63a5cdd56061ebd84d8175d1df3b70  jaraco.text-3.12.0.tar.gz
+sha256  389e25c8d4b32e9715bf530596fab0f5cd3aa47296e43969392e18a541af592c  jaraco.text-3.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
new file mode 100644
index 0000000000..06b028d65f
--- /dev/null
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-text
+#
+################################################################################
+
+PYTHON_JARACO_TEXT_VERSION = 3.12.0
+PYTHON_JARACO_TEXT_SOURCE = jaraco.text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/53/30/52edc6c9997d48b0d9fbedb6a29edab2b397968f637b76aae299a9128c34
+PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
+PYTHON_JARACO_TEXT_LICENSE = MIT
+PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
+PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
