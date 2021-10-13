Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ABAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9044560D07
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9044560D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFDF4082B;
	Wed, 13 Oct 2021 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YVdd5U2HrJw; Wed, 13 Oct 2021 20:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901CE40863;
	Wed, 13 Oct 2021 20:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5411BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 422D44052F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFKG6F_IIDVI for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FEC340538
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8163295B2C; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:47:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a518cbda12290ff51b12d1ccbdd7c0d533ba09
X-Git-Newrev: 74523a644b2482808b69ac4c9e71484549c0c89b
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.8163295B2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=74523a644b2482808b69ac4c9e71484549c0c89b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python2 support and propagate reverse dependency.

Remove six dependency as it is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-engineio/Config.in            |  5 ++---
 package/python-engineio/python-engineio.hash |  4 ++--
 package/python-engineio/python-engineio.mk   | 14 ++------------
 package/python-socketio/Config.in            |  1 +
 4 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/package/python-engineio/Config.in b/package/python-engineio/Config.in
index b12db922a2..48f3391e53 100644
--- a/package/python-engineio/Config.in
+++ b/package/python-engineio/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_ENGINEIO
 	bool "python-engineio"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  Engine.IO server.
 
diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index ef852cf1ad..5762303af0 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  e6ea8b3f2f32eeeb02014c46092f2adb  python-engineio-3.12.1.tar.gz
-sha256  2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916  python-engineio-3.12.1.tar.gz
+md5  d2bc7184d64e9d5a692bfad29ff73dea  python-engineio-4.2.1.tar.gz
+sha256  d510329b6d8ed5662547862f58bc73659ae62defa66b66d745ba021de112fa62  python-engineio-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 4f835da0a4..81bd49fb64 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,21 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 3.12.1
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce993001cbccc80dd786ab09a16a8e3f6c4878ad05f051064d6
+PYTHON_ENGINEIO_VERSION = 4.2.1
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/74/1e/33e402011bb2fe33ab12762e5a66d66df1d47302a23e9c5e8310e11b1403
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
 PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_ENGINEIO_RM_PY3_FILES
-	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/engineio/async_drivers \
-		$(TARGET_DIR)/usr/lib/python*/site-packages/engineio/asyncio_*.py
-endef
-
-PYTHON_ENGINEIO_POST_INSTALL_TARGET_HOOKS += PYTHON_ENGINEIO_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
diff --git a/package/python-socketio/Config.in b/package/python-socketio/Config.in
index af0f6f32e8..096e75a623 100644
--- a/package/python-socketio/Config.in
+++ b/package/python-socketio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SOCKETIO
 	bool "python-socketio"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_ENGINEIO # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
