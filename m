Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D5CA0FE2
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1FC78470A;
	Thu, 21 Aug 2025 19:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvdmzAVUCinr; Thu, 21 Aug 2025 19:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351F684703
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351F684703;
	Thu, 21 Aug 2025 19:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7BCB1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBB0140D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wj3Qe9y9B2kT for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC90540CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC90540CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD96F8141F; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:34:23 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 8517dc056d345619dfb75185bddab3d2152e2e01
X-Git-Newrev: 7cc3b082a3b98211d8682ef2f2273df0a11864b3
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.DD96F8141F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/gst1-plugins-good: security bump to version 1.24.13
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7cc3b082a3b98211d8682ef2f2273df0a11864b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following vulnerabilities:

- CVE-2025-47219: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0004.html

- CVE-2025-47183: An Out-of-bounds read in the MOV/MP4 demuxer that can
  cause crashes or potentially information leaks for certain input files.

  https://gstreamer.freedesktop.org/security/sa-2025-0005.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4d9e973d724b3fb5c99f57d6db61c94c834ab234)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
