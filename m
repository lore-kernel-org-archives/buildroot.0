Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75625C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8B3402FD;
	Mon,  6 Nov 2023 22:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B8B3402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pb6deGLGIvh8; Mon,  6 Nov 2023 22:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53444420AE;
	Mon,  6 Nov 2023 22:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53444420AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E65C1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E95784177E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95784177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EPBl2ax_QXCc for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 150AE4081F
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 150AE4081F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 132A586B72; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77ceef288cee55aba2b1d5793feb0f0b0675ff6b
X-Git-Newrev: 8c10243bcca6a520708a8d298a00bf343aebfcde
X-Patchwork-Hint: ignore
Message-Id: <20231106222018.132A586B72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-classes: bump to
 version 3.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c10243bcca6a520708a8d298a00bf343aebfcde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six runtime dependency.

Add new python-more-itertools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-classes/Config.in                  | 2 +-
 package/python-jaraco-classes/python-jaraco-classes.hash | 6 +++---
 package/python-jaraco-classes/python-jaraco-classes.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-classes/Config.in b/package/python-jaraco-classes/Config.in
index 05c11237ab..6d79062a18 100644
--- a/package/python-jaraco-classes/Config.in
+++ b/package/python-jaraco-classes/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_JARACO_CLASSES
 	bool "python-jaraco-classes"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	help
 	  Utility functions for Python class constructs.
 
diff --git a/package/python-jaraco-classes/python-jaraco-classes.hash b/package/python-jaraco-classes/python-jaraco-classes.hash
index 0e170d58d1..701aa07b83 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.hash
+++ b/package/python-jaraco-classes/python-jaraco-classes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.classes/json
-md5  a661acdae43995c08500324a8df62f03  jaraco.classes-3.2.3.tar.gz
-sha256  89559fa5c1d3c34eff6f631ad80bb21f378dbcbb35dd161fd2c6b93f5be2f98a  jaraco.classes-3.2.3.tar.gz
+md5  26ae65ab8cda78455ddab0b05fe0a553  jaraco.classes-3.3.0.tar.gz
+sha256  c063dd08e89217cee02c8d5e5ec560f2c8ce6cdc2fcdc2e68f7b2e5547ed3621  jaraco.classes-3.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 4790516330..45950556b0 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CLASSES_VERSION = 3.2.3
+PYTHON_JARACO_CLASSES_VERSION = 3.3.0
 PYTHON_JARACO_CLASSES_SOURCE = jaraco.classes-$(PYTHON_JARACO_CLASSES_VERSION).tar.gz
-PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/bf/02/a956c9bfd2dfe60b30c065ed8e28df7fcf72b292b861dca97e951c145ef6
+PYTHON_JARACO_CLASSES_SITE = https://files.pythonhosted.org/packages/8b/de/d0a466824ce8b53c474bb29344e6d6113023eb2c3793d1c58c0908588bfa
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
