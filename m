Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20EBCDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46D5F430F0;
	Thu, 19 Oct 2023 19:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D5F430F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yptRXmctZcIQ; Thu, 19 Oct 2023 19:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE8194312E;
	Thu, 19 Oct 2023 19:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8194312E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA2681BF5F8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA6441775
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA6441775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0Sz_vGRGFxN for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 19:51:40 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0D104171E
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 19:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D104171E
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tZ3QqIjGIX0QvtZ3Qqsalx; Thu, 19 Oct 2023 21:51:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 21:51:35 +0200
Message-Id: <20231019195135.1653708-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfONkFEwqq7BdYhbltQuV83mmHZUsUC5Iy0svjezrDdftn/UkE6rTP0s+y4RyjC0suDNBQSSEA3awSKbeSE7zlbTrUQt9aB22fnlYYa24Nd/euLk04enG
 8PnSCxgFXU49CQAlTJcKRYpkYpufs/VhWEYgXuuoVnKL1tVTynm+3ZCqphTHWJI6pBBKpfEuLAI04klFugYMOJZ3qVd79FmDJHohw8rjuuK5t43OUu4cO0KP
 VB+FTSJkrHAL517K5zisfYANd7EOjHU3DC6Ub3fPXxurke+VGpwSBOGHKeZp5y5m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697745096; bh=5C+DVwc3IGAadhwpgfUjJpKjN3S2Bs+atyjr9ApgtUs=;
 h=From:To:Subject:Date:MIME-Version;
 b=RaRnqSfgDi4SUWWW6aySxV/b514QTMMH1VFV0hs9gnQ7Y0oo9hDtI2CrN6l5h5vbQ
 4O+fyGoz7Assu8SLrZv/lbFGYjSwSn5GwqgIIViTdnjyJqsP1GDp0WMYnk8afJp87q
 8MlqK7WrULvkJvKqDUET+lOBiDh7aI9J4FYrquJdtBLXcp7qE8/LLgRkTZv8yOGX7R
 dENLAP+/AnR0e8goIUDaUeFPYFfdKZJqU3x1F5jboRC3yZrORBHt+jTplP+D6XPpe9
 E7b0crKIaVHhSov9aMulfw7JAowrd6/bhZSkKOfr+IFZ4wgivtlmQrsVIsxjs8tHZL
 mevYW8kQc5g6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RaRnqSfg
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.0.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update local patch to add missing strerror_l() to other files.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-replacement-function-for-strerror_l.patch | 80 ++++++++++++++++---
 package/libblockdev/libblockdev.hash          |  2 +-
 package/libblockdev/libblockdev.mk            |  2 +-
 3 files changed, 72 insertions(+), 12 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 01e03ac6ec..987d28f82e 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,4 +1,4 @@
-From 425d9ad320746298bd52b74ea3f38ad3c0468ff0 Mon Sep 17 00:00:00 2001
+From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 29 Aug 2020 16:04:15 +0200
 Subject: [PATCH] Provide replacement function for strerror_l()
@@ -11,16 +11,19 @@ Upstream status: Not Applicable since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0]
+[Giulio: ported to version 3.0+]
 ---
- configure.ac         | 2 ++
- src/plugins/crypto.c | 7 +++++++
- src/plugins/part.c   | 9 +++++++++
- src/utils/module.c   | 8 +++++++-
- 4 files changed, 25 insertions(+), 1 deletion(-)
+ configure.ac                    | 2 ++
+ src/plugins/crypto.c            | 7 +++++++
+ src/plugins/nvme/nvme-error.c   | 8 ++++++++
+ src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
+ src/plugins/nvme/nvme-op.c      | 8 ++++++++
+ src/plugins/part.c              | 9 +++++++++
+ src/utils/module.c              | 8 +++++++-
+ 7 files changed, 49 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 88fa835a..4fba7b7d 100644
+index 0a8ce4a7..dfbddb39 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
@@ -33,7 +36,7 @@ index 88fa835a..4fba7b7d 100644
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
 diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index 503e1207..5896d211 100644
+index c5f719ca..b2ae3f56 100644
 --- a/src/plugins/crypto.c
 +++ b/src/plugins/crypto.c
 @@ -62,6 +62,13 @@
@@ -50,8 +53,65 @@ index 503e1207..5896d211 100644
  /**
   * SECTION: crypto
   * @short_description: plugin for operations with encrypted devices
+diff --git a/src/plugins/nvme/nvme-error.c b/src/plugins/nvme/nvme-error.c
+index 4bd4d771..618b6aef 100644
+--- a/src/plugins/nvme/nvme-error.c
++++ b/src/plugins/nvme/nvme-error.c
+@@ -34,6 +34,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /**
+  * bd_nvme_error_quark: (skip)
+diff --git a/src/plugins/nvme/nvme-fabrics.c b/src/plugins/nvme/nvme-fabrics.c
+index 1877845f..5fcbeddc 100644
+--- a/src/plugins/nvme/nvme-fabrics.c
++++ b/src/plugins/nvme/nvme-fabrics.c
+@@ -36,6 +36,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /* nvme-cli defaults */
+ #define PATH_NVMF_CONFIG  "/etc/nvme/config.json"
+diff --git a/src/plugins/nvme/nvme-op.c b/src/plugins/nvme/nvme-op.c
+index dbef4f3a..7bafd7a3 100644
+--- a/src/plugins/nvme/nvme-op.c
++++ b/src/plugins/nvme/nvme-op.c
+@@ -35,6 +35,14 @@
+ #include "nvme.h"
+ #include "nvme-private.h"
+ 
++#define UNUSED __attribute__((unused))
++
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++    return strerror(errnum);
++}
++#endif
+ 
+ /**
+  * bd_nvme_device_self_test:
 diff --git a/src/plugins/part.c b/src/plugins/part.c
-index d75bb791..ba34bb93 100644
+index 46d31137..6234e013 100644
 --- a/src/plugins/part.c
 +++ b/src/plugins/part.c
 @@ -26,6 +26,15 @@
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 146f36ceed..5f9a8a7e6c 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0f2872830293f3e222832903d80de4c38e06a9c3ea18915b3263272a72095ea8  libblockdev-3.0.3.tar.gz
+sha256  49841ff92db0ab032931e6f2b5eab63e5969b0ddc14b067b60e46a6eb6c60e47  libblockdev-3.0.4.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index e117a1349c..3bbc221cc5 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.0.3
+LIBBLOCKDEV_VERSION = 3.0.4
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
