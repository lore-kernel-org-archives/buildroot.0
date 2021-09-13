Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C08561B49
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C08561B49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0267980FD8;
	Mon, 13 Sep 2021 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9-x8WDrJf3E; Mon, 13 Sep 2021 13:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CDE480F92;
	Mon, 13 Sep 2021 13:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C27B41BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7D160701
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EZRtv2ecwzT for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECAD060704
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 51F838A56B; Mon, 13 Sep 2021 13:41:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:35:11 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a6f3c70a1750c8067ef6885dcae5a6014ae2e7f2
X-Git-Newrev: 5080c044ccdb3b0baba2dd1ce9628386a02e49d9
X-Patchwork-Hint: ignore
Message-Id: <20210913134145.51F838A56B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mc: fix build
 with ncurses
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

commit: https://git.buildroot.net/buildroot/commit/?id=5080c044ccdb3b0baba2dd1ce9628386a02e49d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

wchar support in ncurses is needed since version 4.8.26 and
https://github.com/MidnightCommander/mc/commit/8b4386df83ab5a525f0568113fe1e53d362f433e

Fixes:
 - http://autobuild.buildroot.org/results/446eb0a15a728e2fe7a58312bb7329983b2df647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3a69aa0fd30cf83acda8f7eebce95e3b3089a76c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch | 32 ++++++++++++++++++++++
 package/mc/Config.in                               |  1 +
 2 files changed, 33 insertions(+)

diff --git a/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
new file mode 100644
index 0000000000..6dfae52af5
--- /dev/null
+++ b/package/mc/0001-Ticket-4181-FTBFS-against-NCurses-on-OS-X-10-9-5.patch
@@ -0,0 +1,32 @@
+From ba62dd32add2767d6d13f9abb82f43304418740f Mon Sep 17 00:00:00 2001
+From: Andrew Borodin <aborodin@vmail.ru>
+Date: Sun, 24 Jan 2021 14:19:22 +0300
+Subject: [PATCH] Ticket #4181: FTBFS against NCurses on OS X 10.9.5.
+
+lib/tty/tty-ncurses.h: define _XOPEN_SOURCE_EXTENDED to use cchar_t,
+getcchar(), setcchar().
+
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+[Retrieved from:
+https://github.com/MidnightCommander/mc/commit/ba62dd32add2767d6d13f9abb82f43304418740f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/tty/tty-ncurses.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/tty/tty-ncurses.h b/lib/tty/tty-ncurses.h
+index 9962c7c413..d75df9533a 100644
+--- a/lib/tty/tty-ncurses.h
++++ b/lib/tty/tty-ncurses.h
+@@ -2,6 +2,11 @@
+ #ifndef MC__TTY_NCURSES_H
+ #define MC__TTY_NCURSES_H
+ 
++/* for cchar_t, getcchar(), setcchar() */
++#ifndef _XOPEN_SOURCE_EXTENDED
++#define _XOPEN_SOURCE_EXTENDED
++#endif
++
+ #ifdef USE_NCURSES
+ #ifdef HAVE_NCURSES_CURSES_H
+ #include <ncurses/curses.h>
diff --git a/package/mc/Config.in b/package/mc/Config.in
index 61f351c41d..ac512116ca 100644
--- a/package/mc/Config.in
+++ b/package/mc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MC
 	select BR2_PACKAGE_LIBGLIB2
 	# mc prefers slang, but can use ncurses too
 	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR if BR2_PACKAGE_NCURSES
 	help
 	  GNU Midnight Commander is a visual file manager, licensed
 	  under GNU General Public License. It can use either SLang
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
