Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA4EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8CC61C2C;
	Fri, 11 Feb 2022 19:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpTIFriWL5xS; Fri, 11 Feb 2022 19:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61E1060E5A;
	Fri, 11 Feb 2022 19:11:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD051C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A6F460E40
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVGmN4T9lNzF for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A97260BEA
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EB22582DDC; Fri, 11 Feb 2022 19:02:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:06:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caca05020d1e2cc1d9ab9202abab44e13bda73fd
X-Git-Newrev: 255e7030f199ebb98ce6e6f283289a95c8f0f0a8
X-Patchwork-Hint: ignore
Message-Id: <20220211190258.EB22582DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-cheetah: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=255e7030f199ebb98ce6e6f283289a95c8f0f0a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk                   |  2 +-
 package/python-cheetah/python-cheetah.mk     |  1 -
 package/python3-cheetah/python3-cheetah.hash |  1 -
 package/python3-cheetah/python3-cheetah.mk   | 18 ------------------
 4 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 311b9de14e..2a5e00be79 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -16,7 +16,7 @@ MONGODB_SELINUX_MODULES = mongodb
 
 MONGODB_DEPENDENCIES = \
 	boost \
-	host-python3-cheetah \
+	host-python-cheetah \
 	host-python3-psutil \
 	host-python-pyyaml \
 	host-python3-regex \
diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
index 02877e03c4..92688f6ced 100644
--- a/package/python-cheetah/python-cheetah.mk
+++ b/package/python-cheetah/python-cheetah.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-cheetah/python3-cheetah.mk
 PYTHON_CHEETAH_VERSION = 3.2.6.post2
 PYTHON_CHEETAH_SOURCE = Cheetah3-$(PYTHON_CHEETAH_VERSION).tar.gz
 PYTHON_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
diff --git a/package/python3-cheetah/python3-cheetah.hash b/package/python3-cheetah/python3-cheetah.hash
deleted file mode 120000
index c29a76ea80..0000000000
--- a/package/python3-cheetah/python3-cheetah.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-cheetah/python-cheetah.hash
\ No newline at end of file
diff --git a/package/python3-cheetah/python3-cheetah.mk b/package/python3-cheetah/python3-cheetah.mk
deleted file mode 100644
index 93d16201aa..0000000000
--- a/package/python3-cheetah/python3-cheetah.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python3-cheetah
-#
-################################################################################
-
-# Please keep in sync with
-# package/python-cheetah/python-cheetah.mk
-PYTHON3_CHEETAH_VERSION = 3.2.6.post2
-PYTHON3_CHEETAH_SOURCE = Cheetah3-$(PYTHON3_CHEETAH_VERSION).tar.gz
-PYTHON3_CHEETAH_SITE = https://files.pythonhosted.org/packages/c0/97/c3fa47e223207e6ca6b501a954c5c959ed3e99f2a1ceec9918238ce38418
-PYTHON3_CHEETAH_LICENSE = MIT
-PYTHON3_CHEETAH_LICENSE_FILES = LICENSE
-PYTHON3_CHEETAH_SETUP_TYPE = setuptools
-HOST_PYTHON3_CHEETAH_DL_SUBDIR = python-cheetah
-HOST_PYTHON3_CHEETAH_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
