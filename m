Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20316C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8EF41EA3;
	Tue,  6 Feb 2024 10:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8EF41EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AL8xmf9TdS2; Tue,  6 Feb 2024 10:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD2F9415CA;
	Tue,  6 Feb 2024 10:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2F9415CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E347B1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D497541559
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D497541559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6R6MGiRafd1e for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:34:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA5CA4175F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA5CA4175F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E6B86F9D; Tue,  6 Feb 2024 10:34:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:28:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff17367e73119a26a0b763cb5484938ed7bbca05
X-Git-Newrev: 40af3cb08a26b797370fd99c51954831edd6a966
X-Patchwork-Hint: ignore
Message-Id: <20240206103428.D6E6B86F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump to version
 4.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=40af3cb08a26b797370fd99c51954831edd6a966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-intelhex runtime dependency.

Add new python-pyyaml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-esptool/Config.in           | 2 ++
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 36243fa89e..4099957971 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	select BR2_PACKAGE_PYTHON_INTELHEX # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 	select BR2_PACKAGE_PYTHON_REEDSOLO # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 25fea229b0..490b4e7e9c 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  17853949fd582550a7c270f08d7691d4  esptool-4.6.2.tar.gz
-sha256  549ef93eef42ee7e9462ce5a53c16df7a0c71d91b3f77e19ec15749804cdf300  esptool-4.6.2.tar.gz
+md5  e7f2012cf31cd23f60049b179fb3b53a  esptool-4.7.0.tar.gz
+sha256  01454e69e1ef3601215db83ff2cb1fc79ece67d24b0e5d43d451b410447c4893  esptool-4.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index c0709c64b1..f5aaface74 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.6.2
+PYTHON_ESPTOOL_VERSION = 4.7.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/a3/63/c757f50b606996a7e676f000b40626f65be63b3a10030563929c968e431c
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879dee053874a4f955ed1e9ad97275485f51cb4bc2cb4e9b24479
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
