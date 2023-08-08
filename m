Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC50C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 09:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1D481414;
	Tue,  8 Aug 2023 09:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1D481414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHi9TDWmLMiJ; Tue,  8 Aug 2023 09:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED872813CA;
	Tue,  8 Aug 2023 09:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED872813CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 350AE1BF28D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19DC340327
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19DC340327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuKQbrnWQiav for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 09:43:51 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66ED940160
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 09:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66ED940160
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E185A352BD59; Tue,  8 Aug 2023 11:43:47 +0200 (CEST)
Date: Tue, 8 Aug 2023 11:43:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNIOU4++bmaUpcp9@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691487828; bh=yh8G01fF4FeaxtajrOatwzyhyD9vugyRsf5LgfEHYjU=;
 h=Date:From:To:Subject:From;
 b=XypI5PRANDn3y7VNS1ZYfeXxk94PV9pV5eoCuGyxkKucNVMmA3qgYS9W648KPdCKA
 WfxcwX1R4agxReDnkcb2YiG/C/ClEMOYyyjwnqrG6n6ghu1WCgLFj63iVp2Xfw1Sj1
 9AMx7U5Ex3ecfy5SBQQK2IJl/iUg3gILV5r2SMY/wmttmj04iswpokii7Xi+loSUW0
 hdkjodo+i4sR844oXkxRNRj0psRwWFk9r2TqnuvaaD5RzCbST0Y5QBQtNYdYp+Fdo/
 jpTW3UKSvqh1wV3vgED/Kw58QnA1ySxCFQhi5VIyHGKFJ0mwebvW3oafhOUwFhYA8U
 WkqitlTwIJCoA==
Subject: [Buildroot] [PATCH v2] package/uclibc: update to 1.0.44
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- mostly stability improvements
- patch is included so remove it

Fixes:
 - http://autobuild.buildroot.net/results/823/823aac32b0ff365ebb3d99073f34276362a2c530
 - http://autobuild.buildroot.net/results/0eb/0eb921e07a3d13bd76e76ab6bafad3a13632f8bf

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - add Fixes for haveged and stress-ng 
---
 .../0001-gettimeofday-fix-static-build.patch  | 29 -------------------
 package/uclibc/uclibc.hash                    |  4 +--
 package/uclibc/uclibc.mk                      |  2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/uclibc/0001-gettimeofday-fix-static-build.patch

diff --git a/package/uclibc/0001-gettimeofday-fix-static-build.patch b/package/uclibc/0001-gettimeofday-fix-static-build.patch
deleted file mode 100644
index 2ef5059f05..0000000000
--- a/package/uclibc/0001-gettimeofday-fix-static-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b19f8f360970ffd0c1a6ac41e07c66dc39790b16 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Wed, 10 May 2023 08:35:25 +0200
-Subject: [PATCH] gettimeofday: fix static build
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=b19f8f360970ffd0c1a6ac41e07c66dc39790b16
----
- libc/sysdeps/linux/common/gettimeofday.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libc/sysdeps/linux/common/gettimeofday.c b/libc/sysdeps/linux/common/gettimeofday.c
-index e5141088e..12473a8e6 100755
---- a/libc/sysdeps/linux/common/gettimeofday.c
-+++ b/libc/sysdeps/linux/common/gettimeofday.c
-@@ -9,8 +9,9 @@
- #include <sys/syscall.h>
- #include <sys/time.h>
- 
-+#ifdef SHARED
- #include "ldso.h"
--
-+#endif
- 
- 
- #ifdef __VDSO_SUPPORT__
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index cdca75b113..8d87c04383 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.43/uClibc-ng-1.0.43.tar.xz.sha256
-sha256  8c1f550f14728a9c06ff1fb3e85069f7f10f4d684b03e163f4d9d41727124047  uClibc-ng-1.0.43.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.44.tar.xz.sha256
+sha256  7df9d987955827382f1c2400da513456becbb6f868bdfd37737265f1cbeec994  uClibc-ng-1.0.44.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 80c9caf07f..4e7d8de643 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.43
+UCLIBC_VERSION = 1.0.44
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
