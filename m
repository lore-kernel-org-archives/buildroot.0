Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C522C5AD4E
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1FC3605E4;
	Sat,  8 Aug 2026 23:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQWLQKzziRwa; Sat,  8 Aug 2026 23:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40DD605ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230264;
	bh=bZUh7a5rnDVSA4l8eDlCEXf1cMztxc+6lNUtZd4TMFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pKK7G3HSHFyRs+CPEZr8QpJfYgIR/qtTaxPFvH3nVYJjTi12TMMx5gIP3i9cG6S41
	 nNTCawtrfhLQAQ9cNWsJIpIqxnRpBZ6/inrz1FFw8fPrvS3dAjJlMBLyem4JIUQuCq
	 HrHdiP3C/xIubHWX8lh6/PFi5s3qacD95vJtUlqmwOuuZoD9tOLzNni9yEOc7KidoC
	 tR9Mha0NUZEduyO2ZCuhCL+5bzgtFfKOxs66nisfd7csdskJlPPOo3xDTDUY7GsEX1
	 z0ZRtSu5nECjg2Iw1Z5O0+YWD+p9NWinWGkv9o71w2OLN/P/hjIClREz4qFakAGBVM
	 gqdx1rySnjBqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40DD605ED;
	Sat,  8 Aug 2026 23:04:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A74282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A8D04009F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzGTs9bP2KmP for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776B24008D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 776B24008D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:04:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 328DD8D1CA; Sat,  8 Aug 2026 23:03:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 00:55:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aa301fc8154f2317dc87957a2bc8a945513c3e2
X-Git-Newrev: a60ae04dbd27dde7b036eb2d09efe0c6943d8040
X-Patchwork-Hint: ignore
Message-Id: <20260808230333.328DD8D1CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snagboot: bump to version 2.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a60ae04dbd27dde7b036eb2d09efe0c6943d8040
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog 2.5..2.6:

treewide:
Migrate documentation to readthedocs
Emit more specific error messages for USB permission-based access issues
Add unit tests

snagflash:
Support compressed input files, e.g. *.wic.bz2
Refactor fastboot-uboot logic to factor out common code and improve logging
Automatically detect when oem_run isn't supported by U-Boot, and fallback to ucmd

snagrecover:
Support Renesas RZ/N1 platforms
Support SoC model aliases, and add i.MX8MP alias
Handle relative path prefixes with the -F syntax

Changelog 2.6..2.6.1:

snagrecover:
Correct i.MX93 ROM code recovery which doesn't support control endpoint HID commands
Add multi-board support to AM335x recovery setup script
Add i.MX7Solo support

treewide:
Fix broken links in documentation
Drop Python 3.9 support
Add CI for Python 3.14

One packaging-related change is that Snagboot would now
unconditionally import the bzip2, gzip and lzma Python modules, which
are not necessarily available. Since these are only needed when
compressed images are provided as input, we submitted a patch upstream
to make those imports only when compressed files are provided as
input, relaxing those dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...over-utils.py-import-compression-modules-.patch | 57 ++++++++++++++++++++++
 package/snagboot/snagboot.hash                     |  2 +-
 package/snagboot/snagboot.mk                       |  2 +-
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
new file mode 100644
index 0000000000..ea92c0caa2
--- /dev/null
+++ b/package/snagboot/0001-src-snagrecover-utils.py-import-compression-modules-.patch
@@ -0,0 +1,57 @@
+From fa60aaf200eb1e6d31124ac3e7631e9e5458d145 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 8 Aug 2026 19:03:52 +0200
+Subject: [PATCH] src/snagrecover/utils.py: import compression modules when
+ needed
+
+Commit 4f98bdec5ebeb13d9f851f848c3bd0086ef31eeb ("snagflash: Support
+on-the-fly decompression of input files") has added unconditional
+imports of lzma, bz2 and gzip Python modules, even if compressed input
+files are not used.
+
+Switch to dynamic imports where these modules are only imported
+on-demand. This allows to relax the need to have support for those
+modules in Python, which can be helpful in environments such as
+Buildroot where dependencies are kept to a minimum.
+
+Upstream: https://github.com/bootlin/snagboot/pull/95
+[Thomas: upstream version is different as upstream master branch also
+supports zstd compression, which wasn't supported as of v2.6.1 of
+snagboot]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/snagrecover/utils.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/snagrecover/utils.py b/src/snagrecover/utils.py
+index 8d240f6..dfe7d23 100644
+--- a/src/snagrecover/utils.py
++++ b/src/snagrecover/utils.py
+@@ -16,9 +16,7 @@ from snagrecover.usb import SnagbootUSBContext
+ import yaml
+ import importlib.resources
+ 
+-import lzma
+-import bz2
+-import gzip
++from math import ceil
+ 
+ USB_RETRIES = 9
+ USB_INTERVAL = 1
+@@ -47,10 +45,13 @@ def open_compressed_file(path: str, mode):
+ 	comp = get_compression_method(path)
+ 
+ 	if comp == "xz":
++		import lzma
+ 		file = lzma.open(path, mode)
+ 	elif comp == "bz2":
++		import bz2
+ 		file = bz2.open(path, mode)
+ 	elif comp == "gz":
++		import gzip
+ 		file = gzip.open(path, mode)
+ 	else:
+ 		return open(path, mode)
+-- 
+2.55.0
+
diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index 6fff4c94c1..09d765d9f5 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  03b3793feb9d926f5cb4f1c89f7a22075247fe91942c7be13065b6b62029376e  snagboot-2.5.tar.gz
+sha256  0b94184d9668c46cc2cf11002772ddb2fe06542f4f96cc6884342b5561d84b8d  snagboot-2.6.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index 64b8b6fcc9..b3f699e988 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.5
+SNAGBOOT_VERSION = 2.6.1
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
