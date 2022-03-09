Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D95C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A373740A0D;
	Wed,  9 Mar 2022 20:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKgkNjdsyvRp; Wed,  9 Mar 2022 20:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C53924051F;
	Wed,  9 Mar 2022 20:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE491BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E91E48431C
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ME4_K6fpLF4D for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E088431F
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0298483976; Wed,  9 Mar 2022 20:22:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 21:29:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6f3de83940ed4ff2bc2a5fec0cd2add93ebf635
X-Git-Newrev: 57eb983832a848dd406bf6c6403d01394bc5fc78
X-Patchwork-Hint: ignore
Message-Id: <20220309202205.0298483976@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaacs: bump to version 0.11.1
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
Content-Type: multipart/mixed; boundary="===============8475396840508766936=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8475396840508766936==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=57eb983832a848dd406bf6c6403d01394bc5fc78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed since
https://code.videolan.org/videolan/libaacs/-/commit/a2ef3313bae4550f54ba842fa342d5b9b5f97145)

https://code.videolan.org/videolan/libaacs/-/blob/0.11.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-read_file.h-include-sys-types.h.patch     | 36 ----------------------
 package/libaacs/libaacs.hash                       |  4 +--
 package/libaacs/libaacs.mk                         |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/libaacs/0001-read_file.h-include-sys-types.h.patch b/package/libaacs/0001-read_file.h-include-sys-types.h.patch
deleted file mode 100644
index 9bb1e04539..0000000000
--- a/package/libaacs/0001-read_file.h-include-sys-types.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1fb08a352afada589f0b93af7a07c6fcd6da9bb8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 21 Sep 2020 20:19:38 +0200
-Subject: [PATCH] read_file.h: include sys/types.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error with uClibc and gcc-8.3.0:
-
-In file included from src/devtools/uk_dump.c:28:
-src/devtools/read_file.h:24:44: error: unknown type name ‘off_t’
- static size_t _read_file(const char *name, off_t min_size, off_t max_size, uint8_t **pdata)
-
-Upstream status: pending
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/devtools/read_file.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/devtools/read_file.h b/src/devtools/read_file.h
-index 953b2ef..a5d185c 100644
---- a/src/devtools/read_file.h
-+++ b/src/devtools/read_file.h
-@@ -19,6 +19,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <sys/types.h>
- #include <errno.h>
- 
- static size_t _read_file(const char *name, off_t min_size, off_t max_size, uint8_t **pdata)
--- 
-2.27.0
-
diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index 62e389f2f9..d4977727b0 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.11.0/libaacs-0.11.0.tar.bz2.sha512
-sha512  167edbb6f26599e41d6084908039bf902f69f57da1f64f1491734157d1568ad0b32c8ea3064e0706e383af8dc6007eef65170b2b47222bf3d363e395e0b60388  libaacs-0.11.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libaacs/0.11.1/libaacs-0.11.1.tar.bz2.sha512
+sha512  42dcba5fd593c9a8ec7af11251006b083ad2c49ec198734d1d66f67c2ded4557d77617600edbf0c5250e9b0407ef9a2f906d59d154bda8ecfc8adfd234fb2c42  libaacs-0.11.1.tar.bz2
 
 # Hash for license file:
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index 3e0df18010..d4e90be26c 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.11.0
+LIBAACS_VERSION = 0.11.1
 LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
 LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
 LIBAACS_LICENSE = LGPL-2.1+

--===============8475396840508766936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8475396840508766936==--
