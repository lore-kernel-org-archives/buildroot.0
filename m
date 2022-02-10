Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 22:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9AE82F41;
	Thu, 10 Feb 2022 22:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9ya5isUnXXj; Thu, 10 Feb 2022 22:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9ED82D57;
	Thu, 10 Feb 2022 22:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67AED1BF2CA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F4982B9F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLgXTkAoi7U6 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 22:40:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 795ED82907
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 22:40:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA236FF804;
 Thu, 10 Feb 2022 22:40:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nII7R-00038c-6L; Thu, 10 Feb 2022 23:40:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 23:40:46 +0100
Message-Id: <20220210224047.11992-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220210224047.11992-1-peter@korsgaard.com>
References: <20220210224047.11992-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/python3-psutil: drop host package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk                 |  2 +-
 package/python-psutil/python-psutil.mk     |  1 -
 package/python3-psutil/python3-psutil.hash |  1 -
 package/python3-psutil/python3-psutil.mk   | 19 -------------------
 4 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 120000 package/python3-psutil/python3-psutil.hash
 delete mode 100644 package/python3-psutil/python3-psutil.mk

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
