Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22526C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A1E581FCD;
	Tue, 15 Aug 2023 18:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1E581FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8bT_i0Xb2ft; Tue, 15 Aug 2023 18:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D554D81F7B;
	Tue, 15 Aug 2023 18:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D554D81F7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66C391BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA13417B6
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA13417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkGEGgVF085t for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 18:40:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5964F4174E
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 18:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5964F4174E
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F71EA4C1105
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 20:40:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53294)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qVyxg-0004Kh-2m
 for buildroot@buildroot.org; Tue, 15 Aug 2023 20:40:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 20:40:12 +0200
Message-Id: <20230815184012.46168-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230815184012.46168-1-bernd@kuhls.net>
References: <20230815184012.46168-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692124813;
 bh=LXVyMXXc414D9hFzq4Qc5mKIz/y+tuxvq5OorYJCTlE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=W/wK/ze8ToIbPLwM9WO9qpSJspLfk/hULjQNy+7XtrD+9EWXXD7phBlNYJyDOXjWQ
 OEaZd28y9nQSy05tqFgzUbHN9LYwOi8nvUTNGNLDKrUxUcM0SeFUVhBIro30rYUSkR
 cXXKD+1ccpUPezl9iVtONMzTGcHocJxOlkUAMe5yYNNNYoNcvinSRR7JaVcmGXXGcv
 9lgDyZN5Fz/w4GIFWK90CM22KKkb4f3m+A5mSHPIZtagJt5kN0EglAb18bAS19SzG2
 MUnG+4bCiLNER0fmOh4PsH9stf1sP36cO02ho+wOmqaVXCOQ7g0y70DrXc+zM8YNUh
 +ydhtOlDO0l8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=W/wK/ze8
Subject: [Buildroot] [PATCH 2/2] package/kodi-peripheral-joystick: bump
 version to 20.1.11-Nexus
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
index 6a128604b0..ba9932c9e4 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b72277358df77ed79a0e7f3ae7e9799d02692fb30408cf6e5325ce7e5a34f597  kodi-peripheral-joystick-20.1.10-Nexus.tar.gz
+sha256  d916506695d71385fe32d9b640e354b895c7a76ae9a9127a76c180f2a3ed8028  kodi-peripheral-joystick-20.1.11-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index e55c92b121..2f2cd05a12 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.10-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.11-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
