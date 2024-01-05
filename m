Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B2FC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 18:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FCF821B5;
	Fri,  5 Jan 2024 18:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6FCF821B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hzKIIh0TnbF; Fri,  5 Jan 2024 18:38:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4681B821BC;
	Fri,  5 Jan 2024 18:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4681B821BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8525D1BF389
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A9CE41DA1
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 18:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9CE41DA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZKHwpRvlp8U for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 18:38:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A89942141
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 18:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A89942141
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EA326A4C0CD0
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 19:38:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40472)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rLp5Q-000000006Kl-1jEV
 for buildroot@buildroot.org; Fri, 05 Jan 2024 19:38:28 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 19:38:27 +0100
Message-Id: <20240105183828.11548-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704479908;
 bh=ox4wj2p1mRPEXFjKgLtu3gOCtK057PIuWDNGmnOO5Gs=;
 h=From:To:Subject:Date:From;
 b=NDF3w9Sgx34WEpQv0GHigOW+2NKLNo0/qL7bnZC8tPVLsgUrJrR+kmRj9O3qprc9n
 liOSymnZroBHEdNRzAl4iiwQCuaHovlYGRik1RQwhBmQS5SKOPkr21Ban4cs/5oSJk
 YsbesIjB4jeAi8qoZ3gOPvueb+P4+F8rWHgWuuSYiDe7JMRGyvwcB3lsg0amDBo5k5
 YjuURfsgOgtJuTlIpTFw0j7NjL+RgLB6VU56J6L4ld+8xS01FH/a7F6HbKwHPY+h+4
 rWg5L6fRyyfDGVmOS1+T+piEcWKW1SzT9Z50ZItVAWXfRaQKzO7hjOUcjTYOsK07yd
 da67Ielr6l7OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=NDF3w9Sg
Subject: [Buildroot] [PATCH 1/2] package/kodi-peripheral-joystick: bump
 version to 20.1.14-Nexus
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
index d4ee52c05b..550da61981 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9fabd0cbb54f6f4acfa16a5fa2c13e37d121bb0774e0b62ad3604a72c99b95e5  kodi-peripheral-joystick-20.1.13-Nexus.tar.gz
+sha256  8c3dde851e45549d13ca3fcead9c27c440dfe070d68fb473ae71c522bc54753a  kodi-peripheral-joystick-20.1.14-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 0f54d71234..2fe6c29c0d 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.13-Nexus
+KODI_PERIPHERAL_JOYSTICK_VERSION = 20.1.14-Nexus
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
