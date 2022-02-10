Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 22:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D54408FD;
	Thu, 10 Feb 2022 22:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqH9FI_stTvg; Thu, 10 Feb 2022 22:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716AD408F5;
	Thu, 10 Feb 2022 22:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547601BF2CA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F97082B9F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMDnzU3LF7Sd for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 22:40:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3233D82907
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 22:40:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5531CC0004;
 Thu, 10 Feb 2022 22:40:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nII7P-00038J-Jy; Thu, 10 Feb 2022 23:40:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 23:40:43 +0100
Message-Id: <20220210224047.11992-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220210224047.11992-1-peter@korsgaard.com>
References: <20220210224047.11992-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/python3-cheetah: drop host package
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.mk                   |  2 +-
 package/python-cheetah/python-cheetah.mk     |  1 -
 package/python3-cheetah/python3-cheetah.hash |  1 -
 package/python3-cheetah/python3-cheetah.mk   | 18 ------------------
 4 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 120000 package/python3-cheetah/python3-cheetah.hash
 delete mode 100644 package/python3-cheetah/python3-cheetah.mk

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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
