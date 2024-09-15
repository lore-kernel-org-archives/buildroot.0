Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE09C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA67A81DFF;
	Sun, 15 Sep 2024 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnDZcnuxfO8F; Sun, 15 Sep 2024 21:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49242847D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49242847D4;
	Sun, 15 Sep 2024 21:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 107FB1BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34E6540A20
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjY3IzqV39eC for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47BA240A19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47BA240A19
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4441B83683; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:12:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ccd05f35dbd5ad0d2d6682bbf764d69d59b3594
X-Git-Newrev: 35c578f25609c6c7afbbb01265b6678afa225a70
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.4441B83683@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiozero: bump to version
 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=35c578f25609c6c7afbbb01265b6678afa225a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove no longer required python-rpi-gpio runtime dependency.

Remove no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gpiozero/Config.in            | 2 --
 package/python-gpiozero/python-gpiozero.hash | 4 ++--
 package/python-gpiozero/python-gpiozero.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Config.in
index 93e5de3e55..c5f3880ea9 100644
--- a/package/python-gpiozero/Config.in
+++ b/package/python-gpiozero/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_PYTHON_GPIOZERO
 	bool "python-gpiozero"
 	depends on BR2_arm
 	select BR2_PACKAGE_PYTHON_COLORZERO # runtime
-	select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  A simple interface to GPIO devices with Raspberry Pi.
 
diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index d019b54346..e9266886f0 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiozero/json
-md5  b8b63443961de2710d88b82671ec6d8a  gpiozero-2.0.tar.gz
-sha256  403bcc9e7f24f0877653e7fced91ba51508d5197c9d1f80e383fe6693b9c3c27  gpiozero-2.0.tar.gz
+md5  ed36bee070df2a8788c2038d585146db  gpiozero-2.0.1.tar.gz
+sha256  d4ea1952689ec7e331f9d4ebc9adb15f1d01c2c9dcfabb72e752c9869ab7e97e  gpiozero-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index bce7644a34..cc06abc118 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 2.0
+PYTHON_GPIOZERO_VERSION = 2.0.1
 PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
-PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/b3/a7/85676e0689114ea08ea3c88b7813efd988a9ead64dc9e1b24545b17af4fd
+PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/e4/47/334b8db8a981eca9a0fb1e7e48e1997a5eaa8f40bb31c504299dcca0e6ff
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
