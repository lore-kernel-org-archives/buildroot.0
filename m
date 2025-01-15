Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90EC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC3B6FCA2;
	Fri, 28 Feb 2025 16:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jATTNAZjG7Hc; Fri, 28 Feb 2025 16:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77FE2706DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FE2706DC;
	Fri, 28 Feb 2025 16:59:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42CAA1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B1C42E06
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jho0K_mN3OVW for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E2342E13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E2342E13
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D8078118C; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: febe8a888c0ea3e1d5ec5b19858fcc359dc6f40f
X-Git-Newrev: 237bd32f0bf9aaf3b24e494b0bdaa63f8dbc3069
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.1D8078118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_99410 (nios2 only)
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

commit: https://git.buildroot.net/buildroot/commit/?id=237bd32f0bf9aaf3b24e494b0bdaa63f8dbc3069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/belle-sip/belle-sip.mk |  4 ----
 package/matio/matio.mk         |  4 ----
 toolchain/Config.in            | 10 ----------
 3 files changed, 18 deletions(-)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index c9bcc3f55d..b4de3612ce 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -35,10 +35,6 @@ endif
 
 BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-BELLE_SIP_CFLAGS += -O0
-endif
-
 BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
 
 $(eval $(cmake-package))
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index dc9be2ac18..d378f06e5b 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -19,10 +19,6 @@ MATIO_CONF_ENV = ac_cv_va_copy=yes
 
 MATIO_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-MATIO_CFLAGS += -O0
-endif
-
 MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
 
 # mat73 require hdf5 (not available), extented-sparse take 2KB
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 23123138e5..86ab3710a0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,16 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
-# Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
-# on gcc 12.x
-config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_nios2
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
 # still exists in gcc = 11.1.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
