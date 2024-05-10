Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AEEC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3518C423F9;
	Fri, 10 May 2024 11:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEwDuNjAwlck; Fri, 10 May 2024 11:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F53423FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F53423FA;
	Fri, 10 May 2024 11:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3B291BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1F684521
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6tGWjXphXxx for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:21:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1FB084520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1FB084520
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5C2086E14; Fri, 10 May 2024 11:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 13:20:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cf2491a23e70dd38f037726551ed6df7a9ac340
X-Git-Newrev: 20373e0be847e1396b01ab3eba69b9ca96f6a70f
X-Patchwork-Hint: ignore
Message-Id: <20240510112119.D5C2086E14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: bump version to 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=20373e0be847e1396b01ab3eba69b9ca96f6a70f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add configuration to disable polkit if it is not available since polkit is enabled by default in 2.0.1.

https://github.com/LudovicRousseau/PCSC/releases/tag/2.1.0
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.3
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.2
https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.1

Signed-off-by: Zenichi Amano <zenichi.amano@gahojin.co.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index e0face9ddb..806792faee 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356  pcsc-lite-2.0.0.tar.bz2
+sha256  85cab61cc744c81e2bc432656863293b8428d0136f079e3b12a84b335b5b35aa  pcsc-lite-2.1.0.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 2b2114835e..8418d6a32a 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 2.0.0
+PCSC_LITE_VERSION = 2.1.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
@@ -45,6 +45,13 @@ ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+PCSC_LITE_CONF_OPTS += --enable-polkit
+PCSC_LITE_DEPENDENCIES += polkit
+else
+PCSC_LITE_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PCSC_LITE_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
