Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B769C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 12:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11FBF40191;
	Sun, 11 Jun 2023 12:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FBF40191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrW0gvUTMd-Y; Sun, 11 Jun 2023 12:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F464012D;
	Sun, 11 Jun 2023 12:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F464012D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91F8B1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C0A08340C
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C0A08340C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPPCyYTc6VOa for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 12:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAE783417
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EAE783417
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 12:31:12 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout04.t-online.de (Postfix) with SMTP id 029AB35DF;
 Sun, 11 Jun 2023 14:31:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8KDs-2uTrBh0; Sun, 11 Jun 2023 14:31:08 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33660)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8KDs-0001lo-0l;
 Sun, 11 Jun 2023 14:31:08 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 14:31:07 +0200
Message-Id: <20230611123108.372959-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686486668-327FBCD8-1374D0BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 9c640cc2-985b-4104-ad40-dae03b87dfb6
Subject: [Buildroot] [PATCH 1/2] package/python-pyicu: bump version to 2.11
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated help text to follow upstream move to gitlab.

This version bump introduces compatibility with icu 73-1:
https://gitlab.pyicu.org/main/pyicu/-/commit/1ba50901161acfce691d41308be6c004a3956f4e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
index 512b2f857f..090ed51bff 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
