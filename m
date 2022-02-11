Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 19:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C58D83E0F;
	Fri, 11 Feb 2022 19:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4g1stRxI2RY; Fri, 11 Feb 2022 19:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A265B83E01;
	Fri, 11 Feb 2022 19:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4458D1BF3F7
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D272860E3F
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7E3WpiP4Onmy for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 19:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E1C161C3B
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 19:10:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 52FC9825B5; Fri, 11 Feb 2022 19:02:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 20:08:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a8cea2ebcadb53d0b7545e9dd489344064d90d5
X-Git-Newrev: f4f0e2a63726efe84032c69b4f2b41a883c5e822
X-Patchwork-Hint: ignore
Message-Id: <20220211190259.52FC9825B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3-six: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4f0e2a63726efe84032c69b4f2b41a883c5e822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk         |  2 +-
 package/python-six/python-six.mk     |  1 -
 package/python3-six/python3-six.hash |  1 -
 package/python3-six/python3-six.mk   | 17 -----------------
 4 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 417a51e067..49e3b95191 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -15,7 +15,7 @@ GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
 	host-python-mako \
-	host-python3-six \
+	host-python-six \
 	host-swig \
 	boost \
 	log4cpp \
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 41ef41d0ba..9e3e5fcf50 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-six/python3-six.mk
 PYTHON_SIX_VERSION = 1.16.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
 PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
diff --git a/package/python3-six/python3-six.hash b/package/python3-six/python3-six.hash
deleted file mode 120000
index ed8cb89a6b..0000000000
--- a/package/python3-six/python3-six.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-six/python-six.hash
\ No newline at end of file
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
deleted file mode 100644
index ee9dc818ee..0000000000
--- a/package/python3-six/python3-six.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# python3-six
-#
-################################################################################
-
-# Please keep in sync with package/python-six/python-six.mk
-PYTHON3_SIX_VERSION = 1.16.0
-PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
-PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
-PYTHON3_SIX_SETUP_TYPE = setuptools
-PYTHON3_SIX_LICENSE = MIT
-PYTHON3_SIX_LICENSE_FILES = LICENSE
-HOST_PYTHON3_SIX_DL_SUBDIR = python-six
-HOST_PYTHON3_SIX_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
