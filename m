Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55826C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC68760E89;
	Thu, 18 Jul 2024 20:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eozeO6HgNMhg; Thu, 18 Jul 2024 20:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2195660E9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2195660E9A;
	Thu, 18 Jul 2024 20:54:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1147C1BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE5D440F42
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLnXVy5ON0dG for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 920D740F3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 920D740F3B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88FE986E02; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:45:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb5f194fcf7da0ce6338e594012e3d7e003f2898
X-Git-Newrev: 9fecf2811cb7cecc47c9f1d160a713720850efa5
X-Patchwork-Hint: ignore
Message-Id: <20240718205421.88FE986E02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypika-tortoise: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fecf2811cb7cecc47c9f1d160a713720850efa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                         |  1 +
 package/python-pypika-tortoise/Config.in                  |  6 ++++++
 .../python-pypika-tortoise/python-pypika-tortoise.hash    |  5 +++++
 package/python-pypika-tortoise/python-pypika-tortoise.mk  | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5f0e7491c8..f314140df4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1291,6 +1291,7 @@ menu "External python modules"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pyphen/Config.in"
+	source "package/python-pypika-tortoise/Config.in"
 	source "package/python-pypng/Config.in"
 	source "package/python-pyqrcode/Config.in"
 	source "package/python-pyqt5/Config.in"
diff --git a/package/python-pypika-tortoise/Config.in b/package/python-pypika-tortoise/Config.in
new file mode 100644
index 0000000000..62e14c6d50
--- /dev/null
+++ b/package/python-pypika-tortoise/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE
+	bool "python-pypika-tortoise"
+	help
+	  Forked from pypika and streamline just for tortoise-orm.
+
+	  https://github.com/tortoise/pypika-tortoise
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
new file mode 100644
index 0000000000..629762f4f7
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
+md5  98c9677516f06f61f211f834d51949a6  pypika-tortoise-0.1.6.tar.gz
+sha256  d802868f479a708e3263724c7b5719a26ad79399b2a70cea065f4a4cadbebf36  pypika-tortoise-0.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
new file mode 100644
index 0000000000..84aa19cfbb
--- /dev/null
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pypika-tortoise
+#
+################################################################################
+
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
+PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
+PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
+PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
+PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
+PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
