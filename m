Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D64C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05258268F;
	Sun, 27 Mar 2022 15:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CX_1tgLwLSNZ; Sun, 27 Mar 2022 15:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5A6828A9;
	Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6781BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394FC60E64
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRXpktNHeC7h for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8982560B9D
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:59:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4260E85DB7; Sun, 27 Mar 2022 15:50:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:55:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05bbdfa382ec8b26d9b2f98b1696cb884ed7c2ca
X-Git-Newrev: 9a78a756134831da20c471dee575f3e8108f62a4
X-Patchwork-Hint: ignore
Message-Id: <20220327155020.4260E85DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack1: libsndfile is optional,
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a78a756134831da20c471dee575f3e8108f62a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsndfile is only needed to build jackrec example client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jack1/Config.in | 1 -
 package/jack1/jack1.mk  | 6 +++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/jack1/Config.in b/package/jack1/Config.in
index 625afdf8c1..5b3116e2f1 100644
--- a/package/jack1/Config.in
+++ b/package/jack1/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_JACK1
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_BERKELEYDB
-	select BR2_PACKAGE_LIBSNDFILE
 	help
 	  JACK Audio Connection Kit (JACK 1 implementation).
 
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 39183826a4..6dca56001f 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,12 +11,16 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsndfile
+JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb
 
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 JACK1_DEPENDENCIES += libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+JACK1_DEPENDENCIES += libsndfile
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 JACK1_DEPENDENCIES += readline
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
