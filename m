Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD394C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F49F416CE;
	Fri, 11 Feb 2022 19:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHvZp1Mt2B0X; Fri, 11 Feb 2022 19:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6EE941675;
	Fri, 11 Feb 2022 19:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54F871BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F27C61C2C
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6wpL6IWhDsh for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5360260E7A
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F9E0825B5; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:07:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aab7bc4a1d499b3f926464290eee3d6459d0e816
X-Git-Newrev: 5211de7d789ba8c9eaf649612711a40d02f3eec9
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.1F9E0825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-pycparser: drop unused
 host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5211de7d789ba8c9eaf649612711a40d02f3eec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d9bf97cf16fa6945466a67 (package/python-cryptography: drop host
variant) dropped the dependency on host-python3-pycparser, so it is now
unused.  Drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycparser/python-pycparser.mk     |  1 -
 package/python3-pycparser/python3-pycparser.hash |  1 -
 package/python3-pycparser/python3-pycparser.mk   | 17 -----------------
 3 files changed, 19 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
