Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CFECF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DDE44056F;
	Sun, 22 Sep 2024 18:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-4iYy02pcgi; Sun, 22 Sep 2024 18:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9E84402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9E84402BC;
	Sun, 22 Sep 2024 18:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 957901BF44A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82995605C2
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYdPWJ42d5zU for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6989B6068B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6989B6068B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA1A82684; Sun, 22 Sep 2024 18:04:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 18:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d33b4a9bc9d70d3a51cdc70844d50b72f831fcfd
X-Git-Newrev: 411e5e802175f6480725ad029161a6dbe3ac56a0
X-Patchwork-Hint: ignore
Message-Id: <20240922180447.1CA1A82684@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-path: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=411e5e802175f6480725ad029161a6dbe3ac56a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                    |  1 +
 package/python-path/Config.in        |  6 ++++++
 package/python-path/python-path.hash |  5 +++++
 package/python-path/python-path.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c0b64de7f9..fab4c1a657 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1246,6 +1246,7 @@ menu "External python modules"
 	source "package/python-paramiko/Config.in"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
+	source "package/python-path/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathspec/Config.in"
 	source "package/python-pathtools/Config.in"
diff --git a/package/python-path/Config.in b/package/python-path/Config.in
new file mode 100644
index 0000000000..a03b568593
--- /dev/null
+++ b/package/python-path/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATH
+	bool "python-path"
+	help
+	  Object-oriented file system path manipulation.
+
+	  https://github.com/jaraco/path
diff --git a/package/python-path/python-path.hash b/package/python-path/python-path.hash
new file mode 100644
index 0000000000..9a0d1a3681
--- /dev/null
+++ b/package/python-path/python-path.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/path/json
+md5  b970d0bcde985133cae6926a02e496b9  path-17.0.0.tar.gz
+sha256  e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5  path-17.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-path/python-path.mk b/package/python-path/python-path.mk
new file mode 100644
index 0000000000..6e094aaad5
--- /dev/null
+++ b/package/python-path/python-path.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-path
+#
+################################################################################
+
+PYTHON_PATH_VERSION = 17.0.0
+PYTHON_PATH_SOURCE = path-$(PYTHON_PATH_VERSION).tar.gz
+PYTHON_PATH_SITE = https://files.pythonhosted.org/packages/ff/a3/5dac44ce60ad6543578736a5729c5c2130cdac1c3117c61aad0583c2e3c6
+PYTHON_PATH_SETUP_TYPE = setuptools
+PYTHON_PATH_LICENSE = MIT
+PYTHON_PATH_LICENSE_FILES = LICENSE
+PYTHON_PATH_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
