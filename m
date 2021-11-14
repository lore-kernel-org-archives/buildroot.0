Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98DFC84BB2;
	Mon,  6 Dec 2021 18:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRzQ6NttIYw6; Mon,  6 Dec 2021 18:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1E184BA4;
	Mon,  6 Dec 2021 18:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21D3C1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A0E241C3D
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9X2qf87XMX1 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B159C41C26
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4AAAC81468; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:12:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b17f4ea1c639e610893e540a8f196d455e467abc
X-Git-Newrev: 74d8e71cd72a2caf2e3089ada566be6ddf74d5ba
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.4AAAC81468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: bump version to 1.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=74d8e71cd72a2caf2e3089ada566be6ddf74d5ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- remove 001-keymap.h-add-missing-includes-to-fix-musl-build.patch
  (superseeded by upstream commit [1])

- add handling of new --with-libudev/--without-libudev option

For details see [2].

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=976a2f681b4e4e16edffd972d53a623b895c5646
[2] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.22

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....h-add-missing-includes-to-fix-musl-build.patch | 68 ----------------------
 package/libv4l/libv4l.hash                         |  2 +-
 package/libv4l/libv4l.mk                           |  6 +-
 3 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch b/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
deleted file mode 100644
index 238f8fc377..0000000000
--- a/package/libv4l/0001-keymap.h-add-missing-includes-to-fix-musl-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From baba68cdcb44fc11d0ba8ce2c13eb5b06bbd9b33 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Wed, 30 Oct 2019 07:15:23 +0100
-Subject: [PATCH] keymap.h: add missing includes to fix musl build
-
-Needed to fix these build errors:
-
-In file included from keymap.c:13:0:
-keymap.h:23:2: error: unknown type name 'u_int32_t'
-  u_int32_t scancode;
-
-keymap.h:36:1: error: unknown type name 'error_t'
- error_t parse_keymap(char *fname, struct keymap **keymap, bool verbose);
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch was not sent upstream due to broken mailing list setup:
-
-<majordomo@vger.kernel.org>: host vger.kernel.org[209.132.180.67] said: 553
-    5.7.1 Hello [xx.xx.xx.xx], for your MAIL FROM address
-    <bernd.kuhls@t-online.de> policy analysis reported: Your address is not
-    liked source for email (in reply to MAIL FROM command)
-
-Hello [xx.xx.xx.xx], for your MAIL FROM address <berndkuhls@hotmail.com>
- policy analysis reported: Your address is not liked source for email 
-
- utils/common/keymap.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/utils/common/keymap.h b/utils/common/keymap.h
-index f2b29632..bb1edce9 100644
---- a/utils/common/keymap.h
-+++ b/utils/common/keymap.h
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
-diff -uNr v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h v4l-utils-1.18.0/utils/ir-ctl/keymap.h
---- v4l-utils-1.18.0.orig/utils/ir-ctl/keymap.h	2019-09-22 11:22:54.000000000 +0200
-+++ v4l-utils-1.18.0/utils/ir-ctl/keymap.h	2019-10-30 07:06:18.250548011 +0100
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
-diff -uNr v4l-utils-1.18.0.orig/utils/keytable/keymap.h v4l-utils-1.18.0/utils/keytable/keymap.h
---- v4l-utils-1.18.0.orig/utils/keytable/keymap.h	2019-09-22 11:22:54.000000000 +0200
-+++ v4l-utils-1.18.0/utils/keytable/keymap.h	2019-10-30 07:06:56.218816126 +0100
-@@ -1,4 +1,8 @@
- /* SPDX-License-Identifier: GPL-2.0 */
-+
-+#include <argp.h>
-+#include <sys/types.h>
-+
- #ifndef __KEYMAP_H
- #define __KEYMAP_H
- 
--- 
-2.20.1
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index e45dd576bd..d99d5e0992 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256 956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7  v4l-utils-1.20.0.tar.bz2
+sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 7b61823cec..b11c8975d1 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.20.0
+LIBV4L_VERSION = 1.22.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
@@ -45,8 +45,10 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-udevdir=/usr/lib/udev
+LIBV4L_CONF_OPTS += --with-libudev --with-udevdir=/usr/lib/udev
 LIBV4L_DEPENDENCIES += udev
+else
+LIBV4L_CONF_OPTS += --without-libudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
