Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95773404C9;
	Sun, 11 Dec 2022 09:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95773404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36CFhz5ICviZ; Sun, 11 Dec 2022 09:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEC92403A7;
	Sun, 11 Dec 2022 09:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEC92403A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0A191BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BE0409FE
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BE0409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhXYw8BUaayh for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C96E4093F
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C96E4093F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 369E885FAB; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ef0959eabce0cf3f155b8959fdd06e6018c86e7
X-Git-Newrev: 25b67238f53867f40b485b79eddaa7ef6fad9ca4
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.369E885FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump to version 4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=25b67238f53867f40b485b79eddaa7ef6fad9ca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required pyaes runtime dependency.

Add new bitstring, cryptography and reedsolo runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-esptool/Config.in           | 5 ++++-
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index b21ccd72d5..36243fa89e 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_PYTHON_ESPTOOL
 	bool "python-esptool"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
-	select BR2_PACKAGE_PYTHON_PYAES # runtime
+	select BR2_PACKAGE_PYTHON_REEDSOLO # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 7e523a7027..b7246f9788 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  973b63eac1391d3491846d8676c783e7  esptool-4.3.tar.gz
-sha256  03d00312eef258baf83faefd0b912b2251dd0440242da9dcb1b18fe75ed614c3  esptool-4.3.tar.gz
+md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
+sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 3f33fd7865..0a71e1a78b 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.3
+PYTHON_ESPTOOL_VERSION = 4.4
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5b/d7/0dae311a94a490d7b7af2f4fab079b34f6244c6129017997bc994f7b360b
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
