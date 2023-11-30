Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1E2C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F704365B;
	Thu, 30 Nov 2023 23:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4F704365B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZ6_lIJc5AIf; Thu, 30 Nov 2023 23:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36F324366F;
	Thu, 30 Nov 2023 23:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F324366F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126C61BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CCF41E56
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CCF41E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGIqWcBctMFO for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C96D41E7B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C96D41E7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38EE18766A; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:43:17 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: be0ceaef5623ae67d69fa1b830dd4a35d21dc4f4
X-Git-Newrev: e169bc91a4e9170495b4f33e055091b3983cb087
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.38EE18766A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/vlc: bump version
 to 3.0.19
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
Content-Type: multipart/mixed; boundary="===============6210730013739540363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6210730013739540363==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e169bc91a4e9170495b4f33e055091b3983cb087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Rebased patch 0006 due to upstream commit
https://code.videolan.org/videolan/vlc/-/commit/3f9fc44176cc5505132977885799fa988c5e7701

Release notes: https://code.videolan.org/videolan/vlc/-/blob/3.0.19/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f45fa3b4059373c7287eafeb6466cc491734b958)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...06-posix-remove-ancient-run-time-fallback-to-real-time-.patch | 9 +++++----
 package/vlc/vlc.hash                                             | 8 ++++----
 package/vlc/vlc.mk                                               | 2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch b/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
index 4fc639e222..5211ef882b 100644
--- a/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
+++ b/package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch
@@ -23,6 +23,7 @@ posix/thread.c: In function ‘vlc_clock_setup_once’:
 posix/thread.c:88:18: error: lvalue required as left operand of assignment
      vlc_clock_id = (val < 0) ? CLOCK_REALTIME : CLOCK_MONOTONIC;
 
+[Bernd: rebased for 3.0.19]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  src/posix/thread.c | 96 +++++++-----------------------------------------------
@@ -93,7 +94,7 @@ index dab8b71f97..8878941913 100644
 -# warning Monotonic clock not available. Expect timing issues.
 -#endif /* _POSIX_TIMERS */
 -
- static struct timespec mtime_to_ts (mtime_t date)
+ static struct timespec mtime_to_ts (vlc_tick_t date)
  {
      lldiv_t d = lldiv (date, CLOCK_FREQ);
 @@ -233,14 +187,11 @@ void vlc_cond_init (vlc_cond_t *p_condvar)
@@ -117,7 +118,7 @@ index dab8b71f97..8878941913 100644
  
 @@ -625,44 +576,27 @@ void vlc_control_cancel (int cmd, ...)
  
- mtime_t mdate (void)
+ vlc_tick_t mdate (void)
  {
 -#if (_POSIX_TIMERS > 0)
      struct timespec ts;
@@ -140,7 +141,7 @@ index dab8b71f97..8878941913 100644
  }
  
  #undef mwait
- void mwait (mtime_t deadline)
+ void mwait (vlc_tick_t deadline)
  {
 -#if (_POSIX_CLOCK_SELECTION > 0)
 -    vlc_clock_setup ();
@@ -165,7 +166,7 @@ index dab8b71f97..8878941913 100644
  }
  
  #undef msleep
-@@ -670,15 +604,7 @@ void msleep (mtime_t delay)
+@@ -670,15 +604,7 @@ void msleep (vlc_tick_t delay)
  {
      struct timespec ts = mtime_to_ts (delay);
  
diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 4b9940df33..ef381e5934 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha256
-sha256  57094439c365d8aa8b9b41fa3080cc0eef2befe6025bb5cef722accc625aedec  vlc-3.0.18.tar.xz
-# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha1
-sha1  b11ccaa0f5ee15a550564817d60458eb0946f80e  vlc-3.0.18.tar.xz
+# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha256
+sha256  643e3294bafe922324663ca499515b7564f2794575fd7d2b7992d20896381745  vlc-3.0.19.tar.xz
+# From https://get.videolan.org/vlc/3.0.19/vlc-3.0.19.tar.xz.sha1
+sha1  6d162248a26fdd76a9d4e7e3d52f40d4326f72c1  vlc-3.0.19.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index c6ae46f469..729e928b4d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.18
+VLC_VERSION = 3.0.19
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+

--===============6210730013739540363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6210730013739540363==--
