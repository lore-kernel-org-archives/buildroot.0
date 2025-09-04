Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0EBCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C9A605FF;
	Thu,  4 Sep 2025 16:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsaBgSdLFNqd; Thu,  4 Sep 2025 16:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C841760603
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C841760603;
	Thu,  4 Sep 2025 16:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1696FAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10DAA80790
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imlGiJtbnLk4 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9796B80761
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9796B80761
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88F6287F46; Thu,  4 Sep 2025 16:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7229f0fdde0bb108ca81326b661204242f5530d4
X-Git-Newrev: b57939e61959923180c40aeda7700ee62ef95113
X-Patchwork-Hint: ignore
Message-Id: <20250904161347.88F6287F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ffmpeg: security
 bump version to 6.1.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b57939e61959923180c40aeda7700ee62ef95113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;h=01cd1ba06fa6570f34e41fd8374f543c7e181604;hb=01d3f764f79b2f571174a4cec855e651258f20ec

Fixes CVE-2023-6602:
https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=ceacc83011a0a5057769626faf14b9256bd3baa7
https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=c599745377199fa75fffb30058fb2a6f39d64ab7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a3a1364f3d58487ea647c0d11b844fcfa221634e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 50498a6ba9..99c3da5e74 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f0b2b07c7014b7aa8c4689095b83a49a85d41887049fc5302543aec0bef7d066  ffmpeg-n6.1.2-27-ge16ff06adb-git4.tar.gz
+sha256  bc5f1e4a4d283a6492354684ee1124129c52293bcfc6a9169193539fbece3487  ffmpeg-6.1.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 30cf7020de..8ee45a8034 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# Update FFMPEG_CPE_ID_VERSION if needed
-FFMPEG_VERSION = n6.1.2-27-ge16ff06adb
-FFMPEG_SITE = https://git.ffmpeg.org/ffmpeg.git
-FFMPEG_SITE_METHOD = git
+FFMPEG_VERSION = 6.1.3
+FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
+FFMPEG_SITE = https://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-FFMPEG_CPE_ID_VERSION = 6.1.2
 
 FFMPEG_LICENSE = LGPL-2.1+, libjpeg license
 FFMPEG_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
