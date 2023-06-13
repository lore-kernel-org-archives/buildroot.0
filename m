Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08AFEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 19:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 210EC405A2;
	Tue, 13 Jun 2023 19:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 210EC405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2jjkJYU8Nu6; Tue, 13 Jun 2023 19:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD222405B7;
	Tue, 13 Jun 2023 19:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD222405B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43DE01BF31C
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 19:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AD5960B1B
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 19:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD5960B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P95XzmbwiuqP for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 19:15:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419EF60761
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 419EF60761
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 19:15:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 99UEqdfmmVBSn99UEqpNVm; Tue, 13 Jun 2023 21:15:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 21:09:09 +0200
Message-Id: <20230613190909.3873760-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfF/9biQQ9YxPHk+8oxd5Fxu4ojpCoIRPq0oUQ4tLF1RERua03uDM6Q880coTLCDbgpt3cf2wQ+o8um8iJ/AyXilBwwAKA11RQlgg1EP9zb4ANjVA1aFu
 lOaJ/mgaiC6jz7PK7Zac1auuhurTRoDDN4rxiFcvE6q+J0OpoE+4JqKu8Pvgj3DPHG3za34ZGduIKWlzHYwXPZ2SzkbIBhGKQ9jTOtAB7ufeMeRz0rA2ffCT
 b1e2Xlq5b4uKb0SSGbwPEp0hfQ5WR4HnXFVkpWfxYGsI6CgdSZ4aS2Ays95QiqLBmLpgaDK/ID93q/uXzLO1Nw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686683726; bh=udQgTuX0G3xQOz9EIDCFNL1IR6a51QZFYXtLYQfAXFo=;
 h=From:To:Subject:Date:MIME-Version;
 b=MFSJDAFLcesNk+9DqpZNpxeYFr7wRYSKPzHH0Fsl8HI1Tp1Vi18KH+JI0Mit7LUCR
 0P+KAyNsjmg9JoqIHz6sX062LGmacv/fwGhOBQxzhJ1zUw1DSvndPl0kabTHywwM7B
 wZuttGdpkf0i3EhBfka7jDcHyP0xx5zD3THPNkVPp1plGFAXPMGhd+TkAoTB7CZiwT
 0wNR/R/et6R8u528EXWITPM7k51/e7Esw7cmjwZh9AZorgtWmO2U1jif4gBxj+hRBO
 XmvGLX+eg3HakZQz3dFco4iNlYUCQRo/UBjhNex+ZxvpzPq4e6SKKsWJ7syVYG5M1P
 jyJFSMsFiA1/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MFSJDAFL
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.15.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop local patch that has been upstreamed but add a new one to fix build
failure:
../meson.build:180:12: ERROR: Can not run test applications in this
cross environment.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ix-MS_LAZYTIME-not-defined-on-uclibc.patch | 48 -------------------
 ...est-applications-for-cross-compiler-.patch | 43 +++++++++++++++++
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 4 files changed, 45 insertions(+), 50 deletions(-)
 delete mode 100644 package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
 create mode 100644 package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch

diff --git a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
deleted file mode 100644
index 58f9747d77..0000000000
--- a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 56038446952516da5d4cf09e1192824031082943 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 27 Mar 2023 21:08:57 +0200
-Subject: [PATCH] Fix MS_LAZYTIME not defined on uclibc
-
-[Upstream status: https://github.com/libfuse/libfuse/pull/753]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- lib/mount.c       | 5 +++++
- util/fusermount.c | 6 ++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/lib/mount.c b/lib/mount.c
-index 1f1ee86..84e5c73 100644
---- a/lib/mount.c
-+++ b/lib/mount.c
-@@ -27,6 +27,11 @@
- #include <sys/wait.h>
- #include <sys/mount.h>
- 
-+/* uclibc doesn't define MS_LAZYTIME */
-+#ifndef MS_LAZYTIME
-+#define MS_LAZYTIME	(1<<25)
-+#endif
-+
- #ifdef __NetBSD__
- #include <perfuse.h>
- 
-diff --git a/util/fusermount.c b/util/fusermount.c
-index 6e72f0d..82cc420 100644
---- a/util/fusermount.c
-+++ b/util/fusermount.c
-@@ -25,6 +25,12 @@
- #include <sys/wait.h>
- #include <sys/stat.h>
- #include <sys/mount.h>
-+
-+/* uclibc doesn't define MS_LAZYTIME */
-+#ifndef MS_LAZYTIME
-+#define MS_LAZYTIME	(1<<25)
-+#endif
-+
- #include <sys/fsuid.h>
- #include <sys/socket.h>
- #include <sys/utsname.h>
--- 
-2.34.1
-
diff --git a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
new file mode 100644
index 0000000000..b99b4c23f4
--- /dev/null
+++ b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
@@ -0,0 +1,43 @@
+From b58a0014bff619f1810af49441d987d732c4244e Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 13 Jun 2023 20:02:01 +1000
+Subject: [PATCH] Wrapper around test applications for cross compiler
+ environment in meson.build (#804)
+
+This enhances commit 7be56c57f93e3436b1fbd9ecc320de5c03a3e4b8 to allow build
+fuse to be built using a cross compiler
+
+Fixes:
+../meson.build:180:12: ERROR: Can not run test applications in this cross environment.
+
+Upstream: https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7aa4e0d..9707ea3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -177,10 +177,12 @@ int main()
+ }
+ '''
+ 
+-result = cc.run(detect_getmntent_needs_unescape)
+-if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
+-  message('getmntent does not unescape')
+-  add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
++if not meson.is_cross_build()
++  result = cc.run(detect_getmntent_needs_unescape)
++  if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
++    message('getmntent does not unescape')
++    add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
++  endif
+ endif
+ 
+ # Write private test results into fuse_config.h (stored in build directory)
+-- 
+2.34.1
+
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index df4df524d0..155c29ecd2 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  99688d68a753ee97eed51d536b216b8ae5d7fe0236c1a45d439357903bfd4d88  libfuse3-3.14.1.tar.gz
+sha256  1e79f1dd60eaf79645c21411c4a7028c97b5e745ea677ac5bda747c90497a785  libfuse3-3.15.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 61523820ad..f1b294f74f 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.14.1
+LIBFUSE3_VERSION = 3.15.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
