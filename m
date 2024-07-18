Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D33C3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4C460EA2;
	Thu, 18 Jul 2024 20:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4buxXIVtUGt; Thu, 18 Jul 2024 20:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43CD60E97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43CD60E97;
	Thu, 18 Jul 2024 20:54:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196441BF983
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 130F240313
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsbhrlB067e8 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE6D402E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE6D402E1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9541B86E0A; Thu, 18 Jul 2024 20:54:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fecf2811cb7cecc47c9f1d160a713720850efa5
X-Git-Newrev: 500070c1050c0a718026a43f620af6c443e003e6
X-Patchwork-Hint: ignore
Message-Id: <20240718205421.9541B86E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=500070c1050c0a718026a43f620af6c443e003e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                    |  1 +
 package/python-tortoise-orm/Config.in                | 10 ++++++++++
 package/python-tortoise-orm/python-tortoise-orm.hash |  5 +++++
 package/python-tortoise-orm/python-tortoise-orm.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f314140df4..e58b8eebc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1397,6 +1397,7 @@ menu "External python modules"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-trafaret/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
new file mode 100644
index 0000000000..62b1a5a86e
--- /dev/null
+++ b/package/python-tortoise-orm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_TORTOISE_ORM
+	bool "python-tortoise-orm"
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
+	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	help
+	  Easy async ORM for python, built with relations in mind.
+
+	  https://github.com/tortoise/tortoise-orm
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
new file mode 100644
index 0000000000..4796c8277f
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
+md5  aa5efa50e69d0a67b75c187f7550acd7  tortoise_orm-0.20.0.tar.gz
+sha256  283af584d685dcc58d6cc1da35b9115bb1e41c89075eae2a19c493b39b9b41f7  tortoise_orm-0.20.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
new file mode 100644
index 0000000000..cc1c2126b7
--- /dev/null
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tortoise-orm
+#
+################################################################################
+
+PYTHON_TORTOISE_ORM_VERSION = 0.20.0
+PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/3b/84/8ca142fe370d59c4e3135825b2822d199c4f885ae855657c1a7361e68511
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
+PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
+PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
