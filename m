Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E26C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 22:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC418410A4;
	Thu, 10 Feb 2022 22:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8MWndGjHYXW; Thu, 10 Feb 2022 22:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB7C408FD;
	Thu, 10 Feb 2022 22:31:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5B61BF2CA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8559B607C9
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BML2oJxP6C8T for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 22:31:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15ED3607BC
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 22:31:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09A00C0006;
 Thu, 10 Feb 2022 22:31:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nIHyM-0002tG-75; Thu, 10 Feb 2022 23:31:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 23:31:27 +0100
Message-Id: <20220210223128.11002-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python3-pycparser: drop unused host
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d9bf97cf16fa6945466a67 (package/python-cryptography: drop host
variant) dropped the dependency on host-python3-pycparser, so it is now
unused.  Drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycparser/python-pycparser.mk    |  1 -
 .../python3-pycparser/python3-pycparser.hash    |  1 -
 package/python3-pycparser/python3-pycparser.mk  | 17 -----------------
 3 files changed, 19 deletions(-)
 delete mode 120000 package/python3-pycparser/python3-pycparser.hash
 delete mode 100644 package/python3-pycparser/python3-pycparser.mk

diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 20c3f641a9..1737c99a32 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pycparser/python3-pycparser.mk
 PYTHON_PYCPARSER_VERSION = 2.21
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
 PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
diff --git a/package/python3-pycparser/python3-pycparser.hash b/package/python3-pycparser/python3-pycparser.hash
deleted file mode 120000
index 7a1912cad2..0000000000
--- a/package/python3-pycparser/python3-pycparser.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pycparser/python-pycparser.hash
\ No newline at end of file
diff --git a/package/python3-pycparser/python3-pycparser.mk b/package/python3-pycparser/python3-pycparser.mk
deleted file mode 100644
index 4075f4a38f..0000000000
--- a/package/python3-pycparser/python3-pycparser.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python3-pycparser
-#
-################################################################################
-
-# Please keep in sync with package/python-pycparser/python-pycparser.mk
-PYTHON3_PYCPARSER_VERSION = 2.21
-PYTHON3_PYCPARSER_SOURCE = pycparser-$(PYTHON3_PYCPARSER_VERSION).tar.gz
-PYTHON3_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
-PYTHON3_PYCPARSER_SETUP_TYPE = setuptools
-PYTHON3_PYCPARSER_LICENSE = BSD-3-Clause
-PYTHON3_PYCPARSER_LICENSE_FILES = LICENSE
-HOST_PYTHON3_PYCPARSER_DL_SUBDIR = python-pycparser
-HOST_PYTHON3_PYCPARSER_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
