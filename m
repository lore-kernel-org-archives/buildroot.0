Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECBAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1096160A9B;
	Sat,  8 Jan 2022 23:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGKRmGxhDkKF; Sat,  8 Jan 2022 23:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B9C60B03;
	Sat,  8 Jan 2022 23:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88EFB1BF27E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B91981447
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbPmqbe5xZ3u for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1221581442
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:16:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C77C6813AC; Sat,  8 Jan 2022 23:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 00:14:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f5ce3ad2c833d2025b2202a4fdcbb06629f1ece
X-Git-Newrev: fff307fc4a4c58c8ba2faafd69614d0bb2d75a93
X-Patchwork-Hint: ignore
Message-Id: <20220108231001.C77C6813AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fff307fc4a4c58c8ba2faafd69614d0bb2d75a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-tomli/Config.in         |  7 +++++++
 package/python-tomli/python-tomli.hash |  5 +++++
 package/python-tomli/python-tomli.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc07fdbde3..690a43f81b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1312,6 +1312,7 @@ F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
+F:	package/python-tomli/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index dbfdcf6ce3..54d9f81e87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1264,6 +1264,7 @@ menu "External python modules"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
+	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tomli/Config.in b/package/python-tomli/Config.in
new file mode 100644
index 0000000000..e1cecaaa36
--- /dev/null
+++ b/package/python-tomli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TOMLI
+	bool "python-tomli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A lil' TOML parser.
+
+	  https://github.com/hukkin/tomli
diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
new file mode 100644
index 0000000000..1a274c8a40
--- /dev/null
+++ b/package/python-tomli/python-tomli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli/json
+md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
+sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
new file mode 100644
index 0000000000..4e6b023ef7
--- /dev/null
+++ b/package/python-tomli/python-tomli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-tomli
+#
+################################################################################
+
+PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_LICENSE = MIT
+PYTHON_TOMLI_LICENSE_FILES = LICENSE
+HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
