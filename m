Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A4C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81184813C3;
	Sun, 30 Jun 2024 14:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caNavSxdvWvO; Sun, 30 Jun 2024 14:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3163C812D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3163C812D1;
	Sun, 30 Jun 2024 14:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED8851BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86D5340180
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BH7W46En2vZj for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977A940130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 977A940130
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:43:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CF40836CA; Sun, 30 Jun 2024 14:43:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:39:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e01942d83c57ce4973e549afa4735a52394de35
X-Git-Newrev: b752d0e4cc78a921ba08cd891f68ef80fc251128
X-Patchwork-Hint: ignore
Message-Id: <20240630144337.7CF40836CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: security bump to version
 3.0.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=b752d0e4cc78a921ba08cd891f68ef80fc251128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://www.videolan.org/security/sb-vlc3021.html

Release notes:
https://code.videolan.org/videolan/vlc/-/blob/3.0.21/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 40529bd664..b3d9a083b9 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha256
-sha256  adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5  vlc-3.0.20.tar.xz
-# From https://get.videolan.org/vlc/3.0.20/vlc-3.0.20.tar.xz.sha1
-sha1  b834516ab701bf6311980ed5d67b77c834fdebe7  vlc-3.0.20.tar.xz
+# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha256
+sha256  24dbbe1d7dfaeea0994d5def0bbde200177347136dbfe573f5b6a4cee25afbb0  vlc-3.0.21.tar.xz
+# From https://get.videolan.org/vlc/3.0.21/vlc-3.0.21.tar.xz.sha1
+sha1  be8557fc2f4be58caebe4a8b1d70f03dc6b95792  vlc-3.0.21.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index d0fc1744c0..a597616470 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.20
+VLC_VERSION = 3.0.21
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
