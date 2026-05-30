Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76048CD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4405A40F2B;
	Tue,  9 Jun 2026 13:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kyMXzwUqFqr; Tue,  9 Jun 2026 13:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B3C140F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010367;
	bh=dPcnj8Wi7F0zDc1qBdz6ffvStP0mwdNTu03zijrIYhw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CQpRuR5gJ067ssruB0fEbSs9Af33sDsmpyPNIhaDNpPFdcqElVWM9jeElpYGIWOWu
	 vWd+2oitSS5fFZvyRO3VP+7gpBAIxJ2CBEcq5atj6AuAm0abr3/2bKxCNWPls80qMY
	 7w3j9CkTbOiWb07I9MqgQN9FPg6CSCW+bUPTsZsQHSFZQnk1prKohqaKUUzvkqQoVy
	 rP/YDsD8nSQ1TDFDQwSsM67hCbHOGM9tfykflbPsBRL4YR3lpzMzt7VWlyrqS7Bq6C
	 SotFki47zijshGWQY/3eGx2OUg1wGQWFdmuQmDsNqKETEALdf58vZWFMfbV8YZYL6P
	 sdttgAhFl6usQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B3C140F63;
	Tue,  9 Jun 2026 13:06:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2363190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEF7D4229D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bf6LbqLkO-42 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DF3F41204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF3F41204
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 796CC87E86; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce9bbefb56b3d51b385455d3efb0cdad93f14117
X-Git-Newrev: 722c2f30ac4e430d8d83256a584a50f45a41d2bc
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.796CC87E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: bump version to 3.42
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/722c2f30ac4e430d8d83256a584a50f45a41d2bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/axboe/fio/releases/tag/fio-3.42

Removed patch which is included in this release.

Added upstream commit to fix build error with musl introduced by
upstream commit
https://github.com/axboe/fio/commit/0b554ec1705ce71f366ac3fe2156b05b0c301623
which was first included in this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ove-linux-prctl.h-include-to-fix-musl-con.patch | 36 ++++++++++++++++++++
 package/fio/0001-fix-musl-builds.patch             | 38 ----------------------
 package/fio/fio.hash                               |  6 ++--
 package/fio/fio.mk                                 |  2 +-
 4 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/package/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch b/package/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
new file mode 100644
index 0000000000..0704b02aef
--- /dev/null
+++ b/package/fio/0001-backend-remove-linux-prctl.h-include-to-fix-musl-con.patch
@@ -0,0 +1,36 @@
+From a84eece62edd46c1f4c8047f1052ac6181fc8b3e Mon Sep 17 00:00:00 2001
+From: Lucas Hecht <lucas.hecht@agdsn.de>
+Date: Tue, 26 May 2026 18:49:48 +0200
+Subject: [PATCH] backend: remove linux/prctl.h include to fix musl conflict
+
+Building with musl fails due to a duplicate definition of prctl_mm_map.
+This is because musl redefines linux/prctl.h in sys/prctl.h.
+
+This commit removes the linux/prctl.h include.
+
+Fixes: #2096
+
+Signed-off-by: Lucas Hecht <lucas.hecht@agdsn.de>
+
+Upstream: https://github.com/axboe/fio/commit/a84eece62edd46c1f4c8047f1052ac6181fc8b3e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ backend.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/backend.c b/backend.c
+index f6023d0e..e2b33b14 100644
+--- a/backend.c
++++ b/backend.c
+@@ -32,7 +32,6 @@
+ #include <pthread.h>
+ 
+ #ifdef CONFIG_LINUX
+-#include <linux/prctl.h>
+ #include <sys/prctl.h>
+ #endif
+ 
+-- 
+2.47.3
+
diff --git a/package/fio/0001-fix-musl-builds.patch b/package/fio/0001-fix-musl-builds.patch
deleted file mode 100644
index 16c3d3836d..0000000000
--- a/package/fio/0001-fix-musl-builds.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
-From: Arthur Gautier <arthur.gautier@arista.com>
-Date: Sat, 13 Dec 2025 20:07:11 -0800
-Subject: [PATCH] fix musl builds
-
-This commit fixes the build on musl which fails with the following
-error:
-```
-oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
-oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
-      |                                     ^~~~~~~~~~~~~~~~~~~~
-oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
-make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
-make: *** Waiting for unfinished jobs....
-```
-
-Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
-
-Upstream: https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- oslib/linux-blkzoned.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
-index 78e25fca91..c45ef623de 100644
---- a/oslib/linux-blkzoned.c
-+++ b/oslib/linux-blkzoned.c
-@@ -25,6 +25,7 @@
- #ifndef BLKFINISHZONE
- #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
- #endif
-+#include <linux/falloc.h>
- 
- /*
-  * If the uapi headers installed on the system lacks zone capacity support,
diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 015f2e3fbe..0a86e4092c 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,8 +1,8 @@
 # From https://brick.kernel.dk/snaps/MD5SUMS
-md5  3cd7ea766be83b560a14c909cdd35889  fio-3.41.tar.gz
+md5  0e817db93ecf11a4797aea757f29c91d  fio-3.42.tar.gz
 # Locally computed after checking gpg signature from
-# https://brick.kernel.dk/snaps/fio-3.41.tar.gz.asc
+# https://brick.kernel.dk/snaps/fio-3.42.tar.gz.asc
 # with key C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6
-sha256  a40b45112005e30a67bab6be4860b198c35104a628b6ec4d15720d62b5d1bab9  fio-3.41.tar.gz
+sha256  9128d0c81bd7bffab0dd06cbfb755a05ef92f3b8a0b0c61f1b3538df6750f1e0  fio-3.42.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 38e7aa7967..890631e9fa 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.41
+FIO_VERSION = 3.42
 FIO_SITE = https://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
