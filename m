Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E12CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E80260F48
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E80260F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D705060791;
	Sun,  3 Oct 2021 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivkYfqOboUYr; Sun,  3 Oct 2021 19:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2CA60B41;
	Sun,  3 Oct 2021 19:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 974751BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1290C4080D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Idqea2SZ_5Wh for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59ABE407D8
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BAA3887B03; Sun,  3 Oct 2021 19:53:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:32:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 247d3bf567bfcb6e2e7ad3406e971b8916aaeb66
X-Git-Newrev: c513d89ab0e6767bc6173b9da686e229fcae26aa
X-Patchwork-Hint: ignore
Message-Id: <20211003195308.BAA3887B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mutagen: bump to version
 1.45.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c513d89ab0e6767bc6173b9da686e229fcae26aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* SETUP_TYPE was changed to setuptools.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mutagen/Config.in           | 7 +++----
 package/python-mutagen/python-mutagen.hash | 9 +++++----
 package/python-mutagen/python-mutagen.mk   | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/python-mutagen/Config.in b/package/python-mutagen/Config.in
index 3c95e37447..655562893f 100644
--- a/package/python-mutagen/Config.in
+++ b/package/python-mutagen/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_MUTAGEN
 	bool "python-mutagen"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Mutagen is a Python module to handle audio metadata.  It
 	  supports ASF, FLAC, MP4, Monkey's Audio, MP3, Musepack, Ogg
diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 5ee8ed17c7..0cf25fd5fe 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mutagen/json, sha256 locally computed
-md5 3729218f974c3a79ee9972ffa5ca5d12 mutagen-1.42.0.tar.gz
-sha256 bb61e2456f59a9a4a259fbc08def6d01ba45a42da8eeaa97d00633b0ec5de71c mutagen-1.42.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+# md5, sha256 from https://pypi.org/pypi/mutagen/json
+md5  76e1f7fc2386813c0ff2716695fb06e1  mutagen-1.45.1.tar.gz
+sha256  6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1  mutagen-1.45.1.tar.gz
+# Locally computed sha256 checksums
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 5477d6f4c8..627ec70e96 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.42.0
+PYTHON_MUTAGEN_VERSION = 1.45.1
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/30/4c/5ad1a6e1ccbcfaf6462db727989c302d9d721beedd9b09c11e6f0c7065b0
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
-PYTHON_MUTAGEN_SETUP_TYPE = distutils
+PYTHON_MUTAGEN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
