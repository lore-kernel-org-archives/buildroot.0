Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB7C4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAE58468A;
	Fri,  2 Feb 2024 19:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AAE58468A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGX1PvDOjiba; Fri,  2 Feb 2024 19:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A119084690;
	Fri,  2 Feb 2024 19:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A119084690
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8181BF3C3
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8832542266
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8832542266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K64Gn4kbhma for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 19:35:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56A2542251
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 19:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A2542251
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 340B2A4C09D2
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 20:35:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59286)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rVzJa-000000000Dv-3rR8
 for buildroot@buildroot.org; Fri, 02 Feb 2024 20:35:06 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 20:35:06 +0100
Message-Id: <20240202193506.58522-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706902507;
 bh=eqXfiaj0vcqOgcd8aMYs6TInLaDZnPvDpizXiSRSV8E=;
 h=From:To:Subject:Date:From;
 b=SVAZCXIw0AHSyx8zr6Qta1k7B3gfxWOBafVRcb/PDKVMqAMbaEx83mtDlmPc3OVDf
 0cJe/qs9ZGxEKZtt1o7AQsTGnpbcZ1HZ2FNjQuedaPO/r7etzM1ec+DgsUz9otml2I
 3MJPg7ZTuJsVo90zynxGZXvkvbU+Ukk/jvkF/2+M6zuMfFtmT3mPSrwj1A+kzANsww
 E79WmZkseBdjWtaJeLytG9mELC9oOACGPevk0K2kW9/8Ch2FNCavGD0QCrup6BQgjb
 P710a8aNkIR+YeIVPIEzSdRIHT/wmPZBoSJBFJuaVEqka1YkyFUQOCi1hHTybEeG45
 8oYz5O4zgdoBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=SVAZCXIw
Subject: [Buildroot] [PATCH 1/1] package/kodi-peripheral-joystick: bump
 version to 20.1.15-Nexus
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
index 550da61981..d4765d2b2c 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8c3dde851e45549d13ca3fcead9c27c440dfe070d68fb473ae71c522bc54753a  kodi-peripheral-joystick-20.1.14-Nexus.tar.gz
+sha256  7292431b26e3ea969967a02f42ce48cae7742398b148ca041470c17934d06272  kodi-peripheral-joystick-20.1.15-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 2fe6c29c0d..d81962562c 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.14-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.15-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
