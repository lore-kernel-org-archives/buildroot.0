Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10991E937EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F60616D4;
	Sun, 12 Apr 2026 17:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk1igggm22ID; Sun, 12 Apr 2026 17:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F248616D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016653;
	bh=02giu58DjS9BGgylL9/XJMswxifeDrgL2D5WgGqjAMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=obdjRjqF8HPk85cg6YbBG7eNLS1AfFyrqUL4MZJ4+wrMkIAzZG0Qj96G6taVMK3kq
	 knVDwdwnk/opPgccHN7ddX143Y6A/+XNFqixBeafXmOMEKjwf2WVHOs9Mt5g2ODbPP
	 6Wd7+5sKAiu52vGz8GNxPkFUD4PdRbcRTqzfP8E/jASWJMqBI2Yrm5PtpxNSFi1/lX
	 6d6ex6J1iPf1ukgf6JIfLHaHaPb46IxNDRRgqYQ012haX3LAJ0KpvIWH/6AnwoP2SB
	 hETPX15lpjXygUx2xEX7gAdpzHjn/1VRQtbBdgvaVq02TgiIH2gxoJ7VmTTJgvpZqj
	 J41Us74Z77wpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F248616D8;
	Sun, 12 Apr 2026 17:57:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6642A31F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D7D616D5
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zDAkG4wXReY for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2FA0616D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2FA0616D4
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 406E0811FF; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 19:07:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1014d8ffb6b6d4f20888c4cb62f4a05d1c63d04a
X-Git-Newrev: f02b6b03188876c0790777134186c3b42694871d
X-Patchwork-Hint: ignore
Message-Id: <20260412175730.406E0811FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version to git
 commit 37453bc3fe
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f02b6b03188876c0790777134186c3b42694871d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tvheadend/tvheadend/compare/5abbcda4d8c82d2d4889452a7056a7bfcd728fc6...37453bc3fe5f9e10f3428ebb1abdc613f8b07186

Updated license hash due to upstream commit
https://github.com/tvheadend/tvheadend/commit/4adb0cb06be5b936bcf09fccba7fde79aab8cd49

Moved mandatory dtv-scan-tables dependency to main block.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 0ec391b8b9..1062dd2c81 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f3c311c2bed4de5b0312286f5b1a0307edf502fa0ed360855eedb044d4247674  tvheadend-5abbcda4d8c82d2d4889452a7056a7bfcd728fc6.tar.gz
-sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
+sha256  0ced1ea6ce8b78ac9bfc7e6e8cdc908a57840d25276b5248039661483faad705  tvheadend-37453bc3fe5f9e10f3428ebb1abdc613f8b07186.tar.gz
+sha256  bd98338d78a253979b9b3040de83c8a6546de499c9a648b8d2d6dedb891c3605  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 76fa7d8cc0..7919612441 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 5abbcda4d8c82d2d4889452a7056a7bfcd728fc6
+TVHEADEND_VERSION = 37453bc3fe5f9e10f3428ebb1abdc613f8b07186
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = \
+	dtv-scan-tables \
 	host-gettext \
 	host-pkgconf \
 	host-pngquant \
@@ -137,8 +138,6 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 TVHEADEND_CONF_OPTS += --disable-pie
 endif
 
-TVHEADEND_DEPENDENCIES += dtv-scan-tables
-
 # The tvheadend build system expects the transponder data to be present inside
 # its source tree. To prevent a download initiated by the build system just
 # copy the data files in the right place and add the corresponding stamp file.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
