Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA4CC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60514605E0;
	Sun, 21 Jul 2024 16:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTrbcEkYkxOE; Sun, 21 Jul 2024 16:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50927605F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50927605F0;
	Sun, 21 Jul 2024 16:20:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0017A1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1C0F80A6A
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqxVDP3l_ZiY for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 077DD80A65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 077DD80A65
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E93B286EED; Sun, 21 Jul 2024 16:20:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:20:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 161c25aee11650a4a6b22ca2a88fa0f84ee6b357
X-Git-Newrev: 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
X-Patchwork-Hint: ignore
Message-Id: <20240721162020.E93B286EED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: bump to version 1.4.0-rc2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8637884057ddc3c1aeb9f0dd285fc6fcf378c26b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- This bump will fix the following static build failure raised
  since switch to meson-package in commit
  37dded43ae681e8319d7b76f9a612c71991467a9 thanks to
  https://github.com/flashrom/flashrom/commit/67ca4a71c477320d4b726acd152b7536344e227f
  (which doesn't apply cleanly above version 1.3.0):

  ld (ld-elf2flt): -shared used without passing a shared library ID

- With above patch, classic_cli can't be built without a static library
  (i.e. with BR2_SHARED_LIBS)

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/ee61dc30056b6c3335d64054c875bfb40526033d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 ----------------------
 package/flashrom/flashrom.hash                     |  5 ++-
 package/flashrom/flashrom.mk                       | 12 ++++---
 3 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch b/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
deleted file mode 100644
index 1ee8d0f7e3..0000000000
--- a/package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1 Mon Sep 17 00:00:00 2001
-From: Angel Pons <th3fanbus@gmail.com>
-Date: Tue, 16 May 2023 11:13:17 +0200
-Subject: [PATCH] chipset_enable.c: Drop `_LARGEFILE64_SOURCE`
-
-This file does not access any large files, so there's no need to define
-this feature test macro.
-
-Change-Id: I866cfa2f996eeea5846e5d9189647ad7a4a4e3e4
-Signed-off-by: Angel Pons <th3fanbus@gmail.com>
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/75271
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: Nico Huber <nico.h@gmx.de>
-Reviewed-by: Anastasia Klimchuk <aklm@chromium.org>
-Reviewed-by: Alexander Goncharov <chat@joursoir.net>
-
-Upstream: https://github.com/flashrom/flashrom/commit/59287a0bd0e4d58a4d2b434bde3db9b2376ac7c1
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
----
- chipset_enable.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/chipset_enable.c b/chipset_enable.c
-index 9d3df5f8..3846ecfb 100644
---- a/chipset_enable.c
-+++ b/chipset_enable.c
-@@ -24,8 +24,6 @@
-  * Contains the chipset specific flash enables.
-  */
- 
--#define _LARGEFILE64_SOURCE
--
- #include <stdbool.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.34.1
-
diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index d3bfbad781..cecec5273f 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,4 +1,3 @@
-# Locally computed after checking pgp signature
-# https://download.flashrom.org/releases/flashrom-v1.3.0.tar.bz2.asc
-sha256  a053234453ccd012e79f3443bdcc61625cf97b7fd7cb4cdd8bfbffbe8b149623  flashrom-v1.3.0.tar.bz2
+# Locally computed
+sha256  318c54a4143a1a05b30cecd64fbff41a0f5cd35a020622864c11fb44f8ed04d4  flashrom-1.4.0-rc2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 478b53e1ac..1e7d332dae 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.3.0
-FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
-FLASHROM_SITE = https://download.flashrom.org/releases
+FLASHROM_VERSION = 1.4.0-rc2
+FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
-	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
@@ -80,4 +78,10 @@ endif
 
 FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
+ifeq ($(BR2_SHARED_LIBS),)
+FLASHROM_CONF_OPTS += -Dclassic_cli=enabled
+else
+FLASHROM_CONF_OPTS += -Dclassic_cli=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
