Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE5C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7654275C;
	Sat,  8 Jun 2024 11:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv7BBX1_drVK; Sat,  8 Jun 2024 11:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F1C04275D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1C04275D;
	Sat,  8 Jun 2024 11:39:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D39281BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC8B042655
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tpxxAJIV9fF for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA92A4052C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA92A4052C
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFFE586F74; Sat,  8 Jun 2024 11:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:24:47 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5f092f70e7260bcc12e3302288b5dcfdf25032c8
X-Git-Newrev: 885a2a466780b02b75689e38eab4b8d2b191c8d2
X-Patchwork-Hint: ignore
Message-Id: <20240608113942.CFFE586F74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/kodi: remove
 libatomic from linker flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=885a2a466780b02b75689e38eab4b8d2b191c8d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Kodi added detection for atomic/libatomic with commit
https://github.com/xbmc/xbmc/commit/1673f476b802da1da942cef256cae6272fdf9a4b
so we can remove our own code to handle the dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 31e7ca602686f936a7ca9baa6830f16d9744e429)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 085169367d..0db79bbb28 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -205,11 +205,6 @@ else
 KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
 endif
 
-# mips: uses __atomic_load_8
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 KODI_C_FLAGS += -std=gnu99
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
