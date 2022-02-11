Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E6560E7A;
	Fri, 11 Feb 2022 19:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6r8JfmlyWQyi; Fri, 11 Feb 2022 19:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B664B60BEA;
	Fri, 11 Feb 2022 19:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2361BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F1583E7A
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2CvHHgf8m4b for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 586F783E34
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1655482DDC; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2b862405abbafd68520f167ccb8b03975dc3aea
X-Git-Newrev: aab7bc4a1d499b3f926464290eee3d6459d0e816
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.1655482DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-psutil: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=aab7bc4a1d499b3f926464290eee3d6459d0e816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk                 |  2 +-
 package/python-psutil/python-psutil.mk     |  1 -
 package/python3-psutil/python3-psutil.hash |  1 -
 package/python3-psutil/python3-psutil.mk   | 19 -------------------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 2a5e00be79..e2a58a5f4e 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -17,7 +17,7 @@ MONGODB_SELINUX_MODULES = mongodb
 MONGODB_DEPENDENCIES = \
 	boost \
 	host-python-cheetah \
-	host-python3-psutil \
+	host-python-psutil \
 	host-python-pyyaml \
 	host-python3-regex \
 	host-python-requests \
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 3bba7ca343..413fc8a391 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-psutil/python3-psutil.mk
 PYTHON_PSUTIL_VERSION = 5.8.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
 PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
diff --git a/package/python3-psutil/python3-psutil.hash b/package/python3-psutil/python3-psutil.hash
deleted file mode 120000
index ff688fab28..0000000000
--- a/package/python3-psutil/python3-psutil.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-psutil/python-psutil.hash
\ No newline at end of file
diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
deleted file mode 100644
index 1304124f57..0000000000
--- a/package/python3-psutil/python3-psutil.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-psutil
-#
-################################################################################
-
-# Please keep in sync with package/python-psutil/python-psutil.mk
-PYTHON3_PSUTIL_VERSION = 5.8.0
-PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
-PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
-PYTHON3_PSUTIL_SETUP_TYPE = setuptools
-PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
-PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
-PYTHON3_PSUTIL_CPE_ID_VENDOR = psutil_project
-PYTHON3_PSUTIL_CPE_ID_PRODUCT = psutil
-HOST_PYTHON3_PSUTIL_DL_SUBDIR = python-psutil
-HOST_PYTHON3_PSUTIL_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
