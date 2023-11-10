Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52985C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C7940281;
	Fri, 10 Nov 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C7940281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3xui_-Gd1Fo; Fri, 10 Nov 2023 21:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB0DD42862;
	Fri, 10 Nov 2023 21:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB0DD42862
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1F11BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB666F6F3
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB666F6F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMdeTSP7dYVG for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2E16F703
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2E16F703
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D1EE86FCB; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64fc2dd727ba07db1a3494a2aeafc79d171f1780
X-Git-Newrev: 554ecdf49a8eeb1e2e3b3ba02d9337344330ffc1
X-Patchwork-Hint: ignore
Message-Id: <20231110210508.1D1EE86FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jeepney: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=554ecdf49a8eeb1e2e3b3ba02d9337344330ffc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/python-jeepney/Config.in           |  6 ++++++
 package/python-jeepney/python-jeepney.hash |  5 +++++
 package/python-jeepney/python-jeepney.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 10d6393523..5a3410d758 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jedi/Config.in"
+	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jmespath/Config.in"
 	source "package/python-json-schema-validator/Config.in"
diff --git a/package/python-jeepney/Config.in b/package/python-jeepney/Config.in
new file mode 100644
index 0000000000..700176e12f
--- /dev/null
+++ b/package/python-jeepney/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_JEEPNEY
+	bool "python-jeepney"
+	help
+	  Low-level, pure Python DBus protocol wrapper.
+
+	  https://gitlab.com/takluyver/jeepney
diff --git a/package/python-jeepney/python-jeepney.hash b/package/python-jeepney/python-jeepney.hash
new file mode 100644
index 0000000000..31a5bac183
--- /dev/null
+++ b/package/python-jeepney/python-jeepney.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jeepney/json
+md5  7e2151e9197c751ceca6550bc6b3294c  jeepney-0.8.0.tar.gz
+sha256  5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806  jeepney-0.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
new file mode 100644
index 0000000000..ac4c0283a8
--- /dev/null
+++ b/package/python-jeepney/python-jeepney.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jeepney
+#
+################################################################################
+
+PYTHON_JEEPNEY_VERSION = 0.8.0
+PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
+PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf
+PYTHON_JEEPNEY_SETUP_TYPE = flit
+PYTHON_JEEPNEY_LICENSE = MIT
+PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
