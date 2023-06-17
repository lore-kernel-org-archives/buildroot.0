Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F6BEB64D9
	for <buildroot@archiver.kernel.org>; Sat, 17 Jun 2023 06:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EA260E8F;
	Sat, 17 Jun 2023 06:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EA260E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DuiYugV97cE; Sat, 17 Jun 2023 06:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A79660EA0;
	Sat, 17 Jun 2023 06:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A79660EA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 877D41BF842
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 06:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56BDF42137
 for <buildroot@lists.busybox.net>; Sat, 17 Jun 2023 06:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BDF42137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4Dp9BkuMFmV for <buildroot@lists.busybox.net>;
 Sat, 17 Jun 2023 06:12:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BE641FD5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80BE641FD5
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 06:12:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcb3.dip0.t-ipconnect.de [84.161.188.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D85FA4C00F4
 for <buildroot@buildroot.org>; Sat, 17 Jun 2023 08:12:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36152)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qAPAz-0003JB-20
 for buildroot@buildroot.org; Sat, 17 Jun 2023 08:12:45 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 17 Jun 2023 08:12:45 +0200
Message-Id: <20230617061245.18750-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1686982366;
 bh=jDCSrHI5wfbzYgG8ClnI5LSoPteRQOinGi74FUOwVMg=;
 h=From:To:Subject:Date:From;
 b=iMg5lqUdFzCgZmq390pK3/3WCB8gmGYD8O8gvuGKcsavgqImpAc6dZlPSBJpi16EV
 99WCRfuMbFUhPe7s8Zp4/nwX3XBufwhTcmK6hw+XPcZF0IpfTe+Bh9PGUh19TahrAZ
 SbhCDN3p9UcpwlCE5sKN1IFGAzrOWIzhqWbWug/YLGD0bC8rlEzjmdhb3aSFeZEEeC
 vXF5ggdrlIGMBJ608kAKItjqZaMHJpi6/2slzlbwY9w3Cgst83+R9MiDrcsFcZ8z84
 rExTDr9og5KQJxgtvkOF0TBl8jpzd1wnPle1KTdwCxmYQb34w7qwvPXK/dViZdUbqo
 nBq5+18wOF3Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iMg5lqUd
Subject: [Buildroot] [PATCH 1/1] package/kodi-peripheral-joystick: bump
 version to 20.1.9-Nexus
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
index 1ccb528526..ea22c603ac 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e8fb553309d3ad48fad21d2d6cebdb537a4e2b88878b6fdc43707c7bc37e160  kodi-peripheral-joystick-20.1.8-Nexus.tar.gz
+sha256  b1b379e7eb24a16702745c78a57b2f246a013becf5c2daf7579651cbf2188b82  kodi-peripheral-joystick-20.1.9-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index c893ae1247..a8c2502420 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.8-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.9-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
