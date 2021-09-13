Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4249C433FE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7659361B2C
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7659361B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C84240394;
	Mon, 13 Sep 2021 13:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IumNo_sOjTUn; Mon, 13 Sep 2021 13:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95FF140390;
	Mon, 13 Sep 2021 13:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEE451BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD0724036D
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wN7lA3Cp4Pz for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0980B4036F
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 543D98A535; Mon, 13 Sep 2021 13:41:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:34:37 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: addd22d4dcba1c862321e4802cc69e324ef3a109
X-Git-Newrev: 421226cbe0ab217eeb1354c96a25509992b090d7
X-Patchwork-Hint: ignore
Message-Id: <20210913134140.543D98A535@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mc: security bump
 version to 4.8.27
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=421226cbe0ab217eeb1354c96a25509992b090d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Removed patch which was backported from upstream and is now included in
this release.

Changelog: https://midnight-commander.org/wiki/NEWS-4.8.27

Fixes CVE-2021-36370:
https://mail.gnome.org/archives/mc/2021-August/msg00010.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f37cc65fa6f0317b13e73dcf01ab0685f0df3d75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch | 32 ----------------------
 package/mc/mc.hash                                 |  4 +--
 package/mc/mc.mk                                   |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
deleted file mode 100644
index 6dfae52af5..0000000000
--- a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ba62dd32add2767d6d13f9abb82f43304418740f Mon Sep 17 00:00:00 2001
-From: Andrew Borodin <aborodin@vmail.ru>
-Date: Sun, 24 Jan 2021 14:19:22 +0300
-Subject: [PATCH] Ticket #4181: FTBFS against NCurses on OS X 10.9.5.
-
-lib/tty/tty-ncurses.h: define _XOPEN_SOURCE_EXTENDED to use cchar_t,
-getcchar(), setcchar().
-
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
-[Retrieved from:
-https://github.com/MidnightCommander/mc/commit/ba62dd32add2767d6d13f9abb82f43304418740f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/tty/tty-ncurses.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
-index 9962c7c413..d75df9533a 100644
---- a/lib/tty/tty-ncurses.h
-+++ b/lib/tty/tty-ncurses.h
-@@ -2,6 +2,11 @@
- #ifndef MC__TTY_NCURSES_H
- #define MC__TTY_NCURSES_H
- 
-+/* for cchar_t, getcchar(), setcchar() */
-+#ifndef _XOPEN_SOURCE_EXTENDED
-+#define _XOPEN_SOURCE_EXTENDED
-+#endif
-+
- #ifdef USE_NCURSES
- #ifdef HAVE_NCURSES_CURSES_H
- #include <ncurses/curses.h>
diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 63fbfa3213..6400f64b99 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.26.sha256
-sha256  c6deadc50595f2d9a22dc6c299a9f28b393e358346ebf6ca444a8469dc166c27  mc-4.8.26.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.27.sha256
+sha256  31be59225ffa9920816e9a8b3be0ab225a16d19e4faf46890f25bdffa02a4ff4  mc-4.8.27.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 50dc50f65e..678d687bcf 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.26
+MC_VERSION = 4.8.27
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
