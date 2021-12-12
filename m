Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78F8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CEB9429D2;
	Sun, 12 Dec 2021 12:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkTJKAQQphQ0; Sun, 12 Dec 2021 12:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BC0429C2;
	Sun, 12 Dec 2021 12:24:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4A681BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B3042059
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_Ti3_MJ__H1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CED4299F
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F17B782B66; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39d60a982fa6dd5e1e0733a527dfc25d82aa4ad
X-Git-Newrev: 671eb03b3b3375f6a8d88e1e51c7b87d173def64
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.F17B782B66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stella: zlib is optional,
 not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=671eb03b3b3375f6a8d88e1e51c7b87d173def64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zlib is optional, not mandatory since version 6.1 and
https://github.com/stella-emu/stella/commit/00e464afc3a2581e2716b3eec9c516a36f895236

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stella/Config.in | 1 -
 package/stella/stella.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index c74c7a704d..7722f8a540 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_STELLA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
 
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index e7b0082e7e..9e21606155 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -10,7 +10,7 @@ STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VE
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
-STELLA_DEPENDENCIES = sdl2 zlib
+STELLA_DEPENDENCIES = sdl2
 
 STELLA_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
@@ -24,6 +24,13 @@ else
 STELLA_CONF_OPTS += --disable-png
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+STELLA_CONF_OPTS += --enable-zip
+STELLA_DEPENDENCIES += zlib
+else
+STELLA_CONF_OPTS += --disable-zip
+endif
+
 # The configure script is not autoconf based, so we use the
 # generic-package infrastructure
 define STELLA_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
