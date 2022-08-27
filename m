Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5F0ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8366F60D6F;
	Sat, 27 Aug 2022 13:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8366F60D6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7YlbRuC4YuM; Sat, 27 Aug 2022 13:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D23860D5D;
	Sat, 27 Aug 2022 13:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D23860D5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09B0F1BF588
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D949C60D5D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D949C60D5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FfxWU3DXq0v for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D976F60D51
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D976F60D51
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2BD1A87DF1; Sat, 27 Aug 2022 13:25:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 15:39:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ccf0abeeea242a9c95b0ef09c65cb10e1fa93ef
X-Git-Newrev: 4ebdf1c47bd0d4e16f0fecc6363281f8cb59227b
X-Patchwork-Hint: ignore
Message-Id: <20220827132551.2BD1A87DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwpe: security bump to version
 1.12.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ebdf1c47bd0d4e16f0fecc6363281f8cb59227b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update fixes a potential memory allocation issue. There is no
associated advisory, though. Release notes:

  https://wpewebkit.org/release/libwpe-1.12.1.html
  https://wpewebkit.org/release/libwpe-1.12.2.html
  https://wpewebkit.org/release/libwpe-1.12.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 2ebe4f19bd..2bbe1f0749 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.12.0.tar.xz.sums
-md5  5a3f11789535d826370ba465ea141393  libwpe-1.12.0.tar.xz
-sha1  91aa47a593a5db511d667b3bdbaa76dee4301311  libwpe-1.12.0.tar.xz
-sha256  e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c  libwpe-1.12.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.12.3.tar.xz.sums
+md5  e538eb8e521d92f2bde3c4cd864abaa1  libwpe-1.12.3.tar.xz
+sha1  9d94c411a502a10e68f69bd1fa273539cc6af2ca  libwpe-1.12.3.tar.xz
+sha256  b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d  libwpe-1.12.3.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index fe3c4b16d7..ac533642d9 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.12.0
+LIBWPE_VERSION = 1.12.3
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
