Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253DEC2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4CD960A9A;
	Mon, 24 Jun 2024 20:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drxW7VjWAP-n; Mon, 24 Jun 2024 20:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1984B6100A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1984B6100A;
	Mon, 24 Jun 2024 20:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 116C01BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6880860A77
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3CEeNPES9gI for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA9660A80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DA9660A80
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 891F882B80; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:55:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db589f9df5587e37f1ba2c2654e8e693f88f4d74
X-Git-Newrev: eb8606348fe338cd8cef7538b1440e8a67887845
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.891F882B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5base: update the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb8606348fe338cd8cef7538b1440e8a67887845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qt5/qt5base/0006-Fix-build-on-riscv32.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
index 5561acb9ae..ff24fbff83 100644
--- a/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
+++ b/package/qt5/qt5base/0006-Fix-build-on-riscv32.patch
@@ -1,7 +1,7 @@
-From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
+From 25a0057e8d7afaab3492e03efb3f85581f1cf9b2 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 27 Aug 2021 16:28:32 +0200
-Subject: Fix build on riscv32
+Subject: [PATCH] Fix build on riscv32
 
 riscv32 fails to build because __NR_futex is not defined on this
 architecture:
@@ -21,15 +21,17 @@ Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
 [Retrieved from:
 https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/corelib/thread/qfutex_p.h | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
-index 40482b6fc1..037207a5c0 100644
+index f287b752d75f..fd7d09ac8572 100644
 --- a/src/corelib/thread/qfutex_p.h
 +++ b/src/corelib/thread/qfutex_p.h
-@@ -103,6 +103,11 @@ QT_END_NAMESPACE
+@@ -81,6 +81,11 @@ QT_END_NAMESPACE
  // if not defined in linux/futex.h
  #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
  
@@ -38,9 +40,9 @@ index 40482b6fc1..037207a5c0 100644
 +#    define __NR_futex __NR_futex_time64
 +#  endif
 +
- QT_BEGIN_NAMESPACE
- namespace QtLinuxFutex {
-     constexpr inline bool futexAvailable() { return true; }
+ #  if __has_feature(thread_sanitizer) || defined(__SANITIZE_THREAD__)
+ #    include <sanitizer/tsan_interface.h>
+ inline void _q_tsan_acquire(void *addr, void *addr2)
 -- 
-cgit v1.2.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
