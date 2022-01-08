Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9A7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5BD840187;
	Sat,  8 Jan 2022 09:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6JuALWIY9tv; Sat,  8 Jan 2022 09:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D8A40124;
	Sat,  8 Jan 2022 09:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D08DF1BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7A28817B5
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kmMsOuWEEtzr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2962817B3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:25:57 +0000 (UTC)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout08.t-online.de (Postfix) with SMTP id 5DCE6ED83;
 Sat,  8 Jan 2022 10:25:55 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd88.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n67z1-0sCHeD0; Sat, 8 Jan 2022 10:25:55 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55028)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n67z0-0007eO-Kf;
 Sat, 08 Jan 2022 10:25:54 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:25:54 +0100
Message-Id: <20220108092554.989783-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641633955-00013579-897AFF73/0/0 CLEAN NORMAL
X-TOI-MSGID: c9a0a2a9-53ed-458f-9624-9357c187e0bd
Subject: [Buildroot] [PATCH 1/1] package/eudev/: bump version to 3.2.11
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch upstream URL to github due to changes in project ownership:
https://github.com/eudev-project/eudev/commit/06ac38e2b876427dfa2ef47e74b46b99927dfe34

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in  | 2 +-
 package/eudev/eudev.hash | 4 +---
 package/eudev/eudev.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 0e5bd0cee9..6e7bbe4648 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_EUDEV
 	  Upstart, older kernels, various toolchains and anything else
 	  required by users and various distributions.
 
-	  https://wiki.gentoo.org/wiki/Project:Eudev
+	  https://github.com/eudev-project/eudev
 
 if BR2_PACKAGE_EUDEV
 
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index fda0481351..fe6c7ef008 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,3 @@
-# From http://dev.gentoo.org/~blueness/eudev/
-md5  60b135a189523f333cea5f71a3345c8d  eudev-3.2.10.tar.gz
 # Locally calculated
-sha256  87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034  eudev-3.2.10.tar.gz
+sha256  19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b  eudev-3.2.11.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 5d18b388c7..705370689d 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.10
-EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
+EUDEV_VERSION = 3.2.11
+EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
