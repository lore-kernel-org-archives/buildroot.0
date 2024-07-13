Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585A4C3DA4D
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C38961077;
	Sat, 13 Jul 2024 09:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M01XUVErlxKk; Sat, 13 Jul 2024 09:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0E360FD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0E360FD9;
	Sat, 13 Jul 2024 09:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE1BF1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D82FA83EF8
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUHbuXbgrhnl for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1452382085
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1452382085
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0915F8634A; Sat, 13 Jul 2024 09:41:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:39:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa549fb95f8409c2b364cd1d8257f92a1b693720
X-Git-Newrev: 347def2fd1f062be5d335d06aaaec577c5fa1d68
X-Patchwork-Hint: ignore
Message-Id: <20240713094126.0915F8634A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cdrkit: convert first patch to Git
 formatted one
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=347def2fd1f062be5d335d06aaaec577c5fa1d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                    |  2 +-
 ...-no-rcmd.patch => 0001-fix-build-with-uClibc.patch} | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ade6c9fd20..6b4412a193 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -395,7 +395,7 @@ package/cache-calibrator/0001-Fix-conflicting-round-function.patch lib_patch.Ups
 package/cairo/0001-_arc_max_angle_for_tolerance_normalized-fix-infinite.patch lib_patch.Upstream
 package/cairo/0002-Fix-mask-usage-in-image-compositor.patch lib_patch.Upstream
 package/caps/0001-Fix-stdint-types-with-musl.patch lib_patch.Upstream
-package/cdrkit/0001-no-rcmd.patch lib_patch.Upstream
+package/cdrkit/0001-fix-build-with-uClibc.patch lib_patch.Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch lib_patch.Upstream
 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch lib_patch.Upstream
 package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
diff --git a/package/cdrkit/0001-no-rcmd.patch b/package/cdrkit/0001-fix-build-with-uClibc.patch
similarity index 59%
rename from package/cdrkit/0001-no-rcmd.patch
rename to package/cdrkit/0001-fix-build-with-uClibc.patch
index 294779f7a5..27203eee64 100644
--- a/package/cdrkit/0001-no-rcmd.patch
+++ b/package/cdrkit/0001-fix-build-with-uClibc.patch
@@ -1,17 +1,20 @@
-[PATCH] fix build with uClibc
+From 13823cfe42f33e947f8375f5a3f9ee177c699960 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 13 Jul 2024 10:57:57 +0200
+Subject: [PATCH] fix build with uClibc
 
 cdrkit unconditionally enables code using rcmd(3), which isn't available
 on uClibc.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
- include/xconfig.h.in |    1 -
+ include/xconfig.h.in | 1 -
  1 file changed, 1 deletion(-)
 
-Index: cdrkit-1.1.10/include/xconfig.h.in
-===================================================================
---- cdrkit-1.1.10.orig/include/xconfig.h.in
-+++ cdrkit-1.1.10/include/xconfig.h.in
+diff --git a/include/xconfig.h.in b/include/xconfig.h.in
+index c130600..00f2044 100644
+--- a/include/xconfig.h.in
++++ b/include/xconfig.h.in
 @@ -187,7 +187,6 @@
   *	they are placed before the large file tests.
   */
@@ -20,3 +23,6 @@ Index: cdrkit-1.1.10/include/xconfig.h.in
  #define HAVE_SOCKET 1		/* socket() is present in libc/libsocket */
  #define HAVE_SOCKETPAIR 1		/* socketpair() is present in libc/libsocket */
  #define HAVE_GETSERVBYNAME 1	/* getservbyname() is present in libc/libsocket */
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
