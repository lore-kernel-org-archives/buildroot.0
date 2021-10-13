Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D90C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC37560D07
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC37560D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8389F40804;
	Wed, 13 Oct 2021 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fzbqPicRqHr5; Wed, 13 Oct 2021 20:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04FCB4085E;
	Wed, 13 Oct 2021 20:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11DC91BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2991C60B06
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EM-wPEkjA5v for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD2960D74
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9886F95BC6; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c926c65aad73004fc2244e8ecee8ce03aa3c8e6
X-Git-Newrev: c86832f63805f1be1f126ea4a9cbeed0b0c9657a
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.9886F95BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-socketio: bump to version
 5.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c86832f63805f1be1f126ea4a9cbeed0b0c9657a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove six dependency which is no longer required.

Add new bidict dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-socketio/Config.in            |  2 +-
 package/python-socketio/python-socketio.hash |  6 +++---
 package/python-socketio/python-socketio.mk   | 14 ++------------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/python-socketio/Config.in b/package/python-socketio/Config.in
index 096e75a623..89d23b6ddf 100644
--- a/package/python-socketio/Config.in
+++ b/package/python-socketio/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_SOCKETIO
 	bool "python-socketio"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_BIDICT # runtime
 	select BR2_PACKAGE_PYTHON_ENGINEIO # runtime
 	help
 	  Socket.IO server.
diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
index d0d8a87dcf..40e74cef96 100644
--- a/package/python-socketio/python-socketio.hash
+++ b/package/python-socketio/python-socketio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-socketio/json
-md5	86cd47dddea1785ce7a6c72f55c93fe7  python-socketio-4.3.1.tar.gz
-sha256	506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57  python-socketio-4.3.1.tar.gz
+md5  0507825ca4bd6527cbaed81ec5767bfe  python-socketio-5.4.0.tar.gz
+sha256  ca807c9e1f168e96dea412d64dd834fb47c470d27fd83da0504aa4b248ba2544  python-socketio-5.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
+sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
index 73dab26f3c..f23342b776 100644
--- a/package/python-socketio/python-socketio.mk
+++ b/package/python-socketio/python-socketio.mk
@@ -4,20 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SOCKETIO_VERSION = 4.3.1
-PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/36/87/e9128a4da04df991fbdb01f44dc4d6dd8f6c03bfd4d1f42dcd6779fd975a
+PYTHON_SOCKETIO_VERSION = 5.4.0
+PYTHON_SOCKETIO_SITE = https://files.pythonhosted.org/packages/72/70/9b992f4b8adfcbf0724c079c18629d83f20b36fb0eb64d4fdf874054becf
 PYTHON_SOCKETIO_SETUP_TYPE = setuptools
 PYTHON_SOCKETIO_LICENSE = MIT
 PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-# only needed/valid for python 3.x
-define PYTHON_SOCKETIO_RM_PY3_FILES
-	rm -f $(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asgi.py \
-		$(TARGET_DIR)/usr/lib/python*/site-packages/socketio/asyncio_*.py
-endef
-
-PYTHON_SOCKETIO_POST_INSTALL_TARGET_HOOKS += PYTHON_SOCKETIO_RM_PY3_FILES
-endif
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
