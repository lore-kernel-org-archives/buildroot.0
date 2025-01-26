Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2DCC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F5C819BE;
	Sun, 26 Jan 2025 11:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MvKb5OoAn4S; Sun, 26 Jan 2025 11:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F8E81A12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F8E81A12;
	Sun, 26 Jan 2025 11:15:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E438941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A8556070F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6UoJvFwiloG for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44100605CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44100605CB
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3867F864C9; Sun, 26 Jan 2025 11:15:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 12:05:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84d03a38bf44bbb30b8fc876afa59b96e6965159
X-Git-Newrev: 175bb0df12363c84aa4c96974314831321890c48
X-Patchwork-Hint: ignore
Message-Id: <20250126111529.3867F864C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: bump to newlib
 4.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=175bb0df12363c84aa4c96974314831321890c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps newlib-bare-metal to version 4.5.0.20241231.

The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
needed since it is now included with version 4.5.0.20241231.  For this reason,
the patch can be removed from buildroot.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-microblaze-fix-read-and-_write-declarati.patch | 40 ----------------------
 package/newlib-bare-metal/newlib-bare-metal.hash   |  6 ++--
 package/newlib-bare-metal/newlib-bare-metal.mk     |  2 +-
 3 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch b/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
deleted file mode 100644
index 5eacfd3270..0000000000
--- a/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1ebecb83607e9c0cc44ad1e518169ae03c0f2d26 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Mon, 13 May 2024 07:22:47 +0100
-Subject: [PATCH] libgloss: microblaze: fix read and _write declarations
-
-This patch resolves the following build error which occurs with gcc 14.1.0:
-../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
-../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
-    3 |         _write(1, &c, 1);
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
-Upstream: https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/
----
- libgloss/microblaze/linux-inbyte.c  | 2 ++
- libgloss/microblaze/linux-outbyte.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/libgloss/microblaze/linux-inbyte.c b/libgloss/microblaze/linux-inbyte.c
-index 58fdf1957..2f8d33871 100644
---- a/libgloss/microblaze/linux-inbyte.c
-+++ b/libgloss/microblaze/linux-inbyte.c
-@@ -1,3 +1,5 @@
-+extern int read (int, char *, int);
-+
- int inbyte(void)
- {
- 	char ch = 0;
-diff --git a/libgloss/microblaze/linux-outbyte.c b/libgloss/microblaze/linux-outbyte.c
-index 9d7bc4890..46de511f6 100644
---- a/libgloss/microblaze/linux-outbyte.c
-+++ b/libgloss/microblaze/linux-outbyte.c
-@@ -1,3 +1,5 @@
-+extern int _write (int, char *, int);
-+
- void outbyte (unsigned char c)
- {
- 	_write(1, &c, 1);
--- 
-2.25.1
-
diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
index 827925373e..b22602033c 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.hash
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib-4.4.0.20231231.tar.gz
+sha256  33f12605e0054965996c25c1382b3e463b0af91799001f5bb8c0630f2ec8c852  newlib-4.5.0.20241231.tar.gz
 
 # Hashes for license files locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
-sha256  9a59b4ee3af067045fe0ea78786201c42d54756fe48cbccf44f3dfc398474717  COPYING.NEWLIB
+sha256  bdaffd5fff30cb5fc7a239a4fa0b95f703590f7b3813ca7f4e76ff46437aeb81  COPYING.LIBGLOSS
+sha256  fcfb5ec69b6ab52676dcc4dab7cf4338c8000ef97812dadd35b8592a640a8419  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
index 89092eb973..a3532f0b22 100644
--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWLIB_BARE_METAL_VERSION = 4.4.0.20231231
+NEWLIB_BARE_METAL_VERSION = 4.5.0.20241231
 NEWLIB_BARE_METAL_SITE = https://sourceware.org/ftp/newlib
 NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).tar.gz
 NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
