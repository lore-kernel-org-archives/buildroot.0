Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9985C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DA3361364;
	Mon,  1 May 2023 07:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA3361364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYZ0bqexsaBO; Mon,  1 May 2023 07:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B145612CB;
	Mon,  1 May 2023 07:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B145612CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7D531BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D44882043
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D44882043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2oAPnN8HwdTr for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD4C82046
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD4C82046
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 647548467F; Mon,  1 May 2023 07:18:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2ad585bc539fffe56609d027687eb3e7c8f5302
X-Git-Newrev: 0022cde5300c01a90480fa26c4d5632d57a02086
X-Patchwork-Hint: ignore
Message-Id: <20230501071802.647548467F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=0022cde5300c01a90480fa26c4d5632d57a02086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch.

Upstream removed the dependency to libavresample:
https://github.com/tvheadend/tvheadend/commit/17a357fee8bccacd931476411200b05f2b06f47c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/0001-no-check_config.patch | 2 +-
 package/tvheadend/Config.in                  | 1 -
 package/tvheadend/tvheadend.hash             | 2 +-
 package/tvheadend/tvheadend.mk               | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index 9261e5fff6..45c862d300 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -12,7 +12,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
 --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
 +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
-@@ -708,7 +708,7 @@
+@@ -710,7 +710,7 @@
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 99a24ec011..3d21897c6d 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -63,7 +63,6 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	# vp8 encoder needs c++
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 45c8bd62b0..004619f4f4 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06c6d33a8e9d1d645cea9c63a06f6bddb309e5546177966d7b9285f68313bf5b  tvheadend-c9a156a25a07f1f84c2f48a1b03b481430c8257d.tar.gz
+sha256  a4ce9ef9299901ebbb5849aba9bb9de3e8f0ab4d1166f1f06ea25997d10d06f6  tvheadend-18effa8ad93e901f3cdaa534123d910f14453d1f.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0ca8f46dc5..c0fa83be8a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c9a156a25a07f1f84c2f48a1b03b481430c8257d
+TVHEADEND_VERSION = 18effa8ad93e901f3cdaa534123d910f14453d1f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
