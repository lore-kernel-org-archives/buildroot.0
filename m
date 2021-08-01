Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F55C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:11:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E287261059
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E287261059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C32402AC;
	Sun,  1 Aug 2021 06:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3Oi9Ek_2Vks; Sun,  1 Aug 2021 06:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FA624022F;
	Sun,  1 Aug 2021 06:11:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2811BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C45E404A1
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pj76kixQdU47 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:11:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74E4740499
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:11:29 +0000 (UTC)
Received: from fwd14.aul.t-online.de (fwd14.aul.t-online.de [172.20.26.242])
 by mailout08.t-online.de (Postfix) with SMTP id 0A7389218;
 Sun,  1 Aug 2021 08:11:27 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (Ze0mI0ZfwhbK9x+nXvNbXa7rwWF+7rQH0DvFIfZY0X7+Dwdee+XoPTVH7QrgMk3QbQ@[79.214.201.246])
 by fwd14.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA4h3-1F3XiS0; Sun, 1 Aug 2021 08:11:25 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34090)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mA4h2-00019v-Fv; Sun, 01 Aug 2021 08:11:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:11:24 +0200
Message-Id: <20210801061124.4521-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: Ze0mI0ZfwhbK9x+nXvNbXa7rwWF+7rQH0DvFIfZY0X7+Dwdee+XoPTVH7QrgMk3QbQ
X-TOI-EXPURGATEID: 150726::1627798285-00000BC0-21510226/0/0 CLEAN NORMAL
X-TOI-MSGID: 3883fad2-ec48-4ad9-a0c6-4d49888e13d6
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-July/000640.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6cf50e23de..64587b4bcd 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.5
+MESA3D_HEADERS_VERSION = 21.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index bf744377e4..4b63e0cece 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-July/000637.html
-sha256  022c7293074aeeced2278c872db4fa693147c70f8595b076cf3f1ef81520766d  mesa-21.1.5.tar.xz
-sha512  d9e0e1b6a1d717febee2aa67b06620c9a21e061ea7e594be5b4c382db1ed6f5acf5d13a75a9f2bba9c32621466ebc816708606e16e8b34700d987158fd8f0b7b  mesa-21.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-July/000640.html
+sha256  b1cb0122f911dfa9fe1f209a7061378c61a1448a280e711511ca72dad9999e37  mesa-21.1.6.tar.xz
+sha512  5daf389aad4fe7ab3574f6af3aabc62ba8b3034004a0a0853dcc18ef6c8003d2f2195cc377dc57b30863ae4cf158149e3156247445ca2b11e401700011cb878c  mesa-21.1.6.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b38718bab5..7ad82a43a5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.5
+MESA3D_VERSION = 21.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
