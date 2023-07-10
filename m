Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CE0EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC34440B98;
	Mon, 10 Jul 2023 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC34440B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiMGL1GR0wb8; Mon, 10 Jul 2023 20:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7D6B40B99;
	Mon, 10 Jul 2023 20:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D6B40B99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 484721BF399
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D4EF4177F
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4EF4177F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlM15Lol_VMo for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:12:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E520E4177E
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E520E4177E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D01E386D2C; Mon, 10 Jul 2023 20:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 22:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8e000b1866fdc2dbb2c57fbfe66f62a80167f18
X-Git-Newrev: 84da7d929113881aad6a4f57ba1f21c54554b3e7
X-Patchwork-Hint: ignore
Message-Id: <20230710201248.D01E386D2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyicu: bump version to 2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=84da7d929113881aad6a4f57ba1f21c54554b3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated help text to follow upstream move to gitlab.

This version bump introduces compatibility with icu 73-1:
https://gitlab.pyicu.org/main/pyicu/-/commit/1ba50901161acfce691d41308be6c004a3956f4e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyicu/Config.in         | 2 +-
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index 93eac53387..cbd75c0119 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_PYICU
 	help
 	  Python extension wrapping the ICU C++ API.
 
-	  https://github.com/ovalhub/pyicu
+	  https://gitlab.pyicu.org/main/pyicu
 
 comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
 	depends on !BR2_BINFMT_FLAT
diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 009b264336..395d2fe47b 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  4090ebb98702338cac3dbed2d72c2fd7  PyICU-2.10.2.tar.gz
-sha256  0c3309eea7fab6857507ace62403515b60fe096cbfb4f90d14f55ff75c5441c1  PyICU-2.10.2.tar.gz
+md5  f13ffa91014efde6962c4c1ed6ee7a3c  PyICU-2.11.tar.gz
+sha256  3ab531264cfe9132b3d2ac5d708da9a4649d25f6e6813730ac88cf040a08a844  PyICU-2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 53e4a15c4f..213c099d07 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.10.2
+PYTHON_PYICU_VERSION = 2.11
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/64/00/a531e119a97e54601f616f5061879ec2d4bb058d225014f9acf94b2970c3
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/03/1b/800fce0236be0b8a99b3ccbb797786dd178028960b3fd65544e2d8bad5ac
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
