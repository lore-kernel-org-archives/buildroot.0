Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3B9C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFAC40A12;
	Fri, 11 Feb 2022 19:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voyYSyRnHhFD; Fri, 11 Feb 2022 19:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D974040A41;
	Fri, 11 Feb 2022 19:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 415581C116E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66BF260BEA
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrFtCy7N_WBl for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FADE60E3F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0AEBA825B5; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 866b42ce4985affd0ab578e15b77eac1dc6533a5
X-Git-Newrev: f2b862405abbafd68520f167ccb8b03975dc3aea
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.0AEBA825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-ply: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2b862405abbafd68520f167ccb8b03975dc3aea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk       |  2 +-
 package/python-ply/python-ply.mk     |  1 -
 package/python3-ply/python3-ply.hash |  1 -
 package/python3-ply/python3-ply.mk   | 16 ----------------
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 534d8d2637..7cd4bfa758 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -11,7 +11,7 @@ LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
 	host-python-jinja2 \
-	host-python3-ply \
+	host-python-ply \
 	host-python-pyyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 50a3e32bc2..5dc7964d5f 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-ply/python3-ply.mk
 PYTHON_PLY_VERSION = 3.11
 PYTHON_PLY_SOURCE = ply-$(PYTHON_PLY_VERSION).tar.gz
 PYTHON_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
diff --git a/package/python3-ply/python3-ply.hash b/package/python3-ply/python3-ply.hash
deleted file mode 120000
index 5e07165c93..0000000000
--- a/package/python3-ply/python3-ply.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-ply/python-ply.hash
\ No newline at end of file
diff --git a/package/python3-ply/python3-ply.mk b/package/python3-ply/python3-ply.mk
deleted file mode 100644
index 15f66a49db..0000000000
--- a/package/python3-ply/python3-ply.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-ply
-#
-################################################################################
-
-PYTHON3_PLY_VERSION = 3.11
-PYTHON3_PLY_SOURCE = ply-$(PYTHON3_PLY_VERSION).tar.gz
-PYTHON3_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
-PYTHON3_PLY_SETUP_TYPE = setuptools
-PYTHON3_PLY_LICENSE = BSD-3-Clause
-PYTHON3_PLY_LICENSE_FILES = README.md
-
-HOST_PYTHON3_PLY_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
