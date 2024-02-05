Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FAEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6056101D;
	Mon,  5 Feb 2024 13:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6056101D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owzR6Jlgs85w; Mon,  5 Feb 2024 13:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E2861029;
	Mon,  5 Feb 2024 13:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E2861029
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69B0C1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A54826A8
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A54826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxqFfV73hhPS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66E53826A4
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E53826A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FF7286C31; Mon,  5 Feb 2024 13:27:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 14:26:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11bc1d76bafd858b9178c22c8e0d7e60dde1ebbf
X-Git-Newrev: 7d91366dac08f26ce023c757631ccb6cd9e2f2ea
X-Patchwork-Hint: ignore
Message-Id: <20240205132708.4FF7286C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tempora: bump to version
 5.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d91366dac08f26ce023c757631ccb6cd9e2f2ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to copyright notice removal:
https://github.com/jaraco/tempora/commit/5957d58266e479f124b31f30e4322e798fdf386b

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tempora/Config.in           | 1 -
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index 508cbae3f3..3f4481422a 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Objects and routines pertaining to date and time.
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index ac6483b77f..ff7093394f 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  87fc0d99edd557323e61a16017707a8b  tempora-5.2.0.tar.gz
-sha256  af82eb016decda8daf566d1e4836f94f7f8ba8c7153637460156e081aadc64df  tempora-5.2.0.tar.gz
+md5  39314c5843bc3f40f8ce4f5cc340c479  tempora-5.5.0.tar.gz
+sha256  13e4fcc997d0509c3306d6841f03e9381b7e5e46b2bebfae9151af90085f0c26  tempora-5.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 3074ad0de2..d1b333ec0a 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.2.0
+PYTHON_TEMPORA_VERSION = 5.5.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/97/70/5cf5031a83ca6d0431a53459b2a98aa387ba23d06710a5e48d681ff3956f
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c9/dc/97d90b9f64dbe4f599023e19602b33a2cced68462db67a3d4805a77cf784
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
