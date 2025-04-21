Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A4DC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A7260B3B;
	Mon, 21 Apr 2025 21:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0rp1GYHqH1Q; Mon, 21 Apr 2025 21:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A766460B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A766460B3E;
	Mon, 21 Apr 2025 21:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9390B1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 857E840B87
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5oBNHLOv-Jt for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5F74026B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5F74026B
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B653986085; Mon, 21 Apr 2025 21:35:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:34:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 340a4bd4f80f71c975f10bee575e8e7cb93131b9
X-Git-Newrev: e954dd0a212a00744c537e8cba2eb6604cf16e0a
X-Patchwork-Hint: ignore
Message-Id: <20250421213518.B653986085@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/httping: bump to version
 a1c5fdcf289cf7d1d8245579150bcf670f90d248
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e954dd0a212a00744c537e8cba2eb6604cf16e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable gettext support.

Make all options configurable.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/httping/httping.hash |  2 +-
 package/httping/httping.mk   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index a55febb15f..cfdd7670b3 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  22c794df06a1c680e923891a445a3745fc88e01b24854af1be8457a37be19fe6  httping-ffb9201042813c58d020df41697f6445df96f438-git4.tar.gz
+sha256  07b6b36e88506810ef19eb987a7ca477a88fb15fa6beccc509ed8f4a06bd64c1  httping-a1c5fdcf289cf7d1d8245579150bcf670f90d248-git4.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 3759f9fb76..8ba124f673 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,19 +4,31 @@
 #
 ################################################################################
 
-HTTPING_VERSION = ffb9201042813c58d020df41697f6445df96f438
+HTTPING_VERSION = a1c5fdcf289cf7d1d8245579150bcf670f90d248
 HTTPING_SITE = https://github.com/folkertvanheusden/HTTPing
 HTTPING_SITE_METHOD = git
 HTTPING_LICENSE = AGPL-3.0
 HTTPING_LICENSE_FILES = LICENSE
+HTTPING_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_HTTPING_TUI),y)
 HTTPING_DEPENDENCIES += ncurses fftw-double
-HTTPING_CONF_OPTS += -DUSE_TUI=1
+HTTPING_CONF_OPTS += -DUSE_TUI=ON -DUSE_FFTW3=ON
+else
+HTTPING_CONF_OPTS += -DUSE_TUI=OFF -DUSE_FFTW3=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_HTTPING_SSL),y)
 HTTPING_DEPENDENCIES += openssl
+HTTPING_CONF_OPTS += -DUSE_SSL=ON
+else
+HTTPING_CONF_OPTS += -DUSE_SSL=OFF
+endif
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+HTTPING_CONF_OPTS += -DUSE_GETTEXT=ON
+else
+HTTPING_CONF_OPTS += -DUSE_GETTEXT=OFF
 endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
