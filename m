Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A71AC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55BA584499;
	Fri,  9 Aug 2024 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhR7RWc8oFvp; Fri,  9 Aug 2024 19:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC64A844CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC64A844CC;
	Fri,  9 Aug 2024 19:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FFF11BF990
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D0B48447F
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwyTpbxqej-B for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DC084484
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DC084484
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2371184E15; Fri,  9 Aug 2024 19:37:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 21:34:48 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: b8ec6c9b64f50d7263871cfe0b77a81ff77e8fe0
X-Git-Newrev: be5c48e20cb5022ae38c404906587cc54e85e25b
X-Patchwork-Hint: ignore
Message-Id: <20240809193706.2371184E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/cdrkit: convert
 first patch to Git formatted one
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

commit: https://git.buildroot.net/buildroot/commit/?id=be5c48e20cb5022ae38c404906587cc54e85e25b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 347def2fd1f062be5d335d06aaaec577c5fa1d68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                    |  2 +-
 ...-no-rcmd.patch => 0001-fix-build-with-uClibc.patch} | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 214b45a57c..d848e20e58 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -453,7 +453,7 @@ package/cache-calibrator/0001-Fix-conflicting-round-function.patch lib_patch.Ups
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
