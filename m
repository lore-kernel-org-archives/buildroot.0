Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A36C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A85394051A;
	Wed,  2 Feb 2022 10:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vELDAvEpr-HS; Wed,  2 Feb 2022 10:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4312C404AF;
	Wed,  2 Feb 2022 10:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F08251BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C25560B31
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZknfAVoilRQ for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABF5960A83
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9AFDE829F9; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:17:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea80e29647dafea9aa2312838a13527be28d3fc1
X-Git-Newrev: 414fa848445eaede01264ad9d8374585b18a95c0
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.9AFDE829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssutils: bump to version
 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=414fa848445eaede01264ad9d8374585b18a95c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python2 support.

Add new host-python-setuptools-scm dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cssutils/Config.in            | 4 ++--
 package/python-cssutils/python-cssutils.hash | 6 +++---
 package/python-cssutils/python-cssutils.mk   | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-cssutils/Config.in b/package/python-cssutils/Config.in
index 74de742c31..141561901c 100644
--- a/package/python-cssutils/Config.in
+++ b/package/python-cssutils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_CSSUTILS
 	bool "python-cssutils"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  A CSS Cascading Style Sheets library for Python.
 
diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
index 393daffb8b..e22dde6e56 100644
--- a/package/python-cssutils/python-cssutils.hash
+++ b/package/python-cssutils/python-cssutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssutils/json
-md5	dc66d96c2d78f1687f59ac412fe9d318  cssutils-1.0.2.tar.gz
-sha256	a2fcf06467553038e98fea9cfe36af2bf14063eb147a70958cfcaa8f5786acaf  cssutils-1.0.2.tar.gz
+md5  71955999f595e4b0eb5a218d614652ca  cssutils-2.3.0.tar.gz
+sha256  b2d3b16047caae82e5c590036935bafa1b621cf45c2f38885af4be4838f0fd00  cssutils-2.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256	03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
+sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
index 513c3a87de..09c2ca44d6 100644
--- a/package/python-cssutils/python-cssutils.mk
+++ b/package/python-cssutils/python-cssutils.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CSSUTILS_VERSION = 1.0.2
+PYTHON_CSSUTILS_VERSION = 2.3.0
 PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
-PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/5c/0b/c5f29d29c037e97043770b5e7c740b6252993e4b57f029b3cd03c78ddfec
+PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f5/c6/878abb7df855938a067b762a688da3fcdfea4e41c2399feaf80369b61ed7
 PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 PYTHON_CSSUTILS_SETUP_TYPE = setuptools
+PYTHON_CSSUTILS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
