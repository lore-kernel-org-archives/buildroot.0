Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD4CC87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37B84042D;
	Thu,  7 Aug 2025 17:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m0pB--N2Cir; Thu,  7 Aug 2025 17:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC7994041D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC7994041D;
	Thu,  7 Aug 2025 17:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C8E31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3307B80C05
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahyv5sM1Qd_C for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91C4380C02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91C4380C02
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DB7182AE0; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:50:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 25284c803ab53bb0c2b6fc6cb5803c6e2381d13b
X-Git-Newrev: f816420fd4840f0d17e54d3a5d6cf2f3e05060f2
X-Patchwork-Hint: ignore
Message-Id: <20250807170022.8DB7182AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc: drop dead
 code related to BR2_GCC_SUPPORTS_LIBCILKRTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=f816420fd4840f0d17e54d3a5d6cf2f3e05060f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The libcilkrts library was removed from gcc 8.x, and gcc 8.x is the
oldest version we allow building (to still support PowerPC SPE). So it
means the BR2_GCC_SUPPORTS_LIBCILKRTS is basically dead code because:

	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8

Will never evaluate to 'y' in current Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 62e784cb97641b5d09eaab04f81e10982d636bcc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc/Config.in.host         |  5 -----
 package/gcc/gcc-final/gcc-final.mk | 19 -------------------
 2 files changed, 24 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b6b159224e..401f2dbe2a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -53,11 +53,6 @@ config BR2_GCC_VERSION_14_X
 
 endchoice
 
-# libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
-config BR2_GCC_SUPPORTS_LIBCILKRTS
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-
 config BR2_GCC_SUPPORTS_DLANG
 	bool
 	default y if BR2_aarch64
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 99d7047b5f..43aea72420 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -85,25 +85,6 @@ else
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
 endif
 
-ifeq ($(BR2_GCC_SUPPORTS_LIBCILKRTS),y)
-
-# libcilkrts does not support v8
-ifeq ($(BR2_sparc),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-# Pthreads are required to build libcilkrts
-ifeq ($(BR2_PTHREADS_NONE),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-# disable libcilkrts as there is no static version
-HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
-endif
-
-endif # BR2_GCC_SUPPORTS_LIBCILKRTS
-
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
