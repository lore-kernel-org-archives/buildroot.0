Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F268C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE8260F35
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BE8260F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4D35400C7;
	Wed,  4 Aug 2021 00:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYp716np8LgA; Wed,  4 Aug 2021 00:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7BA404FA;
	Wed,  4 Aug 2021 00:12:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5462D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D9140EDA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8vm1VadmNeB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5B5404F9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5EC4987059; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 20:20:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 66c9559d1622cf0e0fddf59aeb1e538caaaf94c0
X-Git-Newrev: ea5c0175281838370ed1f48898088e680d1fe971
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.5EC4987059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-esptool: bump
 version to 3.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ea5c0175281838370ed1f48898088e680d1fe971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...quire-wheel-only-when-installing-from-pip.patch | 36 ++++++++++++++++++++++
 package/python-esptool/python-esptool.hash         |  4 +--
 package/python-esptool/python-esptool.mk           |  4 +--
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch b/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
new file mode 100644
index 0000000000..3318fa7b26
--- /dev/null
+++ b/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
@@ -0,0 +1,36 @@
+From 3f2746ad05067aad960f7a08e53f6e72c5eecd07 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sat, 12 Jun 2021 13:50:15 +0200
+Subject: [PATCH] setup.py: require wheel only when installing from pip
+
+Fix the build from sources (that don't require wheel)
+in environments where this module is not available.
+
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ Upstream status: https://github.com/espressif/esptool/pull/632
+
+ setup.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 2b17b28..1a8421d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -110,7 +110,11 @@ setup(
+         'Programming Language :: Python :: 3.8',
+         'Programming Language :: Python :: 3.9',
+     ],
+-    setup_requires=['wheel'] if sys.version_info[0:2] not in [(3, 4), (3, 5)] else [],
++    setup_requires=(
++        ['wheel']
++        if 'bdist_wheel' in sys.argv and sys.version_info[0:2] not in [(3, 4), (3, 5)] else
++        []
++    ),
+     extras_require={
+         "dev": [
+             'flake8>=3.2.0',
+-- 
+2.32.0
+
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 3b030ec75b..7a707d34c6 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5	ccd2855e14c298712aeb37ac063baad5  esptool-3.0.tar.gz
-sha256	87953d235fed2c9adb1292b3769df0149686c9afdb1896dd963f730453cbc934  esptool-3.0.tar.gz
+md5	d62d71041896d105d7abd9e9c40f1995  esptool-3.1.tar.gz
+sha256	ec6b943c53b4d71f87f98776333d5b4b99905766898a7002c28a9090b92b2de4  esptool-3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index e9e3eb6b59..92f9bfce18 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 3.0
+PYTHON_ESPTOOL_VERSION = 3.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/dd/3d/d1d4c004927e6e6807c441ce70330ed969c725d2906053fbd2ff994b4439
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/9c/c8/28f21b3d3b5e1f1d249be52cdd91793c8c3f7c4f4f255ece7d50984fb05d
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
