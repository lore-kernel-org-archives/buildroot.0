Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DC3C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6332614AA;
	Sat, 13 May 2023 19:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6332614AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGEG_66FID32; Sat, 13 May 2023 19:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0212A614A2;
	Sat, 13 May 2023 19:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0212A614A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36BE11BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B9740201
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B9740201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GXB-pcAHVqv for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:28:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5DD4016F
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5DD4016F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C93DF86552; Sat, 13 May 2023 19:27:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2c62b64bd3ba661badb70c05ce6c1d5b781975a
X-Git-Newrev: 8ac4d34ef02cf80a3f0d6063996c0d871aedf1be
X-Patchwork-Hint: ignore
Message-Id: <20230513192759.C93DF86552@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ofono: bump version to 2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ac4d34ef02cf80a3f0d6063996c0d871aedf1be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch 0002 as the TEMP_FAILURE_RETRY macro was replaced by
L_TFR from ell library.
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=765c6655f26304c45adfdb92081448d797ce3092

Release notes:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/tree/ChangeLog?h=2.1

Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                       |  1 -
 package/ofono/0002-fix-musl-compile.patch | 37 -------------------------------
 package/ofono/ofono.hash                  |  2 +-
 package/ofono/ofono.mk                    |  2 +-
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d68a7315a1..773043effa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1128,7 +1128,6 @@ package/odb/0011-Adjust-to-changes-in-GCC-10.patch Upstream
 package/odb/0012-Adjust-to-changes-in-GCC-11.patch Upstream
 package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch Upstream
 package/ofono/0001-uclibc-backtrace.patch Upstream
-package/ofono/0002-fix-musl-compile.patch Upstream
 package/ofono/S46ofono Variables
 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch Upstream
 package/olsr/0001-olsrd-migrate-to-using-bison-3.7.1.patch Upstream
diff --git a/package/ofono/0002-fix-musl-compile.patch b/package/ofono/0002-fix-musl-compile.patch
deleted file mode 100644
index 369fb71791..0000000000
--- a/package/ofono/0002-fix-musl-compile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4a1d114fa3a5d6bef1f71222787c1f6c3a952284 Mon Sep 17 00:00:00 2001
-From: Nicolas Serafini <nicolas.serafini@sensefly.com>
-Date: Thu, 24 Jan 2019 10:11:42 +0100
-Subject: [PATCH] mbim: add optional copy of TEMP_FAILURE_RETRY macro (fix musl
- compile)
-
-TEMP_FAILURE_RETRY is not available on musl.
-
-Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
----
- drivers/mbimmodem/mbim.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drivers/mbimmodem/mbim.c b/drivers/mbimmodem/mbim.c
-index 54b18acf..4b040528 100644
---- a/drivers/mbimmodem/mbim.c
-+++ b/drivers/mbimmodem/mbim.c
-@@ -37,6 +37,16 @@
- #include "mbim-message.h"
- #include "mbim-private.h"
- 
-+/* taken from glibc unistd.h for musl support */
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression)             \
-+  (__extension__                                   \
-+    ({ long int __result;                          \
-+       do __result = (long int) (expression);      \
-+       while (__result == -1L && errno == EINTR);  \
-+       __result; }))
-+#endif
-+
- #define MAX_CONTROL_TRANSFER 4096
- #define HEADER_SIZE (sizeof(struct mbim_message_header) + \
- 					sizeof(struct mbim_fragment_header))
--- 
-2.20.1
-
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 7edef0eb80..f1760d6f13 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256  c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7  ofono-1.34.tar.xz
+sha256  92913dcce9a15cac2174daca249457716a0ec036878d22035e83af0e19e79c52  ofono-2.1.tar.xz
 # Locally computed
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index b7a2a923f9..5f91e4985d 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.34
+OFONO_VERSION = 2.1
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
