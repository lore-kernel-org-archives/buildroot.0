Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36712CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D71C883BE8;
	Wed, 20 Aug 2025 16:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L64yuXmp_qJu; Wed, 20 Aug 2025 16:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5EC383BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EC383BA4;
	Wed, 20 Aug 2025 16:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1301E7AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28FDC81799
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnHJkQsFmTA9 for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D0B81755
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D0B81755
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:37:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE009879C4; Wed, 20 Aug 2025 16:37:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 17:51:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ae23dc70fba3f0139745b67377a26fd202b96b0
X-Git-Newrev: 4d9e973d724b3fb5c99f57d6db61c94c834ab234
X-Patchwork-Hint: ignore
Message-Id: <20250820163742.EE009879C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-good: security bump
 to version 1.24.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d9e973d724b3fb5c99f57d6db61c94c834ab234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following vulnerabilities:

- CVE-2025-47219: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0004.html

- CVE-2025-47183: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0005.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 0c5192c515..a8b17f3d0d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.11.tar.xz.sha256sum
-sha256  94bf3b5118dd4213af66048faac830569cc9a94a8c8e59e8a6d33b315f518462  gst-plugins-good-1.24.11.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.13.tar.xz.sha256sum
+sha256  574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b  gst-plugins-good-1.24.13.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index a7ab9a0326..cd1b9f45b9 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.24.11
+GST1_PLUGINS_GOOD_VERSION = 1.24.13
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
