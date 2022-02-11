Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8786460E40;
	Fri, 11 Feb 2022 19:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-dUfSQKncig; Fri, 11 Feb 2022 19:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9A7960B12;
	Fri, 11 Feb 2022 19:13:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 795C71BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 970A060E40
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1ALBh68llfG for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CFBB61C31
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 484B2825B5; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:08:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3730ae991107d338b4acab5e617c9ff0cd754a4
X-Git-Newrev: 2a8cea2ebcadb53d0b7545e9dd489344064d90d5
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.484B2825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-regex: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a8cea2ebcadb53d0b7545e9dd489344064d90d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped and
instead host support added to python-regex.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk               |  2 +-
 package/python-regex/python-regex.mk     |  1 +
 package/python3-regex/python3-regex.hash |  1 -
 package/python3-regex/python3-regex.mk   | 16 ----------------
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index e2a58a5f4e..9f6c7d31b8 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -19,7 +19,7 @@ MONGODB_DEPENDENCIES = \
 	host-python-cheetah \
 	host-python-psutil \
 	host-python-pyyaml \
-	host-python3-regex \
+	host-python-regex \
 	host-python-requests \
 	host-scons \
 	pcre \
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index c46c4d1614..a90fd579ac 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -12,3 +12,4 @@ PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = CNRI-Python
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python3-regex/python3-regex.hash b/package/python3-regex/python3-regex.hash
deleted file mode 120000
index 274f4dc277..0000000000
--- a/package/python3-regex/python3-regex.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-regex/python-regex.hash
\ No newline at end of file
diff --git a/package/python3-regex/python3-regex.mk b/package/python3-regex/python3-regex.mk
deleted file mode 100644
index 0b71768e9d..0000000000
--- a/package/python3-regex/python3-regex.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-regex
-#
-################################################################################
-
-# Please keep in sync with package/python-regex/python-regex.mk
-PYTHON3_REGEX_VERSION = 2021.4.4
-PYTHON3_REGEX_SOURCE = regex-$(PYTHON3_REGEX_VERSION).tar.gz
-PYTHON3_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
-PYTHON3_REGEX_SETUP_TYPE = setuptools
-PYTHON3_REGEX_LICENSE = CNRI-Python
-HOST_PYTHON3_REGEX_DL_SUBDIR = python-regex
-HOST_PYTHON3_REGEX_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
