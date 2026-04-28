Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C4FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45699610D8;
	Tue, 28 Apr 2026 19:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCA8kEATOQuJ; Tue, 28 Apr 2026 19:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C28610BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777404738;
	bh=sQlYBW4k7iujMF6mf6UMIC55Zxarq9bP707hsC7orGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GGWPyPUKQX+jj/TScerZnSKvkcgrbOe3ixrNQ7I8oAryb5FP2ZAJj7vtCihC9jlN7
	 JFEsRq0/f01gt4y+/NE1eKYDC0NkSoLUXPDNEmYfx6uMtj+Xca45uTeEpY4WBuCGpp
	 IF6XPx/d9JnGD5u2gw9kk84DcVheMNjnM6mypL/L9LiX2sT7efXomiBGEatXLkMC9S
	 KTjgYbYqtbQkYhOVWXZtLxLM4BULkG7Y0P+B9K4pWqRWWTicLIsZHFBhghnFqf4TcP
	 fcbAiHjnjqQl492jB3pfOckrgC1EgZyZOjgF/KHIZh1As6XwtiEYS1sLikFCp0y+Zo
	 Eb5YIKFIiXT6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C28610BF;
	Tue, 28 Apr 2026 19:32:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 870FA1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D63640CCC
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLE_4c9tZw8n for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F38040C6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F38040C6D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:32:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43E57839D9; Tue, 28 Apr 2026 19:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:30:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa5e3eec6384cb73d902a4de3fffc279683ea5a5
X-Git-Newrev: c03745d7de627e70b1142a6f212fe7e5f060cdd7
X-Patchwork-Hint: ignore
Message-Id: <20260428193215.43E57839D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 3.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c03745d7de627e70b1142a6f212fe7e5f060cdd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/storaged-project/libblockdev/blob/3.5.0/NEWS.rst

Reworked local patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ovide-replacement-function-for-strerror_l.patch | 35 +++++++++++++++-------
 package/libblockdev/libblockdev.hash               |  2 +-
 package/libblockdev/libblockdev.mk                 |  2 +-
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index d073e16ac5..dbbe3e5c4a 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,5 +1,5 @@
-From 01883cc14904e55d90955ad7cd9fc55bc18364ac Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+From 3d198be196bdc59ba332b87d8c2959de0b9160d2 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Sat, 20 Jan 2024 13:29:28 +0100
 Subject: [PATCH] Provide replacement function for strerror_l()
 
@@ -11,18 +11,19 @@ Upstream: N/A since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0 and 3.1]
+[Giulio: ported to version 3.0, 3.1 and 3.5]
 ---
- configure.ac       | 2 ++
- src/utils/module.c | 1 +
- src/utils/utils.h  | 4 ++++
- 3 files changed, 7 insertions(+)
+ configure.ac          | 2 ++
+ src/utils/dev_utils.c | 1 +
+ src/utils/module.c    | 1 +
+ src/utils/utils.h     | 4 ++++
+ 4 files changed, 8 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 02b26e3e..67341134 100644
+index e5d65d8b..507fa854 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
+@@ -123,6 +123,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
                   [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
                   [])
  
@@ -31,8 +32,20 @@ index 02b26e3e..67341134 100644
  AC_ARG_WITH([escrow],
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
+diff --git a/src/utils/dev_utils.c b/src/utils/dev_utils.c
+index 89a54b4c..b4be5b44 100644
+--- a/src/utils/dev_utils.c
++++ b/src/utils/dev_utils.c
+@@ -23,6 +23,7 @@
+ #include <errno.h>
+ 
+ #include "dev_utils.h"
++#include "utils.h"
+ 
+ /**
+  * bd_utils_dev_utils_error_quark: (skip)
 diff --git a/src/utils/module.c b/src/utils/module.c
-index 6557c3ab..5893f0ac 100644
+index 11e139f8..c8b124e0 100644
 --- a/src/utils/module.c
 +++ b/src/utils/module.c
 @@ -28,6 +28,7 @@
@@ -59,5 +72,5 @@ index 801a8b6e..b2bdf0d0 100644
   * SECTION: utils
   * @short_description: library providing utility functions used by the blockdev library and its plugins
 -- 
-2.34.1
+2.47.3
 
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index ad0dce77ff..e76e02a756 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  65ef9a37babd44b85b8ff9b273f90f9f7d5f8ff7b0c76a8edb69240325fd83f4  libblockdev-3.4.0.tar.gz
+sha256  bccd30e6b5d11504de60d9889ff6a2a25b07a4ec8f04070f2387e168301b3e3a  libblockdev-3.5.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index b8f5a6cffc..e5cbe45b93 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.4.0
+LIBBLOCKDEV_VERSION = 3.5.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
