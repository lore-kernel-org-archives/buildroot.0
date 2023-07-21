Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4068BEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A56D41EC1;
	Fri, 21 Jul 2023 20:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A56D41EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NS0AKsvkaaqA; Fri, 21 Jul 2023 20:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F2341C57;
	Fri, 21 Jul 2023 20:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F2341C57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B83361BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 913B0613F8
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 913B0613F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6bqC1BemYIk for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:24:10 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4271613E3
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4271613E3
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 919A4A4C0836
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 22:23:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46224)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMwfL-00032Z-1B
 for buildroot@buildroot.org; Fri, 21 Jul 2023 22:23:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 22:23:55 +0200
Message-Id: <20230721202355.1344466-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721202355.1344466-1-bernd@kuhls.net>
References: <20230721202355.1344466-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689971035;
 bh=xN1O2bGmXg9bFEHSgnvq0BjXn7dNBFO8U7RSnjGKxJM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IXXAAvw69BbF/7tPMh5cCzrQzdkGvyjz8v6fsTi47JyQ2D6DXRiU5XpXJ+3k5o6dh
 WQebiqqkrxAgPfDQHeXxlKRicPOqMWVKz6/0B+1FV9UcR863+N8lpu5p1TFofE//o+
 f6BYYLc+7kgS/EKCvtjsCfaiGo6RrgGLluSzAO+ao+BML8j61hiPI8JJgOvmGJL5Pi
 mVV3KEr9jh5ln6MUxnsk34rQKsRAebbs5saiUr5Ft8cfhs6P/A7leTg2oPDeG+prcZ
 8WQ3i17yBaNKAju0RWJxmdvSlneQ4u8MvN/cs1Xm6p20mC3r0d1ocNIUcdJfsZVS0X
 /NFHwyVUaflEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IXXAAvw6
Subject: [Buildroot] [PATCH 2/2] package/kodi-peripheral-joystick: bump
 version to 20.1.10-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index ea22c603ac..6a128604b0 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1b379e7eb24a16702745c78a57b2f246a013becf5c2daf7579651cbf2188b82  kodi-peripheral-joystick-20.1.9-Nexus.tar.gz
+sha256  b72277358df77ed79a0e7f3ae7e9799d02692fb30408cf6e5325ce7e5a34f597  kodi-peripheral-joystick-20.1.10-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index a8c2502420..e55c92b121 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.9-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.10-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
