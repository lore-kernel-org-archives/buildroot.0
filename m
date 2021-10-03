Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B17DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:26:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 367406124C
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 367406124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0955060AE2;
	Sun,  3 Oct 2021 08:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhZM_pf8g0uO; Sun,  3 Oct 2021 08:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B82660AD7;
	Sun,  3 Oct 2021 08:26:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8DB1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 977D340544
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGWf1TFSGA9e for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3385740556
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:23:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8BD048DB40; Sun,  3 Oct 2021 08:20:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 10:22:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c1a9b2f1cdd7d4306364edc472606ee623cb64d
X-Git-Newrev: 1702e06a771f15f2331be7d756cd10e68e1f5997
X-Patchwork-Hint: ignore
Message-Id: <20211003082055.8BD048DB40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump to version
 3.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1702e06a771f15f2331be7d756cd10e68e1f5997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't python2 anymore.
* Indent with two spaces in the hash file.
* License changes was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-xlsxwriter/Config.in              | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.hash | 8 ++++----
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-xlsxwriter/Config.in b/package/python-xlsxwriter/Config.in
index 3641bd0525..b5da7f3f1a 100644
--- a/package/python-xlsxwriter/Config.in
+++ b/package/python-xlsxwriter/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_XLSXWRITER
 	bool "python-xlsxwriter"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  A Python module for creating Excel XLSX files.
 
diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 59890b725e..7c9698067b 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/XlsxWriter/json
-md5	799bf9c16ff58a7c38509b1895b7bc63  XlsxWriter-1.2.2.tar.gz
-sha256	5a5e2195a4672d17db79839bbdf1006a521adb57eaceea1c335ae4b3d19f088f  XlsxWriter-1.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
+md5  5f759dccf222e8f2a9924e90c4afaf84  XlsxWriter-3.0.1.tar.gz
+sha256  3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a  XlsxWriter-3.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	777cb44c00ba1c2905686fa32f2ca3ba17422b96fc229be3d8f0f1333bc4ecfe  LICENSE.txt
+sha256  8fbb9b28ef0afac1c7d999102fd2634f347448d069c8c821976f3dbd2b3f812c  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index ccc2fc7eba..4c8a512086 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 1.2.2
+PYTHON_XLSXWRITER_VERSION = 3.0.1
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/73/78/3ea62c5ad7255a0ff676c87ea88b152090b2178cb27325ba3bb0bb4122c9
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/5d/36/e943d07af9d26cc2f11861955dbf0031e891f77f3d55f70217fd6a0f4d9f
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
