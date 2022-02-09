Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0139441559;
	Wed,  9 Feb 2022 21:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zoxle-juvfX5; Wed,  9 Feb 2022 21:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C586415B0;
	Wed,  9 Feb 2022 21:37:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1017E1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B084403A7
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5O4mpMBWOQU for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF754052C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 558528323C; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2743ce00ca61fde1537b64a165a69d497052be58
X-Git-Newrev: 532dd66e0477968cbed59f380924e9849bfbd04b
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.558528323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-backports-abc: drop python2
 specific package
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

commit: https://git.buildroot.net/buildroot/commit/?id=532dd66e0477968cbed59f380924e9849bfbd04b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                       |  6 ++++++
 package/Config.in                                      |  1 -
 package/python-backports-abc/Config.in                 |  8 --------
 package/python-backports-abc/python-backports-abc.hash |  5 -----
 package/python-backports-abc/python-backports-abc.mk   | 14 --------------
 5 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6bc3803a5c..cc1ed8f9d5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
+	bool "python-backports-abc removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON
 	bool "python2.7 package removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index ca2fb363e3..46e6b30cdf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,7 +941,6 @@ menu "External python modules"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
-	source "package/python-backports-abc/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
diff --git a/package/python-backports-abc/Config.in b/package/python-backports-abc/Config.in
deleted file mode 100644
index 43566279e8..0000000000
--- a/package/python-backports-abc/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
-	bool "python-backports-abc"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  A backport of recent additions to the 'collections.abc'
-	  module.
-
-	  https://pypi.python.org/pypi/backports_abc
diff --git a/package/python-backports-abc/python-backports-abc.hash b/package/python-backports-abc/python-backports-abc.hash
deleted file mode 100644
index 4f4c9bd1fe..0000000000
--- a/package/python-backports-abc/python-backports-abc.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/backports_abc/json
-md5 7d1936ec183a3586290adf60f6f96764 backports_abc-0.5.tar.gz
-# Locally computed
-sha256  033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde  backports_abc-0.5.tar.gz
-sha256  0a4f3b38055f50f047a42521568fa6ddb9a5976c2884f6ae138796d0f71150ca  LICENSE
diff --git a/package/python-backports-abc/python-backports-abc.mk b/package/python-backports-abc/python-backports-abc.mk
deleted file mode 100644
index 66cea1703e..0000000000
--- a/package/python-backports-abc/python-backports-abc.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-backports-abc
-#
-################################################################################
-
-PYTHON_BACKPORTS_ABC_VERSION = 0.5
-PYTHON_BACKPORTS_ABC_SOURCE = backports_abc-$(PYTHON_BACKPORTS_ABC_VERSION).tar.gz
-PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8
-PYTHON_BACKPORTS_ABC_LICENSE = Python-2.0
-PYTHON_BACKPORTS_ABC_LICENSE_FILES = LICENSE
-PYTHON_BACKPORTS_ABC_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
