Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED6CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75527611C3
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75527611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA8C4058C;
	Thu,  4 Nov 2021 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq8mfeYOGJeP; Thu,  4 Nov 2021 12:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E72404C3;
	Thu,  4 Nov 2021 12:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F04CB1BF25F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBFDE403B3
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vbn6wWEo6XaC for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:39:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E734D400F3
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:39:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C6E638A58B; Thu,  4 Nov 2021 12:35:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 13:38:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ffdab3eac6ea111e37fcc5077f8a64b611c55be
X-Git-Newrev: fc8f7be3fd0bd6b6460d9622dfa7d4adebd16846
X-Patchwork-Hint: ignore
Message-Id: <20211104123526.C6E638A58B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump version to 3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc8f7be3fd0bd6b6460d9622dfa7d4adebd16846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...quire-wheel-only-when-installing-from-pip.patch | 36 ----------------------
 package/python-esptool/python-esptool.hash         |  4 +--
 package/python-esptool/python-esptool.mk           |  4 +--
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch b/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
deleted file mode 100644
index 3318fa7b26..0000000000
--- a/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3f2746ad05067aad960f7a08e53f6e72c5eecd07 Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Sat, 12 Jun 2021 13:50:15 +0200
-Subject: [PATCH] setup.py: require wheel only when installing from pip
-
-Fix the build from sources (that don't require wheel)
-in environments where this module is not available.
-
-Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- Upstream status: https://github.com/espressif/esptool/pull/632
-
- setup.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 2b17b28..1a8421d 100644
---- a/setup.py
-+++ b/setup.py
-@@ -110,7 +110,11 @@ setup(
-         'Programming Language :: Python :: 3.8',
-         'Programming Language :: Python :: 3.9',
-     ],
--    setup_requires=['wheel'] if sys.version_info[0:2] not in [(3, 4), (3, 5)] else [],
-+    setup_requires=(
-+        ['wheel']
-+        if 'bdist_wheel' in sys.argv and sys.version_info[0:2] not in [(3, 4), (3, 5)] else
-+        []
-+    ),
-     extras_require={
-         "dev": [
-             'flake8>=3.2.0',
--- 
-2.32.0
-
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 7a707d34c6..a916f9a09a 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5	d62d71041896d105d7abd9e9c40f1995  esptool-3.1.tar.gz
-sha256	ec6b943c53b4d71f87f98776333d5b4b99905766898a7002c28a9090b92b2de4  esptool-3.1.tar.gz
+md5	84aa6ffb4723b1f59a2c83244a9ad918  esptool-3.2.tar.gz
+sha256	9638ff11c68e621e08e7c3335d4fd9d70b2ddcf7caae778073cd8cc27be1216f  esptool-3.2.tar.gz
 # Locally computed sha256 checksums
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 92f9bfce18..77291e252b 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 3.1
+PYTHON_ESPTOOL_VERSION = 3.2
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/9c/c8/28f21b3d3b5e1f1d249be52cdd91793c8c3f7c4f4f255ece7d50984fb05d
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/60/a4/33907f5b735f9179061bd6b6cae7123d4a2d0cdf46c879fa55e66edef24f
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
