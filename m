Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F464C3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 07:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC36408E6;
	Sat, 17 May 2025 07:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oekhFH3jNeLr; Sat, 17 May 2025 07:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E697940887
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E697940887;
	Sat, 17 May 2025 07:37:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 444781DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299E3812D9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0TeNhHsjylR for <buildroot@buildroot.org>;
 Sat, 17 May 2025 07:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DBDA811AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DBDA811AF
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C82D86799; Sat, 17 May 2025 07:37:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 09:28:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc93da91ac44ebf9ed6cf29d6a24c0632854f5a4
X-Git-Newrev: d9aabc1af39fc478e5aeee446bd2d814a2dcbda5
X-Patchwork-Hint: ignore
Message-Id: <20250517073725.5C82D86799@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/m4: bump to 1.4.20
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9aabc1af39fc478e5aeee446bd2d814a2dcbda5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version bundles an updated gnulib that includes support for
-std=c23 which is the default for gcc 15.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/m4/m4.hash |  2 +-
 package/m4/m4.mk   | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index a81f4fab9c..a5b8456cc2 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96  m4-1.4.19.tar.xz
+sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index f5e1e27ad8..396c2bbee2 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,20 +4,10 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.19
+M4_VERSION = 1.4.20
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 
-# gcc-15 defaults to -std=gnu23 which is incorrectly detected and
-# generates build failures in the gnulib copy included in
-# m4-1.4.19. We workaround this by forcing the previous gcc default
-# standard, which is -std=gnu17 only when host gcc is >= 15. This
-# workaround can be removed when m4 will be updated to a version
-# including a fix for gcc-15.
-ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
-HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
-endif
-
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
