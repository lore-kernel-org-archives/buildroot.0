Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9089C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70CFF4F01A;
	Fri, 28 Feb 2025 17:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GxrWgivt9ox; Fri, 28 Feb 2025 17:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A67504ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A67504ED;
	Fri, 28 Feb 2025 17:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0648F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 519D942E08
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I04nrU1RL8V for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1142742E10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1142742E10
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A600818ED; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 895fe8d0f775095bbc7294b8366dbe9fa7a4968a
X-Git-Newrev: febe8a888c0ea3e1d5ec5b19858fcc359dc6f40f
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.0A600818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_93847 (nios2 only)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=febe8a888c0ea3e1d5ec5b19858fcc359dc6f40f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/asterisk/asterisk.mk | 4 ----
 package/git/git.mk           | 2 +-
 toolchain/Config.in          | 7 -------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e27aa2f760..7b99d30fd9 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -290,10 +290,6 @@ ASTERISK_MAKE_OPTS += OPTIMIZE=""
 
 ASTERISK_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
-ASTERISK_CFLAGS += -O0
-endif
-
 ASTERISK_CONF_OPTS += CFLAGS="$(ASTERISK_CFLAGS)"
 
 # We want to install sample configuration files, too.
diff --git a/package/git/git.mk b/package/git/git.mk
index f56807a00f..bc17c9a993 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -66,7 +66,7 @@ endif
 
 GIT_CFLAGS = $(TARGET_CFLAGS)
 
-ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 GIT_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 87160af3d7..23123138e5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,13 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
-# ICE: compiler error: Segmentation fault on Nios II. This bug
-# no longer exists in gcc 9.x.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
-	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
