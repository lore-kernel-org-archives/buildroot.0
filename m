Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEB7D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA0FB40683;
	Mon, 28 Oct 2024 14:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i6s0Du3rb23; Mon, 28 Oct 2024 14:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B7264068B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7264068B;
	Mon, 28 Oct 2024 14:41:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 221F0AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0C840981
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r-tICRzAK9r for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3989A40968
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3989A40968
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36625842F5; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b752ad14b77e8d66db954e2c9aaca14162ccf3f
X-Git-Newrev: 2fa55b43827b9e8a22638623e5d5615525205e8e
X-Patchwork-Hint: ignore
Message-Id: <20241028144053.36625842F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-propcache: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2fa55b43827b9e8a22638623e5d5615525205e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/python-propcache/Config.in             |  6 ++++++
 package/python-propcache/python-propcache.hash |  5 +++++
 package/python-propcache/python-propcache.mk   | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a4fcc56947..57a95a6ea8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1269,6 +1269,7 @@ menu "External python modules"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-priority/Config.in"
 	source "package/python-prompt-toolkit/Config.in"
+	source "package/python-propcache/Config.in"
 	source "package/python-proto-plus/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-propcache/Config.in b/package/python-propcache/Config.in
new file mode 100644
index 0000000000..a387d6520c
--- /dev/null
+++ b/package/python-propcache/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PROPCACHE
+	bool "python-propcache"
+	help
+	  Accelerated property cache.
+
+	  https://github.com/aio-libs/propcache
diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
new file mode 100644
index 0000000000..56a491433f
--- /dev/null
+++ b/package/python-propcache/python-propcache.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/propcache/json
+md5  70b121a9845a0da06eccfbc42ff74335  propcache-0.2.0.tar.gz
+sha256  df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70  propcache-0.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
new file mode 100644
index 0000000000..37ceec731d
--- /dev/null
+++ b/package/python-propcache/python-propcache.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-propcache
+#
+################################################################################
+
+PYTHON_PROPCACHE_VERSION = 0.2.0
+PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a9/4d/5e5a60b78dbc1d464f8a7bbaeb30957257afdc8512cbb9dfd5659304f5cd
+PYTHON_PROPCACHE_SETUP_TYPE = setuptools
+PYTHON_PROPCACHE_LICENSE = Apache-2.0
+PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
+PYTHON_PROPCACHE_DEPENDENCIES = \
+	host-python-cython \
+	host-python-expandvars
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
